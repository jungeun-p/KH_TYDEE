<%@page import="com.tydee.dto.BoardItemDto"%>
<%@page import="java.util.List"%>
<%@page import="com.tydee.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://kit.fontawesome.com/3914a9940d.js"
	crossorigin="anonymous"></script>
</head>
<%
	List<BoardItemDto> itemList = (List<BoardItemDto>) request.getAttribute("itemList");
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
%>
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
			<h1>TYDEE ESHOP</h1>
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
				<a href="item.do?command=eshopList"><p class="list__eshop"><i class="fas fa-bars"></i></p></a>
			</c:if>
			<c:if test="${loginuser.user_role ne 'ADMIN' and !empty loginuser }">
				<a href="basket.do?command=list"><p class="cart__eshop"><i class="fas fa-shopping-cart"></i></p></a>
				<a href="order.do?command=orderList"><p class="list__order"><i class="fas fa-bars"></i></p></a>
			</c:if>
		</div>
		<div class="detailinfo">
			<div class="content">
								<section class="modals">
					<div class="modal">
						<div class="modal__wrap">
							<div class="modal__description">
								<div class="modal__menu">
									<p class="">주문고유번호</p>
									<p class="">총 결제 금액</p>
									<p class="">결제 일자</p>
								</div>
								<div class="modal__contents">
									<p class="">${list[0].merchant_uid}</p>
									<p class=""><fmt:setLocale value="ko_KR"/>
										<fmt:formatNumber type="currency" value="${list[0].item_total_price}"></fmt:formatNumber></p>
									<p class="">${list[0].order_regdate}</p>
								</div>
							</div>
						</div>
					</div>
				</section>
				<section class="modals">
					<c:forEach items="${list }" var="item">
						<a href="item.do?command=detail&item_no=${item.item_no }">
							<div class="modal">
								<div class="modal__wrap">
									<img class="modal__img" src="./images/${empty item.item_image ? '1.jpg' : item.item_image }"/>
									<div class="modal__description">
										<p class="modal__name">${item.item_title }</p>
										<p class="modal__explain"><fmt:setLocale value="ko_KR"/>
										<fmt:formatNumber type="currency" value="${item.item_price}"></fmt:formatNumber></p>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</section>
				<section class="modals">
					<div class="modal">
						<div class="modal__wrap">
							<div class="modal__description">
								<div class="modal__menu">
									<p class="">성명</p>
									<p class="">연락처</p>
									<p class="">우편번호</p>
									<p class="">주소</p>
								</div>
								<div class="modal__contents">
									<p class="">${list[0].user_name }</p>
									<c:set var="phone" value="${list[0].user_phone }" />
									<p class="">${fn:substring(phone, 0,3) }-${fn:substring(phone, 3, 7) }-${fn:substring(phone, 7, 11) }</p>
									<p class="">${list[0].user_postcode }</p>
									<p class=""><c:out value="${list[0].user_address_first }" /></p>
									<p class=""><c:out value="${list[0].user_address_second }" /></p>
									<p class=""><c:out value="${list[0].user_address_extra }" /></p>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div> <!-- tydee__eshop -->
</body>
</html>