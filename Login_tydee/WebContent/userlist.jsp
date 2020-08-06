<%@page import="com.login.dto.UserInfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급변경</title>
</head>

<body>

<%
	List<UserInfoDto> list = (List<UserInfoDto>)request.getAttribute("list");
%>

	<h1>회원정보 전체 조회</h1>
	<table border=1>
		<tr>
			<th>회원번호</th>
			<th>닉네임</th>
			<th>이메일</th>
			<th>등급</th>
		</tr>
<%
	if (list.size() == 0){
%>
		<tr>
			<td colspan="4">---회원 정보가 없습니다---</td>
		</tr>
	
<%
	}else{
		for(UserInfoDto dto : list){
%>
	<tr>
		<td><%=dto.getUser_no() %></td>
		<td><%=dto.getUser_nickname() %></td>
		<td><%=dto.getUser_id() %></td>
		<td>
			<%=dto.getUser_role() %><input type="button"  value="변경" onclick="location.href='controller.do?command=updaterole&user_no=<%=dto.getUser_no()%>'"/>
		</td>
	</tr>

<%
		}
	}
%>
	<tr>
		<td colspan="4" align="right">
			<input type="button" value="메인" onclick="location.href='adminmain.jsp'"/>
		</td>
	</tr>

	</table>

</body>
</html>







