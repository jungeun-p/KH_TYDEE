<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Userinfo</title>
</head>
<%
	UserInfoDto dto = (UserInfoDto)request.getAttribute("dto");
%>
<body>
	<h1>내 정보 조회</h1>
	<table border=1>
		<tr>
			<th>닉네임</th>
			<td><%=dto.getUser_nickname() %></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=dto.getUser_id() %></td>
		</tr>
		<tr>
			<th>등급</th>
			<td><%=dto.getUser_role() %></td>
		</tr>
		<tr>
			<td colspan="3" align=right>
				<input type="button" value="메인" onclick="controller.do?command=usermain"/>
				<input type="button" value="수정" onclick=""/>
				<input type="button" value="탈퇴" onclick=""/>
			</td>
		</tr>
	
	</table>

</body>
</html>

