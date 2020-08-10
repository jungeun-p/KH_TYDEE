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
	<form action="member.do" method="post">
		<input type="hidden" name="command" value="login">
		<fieldset>
			<legend>Sign In</legend>
			<input type="email" name="user_id" autofocus="autofocus"/>
			<input type="password" name="user_pw" />
			<input type="submit" value="sign in" />
		</fieldset>
	</form>
</body>
</html>