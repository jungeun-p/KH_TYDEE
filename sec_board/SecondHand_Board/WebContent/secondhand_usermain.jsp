<%@page import="com.tydee.second.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	img{
		width:130px; length:130px;
		border-radious :1px;
	}

</style>
</head>
<body>

												
	<h2>&lt;${loginuser.user_nickname }회원님 반갑습니다.&gt;</h2>
	<a href="secondhand_controller.do?command=list&user_id=${loginuser.user_id }">- ( 회원 )중고게시판 고!</a>
															
	

</body>
</html>