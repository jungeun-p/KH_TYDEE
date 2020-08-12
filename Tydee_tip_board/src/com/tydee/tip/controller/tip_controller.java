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
import com.tydee.tip.dao.tip_file_dao;
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
		System.out.println("[ "+command+" ]");
		
		
		HttpSession session = request.getSession();
		UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
		 
		int user_no = loginuser.getUser_no();
		
		tip_file_biz filebiz = new tip_file_biz();
		tip_biz biz = new tip_biz();
		tip_dao dao = new tip_dao();
		tip_file_dao filedao = new tip_file_dao();
		
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
			
			
			System.out.println("[ 상세페이지 제목 ]"+tip_title);
			System.out.println("[ 상세페이지 요약 ]"+tip_summary);
			System.out.println("[ 상세페이지 내용 ]"+tip_content);
			
			tip_dto dto = new tip_dto(0, user_no, null,tip_title, tip_content, tip_summary, "image", null, null);
			
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
			System.out.println("[ 조회하는 게시글 번호 ] : "+request.getParameter("tip_no"));
			
			tip_dto dto = dao.selectOne(tip_no);
			tip_file_dto filedto = filedao.selectOne(tip_no); 
		
			
			request.setAttribute("dto", dto);
			request.setAttribute("tip_no",tip_no);
			dispatch("tip_detail.jsp", request, response);
			
			
			
		} else if(command.equals("update")) {
			
			int tip_no = Integer.parseInt(request.getParameter("tip_no"));
			System.out.println(request.getParameter("tip_no"));
			
			tip_dto dto = dao.selectOne(tip_no);
			System.out.println("[ 수정을 원하는 게시글 번호 ] : "+dto.getTip_content());
			
			request.setAttribute("dto", dto);
			dispatch("tip_update.jsp", request, response);
			
			
			
			
		} else if (command.equals("updateRes")) {
			
			int tip_no = Integer.parseInt(request.getParameter("tip_no"));
			
			String tip_title = request.getParameter("tip_title");
			String tip_content = request.getParameter("tip_content");
			String tip_summary = request.getParameter("tip_summary");
			System.out.println(tip_title+"/"+tip_content+"/"+tip_summary);
			
			tip_dto dto = new tip_dto(tip_no, user_no, null, tip_title, tip_content, tip_summary, null, null, null);
			
			int res = dao.update(dto);
			
			if (res > 0) {	
				dispatch("tip_success.jsp", request, response);
				System.out.println( " [ "+tip_no+ " ] " + " 번 게시글 수정완료 ");
			} else {
				dispatch("tip_error.jsp", request, response);
				System.out.println( " [ "+tip_no+ " ] " + " 번 게시글 수정실패 ");
			}
			
			
		} else if(command.equals("delete")){
			
		
				int tip_no = Integer.parseInt(request.getParameter("tip_no"));
				System.out.println("1");
				
				tip_dto dto = new tip_dto();
				dto.setTip_no(tip_no);
				
				System.out.println("2");
				int res = biz.delete(tip_no);
				
				if( res > 0) {
					dispatch("tip_success.jsp", request, response);
					System.out.println( " [ "+tip_no+ " ] " + " 번 게시글 삭제완료 ");
				} else {
					dispatch("tip_error.jsp", request, response);
					System.out.println( " [ "+tip_no+ " ] " + " 번 게시글 삭제완료 ");
	
				}
			
//---------------------------------------------------
//이미지 업로드
				
		} else if(command.equals("insertImg")) {
			

			System.out.println("이미지 저장중");
			String tip_image = "";
			String path = request.getSession().getServletContext().getRealPath("images").replace("\\","\\\\");
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdir();
			}
			int size = 1024*1024*10;
			String file = "";
			String originalFile = "";
		    try{
		        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new TydeeRenamePolicy());
		        
		        Enumeration files = multi.getFileNames();
		        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장
		        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
		        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴
		        
		        
		        
		    } catch (Exception e) {
		    	System.out.println("[error] 파일저장 실패");
		        e.printStackTrace();
		    }
		   
		    
		    System.out.println("[ 이미지 저장 완료 ]");
		    request.setAttribute("ori_image", originalFile);
		    request.setAttribute("db_image", file);
		    request.setAttribute("filePath", path);

		    
			dispatch("tip.do?command=imguploded", request, response);
			
			
			System.out.println("[ RequestDispatcher... ] ");
			System.out.println("[ 경로 ]"+path);
			System.out.println(originalFile +" -> "+ file + " 로 저장");

			
		} else if (command.equals("imguploded")) {
			
			String ori_image = (String) request.getAttribute("ori_image");
			String new_image = (String) request.getAttribute("db_image");
			String filePath = (String) request.getAttribute("filePath");
			
			System.out.println("[업로드 한 파일 ] : " + ori_image + new_image);
			
			String imgname = "<script type='text/javascript'>"
					   + "let imgName = opener.document.querySelector('#upload_name');"
				       + "imgName.textContent='"+ori_image+"';"
				       
				       + "let loc = opener.document.querySelector('#upload_loc');"
				       + "loc.textContent='"+filePath+"';"
				       
				       
				       + "let imgSpan = opener.document.querySelector('#upload_img');"
				       + "imgSpan.textContent='"+ori_image+"';"
				       
				       + "let showImg = opener.document.querySelector('#upload_img');"
				       + "showImg.innerHTML='<img src=images/"+new_image+">';"
				       		
				       
				       + "self.close();"
				       
				       
					   + "</script>";
			
			response.getWriter().append(imgname);
			
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
