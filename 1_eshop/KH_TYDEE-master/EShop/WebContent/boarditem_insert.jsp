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
<!-- Editor's Dependecy Style -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
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
			<h1>TYDEE ESHOP :: WRITE</h1>
			<!-- no hashtag in this page -->
			<c:if test="${loginuser.user_role eq 'ADMIN'}">
				<a href="item.do?command=insert"><p class="wrtie__eshop"><i class="fas fa-plus"></i></p></a>
			</c:if>
			<c:if test="${loginuser.user_role ne 'ADMIN' or empty loginuser }">
				<% response.sendRedirect("item.do?command=list"); %>
			</c:if>
		</div>
		<div class="insert">
			<form action="item.do" method="post">
				<input type="hidden" name="command" value="insertres" />
				<div class="item__menus">
					<p><label for="title">상품명</label></p>
					<p><label for="category">카테고리</label></p>
					<p><label for="price">가격</label></p>
					<p><label for="content">내용</label></p>
					<p><label for="file">이미지</label></p>
				</div>
				<div class="item__contents">
					<input type="text" name="item_title" required="required"/>
					<input type="text" name="item_category" /><!-- category ajax 쓰고 싶은데 keep -->
					<input type="number" name="item_price"  min="0" required="required" />
					<div id="editor" name="item_content"></div>
					<div class="item__upload">
						<input type="button" value="업로드" onclick="makeapopup('boarditem_popup.jsp')"/>
						<span>이미지 없음</span>
					</div>
				</div>
				<div class="item__buttons">
					<input type="submit" value="저장" onclick="contentHidden()" />
					<input type="button" value="취소" onclick="location.href='item.do?command=list'" />
				</div>
			</form>
		</div>
	</div>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="shop_js/boarditem_insert_tuieditor.js"></script>
<script src="shop_js/boarditem_insert_makeapopup.js"></script>
<script src="shop_js/boarditem_insert_hiddencontent.js"></script>
</body>
</html>