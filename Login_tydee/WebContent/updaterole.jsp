<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급수정</title>
</head>
<body>


	<form action="controller.do" method="post">
		<input type="hidden" name="command" value="updateroleres" /> <input
			type="hidden" name="user_no" value="${dto.user_no }" />
		<table border=1>
			<tr>
				<th>현재 회원등급</th>
				<td><input type="text" name="nowRole"
					value="${dto.user_role }" /></td>
			</tr>
			<tr>
				<td>변경할 등급</td>
				<td><input type="radio" name="myrole" value="ADMIN" id="admin" />
					<label for="admin">관리자</label>
					 <input type="radio" name="myrole"value="EXPERT" id="expert" /> 
					 <label for="expert">전문가</label>
					  <input type="radio" name="myrole" value="USER" id="user" /> 
					  <label for="user">사용자</label></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="변경" />
					<input type="button" value="취소"
					onclick="location.href='controller.do?command=adminmain'" /></td>
			</tr>
		</table>

	</form>
</body>
</html>





