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
import javax.servlet.jsp.PageContext;

import com.tydee.dao.ItemBasketDao;
import com.tydee.dto.ItemBasketDto;
import com.tydee.dto.UserInfoDto;

/**
 * Servlet implementation class ItemPurchaseController
 */
@WebServlet("/ItemPurchaseController")
public class ItemOrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ItemOrderController() {
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
		if (command.equals("ready")) {
			ItemBasketDao ibdao = new ItemBasketDao();
			List<ItemBasketDto> list = ibdao.selectList(user_no);
			request.setAttribute("list", list);
			int totalPrice = ibdao.totalPrice(user_no);
			request.setAttribute("totalPrice", totalPrice);
			dispatch("boarditem_order.jsp", request, response);
		} else if (command.equals("order")) {
			String total_price = request.getParameter("total_price");
			String user_name = request.getParameter("user_name");
			String user_phone = request.getParameter("user_phone");
			String user_postcode = request.getParameter("user_postcode");
			String user_address_first = request.getParameter("user_address_first");
			String user_address_second = request.getParameter("user_address_second");
			String user_address_extra = request.getParameter("user_address_extra");
			Map<String,String> map = new HashMap<String, String>();
			map.put("total_price", total_price);
			map.put("user_name", user_name);
			map.put("user_phone", user_phone);
			map.put("user_postcode", user_postcode);
			map.put("user_address_first", user_address_first);
			map.put("user_address_second", user_address_second);
			map.put("user_address_extra", user_address_extra);
			request.setAttribute("map", map);
			dispatch("test.jsp", request, response);
		}
	}

	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
