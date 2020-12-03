<%@page import="com.login.dto.UserInfoDto"%>
<%@page import="com.tydee.tip.dto.tip_dto"%>
<%@page import="com.tydee.tip.dto.tip_Comm_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TYDEE</title>
<!-- Editor's Dependecy Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./tip_css/tip_detail1.css" />
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
	<div class="tydee__tips__title">
		<h2>TYDEE TIPs</h2>
	</div>
	<section id="tydee__tips__detail">
		<div class="contents__header">
		<input type="hidden" name="tip_no" value="${dto.tip_no }">
			<div class="title">
				<p>${dto.tip_title }</p>
			</div>
			<div class="date">
				<div class="writer">
					<p class="writer1">${dto.user_nickname }</p>
					<p class="date1">${dto.tip_regdate }</p>
				</div>
				<div class="etc">
					<p>sns</p>
					<input type="button" class="bookmark" value="bookmark"
						name="bookmark" />
				</div>
			</div>
			<div class="line"></div>
		</div>
		<div class="contents">
			<div class="contents__detail">
				<img src="img/3.jpg" alt="" />
				<p id="viewer"></p>
			</div>
			<div class="button">
				<input type="button" value="delete" onclick="location.href='tip.do?command=delete&tip_no=${dto.tip_no}'" />
				<input
					type="button" value="list"
					onclick="location.href='tip.do?command=list'" /> <input
					type="button" value="back" onclick="location.href='tip.do?command=list'" />
			</div>
			<div class="comments">
				<div class="comments__box">
			
			<!-- 이 아래부터는 댓글에 대한 리스트 입니다. -->

	<c:choose>
		<c:when test="${empty list }">
			<p>no comments</p>
		</c:when>
		<c:otherwise>

			<c:forEach items="${list }" var="dto">
				<form action="tip.do" method="post">
				<input type="hidden" name="command" value="delete_reply" /> 
				<input type="hidden" name="tip_no" value="${dto.tip_no }" /> 
				<input type="hidden" name="user_no" value="${dto.user_no}" />
				<input type="hidden" name="tip_comm_no" value="${dto.tip_comm_no }" /> 
				<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id}"/>
			<div class="comment">				
			    <span>${loginuser.user_nickname }</span><input class="input" type="submit" value="delete" />
				<p>${dto.sec_comm_content}</p>
			</div>
				</form>
				<hr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
				</div>
			</div>
		</div>
		
	<!-- reply -->
		<form action="tip.do" method="post">
			<input type="hidden" name="command" value="reply" /> 
			<input type="hidden" name="tip_no" value="${dto.tip_no}" />  
			<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id }" />
    		<p class="comment_write">	
				<input class = "title__inner__comment" name="sec_comm_content" type="text" name="title" />
				<!-- <input type="submit" name="sec_comm_content" value="답변 등록" /><br/> -->
				<input class="reply" type="submit" value="reply" />
			</p>
		</form>
	</section>
	  <div class="list">
      <a href="#">
        <div class="modal__wrap">
          <img src="img/6.jpg" alt="" />
          <div class="modal__description">
            <p class="modal__name">
              TYDEE BOX
            </p>
            <p class="modal__explain">
              Contrary to popular belief, Lorem Ipsum is not simply random text.
            </p>
          </div>
        </div>
      </a>
      <a href="#">
        <div class="modal__wrap">
          <img src="img/7.jpg" alt="" />
          <div class="modal__description">
            <p class="modal__name">
              TYDEE BOX
            </p>
            <p class="modal__explain">
              Contrary to popular belief, Lorem Ipsum is not simply random text.
            </p>
          </div>
        </div>
      </a>
      <a href="#">
        <div class="modal__wrap">
          <img src="img/8.jpg" alt="" />
          <div class="modal__description">
            <p class="modal__name">
              TYDEE BOX
            </p>
            <p class="modal__explain">
              Contrary to popular belief, Lorem Ipsum is not simply random text.
            </p>
          </div>
        </div>
      </a>
    </div>	
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
	<script>
		const viewer = new toastui.Editor({
			el : document.querySelector('#viewer'),
			viewer : true,
			height : '500px',
			initialValue : `${dto.tip_content}`
		});
		viewer.getMarkdown();
	</script>

</body>
</html>