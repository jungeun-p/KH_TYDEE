package com.tydee.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
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
import com.oreilly.servlet.MultipartRequest;
import com.tydee.dao.MyTydeeVisionDao;
import com.tydee.dto.MyTydeeVisionDto;
import com.login.dto.UserInfoDto;
import com.tydee.utils.MyTydeeVisionDetectText;

@WebServlet("/VisionApiController")
public class MyTydeeVisionController extends HttpServlet {
	// vision.do로 이동
	private static final long serialVersionUID = 1L;
	
	public MyTydeeVisionController() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		String command = request.getParameter("command");
		MyTydeeVisionDao dao = new MyTydeeVisionDao();
		HttpSession session = request.getSession();
		UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
		int user_no = loginuser.getUser_no();
		if (command.equals("insert")) {
			String path = request.getSession().getServletContext().getRealPath("images");
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdir();
			}
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
		    String visionpath = path + "\\"+file;
		    System.out.println(visionpath);
		    String result = MyTydeeVisionDetectText.detectDocumentText(visionpath);
		    request.setAttribute("visionresult", result);
		    File f = new File(visionpath);
		    if (f.exists()) {
		    	f.delete();
		    	System.out.println("파일 삭제");
		    }
		    dispatch("vision.do?command=insertres", request, response);
		} else if (command.equals("insertres")) {
			String visionresult = (String) request.getAttribute("visionresult");
			MyTydeeVisionDto dto = new MyTydeeVisionDto(user_no, visionresult);
			int res = dao.insertVision(dto);
			if (res > 0) {
				String js = "<script type='text/javascript'>"
						+ "opener.listRequest();"
						+ "self.close();"
						+ "</script>";
				response.getWriter().append(js);
			} else {
				String js = "<script type='text/javascript'>"
						+ "alert('실패...');"
						+ "opener.listRequest();"
						+ "self.close();"
						+ "</script>";
				response.getWriter().append(js);
			}
		} else if (command.equals("delete")) {
			
		} else if (command.equals("showlist")) {
			List<MyTydeeVisionDto> list = dao.selectList(user_no);
			List<Map<String, Object>> maplist = new ArrayList();
			String json = "";
			if (list.size() != 0) {
				int numbering = 1;
				for (MyTydeeVisionDto dto : list) {
					Map<String, Object> one = new HashMap<String, Object>();
					one.put("no", numbering);
					one.put("vision_text", dto.getVision_text().substring(0, 10)+"...");
					one.put("vision_no", dto.getVision_no());
					one.put("vision_regdate", dto.getVision_regdate());
					maplist.add(one);
					numbering++;
				}
			}
			json = new Gson().toJson(maplist);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} else if (command.equals("showone")) {
			int vision_no = Integer.parseInt(request.getParameter("vision_no"));
			MyTydeeVisionDto dto = dao.selectOne(vision_no);
			Map<String,Object> one = new HashMap<String, Object>();
			one.put("vision_no", dto.getVision_no());
			one.put("vision_text", dto.getVision_text());
			one.put("vision_regdate", dto.getVision_regdate());
			String json = new Gson().toJson(one);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		}
	}
	
	protected void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
