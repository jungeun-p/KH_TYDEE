package com.tydee.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tydee.dao.MyTydeeDao;
import com.tydee.dto.MyTydeeDto;
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
			
		} else if (command.equals("insert")) {
			String tiny_type = request.getParameter("tiny_type");
			String tiny_title = request.getParameter("tiny_title");
			String tiny_content = request.getParameter("tiny_content");
			String tiny_image = request.getParameter("tiny_image");
			int tiny_depth = Integer.parseInt(request.getParameter("tiny_depth"));
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
