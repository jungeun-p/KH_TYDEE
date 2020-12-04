<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>RESULT</title>
</head>

<body>
<% 
	String title = request.getParameter("title");
    String content = request.getParameter("content");
%>
    <h1><%=title %></h1>
    <%=content %>
    <input type="button" value="뒤로가기" onclick="location.href='toast_editor.jsp'" />
</body>

</html>