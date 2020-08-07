<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<span>${map.user_name }</span>
	<span>${map.user_phone }</span>
	<span>${map.user_postcode }</span>
	<span>${map.user_address_first }</span>
	<span>${map.user_address_second }</span>
	<span>${map.user_address_extra }</span>
	<span>${map.user_total_price }</span>
</body>
</html>