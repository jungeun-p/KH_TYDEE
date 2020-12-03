package com.tydee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mytydee.do")
public class TydeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TydeeController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String command = request.getParameter("command");
		TydeeGson tydee = new TydeeGson();
		if (command.equals("show")) {
			String jsonobject = tydee.callJson();
			JsonWriter.makeJsonFile(jsonobject);
			dispatch("mytydee.jsp", request, response);
			
		}
	}

	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
