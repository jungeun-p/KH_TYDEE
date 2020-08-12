<%@page import="com.tydee.dto.BoardItemDto"%>
<%@page import="java.util.List"%>
<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>TYDEE</title>
<!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./shop_css/boarditem_basket.css" />

<script src="https://kit.fontawesome.com/3914a9940d.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="tydee__basket">
		<div class="tydee__eshop__title">
			<h2>TYDEE ESHOP :: BASKET</h2>
			<!-- no hashtag in this page -->
		</div>
		<div class="baskets">
			<c:choose>
				<c:when test="${empty list }">
				<div class="basket">
					<div class="basket__item">
						<span>none</span>
					</div>				
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="item">
					<div class="basket__item">
						<div class="item__image">
							<img src="./images/${empty item.item_image ? 'basket1.jpg' : item.item_image }" />
						</div>
						<div class="item__title">
							<span>${item.item_title }</span>
							<span>
								<fmt:setLocale value="ko_KR"/>
								<fmt:formatNumber type="currency" value="${item.item_price}"></fmt:formatNumber>
							</span>
						</div>
						<div class="item__quantity" id="${item.basket_no}">
							<form action="basket.do" method="POST">
								<input type="hidden" name="basket_no" value="${item.basket_no }" />
								<input type="hidden" name="item_no" value="${item.item_no }" />
							<div class="item__quantity_value">
								<input class="minus" type="button" value="-" onclick="quan_minus(${item.basket_no})"/>
								<input class="title__inner" type="number" name="item_quan" value="${item.item_quan }" min="1" required="required"/>
								<input class="plus" type="button" value="+" onclick="quan_plus(${item.basket_no})"/>
							</div>
							</form>
							<div class="item__quantity_change">
								<input class="button" type="button" value="change" onclick="quan_change(${item.basket_no})" />
							</div>
						</div>
						<div class="buttons">
							<span onclick="quan_delete(${item.basket_no})" ><i class="far fa-trash-alt"></i
              ></span>
						</div>
					</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
	</div>
	<div class="total__price">
		<button class="goToList" onclick="location.href='item.do?command=list'">BACK</button>
		<span id="total_price">
			<fmt:formatNumber type="currency" value="${totalPrice ge 50000 ? totalPrice : (totalPrice eq 0 ? 0 : totalPrice + 3000) }"></fmt:formatNumber>
		</span>
		<button class="goOrder" onclick="priceCheck()">ORDER</button>
	</div>
	<script type="text/javascript">
		function priceCheck(){
			let span = document.getElementById("total_price");
			if (Number(span.textContent) == 0){
				alert("장바구니에 물건이 없습니다");
				return false;
			} else {
				location.href="order.do?command=ready";
			}
		}
		// Select your input element.
		var numbers = document.querySelectorAll("[type=number]");
		numbers.onkeydown = function(e) {
		    if(!((e.keyCode > 95 && e.keyCode < 106)
		      || (e.keyCode > 47 && e.keyCode < 58) 
		      || e.keyCode == 8)) {
		        return false;
		    }
		} // 입력창에 문자나 기호 못 넣게 하는 코드
	</script>
	<script src="shop_js/boarditem_basket_quantity.js"></script>
</body>
</html>