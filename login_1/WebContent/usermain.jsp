<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user main</title>
</head>
<%
	UserInfoDto dto = (UserInfoDto)session.getAttribute("dto");
%>

<body>

	<h1><%= dto.getUser_nickname() %> 님 환영합니다.</h1>
	<div>
		<span>등급 : <%=dto.getUser_role() %><br/></span>
	</div>
	<input type="button" value="정보수정" onclick="controller.do?command=userupdate"/>
	<input type="button" value="로그아웃" onclick="location.href='index.jsp'"/>
	
	
</body>
</html>





