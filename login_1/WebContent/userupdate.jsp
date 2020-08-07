<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<%
	UserInfoDto dto = (UserInfoDto)request.getAttribute("dto");
%>
<body>

	<h1>내 정보 수정</h1>
	<form action="controller.do" method="post">
		<input type="hidden" name="command" value="userupdate"/>
		<input type="hidden" name="user_no" value="<%=dto.getUser_no()%>"/>
		<table border="1">
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" name="nick" value="<%=dto.getUser_nickname()%>"/>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="text" name="pw" value="<%=dto.getUser_pw() %>"/>
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="email" value="<%=dto.getUser_id() %>" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
					<input type="submit" value="수정"/>
					<input type="button" value="취소" onclick="controller.do?command=usermain"/>
				</td>
			</tr>
		
		</table>
	</form>
</body>
</html>




