<%@page import="com.tydee.tip.dto.UserInfoDto"%>
<%@page import="com.tydee.tip.dto.tip_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RESULT</title>
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
if (loginuser == null) {
	pageContext.forward("tip_index.jsp");
}
%>
<body>
	<table border='1'>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>요약</th>
			<th>작성일자</th>
			
		</tr>
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.tip_no }</td>
				<td onclick="location.href='tip.do?command=detail&tip_no=${dto.tip_no}'">${dto.tip_title }</td>
				<td>${dto.tip_summary }</td>
				<td>${dto.tip_regdate }</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="팁 추가하기"
		onclick="location.href='tip_write.jsp'" />
	
</body>

</html>