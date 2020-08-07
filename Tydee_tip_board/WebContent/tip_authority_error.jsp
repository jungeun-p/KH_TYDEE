<%@page import="com.tydee.tip.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR </title>
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
if (loginuser == null) {
	pageContext.forward("tip_index.jsp");
}
%>
<body>
	<!-- 컨트롤러에서 role이 admin이 아닐떄 나오는 페이지입니다.(미완성) -->
	<h1>😵삭제 권한이 없습니다</h1>
	<input type="button" value="돌아가기" onclick="location.href='tip_main.jsp'">
</body>
</html>