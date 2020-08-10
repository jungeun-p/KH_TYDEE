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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/3914a9940d.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<style>
img {
width: 200px;
}
</style>
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
	BoardItemDto item = (BoardItemDto) request.getAttribute("item");
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
		<div class="detailinfo">
			<div class="content">
				<section class="modals">
					<div class="modal">
						<div class="modal__wrap">
							<img alt="상품사진" src="./images/${empty item.item_image ? '1.jpg' : item.item_image }">
						</div>
					</div>
					<div class="modal">
						<form action="basket.do" method="POST">
						<input type="hidden" name="command" value="insert" />
						<input type="hidden" name="user_no" value="${empty loginuser.user_no ? 0 : loginuser.user_no }" />
						<input type="hidden" name="item_no" value="${item.item_no }" />
						<div class="modal_wrap">
							<div class="modal__description">
								<div class="modal__name">${item.item_title }</div>
								<div class="modal__explain">${item.item_price }</div>
								<div class="modal__buttons">
									<div class="item__quantity_value">
										<input type="button" value="-" onclick="quan_minus()"/>
										<input type="number" name="item_quan" value="1" min="1" required="required" />
										<input type="button" value="+" onclick="quan_plus()"/>
									</div>
									<input type="submit" value="장바구니" />
									<input type="button" value="바로 구매" onclick="goToOrder()" />
								</div>
							</div>
							<div class="modal__viewer">
								<div id="viewer"></div>
							</div>
						</div>
						<c:if test="${loginuser.user_role eq 'ADMIN'}">
							<input type="button" value="수정" onclick="goToUpdate();" />
							<input type="button" value="삭제" onclick="goToDelete();" />
						</c:if>
						</form>
					</div>
				</section>
				<section class="reviews">
					<div class="review"></div>
				</section>
			</div> <!-- content -->
		</div> <!-- detailinfo -->
	</div> <!-- tydee__eshop -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
<script src="shop_js/boarditem_detail_quantity.js"></script>
<script>
const viewer = new toastui.Editor({
	el: document.querySelector('#viewer'),
	viewer: true,
	height: '500px',
	initialValue: `${item.item_content}`
});
function goToOrder(){
	let command = document.querySelector("[name=command]");
	command.setAttribute("value", "directready");
	let form = document.getElementsByTagName("form")[0];
	form.setAttribute("action", "order.do");
	form.submit();
}
function goToUpdate(){
	let command = document.querySelector("[name=command]");
	command.setAttribute("value", "update");
	let form = document.getElementsByTagName("form")[0];
	form.setAttribute("action", "item.do");
	form.submit();
}
function goToDelete(){
	let really = confirm("삭제하시겠습니까?");
	if (really && `${loginuser.user_role eq 'ADMIN'}`){
		let command = document.querySelector("[name=command]");
		command.setAttribute("value", "delete");
		let form = document.getElementsByTagName("form")[0];
		form.setAttribute("action", "item.do");
		form.submit();
	} else {
		return false;
	}
}
</script>
</body>
</html>