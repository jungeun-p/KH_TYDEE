package com.tydee.controller;

import java.io.File;
import java.io.IOException;
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
import com.tydee.dao.MyTydeeDao;
import com.tydee.dto.MyTydeeDto;
import com.tydee.dto.MyTydeeVisionDto;
import com.tydee.dto.UserInfoDto;
import com.tydee.utils.MyTydeeConvertToJson;

@WebServlet("/MyTydeeController")
public class MyTydeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyTydeeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
		int user_no = loginuser.getUser_no();
		String command = request.getParameter("command");
		MyTydeeDao dao = new MyTydeeDao();
		if (command.equals("main")) {
			String jsonobject = MyTydeeConvertToJson.convertJson(loginuser);
			request.setAttribute("mytydeejson", jsonobject);
			String options = MyTydeeConvertToJson.makeOptions(loginuser);
			request.setAttribute("optionArray", options);
			dispatch("mytydee.jsp",request,response);
		} else if (command.equals("update")) {
			int tiny_no = Integer.parseInt(request.getParameter("tiny_no"));
			String name = request.getParameter("name");
			String content = request.getParameter("content");
			MyTydeeDto dto = new MyTydeeDto(tiny_no, user_no, name, content);
			int res = dao.update(dto);
			if (res > 0) {
				response.sendRedirect("mytydee.do?command=main");
			} else {
				response.sendRedirect("mytydee.do?command=main");
			}
		} else if (command.equals("delete")) {
			int tiny_no = Integer.parseInt(request.getParameter("tiny_no"));
			MyTydeeDto dto = new MyTydeeDto(tiny_no, user_no);
			int res = dao.delete(dto);
			if (res > 0) {
				response.sendRedirect("mytydee.do?command=main");
			} else {
				response.sendRedirect("mytydee.do?command=main");
			}
			
		} else if (command.equals("insertImg")) {
			String tiny_image = "";
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
		        e.printStackTrace();
		    }
		    request.setAttribute("tiny_image", file);
			dispatch("mytydee.do?command=imguploded", request, response);
		} else if (command.equals("imguploded")) {
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
		} else if (command.equals("delete")) {
			int tiny_no = Integer.parseInt(request.getParameter("tiny_no"));
			MyTydeeDto dto = new MyTydeeDto(tiny_no, user_no);
			int res = dao.delete(dto);
			if (res > 0) {
				response.sendRedirect("mytydee.do?command=main");
			} else {
				response.sendRedirect("mytydee.do?command=main");
			}
		} else if (command.equals("insert")) {
			String tiny_type = request.getParameter("tiny_type");
			String tiny_title = request.getParameter("tiny_title");
			int tiny_depth = Integer.parseInt(request.getParameter("tiny_depth"));
			String tiny_content = request.getParameter("tiny_content");
			String tiny_image = request.getParameter("tiny_image");
			MyTydeeDto dto = new MyTydeeDto(user_no, tiny_type, tiny_title, tiny_depth, tiny_content, tiny_image);
			int res = dao.insert(dto);
			if (res > 0) {
				response.sendRedirect("mytydee.do?command=main");
			} else {
				response.sendRedirect("mytydee.do?command=main");
			}
		} else if (command.equals("insertNew")) {
			int tydeenumber = Integer.parseInt(request.getParameter("tydeenumber"));
			int res = dao.insertNew(user_no, tydeenumber);
			if (res > 0) {
				response.sendRedirect("mytydee.do?command=main");
			} else {
				response.sendRedirect("mytydee.do?command=main");
			}
		}
	}
	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
