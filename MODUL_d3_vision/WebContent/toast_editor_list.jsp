<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>RESULT</title>
</head>

<body>
	<table border='1'>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일자</th>
		</tr>
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.seq }</td>
				<td onclick="location.href='toast.do?command=detail&seq=${dto.seq}'">${dto.title }</td>
				<td>${dto.regdate }</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" value="뒤로가기"
		onclick="location.href='toast_editor.jsp'" />

</body>

</html>