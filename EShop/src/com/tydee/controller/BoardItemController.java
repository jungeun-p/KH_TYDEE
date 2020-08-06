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

import com.tydee.dao.BoardItemDao;
import com.tydee.dto.BoardItemDto;
import com.tydee.dto.UserInfoDto;

/**
 * Servlet implementation class BoardItemController
 */
@WebServlet("/BoardItemController")
public class BoardItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardItemController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		if (session.getAttribute("loginuser") != null) {
			UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
			int user_no = loginuser.getUser_no();
		}
		BoardItemDao dao = new BoardItemDao();
		String command = request.getParameter("command");
		if (command.equals("list")) {
			List<BoardItemDto> itemList = dao.selectListAllY();
			request.setAttribute("itemList", itemList);
			List<BoardItemDto> categoryList = dao.selectCategory();
			request.setAttribute("categoryList", categoryList);
			dispatch("boarditem_list.jsp", request, response);
		} else if (command.equals("detail")) {
			 int item_no = Integer.parseInt(request.getParameter("item_no"));
			 BoardItemDto dto = dao.selectOne(item_no);
			 request.setAttribute("item", dto);
			 List<BoardItemDto> categoryList = dao.selectCategory();
			 request.setAttribute("categoryList", categoryList);
			 dispatch("boarditem_detail.jsp", request, response);
		} else if (command.equals("insert")) {
			dispatch("boarditem_insert.jsp",request, response);
		} else if (command.equals("insertres")) {
			String item_category = request.getParameter("item_category");
			String item_title = request.getParameter("item_title");
			String item_content = request.getParameter("item_content");
			String item_image = request.getParameter("item_image");
			int item_price = Integer.parseInt(request.getParameter("item_price"));
			BoardItemDto dto = new BoardItemDto(item_category, item_title, item_content, item_image, item_price);
			int res = dao.insert(dto);
			if (res > 0) {
				System.out.println("등록 성공");
			}
			// 관리자 전용 eshop 관리 페이지가 있다면 거기가 좋겠지만
			dispatch("item.do?command=list", request, response);
		} else if (command.equals("insertImg")) {
			
		} else if (command.equals("update")) {
			
		} else if (command.equals("delete")) {
			
		} else if (command.equals("")) {
			
		}
	}
	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
