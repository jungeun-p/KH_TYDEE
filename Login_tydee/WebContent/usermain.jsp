<%@page import="com.login.dao.UserInfoDao"%>
<%@page import="com.login.dto.UserInfoUpdateDto"%>
<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">


</script>

<head>
<meta charset="UTF-8">
<title>user main</title>
</head>
<%
	UserInfoDto dto = (UserInfoDto)session.getAttribute("dto");
%>

<body>

	<h1><%= dto.getUser_nickname() %> 님 환영합니다.</h1>
	<div>
		<span>등급 : <%=dto.getUser_role() %><br/></span>
	</div>
	<form action="controller.do" method="post">
		<input type="hidden" name="command" value="userupdate"/>
		<input type="hidden" name="user_no" value="<%=dto.getUser_no()%>"/>
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
				<input type="text" name="email" value="<%=dto.getUser_id() %>" readonly="readonly"/>
				</td>
			</tr>
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
				<td colspan="3" align="right">
					<input type="submit" value="수정"/>
					<input type="button" value="메인" onclick=""/>
					<input type="button" value="로그아웃" onclick="location.href='main.jsp'"/>
				</td>
			</tr>
		
		</table>
	</form>	
</body>
</html>





