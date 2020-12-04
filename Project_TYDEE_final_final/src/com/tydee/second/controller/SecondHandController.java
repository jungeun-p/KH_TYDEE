package com.tydee.second.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.tydee.second.dao.SecondHandDao;
import com.tydee.second.dao.UserInfoDao;
import com.tydee.second.dto.SecondCommDto;
import com.tydee.second.dto.SecondHandDto;
import com.tydee.second.dto.UserInfoDto;

@WebServlet("/SecondHandController")
public class SecondHandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/* private HttpSession session = null; */

	public SecondHandController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		SecondHandDao dao_s = new SecondHandDao();
		UserInfoDao dao_u = new UserInfoDao();

		String command = request.getParameter("command");
		System.out.println(" command in servlet : < " + command + " >");

		if (command.equals("login")) {

			HttpSession session = request.getSession();

			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			UserInfoDto input = new UserInfoDto(user_id, user_pw);
			UserInfoDto dto = dao_u.login(input);

			if (dto != null) {
				session.setAttribute("loginuser", dto);
				session.setMaxInactiveInterval(10 * 60);
				if (dto.getUser_role().equals("ADMIN")) {
					response.sendRedirect("adminmain.jsp");
				} else if (dto.getUser_role().equals("USER")) {
					response.sendRedirect("secondhand_usermain.jsp");
					System.out.println(dto.getUser_nickname() + " 접속");
				}
			} else {
				jsResponse("아이디 또는 비밀번호가 틀렸거나 가입하지 않은 회원입니다.", "index.jsp", response);
				System.out.println(" 로그인 여부 : " + dto);
			}
		} else if (command.equals("list")) {
			
			List<SecondHandDto> list = dao_s.selectList();
			request.setAttribute("list", list);

			dispatch("secondhand_boardlist.jsp", request, response);

		} else if (command.equals("write")) {

			String user_id = request.getParameter("user_id");
			int user_no = Integer.parseInt(request.getParameter("user_no"));

			System.out.println("유저번호 : " + user_no);
			if (user_id.equals("")) {
				System.out.println(" 글 작성 불가");
				jsResponse("로그인을 하셔야 합니다.", "secondhand_index.jsp", response);

			} else {

				request.setAttribute("user_no", user_no);
				dispatch("secondhand_write.jsp", request, response);
			}

		} else if (command.equals("writeres")) {
			
			String sec_title = request.getParameter("sec_title");
			String sec_price = request.getParameter("sec_price");
			String sec_content = request.getParameter("sec_content");
			String user_id = request.getParameter("user_id");
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			System.out.println(user_no);
			System.out.println(user_id);

			SecondHandDto dto = new SecondHandDto(0, user_no, sec_title, sec_content, sec_price, null, null, null);

			int res = dao_s.insert(dto);

			if (res > 0) {
				System.out.println(" 글 작성 성공!");
				jsResponse("글 등록 성공", "secondhand_controller.do?command=list", response);
			} else {
				System.out.println(" 글 작성 실패!");
				jsResponse("글 등록 실패", "secondhand_controller.do?command=list", response);

			}

		} else if (command.equals("detail")) {

			int sec_no = Integer.parseInt(request.getParameter("sec_no"));
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			System.out.println("유저 번호 : " + user_no);
			System.out.println("글 번호 : " + sec_no);

			SecondHandDto dto = dao_s.selectOne(sec_no);
			/* System.out.println("controller user no : "+dto.getUser_no()); */

			request.setAttribute("dto", dto);

			List<SecondCommDto> list = dao_s.selectListComment(sec_no, user_no);

			request.setAttribute("list", list);

			dispatch("secondhand_detail.jsp", request, response);

		} else if (command.equals("modify")) {

			int sec_no = Integer.parseInt(request.getParameter("sec_no"));
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			
			String user_id = request.getParameter("user_id");

			if (user_id.equals("")) {
				System.out.println(" 수정 불가");
				jsResponse(" 로그인을 하셔야 합니다.", "secondhand_index.jsp", response);
			} else {

				SecondHandDto dto = dao_s.selectOne(sec_no);
				request.setAttribute("dto", dto);
				dispatch("secondhand_update.jsp", request, response);

			}

		} else if (command.equals("update")) {

			String sec_title = request.getParameter("sec_title");
			String sec_content = request.getParameter("sec_content");
			String sec_price = request.getParameter("sec_price");

			int sec_no = Integer.parseInt(request.getParameter("sec_no"));
			int user_no = Integer.parseInt(request.getParameter("user_no"));

			SecondHandDto dto = new SecondHandDto(sec_no, user_no, sec_title, sec_content, sec_price, null, null, null);

			int res = dao_s.update(dto);

			if (res > 0) {
				System.out.println(" 수정 성공!");
				jsResponse(" 수정 성공! ", "secondhand_controller.do?command=list", response);
			} else {
				System.out.println(" 수정 실패!");
				jsResponse(" 수정 실패! ", "secondhand_controller.do?command=list", response);
			}

		} else if (command.equals("reply")) {

			String user_id = request.getParameter("user_id");

			if (user_id.equals("") || user_id == null) {
				jsResponse("로그인을 하셔야 합니다.", "secondhand_index.jsp", response);
				System.out.println(" 로그인 데이터 여부 : " + user_id);

			} else if (user_id != null) {
				System.out.println(" 로그인 데이터 여부 : " + user_id);

				int sec_no = Integer.parseInt(request.getParameter("sec_no"));
				int user_no = Integer.parseInt(request.getParameter("user_no"));

				String sec_comm_content = request.getParameter("sec_comm_content");
				SecondCommDto dto = new SecondCommDto(0, sec_no, user_no, sec_comm_content, null, null);
				int res = dao_s.insertReply(dto);

				if (res > 0) {

					System.out.println(" 댓글 추가 성공!");
					dispatch("secondhand_controller.do?command=detail&sec_no=" + sec_no + "&user_no=" + user_no,
							request, response);
				} else {
					System.out.println(" 댓글 추가 실패");
					jsResponse("댓글 추가 실패! ",
							"secondhand_controller.do?command=detail&sec_no=" + sec_no + "&user_no=" + user_no,
							response);
				}
			}

		} else if (command.equals("delete")) {

			int sec_no = Integer.parseInt(request.getParameter("sec_no"));
			int user_no = Integer.parseInt(request.getParameter("user_no"));

			int res = dao_s.delete(sec_no);
			int resC = dao_s.deleteChild(sec_no);
			String user_id = request.getParameter("user_id");

			if (user_id.equals("") || user_id == null) {

				System.out.println(" 게시글 삭제 권한이 없음(로그인 요망)");
				jsResponse("로그인을 하셔야 합니다.", "secondhand_index.jsp", response);

			} else {
				System.out.println(" 로그인 아이디 : " + user_id);

				if (resC > 0 && res > 0) {

					System.out.println("게시글 삭제");
					jsResponse("게시글이 삭제되었습니다.", "secondhand_controller.do?command=list", response);
				}
				if (res > 0) {
					// 게시판 전체 삭제
					System.out.println("게시글 삭제");
					jsResponse("게시글이 삭제되었습니다.", "secondhand_controller.do?command=list", response);

				} else {
					System.out.println("삭제 안됨");
					dispatch("secondhand_controller.do?command=detail&sec_no=" + sec_no + "&user_no=" + user_no,
							request, response);
				}
			}

		} else if (command.equals("delete_reply")) {

			int sec_comm_no = Integer.parseInt(request.getParameter("sec_comm_no"));
			int sec_no = Integer.parseInt(request.getParameter("sec_no"));
			int user_no = Integer.parseInt(request.getParameter("user_no"));

			int res = dao_s.deleteReply(sec_comm_no);
			String user_id = request.getParameter("user_id");

			if (user_id.equals("") || user_id == null) {
				jsResponse("로그인을 하셔야합니다.", "secondhand_index.jsp", response);
				System.out.println(" 로그인 데이터 여부 : " + user_id);
				System.out.println(" 댓글 삭제 접근 불가(로그인 요망)");
			} else if (user_id != null) {
				System.out.println(" 로그인 데이터 여부 : " + user_id);

				if (res > 0) {
					System.out.println("댓글 삭제 성공!");
					dispatch("secondhand_controller.do?command=detail&sec_no=" + sec_no + "&user_no=" + user_no,
							request, response);
				} else {
					System.out.println("댓글 삭제 실패!");
					jsResponse("댓글 삭제 실패!",
							"secondhand_controller.do?command=detail&sec_no=" + sec_no + "&user_no=" + user_no,
							response);
				}
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String js = "<script type='text/javascript'> " + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().append(js);
	}

}
