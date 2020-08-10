<%@page import="com.login.dao.UserInfoDao"%>
<%@page import="com.login.dto.UserInfoUpdateDto"%>
<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user main</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./login_css/tydee__user.css" />
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
%>
<body>
	<section class="admin__page">
		<form action="controller.do" method="post">
			<input type="hidden" name="command" value="usercheck" />
			<div class="admin__login">
				<p>My Account</p>
				<span>password</span> <input class="title__inner" type="password"
					name="title" /> <input class="submit" type="submit" value="login"
					onclick="" />
			</div>
		</form>
	</section>
</body>
</html>





