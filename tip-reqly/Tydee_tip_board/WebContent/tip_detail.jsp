<%@page import="com.tydee.tip.dto.tip_Comm_dto"%>
<%@page import="com.tydee.tip.dto.UserInfoDto"%>
<%@page import="com.tydee.tip.dto.tip_dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Editor's Dependecy Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
	<style>
	table {
	width: 400px;
	}
	th {
	width: 50px;
	}
	</style>
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
if (loginuser == null) {
	pageContext.forward("tip_index.jsp");
}

%>
<body>
	<table border='1'>
		<tr>
			<th>번호</th>
			<td>${dto.tip_no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.tip_title }</td>
		</tr>
		<tr>
			<th>요약</th>
			<td>${dto.tip_summary }</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td id="viewer"></td>
		</tr>
	</table>
	<input type="button" value="뒤로가기" onclick="location.href='tip.do?command=list'" />
	<input type="button" value="맨앞으로" onclick="location.href='tip_index.jsp'" />
	<input type="button" value="삭제하기" onclick="location.href='tip.do?command=delete&tip_no=${dto.tip_no}'" />
	    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
    <script>
        const viewer = new toastui.Editor({
            el: document.querySelector('#viewer'),
            viewer: true,
            height: '500px',
			initialValue: `${dto.tip_content}`
        });
        viewer.getMarkdown();
    </script>
    

		<!-- 이 아래부터는 댓글에 대한 리스트 입니다. -->

	<c:choose>
		<c:when test="${empty list }">
			<p>---작성된 댓글이 존재하지 않습니다. ---</p>
		</c:when>
		<c:otherwise>

			<c:forEach items="${list }" var="dto">
				<form action="tip.do" method="post">
				<input type="hidden" name="command" value="delete_reply" /> 
				<input type="hidden" name="tip_no" value="${dto.tip_no }" /> 
				<input type="hidden" name="user_no" value="${dto.user_no}" />
				<input type="hidden" name="tip_comm_no" value="${dto.tip_comm_no }" /> 
				<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id}"/>
					
					<p>유저 번호  :[ ${dto.user_no } ] 게시판 번호  : [ ${dto.tip_comm_no} ] -
						작성일자  : ${dto.tip_comm_regdate }</p>
					<p> 댓 글 내 용   : ${dto.tip_comm_content} </p>
					<input type="submit" value="삭제" />
				</form>
				<hr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
    	<form action="tip.do" method="post">
			<input type="hidden" name="command" value="reply" /> 
			<input type="hidden" name="tip_no" value="${dto.tip_no}" />  
			<input type="hidden" name="user_id" value="${sessionScope.loginuser.user_id }" />
    
    
    		<br>
			<br>
			<div>
			
			<b>Reply</b><br/>

			<p>
				<textarea rows="5" cols="40" placeholder="내용 입력" name="tip_comm_content"></textarea>
				<br/>
				
				<input type="submit" value="댓글 등록" />

			</p>

				<hr>
			</div>

	</form>
</body>
</html>