<%@page import="com.tydee.second.dto.SecondHandDto"%>
<%@page import="com.login.dto.UserInfoDto"%>
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
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./sec_css/secondhand__detail.css" />
</head>
<style>
	.header{
	  position: sticky;
	  top:0;
	}
</style>
<body>
<%
	SecondHandDto dto = (SecondHandDto) request.getAttribute("dto");
%>
<div class="header">
	<%@ include file="./include/main_header_test.jsp"%>
</div>
	<!-- 이 부부은 detail 화면을 보여줍니다.  -->

	<div class="tydee__tips__title">
		<h2>TYDEE SECOND HAND</h2>
	</div>  
	
  <section id="tydee__tips__detail">
	<form action="secondhand_controller.do" method="post">
		<input type="hidden" name="command" value="modify" />
		<input type="hidden" name="sec_no" value="${dto.sec_no}" />
		<input type="hidden" name="user_no" value="${sessionScope.loginuser.user_no}" />
		<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id}" />
		 <div class="contents__header">
        <div class="title" name="sec_title">
          <p>${dto.sec_title }</p>
        </div>
        <div class="date">
          <div class="writer">
            <p class="writer1" name="user_nickname">${loginuser.user_nickname }</p>
            <p class="date1" name="sec_price">${dto.sec_price }</p>
          </div>
          <div class="etc">
            <p>sns</p>
            <input type="button" class="bookmark" value="bookmark" name="bookmark"/>
          </div>
        </div>
        <div class="line"></div>
       	<div>
			<img alt="image" src="resources/img/img00.jpg" />
		</div>
      </div>
       <div class="contents">
        <div class="contents__detail">
          <img src="img/3.jpg" alt="" />
          <p name="sec_content">${dto.sec_content }</p>
        </div>
		<div class="button">
          <input type="submit" value="modify"/>
          <input type="button" value="delete" onclick="location.href='secondhand_controller.do?command=delete&sec_no=${dto.sec_no}&user_no=${dto.user_no}&user_id=${sessionScope.loginuser.user_id}'"/>
          <input type="button" value="list" onclick="location.href='secondhand_controller.do?command=list&user_id=${loginuser.user_id }'"/>
        </div>
      </form>
        <div class="line"></div>
          <div class="comments">
          	<div class="comments__box">
          	
          	 <!-- 이 아래부터는 댓글에 대한 리스트 입니다. -->
	<c:choose>
		<c:when test="${empty list }">
			<p>no comments</p>
		</c:when>
		<c:otherwise>

			<c:forEach items="${list }" var="dto">
				<form action="secondhand_controller.do" method="post">
					<input type="hidden" name="command" value="delete_reply" /> <input
						type="hidden" name="sec_no" value="<%=dto.getSec_no()%>" /> <input
						type="hidden" name="user_no" value="${dto.user_no}" /> <input
						type="hidden" name="sec_comm_no" value="${dto.sec_comm_no }" /> <input
						type="hidden" name="user_id" value="${sessionScope.loginuser.user_id}" />
					<div class="comment">				
						  <span>${loginuser.user_nickname }</span><input class="input" type="submit" value="delete" />
						  <p>${dto.sec_comm_content}</p>
					</div>
				</form>
			</c:forEach>
		</c:otherwise>
	</c:choose>
          	
          	</div>
    	  </div>
       </div>


	<!-- reply -->
	<form action="secondhand_controller.do" method="post">
		<input type="hidden" name="command" value="reply" /> <input
			type="hidden" name="sec_no" value="${dto.sec_no}" /> <input
			type="hidden" name="user_no"
			value="${sessionScope.loginuser.user_no}" /> <input type="hidden"
			name="user_id" value="${sessionScope.loginuser.user_id }" />
			<p class="comment_write">	
				<input class = "title__inner__comment" name="sec_comm_content" type="text" name="title" />
				<!-- <input type="submit" name="sec_comm_content" value="답변 등록" /><br/> -->
				<input class="reply" type="submit" value="reply" />
			</p>
	</form>
	</section>
	
</body>
</html>