package com.tydee.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.tydee.dao.BoardItemDao;
import com.tydee.dao.ItemBasketDao;
import com.tydee.dao.ItemOrderDao;
import com.tydee.dao.UserAddressDao;
import com.tydee.dto.BoardItemDto;
import com.tydee.dto.ItemBasketDto;
import com.tydee.dto.ItemOrderDto;
import com.tydee.dto.ItemTotalDto;
import com.login.dto.UserInfoDto;

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
	private int total_price = 0;
	private String user_address = "";
	private String item_lead_name = "";
	private String email = "";
	private int user_no = 0;
	private int address_no = 0;
	
       
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
		user_no = (loginuser == null ? 0 : loginuser.getUser_no());
		email = (loginuser == null ? "" : loginuser.getUser_id());
		ItemOrderDao iodao = new ItemOrderDao();
		ItemBasketDao ibdao = new ItemBasketDao();
		
		String command = request.getParameter("command");
		if (command.equals("ready")) {
			List<ItemBasketDto> list = ibdao.selectList(user_no);
			request.setAttribute("list", list);
			int totalPrice = 0;
			if (ibdao.totalPrice(user_no).get(0) != null) {
				totalPrice = ibdao.totalPrice(user_no).get(0);
				request.setAttribute("totalPrice", totalPrice);
				dispatch("boarditem_order.jsp", request, response);
			} else {
				String js = "<script type='text/javascript'>"
						+ "alert('장바구니에 물건이 없습니다');"
						+ "location.href='item.do?command=list';"
						+ "</script>";
				response.getWriter().append(js);
			}
		} else if (command.equals("directready")) {
			if (user_no == 0) {
				String js = "<script type='text/javascript'>"
						+ "alert('구매는 로그인 후 이용 가능합니다');"
						+ "location.href='item.do?command=list';"
						+ "</script>";
				response.getWriter().append(js);
			} else {
				int item_no = Integer.parseInt(request.getParameter("item_no"));
				BoardItemDao bidao = new BoardItemDao();
				BoardItemDto item = bidao.selectOne(item_no);
				int item_quan = Integer.parseInt(request.getParameter("item_quan"));
				int totalPrice = item.getItem_price() * item_quan;
				ItemBasketDto dto = new ItemBasketDto(0, user_no, item_no, item_quan, item.getItem_title(), item.getItem_price(), item.getItem_image(), totalPrice); 
				List<ItemBasketDto> list =  new ArrayList<ItemBasketDto>();
				list.add(dto);
				request.setAttribute("list", list);
				request.setAttribute("directlist", list);
				request.setAttribute("totalPrice", totalPrice);
				dispatch("boarditem_order.jsp", request, response);
			}
		} else if (command.equals("order")) {
	        merchant_uid = makeMerchant_uid();
			user_name = request.getParameter("user_name");
			user_phone = request.getParameter("user_phone");
			user_postcode = request.getParameter("user_postcode");
			total_price = Integer.parseInt(request.getParameter("total_price"));
			user_address = request.getParameter("user_address");
			item_lead_name = request.getParameter("item_lead_name");
			address_no = Integer.parseInt(request.getParameter("address_no"));
			String js = kakaoPayJS();
			request.setAttribute("merchant_uid", merchant_uid);
			request.setAttribute("item_lead_name", item_lead_name);
			request.setAttribute("item_total_price", total_price);
			request.setAttribute("address_no", address_no);
			request.setAttribute("js", js);
			dispatch("boarditem_kakaopay.jsp", request, response);
		} else if (command.equals("newaddrorder")) {
			merchant_uid = makeMerchant_uid();
			user_name = (String) request.getAttribute("user_name");
			user_phone = (String) request.getAttribute("user_phone");
			user_postcode = (String) request.getAttribute("user_postcode");
			total_price = Integer.parseInt(request.getParameter("total_price"));
			user_address = request.getParameter("user_address");
			item_lead_name = request.getParameter("item_lead_name");
			address_no = (int) request.getAttribute("address_no");
			String js = kakaoPayJS();
			request.setAttribute("merchant_uid", merchant_uid);
			request.setAttribute("item_lead_name", item_lead_name);
			request.setAttribute("item_total_price", total_price);
			request.setAttribute("address_no", address_no);
			request.setAttribute("js", js);
			dispatch("boarditem_kakaopay.jsp", request, response);
		} else if (command.equals("result")) {
			dispatch("boarditem_result.jsp", request, response);
		} else if (command.equals("insert")) {
			List<ItemBasketDto> list = ibdao.selectList(user_no);
			if (list != null || list.size() != 0) {
				List<ItemOrderDto> insertlist = new ArrayList<ItemOrderDto>();
				for (ItemBasketDto dto : list) {
					ItemOrderDto insertone = new ItemOrderDto();
					insertone.setOrder_title(item_lead_name);
					insertone.setUser_no(user_no);
					insertone.setAddress_no(address_no);
					insertone.setMerchant_uid(merchant_uid);
					insertone.setItem_no(dto.getItem_no());
					insertone.setItem_quan(dto.getItem_quan());
					insertone.setItem_price(dto.getItem_price());
					insertone.setItem_total_price(total_price);
					insertlist.add(insertone);
				}
				int res = iodao.insertList(insertlist);
				dispatch("basket.do?command=deleteAll", request, response);
			} else {
				List<ItemBasketDto> directlist = (List<ItemBasketDto>) request.getAttribute("directlist");
				System.out.println(directlist.get(0).getItem_title());
				List<ItemOrderDto> insertlist = new ArrayList<ItemOrderDto>();
				for (ItemBasketDto dto : directlist) {
					ItemOrderDto insertone = new ItemOrderDto();
					insertone.setOrder_title(item_lead_name);
					insertone.setUser_no(user_no);
					insertone.setAddress_no(address_no);
					insertone.setMerchant_uid(merchant_uid);
					insertone.setItem_no(dto.getItem_no());
					insertone.setItem_quan(dto.getItem_quan());
					insertone.setItem_price(dto.getItem_price());
					insertone.setItem_total_price(total_price);
					insertlist.add(insertone);
				}
				int res = iodao.insertList(insertlist);
				dispatch("order.do?command=result", request, response);
				// boarditem_detail.jsp 화면에서 바로 구매할 경우
				// 구매 목록이 저장되는 케이스는
				// 시간부족으로 미구현
			}
		} else if (command.equals("orderList")) {
			List<ItemOrderDto> list = iodao.selectList(user_no);
			request.setAttribute("list", list);
			dispatch("boarditem_order_list.jsp", request, response);
			// 주문 목록
		} else if (command.equals("orderOne")) {
			// 주문 목록 detail
			int order_no = Integer.parseInt(request.getParameter("order_no"));
			List<ItemTotalDto> list = iodao.selectOne(order_no);
			request.setAttribute("list", list);
			dispatch("boarditem_order_detail.jsp", request, response);
		} else if (command.equals("eshopList")) {
			List<ItemOrderDto> list = iodao.selectList(user_no);
			request.setAttribute("list", list);
			dispatch("boarditem_order_list.jsp", request, response);
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
				+ "var msg = '<h3>결제가 완료되었습니다.</h3>';"
				+ "msg += '<p>상점 거래내역 ID : '+ rsp.merchant_uid +'</p>';"
				+ "msg += '<p>결제 금액 : &#8361;'+ rsp.paid_amount.toLocaleString() +'</p>';"
				+ "msg += '<p>결제 상품 : ' + rsp.name +'</p>';"
				+ "localStorage.setItem('msg', msg);"
				+ "location.replace('order.do?command=insert');"
				+ "} else {"
				+ "var msg = '<h3>결제에 실패하였습니다.</h3>';"
				+ "msg += '<p>에러 내용 : ' + rsp.error_msg + '</p>';"
				+ "localStorage.setItem('msg', msg);"
				+ "location.replace('order.do?command=result');"
				+ "}"
				+ "});"
				+ "</script>";
		return js;
		// 이후에는 location.hre='' 부분 수정해야 함!
	}
}
