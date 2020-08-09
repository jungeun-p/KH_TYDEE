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

import com.tydee.dao.ItemBasketDao;
import com.tydee.dto.ItemBasketDto;
import com.tydee.dto.UserInfoDto;

/**
 * Servlet implementation class ItemBasketController
 */
@WebServlet("/ItemBasketController")
public class ItemBasketController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemBasketController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		int user_no = 0;
		if (session.getAttribute("loginuser") != null) {
			UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
			user_no = loginuser.getUser_no();
		}
		
		ItemBasketDao dao = new ItemBasketDao();
		String command = request.getParameter("command");
		if (command.equals("insert")) {
			if (user_no == 0) {
				String js = "<script type='text/javascript'>"
						+ "alert('장바구니는 로그인 후 이용 가능합니다');"
						+ "location.href='item.do?command=list';"
						+ "</script>";
				response.getWriter().append(js);
			} else {
				int item_no = Integer.parseInt(request.getParameter("item_no"));
				List<ItemBasketDto> list = dao.selectList(user_no);
				for (ItemBasketDto dto : list) {
					if (dto.getItem_no() == item_no) {
						String js = "<script type='text/javascript'>"
								+ "alert('이미 장바구니에 있는 상품입니다');"
								+ "location.href='item.do?command=list';"
								+ "</script>";
						response.getWriter().append(js);
					}
				}
				int item_quan = Integer.parseInt(request.getParameter("item_quan"));
				ItemBasketDto dto = new ItemBasketDto(user_no, item_no, item_quan);
				int res = dao.insert(dto);
				dispatch("basket.do?command=list", request, response);
			}
		} else if (command.equals("update")) {
			int basket_no = Integer.parseInt(request.getParameter("basket_no"));
			int item_no = Integer.parseInt(request.getParameter("item_no"));
			int item_quan = Integer.parseInt(request.getParameter("item_quan"));
			ItemBasketDto dto = new ItemBasketDto(basket_no, user_no, item_no, item_quan);
			int res = dao.update(dto);
			dispatch("basket.do?command=list", request, response);
		} else if (command.equals("delete")) {
			int basket_no = Integer.parseInt(request.getParameter("basket_no"));
			int res = dao.delete(basket_no);
			dispatch("basket.do?command=list", request, response);
		} else if (command.equals("list")) {
			List<ItemBasketDto> list = dao.selectList(user_no);
			request.setAttribute("list", list);
			int totalPrice = dao.totalPrice(user_no).get(0) != null ? dao.totalPrice(user_no).get(0) : 0;
			request.setAttribute("totalPrice", totalPrice);
			dispatch("boarditem_basket.jsp", request, response);
		} else if (command.equals("deleteAll")) {
			int res = dao.deleteAll(user_no);
			dispatch("order.do?command=result", request, response);
		}
	}
	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
