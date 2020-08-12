<%@page import="com.tydee.second.dto.SecondHandDto"%>
<%@page import="com.login.dto.UserInfoDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tydee.second.dto.SecondCommDto"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="./sec_css/tydee__secondhandlist.css" />
<style>
	.header{
	  position: sticky;
	  top:0;
	}
</style>
</head>
<body>
	<div class="header">
	<%@ include file="./include/main_header_test.jsp"%>
	</div>
	<div class="tydee__secondhand">
		<div class="tydee__secondhand__title">
			<h2>TYDEE SECOND HAND</h2>
			<form action="secondhand_controller.do" method="post">
				<div class="buttons">
				<input type="hidden" name="command" value="write" />
				<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id }" /> 
				<input type="hidden" name="user_no" value="${sessionScope.loginuser.user_no}" /> 
				<input class="write" type="submit" value="sell your secondhand" />
				</div>
			</form>
		</div>
		<section class="modals">
		       <a href="#">
          <div class="modal">
            <div class="modal__white">
              <div class="modal__wrap">
                <img src="./img/7.jpg" alt="" />
                <div class="modal__description">
                  <p class="modal__name">
                    GREEN SOFA
                  </p>
                  <p class="modal__explain">
                    25,000
                  </p>
                </div>
              </div>
            </div>
          </div>
        </a>
        <a href="#">
          <div class="modal">
            <div class="modal__white">
              <div class="modal__wrap">
                <img src="./img/8.jpg" alt="" />
                <div class="modal__description">
                  <p class="modal__name">
                    WHITE CHAIR
                  </p>
                  <p class="modal__explain">
                    25,000
                  </p>
                </div>
              </div>
            </div>
          </div>
        </a>
			<c:forEach items="${list}" var="dto">
				<a href="secondhand_controller.do?command=detail&sec_no=${dto.sec_no }&user_no=${dto.user_no}">
					<div class="modal">
						<input type="hidden" value="${dto.sec_no }" name="sec_no" />
						<div class="modal__white">
							<div class="modal__wrap">
								<img src="./img/6.jpg" alt="" />
								<div class="modal__description">
									<p class="modal__name">${dto.sec_title }</p>
									<p class="modal__explain">${dto.sec_price }</p>
								</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
</body>
</html>