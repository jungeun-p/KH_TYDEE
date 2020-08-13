package com.tydee.tip.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.TydeeRenamePolicy;
import com.tydee.tip.dao.tip_biz;
import com.tydee.tip.dao.tip_dao;
import com.tydee.tip.dao.tip_file_biz;
import com.tydee.tip.dto.UserInfoDto;
import com.tydee.tip.dto.tip_dto;
import com.tydee.tip.dto.tip_file_dto;


@WebServlet("/tip_controller")
public class tip_controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public tip_controller() { 
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		
		HttpSession session = request.getSession();
		UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
		
		int user_no = loginuser.getUser_no();
		
		tip_file_biz filebiz = new tip_file_biz();
		tip_biz biz = new tip_biz();
		tip_dao dao = new tip_dao();
		
		if(command.equals("main")) {
			List<tip_dto> list  = biz.selectList();
			request.setAttribute("list", list);
			dispatch("tip_main.jsp", request, response);
//--------------------------------------------------------------
// 게시판 CRUD
			
		} else if(command.equals("write")) {
			String tip_title = request.getParameter("tip_title");
			String tip_content = request.getParameter("tip_content");
			String tip_summary = request.getParameter("tip_summary");
			
			System.out.println(tip_title);
			System.out.println(tip_content);
			System.out.println(tip_summary);
			
			tip_dto dto = new tip_dto(0, user_no, tip_title, tip_content, tip_summary, "image", null, null);
			int res = dao.insert(dto);
			if (res > 0) {
				
				dispatch("tip_success.jsp", request, response);
			} else {
				dispatch("tip_error.jsp", request, response);
			}
			
		} else if (command.equals("list")) {
			List<tip_dto> list = dao.selectList();
			request.setAttribute("list", list);
			dispatch("tip_main.jsp", request, response);
			
		} else if (command.equals("detail")) {
			int tip_no = Integer.parseInt(request.getParameter("tip_no"));
			System.out.println(request.getParameter("tip_no"));
			tip_dto dto = dao.selectOne(tip_no);
			System.out.println(dto.getTip_content());
			request.setAttribute("dto", dto);
			dispatch("tip_detail.jsp", request, response);
			
		} else if(command.equals("delete")){
			
				//삭제하려는 사람의 role이 관리자 일때만 가능하게하는코드 추가해야됨
			
				int tip_no = Integer.parseInt(request.getParameter("tip_no"));
				System.out.println("1");
				
				tip_dto dto = new tip_dto();
				dto.setTip_no(tip_no);
				
				System.out.println("2");
				int res = biz.delete(tip_no);
				
				if( res > 0) {
					dispatch("tip_success.jsp", request, response);
				} else {
					dispatch("tip_error.jsp", request, response);
	
				}
			
//---------------------------------------------------
//이미지 업로드
				
		} else if(command.equals("insertImg")) {
			
			System.out.println("Upload image");
			String tip_image = "";
			String path = request.getSession().getServletContext().getRealPath("tip_images").replace("\\","\\\\");
			
			File dir = new File(path);
			
			if(!dir.isDirectory()) {
				dir.mkdir();
			}
			
			int size = 1024*1024*10;
			String file = "";
			String originalfile = "";
			
			try {
				MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new TydeeRenamePolicy());
				
				Enumeration files = multi.getFileNames();
				String str = (String)files.nextElement();
				file = multi.getFilesystemName(str);
				originalfile = multi.getOriginalFileName(str);
			
			} catch (IOException e) {
				e.printStackTrace();
			}
			System.out.println("이미지 업로드 완료!");
			System.out.println(originalfile);
			request.setAttribute("file_name",file);
		
			tip_file_dto file_dto = new tip_file_dto(0, null, file);
			int res = filebiz.insert(file_dto);
			
			System.out.println("이미지 저장 완료");
		   if(res > 0) {
			   System.out.println("이미지 저장 성공");
		   } else {
			   System.out.println("이미지 저장 실패");
		   }
			
			PrintWriter out = response.getWriter();
			out.println("<script>self.close()</script>");
			
			
		} else if (command.equals("uploadedImg")) {
			String tiny_image = (String) request.getAttribute("tiny_image");
			String js = "<script type='text/javascript'>"
					+ "let isUpload = opener.document.getElementsByClassName('pop__content_box')[3].getElementsByTagName('span')[0];"
					+ "isUpload.textContent = '이미지 업로드 완료';"
					+ "let hidden = document.createElement('input');"
					+ "hidden.setAttribute('type', 'hidden');"
					+ "hidden.setAttribute('name','tiny_image');"
					+ "hidden.setAttribute('value','"+tiny_image+"');"
					+ "let where = opener.document.getElementsByClassName('pop__content_box')[3];"
					+ "where.appendChild(hidden);"
					+ "self.close();"
					+ "</script>";
			response.getWriter().append(js);
					  
		}

	}
	
	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
	}
	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String js = "<script type='text/javascript'> "
						+ "alert('"+msg+"');"
						+ "location.href='"+url+"';"
						+ "</script>";
		response.getWriter().append(js);
	}

}
