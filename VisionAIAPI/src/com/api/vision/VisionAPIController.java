package com.api.vision;

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
import com.oreilly.servlet.multipart.TydeeRenamePolicy;

/**
 * Servlet implementation class VisionAPIController
 */
@WebServlet("/vision")
public class VisionAPIController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VisionAPIController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		if (command.equals("doVision")) {
			String path = request.getSession().getServletContext().getRealPath("images");
			// 이 부분 코드는 이제보니 다소 불필요한 듯하다 String path = request.getServletContext().getRealPath("");
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdir();
				System.out.println("디렉토리 생성");
			}
			int size = 1024*1024*10;
			String file = "";
			String originalFile = "";
			
		    try{
		    	// form enctype="multipart/form-data"로 보낸 파일을 MultipartRequest로 받는다
		    	// http://www.servlets.com/cos/javadoc/com/oreilly/servlet/MultipartRequest.html
		        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8");
		        // new MultipartRequest(javax.servlet.http.HttpServletRequest request, String saveDirectory, int maxPostSize, String encoding)
		        // vision ai api를 활용할 때에는 이미지 저장할 필요를 느끼지 못해서
		        // FileRenamePolicy policy 파라미터가 없는 생성자를 사용했다
		        // MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new TydeeRenamePolicy());

		        Enumeration files = multi.getFileNames();
		        // java.util.Enumeration(interface) : 한번에 일련의 엘리먼츠들을 생성하는 인터페이스
		        // multipartrequest 객체로부터 전달받은 파일 이름을 저장
		        // 이하는 여러 개의 파일을 받아온다면 while(files(Enumeration 객체).hasMoreElements()) {...} 로 감싸야 하는 부분이다
		        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장
		        file = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
		        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    String visionpath = path + "\\" + file;
		    System.out.println("업로드된 파일 저장 경로 : "+ visionpath);
		    String result = VisionTest.detectDocumentText(visionpath);
		    // 해당 경로에 업로드된 파일을 vision ai api로 text-detecting(String)
		    System.out.println("추출된 텍스트 : " + result.substring(0, 20));
		    request.setAttribute("text", result);
		    File f = new File(visionpath);
		    if (f.exists()) {
		    	f.delete();
		    	System.out.println("파일 삭제");
		    }
		    RequestDispatcher dispatch = request.getRequestDispatcher("viewpage.jsp");
		    dispatch.forward(request, response);
		}
	}

}
