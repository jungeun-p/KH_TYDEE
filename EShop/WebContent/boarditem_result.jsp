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
<script>
	let span = document.createElement("span");
	let msg = localStorage.getItem("msg");
	console.log(msg);
	span.textContent = msg;
	document.body.appendChild(span);
</script>
</body>
</html>