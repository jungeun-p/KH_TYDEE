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
</body>
</html>