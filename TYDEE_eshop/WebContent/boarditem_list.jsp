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
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3914a9940d.js"
	crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/boarditem_list.css" />
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
</head>
<%
	List<BoardItemDto> itemList = (List<BoardItemDto>) request.getAttribute("itemList");
UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
%>
<body>
	<!-- header -->
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
	<!-- eshop title -->
	<div class="tydee__eshop">
		<div class="tydee__eshop__title">
			<h1>TYDEE ESHOP</h1>
			<div class="tydee__hashtag">
				<a href="item.do?command=list"><span class="tydee__hashtag">All</span></a>
				<c:if test="${!empty categoryList }">
					<c:forEach items="${categoryList }" var="category">
						<a
							href="item.do?command=categoryList&item_category=${category.item_category}"><span
							class="tydee__hashtag">${category.item_category}</span></a>
					</c:forEach>
				</c:if>
			</div>
			<!-- write or cart -->
			<c:if test="${loginuser.user_role eq 'ADMIN'}">
				<a href="item.do?command=insert"><p class="wrtie__eshop">
						<i class="fas fa-plus"></i>
					</p></a>
			</c:if>
			<c:if test="${loginuser.user_role ne 'ADMIN' or empty loginuser }">
				<a href="basket.do?user_no=${loginuser.user_no }"><p
						class="cart__eshop">
						<i class="fas fa-shopping-cart"></i>
					</p></a>
			</c:if>
		</div>
		<!-- list -->
		<div class="listinfo">
			<div class="content">
				<section class="modals">
					<c:choose>
						<c:when test="${empty itemList }">
							<div class="modal">
								<div class="modal__white">
									<div class="modal__wrap_none">
										<p class="modal__title">판매 중인 상품이 없습니다</p>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach items="${itemList }" var="item">
								<a href="item.do?command=detail&item_no=${item.item_no }">
									<div class="modal">
										<div class="modal__white">
											<div class="modal__wrap">
												<img class="modal__img"
													src="./shop_images/${item.item_image ? item.item_image : 'basket1.jpg' }" />
												<div class="modal__description">
													<p class="modal__name">${item.item_title }</p>
													<p class="modal__explain">${item.item_price }won</p>
												</div>
											</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</section>
			</div>
		</div>
	</div>
</body>
</html>