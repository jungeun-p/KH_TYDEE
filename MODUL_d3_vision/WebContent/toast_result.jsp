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
    String textinput = request.getParameter("example");
    String toast = request.getParameter("toastContent");
%>
    <h1><%=textinput %></h1>
    <%=toast %>
    <input type="button" value="뒤로가기" onclick="location.href='toast_example.jsp'" />
</body>

</html>