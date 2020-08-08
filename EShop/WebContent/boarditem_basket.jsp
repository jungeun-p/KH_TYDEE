<%@page import="com.tydee.dto.BoardItemDto"%>
<%@page import="java.util.List"%>
<%@page import="com.tydee.dto.UserInfoDto"%>
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
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3914a9940d.js"
	crossorigin="anonymous"></script>
<style>
img {
width: 200px;
}
</style>
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
	<div class="tydee__basket">
		<div class="tydee__eshop__title">
			<h1>TYDEE ESHOP :: BASKET</h1>
			<!-- no hashtag in this page -->
		</div>
		<div class="basket">
			<c:choose>
				<c:when test="${empty list }">
					<div class="basket__item">
						<span>장바구니가 비어 있습니다</span>
					</div>				
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="item">
					<div class="basket__item">
						<div class="item__image">
							<img src="./images/${empty item.item_image ? '1.jpg' : item.item_image }" />
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
								<input type="button" value="-" onclick="quan_minus(${item.basket_no})"/>
								<input type="number" name="item_quan" value="${item.item_quan }" min="1" required="required" />
								<input type="button" value="+" onclick="quan_plus(${item.basket_no})"/>
							</div>
							</form>
							<div class="item__quantity_change">
								<input type="button" value="수량변경" onclick="quan_change(${item.basket_no})" />
							</div>
						</div>
						<div class="buttons">
							<span onclick="quan_delete(${item.basket_no})" >삭제하기</span>
						</div>
					</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="total__price">
		<button class="goToList" onclick="location.href='item.do?command=list'">돌아가기</button>
		<span id="total_price">
			<fmt:formatNumber type="currency" value="${totalPrice gt 50000 ? totalPrice : (totalPrice eq 0 ? 0 : totalPrice + 3000) }"></fmt:formatNumber>
		</span>
		<button class="goOrder" onclick="location.href='order.do?command=ready&user_no=${loginuser.user_no}'">주문하기</button>
	</div>
	<script type="text/javascript">
		// Select your input element.
		var numbers = document.querySelectorAll("[type=number]");
		numbers.onkeydown = function(e) {
		    if(!((e.keyCode > 95 && e.keyCode < 106)
		      || (e.keyCode > 47 && e.keyCode < 58) 
		      || e.keyCode == 8)) {
		        return false;
		    }
		} // 입력창에 문자나 기호 못 넣게 하는 코드
		function quan_minus(no){
			let where = document.getElementById(no);
			let quantity = where.querySelector("[type=number]").value; 
			if (quantity == 1){
				return false;
			} else {
				quantity = Number(quantity) - 1;
				where.querySelector("[type=number]").value = quantity;
			}
		}
		function quan_plus(no){
			let where = document.getElementById(no);
			let quantity = where.querySelector("[type=number]").value; 
			quantity = Number(quantity) + 1;
			where.querySelector("[type=number]").value = quantity;
		}
		function quan_change(no){
			let up = document.createElement("input");
			up.setAttribute("type","hidden");
			up.setAttribute("name","command");
			up.setAttribute("value","update");
			let where = document.getElementById(no);
			let form = where.getElementsByTagName("form")[0];
			form.appendChild(up);
			form.submit();
		}
		function quan_delete(no){
			let del = document.createElement("input");
			del.setAttribute("type","hidden");
			del.setAttribute("name","command");
			del.setAttribute("value","delete");
			let where = document.getElementById(no);
			let form = where.getElementsByTagName("form")[0];
			form.appendChild(del);
			form.submit();
		}
	</script>
</body>
</html>