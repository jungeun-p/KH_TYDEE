<%@page import="com.tydee.dto.BoardItemDto"%>
<%@page import="java.util.List"%>
<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<script src="https://kit.fontawesome.com/3914a9940d.js" crossorigin="anonymous"></script>
    <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./shop_css/tydee__eshop__order.css" />
    <!--font awsome-->
    <script
      src="https://kit.fontawesome.com/9378bc4c66.js"
      crossorigin="anonymous"
    ></script>
</head>
<%
	List<BoardItemDto> itemList = (List<BoardItemDto>) request.getAttribute("itemList");
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
	int user_no = loginuser.getUser_no();
%>
<body>
	 <div id="shop__order">
		<div class="tydee__eshop__title">
			<h2>TYDEE ESHOP :: ORDER</h2>
			<!-- no hashtag in this page -->
		</div>
		<div class="eshop__order">
	<div class="tydee__basket">
		<div class="basket">
			<c:forEach items="${list }" var="item">
			<div class="basket__item">
				<div class="item__image">
					<img src="./images/${empty item.item_image ? 'basket1.jpg' : item.item_image }" />
				</div>
				<div class="item__title">
					<span>${item.item_title }</span>
				</div>
				<div class="item__price">
					<span>
						<fmt:setLocale value="ko_KR"/>
						<fmt:formatNumber type="currency" value="${item.item_price}"></fmt:formatNumber>
					</span>
				</div>
				<div class="item__quantity">
					<span>${item.item_quan }</span>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<div class="form">
	<form method="POST">
	<div class="order__info">
		<div class="order__menu">
			<p><label for="name">name</label></p>
			<p><label for="phone_first">phone</label></p>
			<p><label for="recent">address</label></p>
		</div>
			<div class="order__contents">
				<div class="order__info_name">
					<input type="text" id="name" name="user_name" required="required" />
				</div>
				<div class="order__info_phone">
					<input type="text" id="phone_first" onkeypress="onlyNumber();" required="required" maxlength="4"/><span>-</span>
					<input type="text" id="phone_second" onkeypress="onlyNumber();" required="required" maxlength="4"/><span>-</span>
					<input type="text" id="phone_third" onkeypress="onlyNumber();" required="required" maxlength="4"/>
				</div>
				<div class="order__info_address">
					<input type="text" id="postcode" name="user_postcode" placeholder="우편번호" required="required" onkeypress="onlyNumber();">
					<input class="postcode" type="button" onclick="execDaumPostcode()" value="우편번호"><br>
					<input type="text" id="address" name="user_address_first" placeholder="주소" required="required"><br>
					<input type="text" id="detailAddress" name="user_address_second" placeholder="상세주소">
					<input type="text" id="extraAddress" name="user_address_extra" placeholder="참고항목">
				</div>
				<div class="address_select">
					<input type="radio" name="address_type" id="recent" /><label for="recent">최근 주소록</label>
					<input type="radio" name="address_type" id="new" /><label for="new">새 주소록</label>
				</div>
			</div>
		<input type="hidden" name="total_price" value="${totalPrice ge 50000 ? totalPrice : totalPrice + 3000 }" />
		<input type="hidden" name="item_number" value="${fn:length(list) -1 }" />
		<input type="hidden" name="item_name" value="${list[0].item_title }" />
		<input type="hidden" name="email" value="${loginuser.user_id }" />
	</div>
	<div class="order__buttons">
		<input class="back" type="button" value="back" onclick="location.href='item.do?command=list'" />
		<button class="kakao" onclick="readyToSubmit();"><img src="./images/kakaopay/payment_icon_yellow_small.png" /></button>
	</div>
	</form>
	</div>
	</div>
	</div>
		<div class="total__price">
		<span id="total_price">
			<fmt:formatNumber type="currency" value="${totalPrice ge 50000 ? totalPrice : totalPrice + 3000 }"></fmt:formatNumber>
		</span>
	</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="shop_js/boarditem_order_getpostcode.js"></script>
<script src="shop_js/boarditem_order_readysubmit.js"></script>
<script src="shop_js/boarditem_order_addressajax.js"></script>
<script>
	function onlyNumber(){
	    if((event.keyCode<48)||(event.keyCode>57))
	       event.returnValue=false;
	}

</script>
</body>
</html>