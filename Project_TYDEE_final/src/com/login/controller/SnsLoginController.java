package com.login.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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

import com.login.dao.UserInfoDao;

import com.login.dto.UserInfoDto;

@WebServlet("/SnsLoginController")
public class SnsLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("[" + command + "]");
		UserInfoDao dao = new UserInfoDao();
		
		if(command.equals("naverlogin")) {
			HttpSession session = request.getSession();
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
			String user_id = (String)resObj.get("email");
			
			//String sns_id = request.getParameter("id");
			//String user_id = request.getParameter("email");
			
			System.out.println(sns_id+"id/"+user_id+"email/");
			
			UserInfoDto snsdto = new UserInfoDto();
			
			snsdto.setSns_id(sns_id);
			snsdto.setUser_id(user_id);
			
			request.setAttribute("snsdto", snsdto);
			
				RequestDispatcher dispatch = 
						request.getRequestDispatcher("registformsns.jsp");
				dispatch.forward(request, response);					
		   
			} catch (Exception e) {
		    	e.printStackTrace();
		    }
		    	
		    } else if(command.equals("naversign")) {
		    	String user_id = request.getParameter("user_id");
		    	String user_pw = request.getParameter("user_pw");
		    	String user_nickname = request.getParameter("user_nickname");
		    	String sns_id = request.getParameter("sns_id");
		    	System.out.println(user_id+"user_id/");
		    	
		    	UserInfoDto snsdto = new UserInfoDto();
		    	
		    	snsdto.setUser_id(user_id);
		    	snsdto.setUser_pw(user_pw);
		    	snsdto.setUser_nickname(user_nickname);
		    	snsdto.setSns_id(sns_id);
		    	
		    	int res = dao.insertNaver(snsdto);
		    	System.out.println("res"+res);
		    	
				if (res > 0) {
					response.sendRedirect("main.jsp");
				} else {
					response.sendRedirect("registform.jsp");
				}
		    }
	}
	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String js = "<script type='text/javascript'> " + "alert('" + msg + "');" + "location.href='" + url + "';"
				+ "</script>";
		response.getWriter().append(js);
	}

	}

