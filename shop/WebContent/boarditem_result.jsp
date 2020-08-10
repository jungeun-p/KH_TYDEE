<%@page import="com.tydee.dto.BoardItemDto"%>
<%@page import="java.util.List"%>
<%@page import="com.tydee.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3914a9940d.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="userinfo">
		<c:choose>
			<c:when test="${empty loginuser }">
				<a href="userinfo_login.jsp">login</a>
			</c:when>
			<c:otherwise>
				<a href="#">logout</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="tydee__eshop">
		<div class="tydee__eshop__title">
			<h1>TYDEE ESHOP :: DETAIL</h1>
			<div class="tydee__hashtag">
				<a href="item.do?command=list"><span class="tydee__hashtag">All</span></a>
				<c:if test="${!empty categoryList }">
					<c:forEach items="${categoryList }" var="category">
						<a href="item.do?command=categoryList&item_category=${category.item_category}"><span class="tydee__hashtag">${category.item_category}</span></a>
					</c:forEach>
				</c:if>
			</div>
			<c:if test="${loginuser.user_role eq 'ADMIN'}">
				<a href="item.do?command=insert"><p class="wrtie__eshop"><i class="fas fa-plus"></i></p></a>
			</c:if>
			<c:if test="${loginuser.user_role ne 'ADMIN' and !empty loginuser }">
				<a href="basket.do?command=list"><p class="cart__eshop"><i class="fas fa-shopping-cart"></i></p></a>
			</c:if>
		</div>
		<div class="resultinfo">
			<div class="content">
				<section class="modals">
					<div class="modal">
						<div class="modal__wrap">
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
<script>
	let where = document.getElementsByClassName("modal__wrap")[0];
	let msg = localStorage.getItem("msg");
	where.innerHTML = msg;
</script>
</body>
</html>