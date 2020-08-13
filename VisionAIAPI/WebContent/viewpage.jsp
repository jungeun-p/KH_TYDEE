<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#viewer {
	max-width: 500px;
}
</style>
<% String text = (String) request.getAttribute("text"); %>
</head>
<body>
	<div id="viewer">
		<%=text %>
	</div>
</body>
</html>