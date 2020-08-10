<%@page import="com.tydee.second.dto.SecondHandDto"%>
<%@page import="com.tydee.second.dto.UserInfoDto"%>
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
<style type="text/css">
img {
	width: 150px;
	heiht: 150px;
}

textarea {
	boder-radious: 20px;
}

hr {
	border-color: gray;
}

legent{
	width : 50%;
}
</style>

<%
	SecondHandDto dto = (SecondHandDto) request.getAttribute("dto");
%>

<title>Insert title here</title>
</head>
<body>

	<!-- 이 부부은 detail 화면을 보여줍니다.  -->

	<form action="secondhand_controller.do" method="post">
		<input type="hidden" name="command" value="modify" /> 
		<input type="hidden" name="sec_no" value="${dto.sec_no}" /> 
		<input type="hidden" name="user_no" value="${sessionScope.loginuser.user_no}" />
		<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id}"/>
		
		<div>
			<img alt="image" src="resources/img/img00.jpg" />
		</div>
		<div>
			유저 번호 : <input type="text" value="${dto.user_no }" name="user_no"
				readonly="readonly" />
		</div>
		<div>
			글제목 : <input type="text" value="${dto.sec_title }" name="sec_title"
				readonly="readonly" />
		</div>
		<br />
		<div>
			가 격 : <input type="text" value="${dto.sec_price }" name="sec_price"
				readonly="readonly" />

		</div>
		<br>
		<br> |내 용|
		<div>

			<textarea rows="10" cols="60" name="sec_content" readonly="readonly">${dto.sec_content}</textarea>
			<input type="submit" value="수정" /> 
			<input type="button" value="삭제" onclick="location.href='secondhand_controller.do?command=delete&sec_no=${dto.sec_no}&user_no=${dto.user_no}&user_id=${sessionScope.loginuser.user_id}'" />
		</div>
	</form>
	<form action="secondhand_controller.do" method="post">
		<input type="hidden" name="command" value="reply" /> 
		<input type="hidden" name="sec_no" value="${dto.sec_no}" /> 
		<input type="hidden" name="user_no" value="${sessionScope.loginuser.user_no}" /> 
		<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id }" />
		
		<hr />
		<br>
		<br>
		<div>
			<b>Reply</b><br/>

			<p>
				<textarea rows="5" cols="40" placeholder="내용 입력"
					name="sec_comm_content"></textarea>
				<br />
				<!-- <input type="submit" name="sec_comm_content" value="답변 등록" /><br/> -->
				<input type="submit" value="댓글 등록" />

			</p>

			<hr>
		</div>



		<!-- 이 아래부터는 댓글에 대한 리스트 입니다. -->
	</form>
	<c:choose>
		<c:when test="${empty list }">
			<p>---작성된 댓글이 존재하지 않습니다. ---</p>
		</c:when>
		<c:otherwise>

			<c:forEach items="${list }" var="dto">
				<form action="secondhand_controller.do" method="post">
					<input type="hidden" name="command" value="delete_reply" /> 
					<input	type="hidden" name="sec_no" value="<%=dto.getSec_no()%>" /> 
					<input type="hidden" name="user_no" value="${dto.user_no}" />
					<input type="hidden" name="sec_comm_no" value="${dto.sec_comm_no }" /> 
					<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id}"/>

					<p>유저 번호  :[ ${dto.user_no } ] 게시판 번호  : [ ${dto.sec_comm_no} ] -
						작성일자  : ${dto.sec_comm_regdate }</p>
					<p> 댓 글 내 용   : ${dto.sec_comm_content} </p>
					<input type="submit" value="삭제" />
				</form>
				<hr>
			</c:forEach>



			
		</c:otherwise>
	</c:choose>


</body>
</html>