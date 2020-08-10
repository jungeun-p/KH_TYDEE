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
<title>Insert title here</title>
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
	<div class="header">
	<%@ include file="./include/main_header_test_login.jsp"%>
	</div>
	<section class="tydee__index">
      <div class="images">
        <div class="image"><img src="img/scroll.png" alt="" /></div>
        <div class="image"><img src="img/7.jpg" alt="" /></div>
        <div class="image"><img src="img/8.jpg" alt="" /></div>
      </div>
    </section>
	<%@ include file="./include/footer.jsp"%>
</body>
</html>