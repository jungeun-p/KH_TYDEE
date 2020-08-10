package com.tydee.controller;

import java.io.IOException;
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

import com.google.gson.Gson;
import com.tydee.dao.UserAddressDao;
import com.tydee.dto.UserAddressDto;
import com.tydee.dto.UserInfoDto;

/**
 * Servlet implementation class UserAddressController
 */
@WebServlet("/UserAddressController")
public class UserAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserAddressController() {
        super();
        // TODO Auto-generated constructor stub
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
		UserAddressDao dao = new UserAddressDao();
		if (command.equals("select")) {
			List<UserAddressDto> list = dao.selectRecent(user_no);
			Map<String,Object> result = null;
			String json = "";
			UserAddressDto dto = null;
			if (list != null || list.size() != 0) {
				dto = list.get(0);
				result = new HashMap<String,Object>();
				result.put("address_no", dto.getAddress_no());
				result.put("user_no", dto.getUser_no());
				result.put("user_name", dto.getUser_name());
				result.put("user_phone", dto.getUser_phone());
				result.put("user_address_first", dto.getUser_address_first());
				result.put("user_address_second", dto.getUser_address_second());
				result.put("user_address_extra", dto.getUser_address_extra());
				result.put("user_postcode", dto.getUser_postcode());
			}
			json = new Gson().toJson(result);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} else if (command.equals("insert")) {
			String user_name = request.getParameter("user_name");
			String user_phone = request.getParameter("user_phone");
			String user_address_first = request.getParameter("user_address_first");
			String user_address_second = request.getParameter("user_address_second");
			String user_address_extra = request.getParameter("user_address_extra");
			String user_postcode = request.getParameter("user_postcode");
			UserAddressDto dto = new UserAddressDto(user_no, user_name, user_phone, user_address_first, user_address_second, user_address_extra, user_postcode);
			int res = dao.insertNew(dto);
			int address_no = dao.selectRecent(user_no).get(0).getAddress_no();
			request.setAttribute("user_name", user_name);
			request.setAttribute("user_phone", user_phone);
			request.setAttribute("user_postcode", user_postcode);
			request.setAttribute("address_no", address_no);
			dispatch("order.do?command=newaddrorder", request, response); // pay로 이동
		}
		
	}
	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
