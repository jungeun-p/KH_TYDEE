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
<body>
	<div id="result"></div>
	<input type="button" value="뒤로가기" onclick="location.href='index.jsp'" />
	<script>
		let msg = localStorage.getItem("msg");
		document.getElementById("result").innerHTML = msg;
	</script>
</body>
</html>