package member.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

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

@WebServlet("/naverloginController")
public class naverloginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		System.out.println("[" + command + "]");

		loginDao dao = new loginDao();

		if (command.equals("login")) {

			String token = (String) session.getAttribute("access_token");// 네이버 로그인 접근 토큰;
			String header = "Bearer " + token; // Bearer 다음에 공백 추가

			try {
				String apiurl = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiurl);
				HttpURLConnection con = (HttpURLConnection) url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				BufferedReader br;

				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					res.append(inputLine);
				}
			br.close();
			

			JSONParser parsing = new JSONParser();
			Object obj = parsing.parse(res.toString());
			JSONObject jsonObj = (JSONObject)obj;
			JSONObject resObj = (JSONObject)jsonObj.get("response");
			
			String sns_id = (String)resObj.get("id");
			String myemail = (String)resObj.get("email");
			
			//String sns_id = request.getParameter("id");
			//String myemail = request.getParameter("email");
			
			System.out.println(sns_id+"id/"+myemail+"email/");
			
			loginDto snsdto = new loginDto();
			
			snsdto.setSns_id(sns_id);
			snsdto.setMyemail(myemail);
			
			request.setAttribute("snsdto", snsdto);

			RequestDispatcher dispatch = 
					request.getRequestDispatcher("snssignform.jsp");
			dispatch.forward(request, response);

		    } catch (Exception e) {
		    	e.printStackTrace();
		    } 
		    	
		    } else if(command.equals("loginres")) {
		    	String myemail = request.getParameter("myemail");
		    	String mypw = request.getParameter("mypw");
		    	String myname = request.getParameter("myname");
		    	String sns_id = request.getParameter("sns_id");
		    	System.out.println(myemail+"email/");
		    	
		    	loginDto snsdto = new loginDto();
		    	
		    	snsdto.setMyemail(myemail);
		    	snsdto.setMypw(mypw);
		    	snsdto.setMyname(myname);
		    	snsdto.setSns_id(sns_id);
		    	
		    	int res = dao.insertNaver(snsdto);
		    	
		    	if(res>0) {
		    		response.sendRedirect("main.jsp");
		    	} else {
		    		response.sendRedirect("sign.jsp");
		    	}
		    }
			
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
