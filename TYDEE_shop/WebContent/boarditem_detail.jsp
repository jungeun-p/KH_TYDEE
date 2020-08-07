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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/3914a9940d.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./css/boarditem_detail.css" />
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
BoardItemDto item = (BoardItemDto) request.getAttribute("item");
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
			<h1>TYDEE ESHOP :: DETAIL</h1>
			<div class="tydee__hashtag">
				<a href="item.do?command=list"><span class="tydee__hashtag">All</span></a>
				<c:if test="${!empty categoryList }">
					<c:forEach items="${categoryList }" var="category">
						<a href="item.do?command=list&item_category=${category.item_category}"><span class="tydee__hashtag">${category.item_category}</span></a>
					</c:forEach>
				</c:if>
			</div>
			<!-- wrtie or cart -->
			<c:if test="${loginuser.user_role eq 'ADMIN'}">
				<a href="item.do?command=insert"><p class="wrtie__eshop">
						<i class="fas fa-plus"></i>
					</p></a>
			</c:if>
			<c:if test="${loginuser.user_role ne 'ADMIN' or empty loginuser }">
				<a href="basket.do?user_no=${loginuser.user_no }"><p class="cart__eshop">
						<i class="fas fa-shopping-cart"></i>
					</p></a>
			</c:if>
		</div>
		<!-- list -->
		<div class="detailinfo">
			<div class="content">
				<section class="modals">
					<div class="modal__img">
							<div class="modal__wrap">
								<img alt="상품사진"
									src="./images/${item.item_image ? item.item_image : '1.jpg' }">
									<img alt="상품사진"
									src="./images/${item.item_image ? item.item_image : '1.jpg' }">
									<img alt="상품사진"
									src="./images/${item.item_image ? item.item_image : '1.jpg' }">
							</div>
					</div>
					<div class="modal">
						<div class="details">
							<form action="basket.do" method="POST">
								<input type="hidden" name="command" value="insert" /> <input
									type="hidden" name="user_no"
									value="${loginuser.user_no ? loginuser.user_no : 0 }" /> <input
									type="hidden" name="item_no" value="${item.item_no }" />
								<div class="modal_wrap">
									<div class="modal__description">
										<div class="modal__name">${item.item_title }</div>
										<div class="modal__explain">${item.item_price }</div>
										<div class="modal__buttons">
											<input class="title__inner" type="number" name="item_quan"
												value="1" min="1" required="required" /> <input
												class="button" type="submit" value="CART" /> <input
												class="button" type="button" value="BUY" />
										</div>
									</div>
									<!-- eshop detail -->
									<div class="modal__viewer">
										<div id="viewer">
											<div class="tui-editor-contents">
												<span> Pictures, abstract symbols, materials, and
													colors are among the ingredients with which a designer or
													engineer works. To design is to discover relationships and
													to make arrangements and rearrangements among these
													ingredients. </span>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</section>
				<section class="reviews">
					<div class="review">review</div>
				</section>
			</div>
		</div>
	</div>
	<script src="js/boarditem_detail.js"></script>
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
	<script>
		const viewer = new toastui.Editor({
			el : document.querySelector('#viewer'),
			viewer : true,
			height : '500px',
			initialValue : `${item.item_content}`
		});
	</script>
</body>
</html>