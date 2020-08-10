<%@page import="com.tydee.second.dto.UserInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tydee.second.dto.SecondCommDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	img{
		width : 100px; height : 100px;
	}
		
</style>

<%
	
%>

		
	
	
	


</head>
<body>

	<form action="secondhand_controller.do" method="post">
	<input type="hidden" name="command" value="write"/>
	<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id }"/>
	<input type="hidden" name="user_no" value="${dto.user_no }"/>
	
		<table border="1">
			<col width="70px">
			<col width="85px">
			<col width="100px">
			<col width = "100px">
		
			
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>글 제목</th>
				<th>가격</th>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
						<td colspan="4">---작성된 글이 존재하지 않습니다.---</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var ="dto">
							<tr>
									<td>${dto.sec_no }</td>
									<td><a href="secondhand_controller.do?command=detail&sec_no=${dto.sec_no }&user_no=${dto.user_no}"><img alt="image" src="resources/img/img00.jpg"/></a></td>
									<td><a href="secondhand_controller.do?command=detail&sec_no=${dto.sec_no }&user_no=${dto.user_no}">${dto.sec_title }</a></td>
									<td>${dto.sec_price }</td>
								
							</tr>
						
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td colspan="3" align="right"><input type="submit" value="글 작성"/></td>
			</tr>
			
		</table>
	
	</form>

</body>
</html>