<%@page import="com.tydee.tip.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
if (loginuser == null) {
	pageContext.forward("tip_index.jsp");
}
%>
<body>
	<h1>Tip 게시판 관리자</h1>
</body>
</html>