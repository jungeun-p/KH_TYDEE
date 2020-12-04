package member.login.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.login.dao.loginDao;

@WebServlet("/GoogleLogin")
public class googleloginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");

		loginDao dao = new loginDao();
		
		if(command.equals("googlelogin")) {
			String sns_id = request.getParameter("sns_id");
			String myemail = request.getParameter("myemail");
			System.out.println("유저 아이디 유: " +sns_id);
		}
	}

}
