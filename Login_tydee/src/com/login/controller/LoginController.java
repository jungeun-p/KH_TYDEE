package com.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import javax.xml.ws.Dispatch;

import org.apache.catalina.Session;

import com.login.dao.UserInfoDao;
import com.login.dto.UserInfoDto;
import com.login.dto.UserInfoUpdateDto;
import com.sun.org.apache.regexp.internal.RE;

import sun.rmi.server.Dispatcher;

@WebServlet("/controller")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserInfoDto dto = null;

	public LoginController() {
		UserInfoDto dto = new UserInfoDto();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();

		String command = request.getParameter("command");

		UserInfoDao dao = new UserInfoDao();

		if (command.equals("login")) {
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			UserInfoDto input = new UserInfoDto(user_id, user_pw);
			UserInfoDto dto = dao.Login(input);

			if (dto != null) {
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(10 * 60);
				if (dto.getUser_role().equals("ADMIN")) {
					response.sendRedirect("adminmain.jsp");
				} else if (dto.getUser_role().equals("USER")) {
					response.sendRedirect("usermain.jsp");
					System.out.println(dto.getUser_nickname() + " 접속");
				} else if (dto.getUser_role().equals("EXPERT")) {
					response.sendRedirect("expertmain.jsp");
				}
			} else {
				jsResponse("아이디 또는 비밀번호가 틀렸거나 가입하지 않은 회원입니다.", "main.jsp", response);
			}

		} else if (command.equals("logout")) {
			session.invalidate();
			response.sendRedirect("main.jsp");

		} else if (command.equals("listall")) {
			List<UserInfoDto> list = dao.selectlist();
			request.setAttribute("list", list);
			RequestDispatcher dispatcher = request.getRequestDispatcher("userlist.jsp");
			dispatcher.forward(request, response);

		} else if (command.equals("updaterole")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			UserInfoDto dto = dao.selectUser(user_no);
			System.out.println(">> : " + dto.getUser_no());
			System.out.println(">> : " + dto.getUser_role());
			request.setAttribute("dto", dto);
			dispacher("updaterole.jsp", request, response);

		} else if (command.equals("updateroleres")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			System.out.println(">> :" + user_no);
			String updaterole = request.getParameter("myrole");
			System.out.println("updaterole : " + updaterole);
			int res = dao.updaterole(user_no, updaterole);
			System.out.println(">> :" + res);
			if (res > 0) {
				jsResponse("등급변경 성공 !!", "controller.do?command=adminmain", response);
			} else {
				jsResponse("등급변경 실패...", "controller.do?command=updaterole", response);
			}
		} else if (command.equals("adminmain")) {
			response.sendRedirect("adminmain.jsp");

		} else if (command.equals("userupdate")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			UserInfoDto dto = dao.selectUser(user_no);
			request.setAttribute("dto", dto);
			dispacher("userupdate.jsp", request, response);

		} else if (command.equals("userdateres")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			String user_pw = request.getParameter("pw");
			String user_nickname = request.getParameter("nick");

			System.out.println(user_no);
			System.out.println(user_pw);
			System.out.println(user_nickname);

			UserInfoUpdateDto dto = new UserInfoUpdateDto(user_no, user_pw, user_nickname);
			request.setAttribute("dto", dto);
			System.out.println("/>>>>" + dto);
			int res = dao.UserUP(dto);
			if (res > 0) {
				jsResponse("정보수정성공!!", "controller.do?command=usermain", response);
			} else {
				jsResponse("실패...", "userupdate.jsp", response);
			}

		} else if (command.equals("usermain")) {
			response.sendRedirect("usermain.jsp");
		} else if (command.equals("registform")) {
			response.sendRedirect("registform.jsp");

		} else if (command.equals("registformres")) {
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			String user_nickname = request.getParameter("user_nickname");

			UserInfoDto dto = new UserInfoDto(user_id, user_pw, user_nickname);
			System.out.println("dto :" + dto.getUser_id());
			System.out.println("dto :" + dto.getUser_pw());
			System.out.println("dto :" + dto.getUser_nickname());

			int res = dao.insertRegist(dto);
			System.out.println("res : " + res);

			if (res > 0) {
				System.out.println("회원가입 성공!!");
				jsResponse("가입성공!", "main.jsp", response);
			} else {
				System.out.println("회원가입 실패!!");
				jsResponse("회원가입 실패...", "registform.jsp", response);
			}

		} else if (command.equals("emailChk")) {
			response.sendRedirect("idChk.jsp");
		} else if (command.equals("nickChk")) {
			String user_nickname = request.getParameter("user_nickname");
			UserInfoDto res = dao.nickChk(user_nickname);

			boolean nickid = true;

			if (res != null) {
				nickid = false;
			}
			response.sendRedirect("nickChk.jsp?nickid=" + nickid);

		} else if (command.equals("FindPw")) {
			response.sendRedirect("loginpwsearch.jsp");
		} else if (command.equals("PwSearch")) {
			String user_id = request.getParameter("id");
			boolean dto = dao.PwCheck(user_id);
			request.setAttribute("dto", dto);

			PrintWriter out = response.getWriter();
			if (dto) {
				out.print("ok");
			} else {
				out.print("fail");
			}

		} else if (command.equals("PwSearchres")) {
			String user_id = request.getParameter("id");
			System.out.println(">>" + user_id);
			UserInfoDto dto = dao.PwInfo(user_id);
			System.out.println(">>" + user_id);
			request.setAttribute("dto", dto);
			System.out.println("--" + dto);
			dispacher("loginpwsearchemail.jsp", request, response);
		
		} else if (command.equals("userdel")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			System.out.println(">>>>>>>" + user_no);
			int res = dao.delete(user_no);
			System.out.println(">>>>>>>>>>" + res);
			if (res > 0) {
				jsResponse("안녕히 가세요~~^^", "controller.do?command=login", response);
			}else {
				jsResponse("탈퇴 실패 했습니다...", "controller.do?userupdate", response);
			}
		}
	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String js = "<script type='text/javascript'> " + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().append(js);
	}

	private void dispacher(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispacher = request.getRequestDispatcher(url);
		dispacher.forward(request, response);
	}
}