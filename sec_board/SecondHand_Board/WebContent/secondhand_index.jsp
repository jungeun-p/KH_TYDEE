<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="secondhand_controller.do" method="post">
		<input type="hidden" name="command" value="login">
		<fieldset>
			<legend>Sign In</legend> 
		<strong> I D : </strong> <input type="email" name="user_id" autofocus="autofocus"/><p>
		<strong> P W : </strong> <input type="password" name="user_pw" /></p>
			<p><input type="submit" value="Sign In" /></p>
				<input type="button" value="Logout" onclick="location.href=''"/>
		</fieldset>
	</form>						
	
	<a href="secondhand_controller.do?command=list">-(비회원 상태로) 중고게시판으로 이동~!</a>
	
</body>
</html>

