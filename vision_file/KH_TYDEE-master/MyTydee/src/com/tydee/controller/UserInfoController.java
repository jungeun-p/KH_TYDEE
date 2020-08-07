package com.tydee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tydee.dao.UserInfoDao;
import com.tydee.dto.UserInfoDto;

@WebServlet("/UserInfoController")
public class UserInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserInfoController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		UserInfoDao dao = new UserInfoDao();
		if (command.equals("login")) {
			HttpSession session = request.getSession();
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			UserInfoDto input = new UserInfoDto(user_id, user_pw);
			UserInfoDto dto = dao.login(input);
			if (dto != null) {
				session.setAttribute("loginuser", dto);
				session.setMaxInactiveInterval(10*60);
				if (dto.getUser_role().equals("ADMIN")) {
					response.sendRedirect("error.jsp");
				} else if (dto.getUser_role().equals("USER")) {
					response.sendRedirect("mytydee.do?command=main");
					System.out.println(dto.getUser_nickname()+" 접속");
				}
			} else {
				jsResponse("아이디 또는 비밀번호가 틀렸거나 가입하지 않은 회원입니다.", "index.jsp", response);
			}
			
		}
	}
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String js = "<script type='text/javascript'> "
						+ "alert('"+msg+"');"
						+ "location.href='"+url+"';"
						+ "</script>";
		response.getWriter().append(js);
	}

}
