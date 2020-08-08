package com.tydee.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    private String merchant_uid = "";
	private String user_name = "";
	private String user_phone ="";
	private String user_postcode = "";
	private String total_price = "";
	private String user_address = "";
	private String item_lead_name = "";
	private String email = "";
	
       
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
		email = loginuser.getUser_id();
		
		String command = request.getParameter("command");
		if (command.equals("ready")) {
			ItemBasketDao ibdao = new ItemBasketDao();
			List<ItemBasketDto> list = ibdao.selectList(user_no);
			request.setAttribute("list", list);
			int totalPrice = ibdao.totalPrice(user_no);
			request.setAttribute("totalPrice", totalPrice);
			dispatch("boarditem_order.jsp", request, response);
		} else if (command.equals("order")) {
	        merchant_uid = makeMerchant_uid();
			user_name = request.getParameter("user_name");
			user_phone = request.getParameter("user_phone");
			user_postcode = request.getParameter("user_postcode");
			total_price = request.getParameter("total_price");
			user_address = request.getParameter("user_address");
			item_lead_name = request.getParameter("item_lead_name");
			String js = kakaoPayJS();
			request.setAttribute("merchant_uid", merchant_uid);
			request.setAttribute("js", js);
			dispatch("boarditem_kakaopay.jsp", request, response);
		} else if (command.equals("newaddrorder")) {
			merchant_uid = makeMerchant_uid();
			user_name = (String) request.getAttribute("user_name");
			user_phone = (String) request.getAttribute("user_phone");
			user_postcode = (String) request.getAttribute("user_postcode");
			total_price = request.getParameter("total_price");
			user_address = request.getParameter("user_address");
			item_lead_name = request.getParameter("item_lead_name");
			String js = kakaoPayJS();
			request.setAttribute("merchant_uid", merchant_uid);
			request.setAttribute("js", js);
			dispatch("boarditem_kakaopay.jsp", request, response);
		} else if (command.equals("result")) {
			dispatch("boarditem_result.jsp", request, response);
		} else if (command.equals("insert")) {
			// basket에 있던 리스트들 order 테이블로 넘기기
			dispatch("basket.do?command=deleteAll", request, response);
		} else if (command.equals("orderList")) {
			
		}
	}

	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	protected String makeMerchant_uid() {
		long cureentTime = System.currentTimeMillis();
		SimpleDateFormat simDF = new SimpleDateFormat("yyyyMMddHHmmss");
		int randomNumber = (int)(Math.random()*100);
		Date nowdate = new Date(cureentTime);
		String merchant_uid = "tydeeeshop_" + randomNumber + simDF.format(nowdate);
		return merchant_uid;
	}
	private String kakaoPayJS() {
		String js = "<script type='text/javascript'>"
				+ "const IMP = window.IMP;"
				+ "IMP.init('imp00320262');"
				+ "IMP.request_pay({"
				+ "pg:'kakaopay',"
				+ "pay_method:'card',"
				+ "merchant_uid:'"+ merchant_uid + "',"
				+ "name:'" + item_lead_name + "', "
				+ "amount:'" + total_price + "',"
				+ "buyer_email:'" + email + "', "
				+ "buyer_name:'" + user_name + "', "
				+ "buyer_tel:'" + user_phone + "', "
				+ "buyer_addr:'" + user_address + "', "
				+ "buyer_postcode:'" + user_postcode
				+ "'}, rsp => {"
				+ "if (rsp.success){"
				+ "var msg = '결제가 완료되었습니다.';"
				+ "msg += '상점 거래내역 ID : '+rsp.merchant_uid;"
				+ "msg += '결제 금액 : ' + rsp.paid_amount;"
				+ "msg += '결제 상품 : ' + rsp.name;"
				+ "alert(msg);"
				+ "} else {"
				+ "var msg = '결제에 실패하였습니다.';"
				+ "msg += '에러 내용 : ' + rsp.error_msg;"
				+ "alert(msg);"
				+ "}"
				+ "location.replace('order.do?command=result');"
				+ "});"
				+ "</script>";
		return js;
		// 이후에는 location.hre='' 부분 수정해야 함!
	}
}
