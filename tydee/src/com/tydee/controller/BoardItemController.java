package com.tydee.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.TydeeRenamePolicy;
import com.tydee.dao.BoardItemDao;
import com.tydee.dto.BoardItemDto;
import com.login.dto.UserInfoDto;

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
		} else if (command.equals("categoryList")) {
			String item_category = request.getParameter("item_category");
			List<BoardItemDto> itemList = dao.selectListSomeY(item_category);
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
			response.sendRedirect("item.do?command=list");
		} else if (command.equals("insertImg")) {
			String tiny_image = "";
			String path = request.getSession().getServletContext().getRealPath("images").replace("\\","\\\\");
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdir();
			}
			int size = 1024*1024*10;
			String file = "";
			String originalFile = "";
		    try{
		        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new TydeeRenamePolicy());
		        
		        Enumeration files = multi.getFileNames();
		        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장
		        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
		        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    request.setAttribute("item_image", file);
			dispatch("item.do?command=imguploded", request, response);
		} else if (command.equals("imguploded")) {
			String item_image = (String) request.getAttribute("item_image");
			String js = "<script type='text/javascript'>"
					+ "let isUpload = opener.document.getElementsByClassName('item__upload')[0].getElementsByTagName('span')[0];"
					+ "isUpload.textContent = '이미지 업로드 완료';"
					+ "let hidden = document.createElement('input');"
					+ "hidden.setAttribute('type', 'hidden');"
					+ "hidden.setAttribute('name','item_image');"
					+ "hidden.setAttribute('value','"+item_image+"');"
					+ "let where = opener.document.getElementsByClassName('item__upload')[0];"
					+ "where.appendChild(hidden);"
					+ "self.close();"
					+ "</script>";
			response.getWriter().append(js);
		} else if (command.equals("update")) {
			int item_no = Integer.parseInt(request.getParameter("item_no"));
			BoardItemDto dto = dao.selectOne(item_no);
			request.setAttribute("item", dto);
			dispatch("boarditem_update.jsp", request, response);
		} else if (command.equals("updateres")) {
			int item_no = Integer.parseInt(request.getParameter("item_no"));
			String item_category = request.getParameter("item_category");
			String item_title = request.getParameter("item_title");
			String item_content = request.getParameter("item_content");
			String item_image = request.getParameter("item_image");
			int item_price = Integer.parseInt(request.getParameter("item_price"));
			BoardItemDto dto = new BoardItemDto(item_no, item_category, item_title, item_content, item_image, item_price);
			int res = dao.update(dto);
			if (res > 0) {
				System.out.println("수정 성공");
			}
			response.sendRedirect("item.do?command=list");
		} else if (command.equals("delete")) {
			int item_no = Integer.parseInt(request.getParameter("item_no"));
			int res = dao.delete(item_no);
			if (res > 0) {
				System.out.println("삭제 성공");
			}
			response.sendRedirect("item.do?command=list");
		} else if (command.equals("eshopList")) {
			// 관리자페이지의 판매 상품 목록 보기?
		}
	}
	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
}
