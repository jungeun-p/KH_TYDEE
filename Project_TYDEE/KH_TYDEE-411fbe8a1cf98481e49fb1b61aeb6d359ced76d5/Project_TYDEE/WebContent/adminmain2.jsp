<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminmain</title>
 <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./login_css/tydee__admin.css" />
</head>
<%
	UserInfoDto loginuser = (UserInfoDto)session.getAttribute("loginuser");
%>
<body>

	<h1>${loginuser.user_nickname } 님 환영합니다.</h1>
	<div>
		<span>등급 : <%=loginuser.getUser_role() %></span><br/>
		<a href ="controller.do?command=logout">로그아웃</a>
	</div>
	<div>
		<a href="controller.do?command=listall">회원정보 전체조회</a>
	</div>
</body>
</html>