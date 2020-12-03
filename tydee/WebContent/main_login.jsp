<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TYDEE</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
</head>
<style>
	.header{
	  position: sticky;
	  top:0;
	}
</style>
<body>
	<div class="main">
		<div class="header">
		<%@ include file="./include/main_header_test_login.jsp"%>
		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>    
</body>
</html>