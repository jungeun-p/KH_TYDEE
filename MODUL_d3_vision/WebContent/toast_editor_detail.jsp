<%@page import="com.toast.dto.ToastDto"%>
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
<body>
	<table border='1'>
		<tr>
			<th>번호</th>
			<td>${dto.seq }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td id="viewer"></td>
		</tr>
	</table>
	<input type="button" value="뒤로가기" onclick="location.href='toast.do?command=list'" />
	<input type="button" value="맨앞으로" onclick="location.href='index.jsp'" />
	    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
    <script>
        const viewer = new toastui.Editor({
            el: document.querySelector('#viewer'),
            viewer: true,
            height: '500px',
			initialValue: `${dto.content}`
        });
        viewer.getMarkdown();
    </script>
</body>
</html>