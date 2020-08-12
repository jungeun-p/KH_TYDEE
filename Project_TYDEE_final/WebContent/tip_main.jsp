<%@page import="com.login.dto.UserInfoDto"%>
<%@page import="com.tydee.tip.dto.tip_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TYDEE</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./tip_css/tip_main.css" />
<script src="https://kit.fontawesome.com/3914a9940d.js"
	crossorigin="anonymous"></script>
</head>
<style>
	.header{
	  position: sticky;
	  top:0;
	}
</style>
<body>
	
	<div class="tip_main">
		<div class="header">
		<%@ include file="./include/main_header_test.jsp"%>
		</div>
   <div class="section">
	<div class="tydee__secondhand">
		<div class="tydee__secondhand__title">
			<h1>TYDEE TIP</h1>
		</div>
		<section class="modals">
			<c:forEach items="${list }" var="dto">
				<a href="tip.do?command=detail&tip_no=${dto.tip_no}">
					<div class="modal">
						<div class="modal__white">
							<div class="modal__wrap">
								<img src="./tip_images/3.jpg" alt="" />
								<div class="modal__description">
									<p class="modal__name">${dto.tip_title }</p>
									<p class="modal__explain">${dto.tip_summary }by
										${dto.tip_regdate }</p>
								</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
			<a class="modal__write" href="tip_write.jsp">
				<div class="write">
					<div class="modal">
						<div class="modal__white">
							<div class="modal__wrap">
								<div class="modal__description">
									<p class="modal__write">
										<i class="far fa-edit"></i>
									</p>
									<p class="modal__explain">　　　　　　　　　　　　　　　　　　　　　　</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</a>
		</section>
	</div>
	</div>
	</div>
		<%@ include file="./include/footer.jsp"%>
</body>

</html>