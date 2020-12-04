<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.login.dto.loginDto"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
table {
	border: none;
}
</style>

<body>


	<h1>회원가입</h1>

	<form action="login.do?command=signres" method="post">

		<table border="1">
			<tr>
				<th>이메일</th>
				<td><input type="text" name="myemail" required="required"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mypw" required="required" /></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="myname" required="required" /></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="가입" />
				<input type="button" value="취소" onclick="location.href='login.jsp'" />
			</tr>
		</table>
	</form>

</body>
</html>