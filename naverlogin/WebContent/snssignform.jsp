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
<body>
	<%
		loginDto snsdto = (loginDto) request.getAttribute("snsdto");
	%>

	<h1>회원가입</h1>

	<form action="naverlogin.do?command=loginres" method="post">
		<%
			if (snsdto != null) {
		%>
		<input type="hidden" name="sns_id" value="<%=snsdto.getSns_id()%>">
		<%
			}
		%>
		<table border="1">
			<tr>
				<th>이메일</th>
				<%
					if (snsdto.getMyemail() != null) {
				%>
				<td><input type="text" name="myemail" required="required"
					value="<%=snsdto.getMyemail()%>" /></td>
				<%
					} else {
				%>
				<td><input type="text" name="myemail" required="required" /></td>
				<%
					}
				%>
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