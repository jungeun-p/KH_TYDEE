package member.login.controller;

import java.io.IOException;

import java.net.URLEncoder;
import java.net.URL;
import java.net.HttpURLConnection;
import java.io.BufferedReader;
import java.io.InputStreamReader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import member.login.dao.loginDao;
import member.login.dto.loginDto;

@WebServlet("/loginController")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public loginController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");

		loginDao dao = new loginDao();

		// sign
		if (command.equals("signres")) {
			String myemail = request.getParameter("myemail");
			String mypw = request.getParameter("mypw");
			String myname = request.getParameter("myname");

			loginDto dto = new loginDto(myemail, mypw, myname);

			int res = dao.insertUser(dto);

			if (res > 0) {
				response.sendRedirect("login.jsp");
			} else {
				response.sendRedirect("signform.jsp");
			}
		} else if  (command.equals("login")) {
			HttpSession session = request.getSession();

			String myemail = request.getParameter("myemail");
			String mypw = request.getParameter("mypw");

			loginDto dto = dao.login(myemail, mypw);

			if (dto != null) {
				session.setAttribute("dto", dto);
				session.setMaxInactiveInterval(10 * 60);

				if (dto.getSns_type().equals("naver")) {
					response.sendRedirect("main.jsp");
				} else if (dto.getSns_type().equals("0")) {
					response.sendRedirect("main.jsp");
				}
			}
		}
	}
}
