package com.test.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.test.dao.VisionTest;

@WebServlet("/visiontest")
public class visiontest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public visiontest() {
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
		if (command.equals("titfortat")) {
			String path = request.getSession().getServletContext().getRealPath("");
			int size = 1024*1024*10;
			String file = "";
			String originalFile = "";
			
		    try{
		        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8");

		        Enumeration files = multi.getFileNames();
		        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장

		        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
		        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    String visionpath = path + "\\" + file;
		    System.out.println(visionpath);
		    String result = VisionTest.detectDocumentText(visionpath);
//		    System.out.println(result);
		    if(result.equals("")) {
		    	request.setAttribute("condition", "really fail");
		    } else {
		    	request.setAttribute("condition", "not bad");
		    }
		    request.setAttribute("text", result);
		    File f = new File(visionpath);
		    if (f.exists()) {
		    	f.delete();
		    	System.out.println("파일 삭제");
		    }
		    RequestDispatcher dispatch = request.getRequestDispatcher("vision_test_result.jsp");
		    dispatch.forward(request, response);
		}
		
	}

}
