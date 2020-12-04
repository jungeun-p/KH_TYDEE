package com.toast.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.toast.dao.ToastDao;
import com.toast.dto.ToastDto;

@WebServlet("/ToastController")
public class ToastController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ToastController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		ToastDao dao = new ToastDao();
		if (command.equals("write")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			ToastDto dto = new ToastDto(0, title, content, null);
			int res = dao.insert(dto);
			if (res > 0) {
				jsResponse("등록 성공!", "toast_editor.jsp", response);
			} else {
				jsResponse("등록 실패...", "toast_editor.jsp", response);
			}
			
		} else if (command.equals("list")) {
			List<ToastDto> list = dao.selectList();
			request.setAttribute("list", list);
			dispatch("toast_editor_list.jsp", request, response);
		} else if (command.equals("detail")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			ToastDto dto = dao.selectOne(seq);
			System.out.println(dto.getContent());
			request.setAttribute("dto", dto);
			dispatch("toast_editor_detail.jsp", request, response);
		}
	}
	
	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String js = "<script type='text/javascript'> "
						+ "alert('"+msg+"');"
						+ "location.href='"+url+"';"
						+ "</script>";
		response.getWriter().append(js);
	}

}
