<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Tip 파일 업로드 팝업</title>
</head>

<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
    int user_no = loginuser.getUser_no();
    if (user_no == 0 || loginuser == null) {
%>
	<script type="text/javascript">
        self.close();
	</script>
<%
    }
%>

<body>
	<form action="tip.do?command=insertImg" method="post" enctype="multipart/form-data">
		 <section>
            <input type="submit" value="저장"/>
            <input type="file" accept="image/*" id="image" name="file_name" />
            <input type="button" value="닫기" onclick="self.close();"/>
        </section>
         <section>
            <img id="frame" />
        </section>
	</form>
	<script type="text/javascript" src="tip_js/tip_file_popup.js"></script>

</body>
</html>