<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Editor's Dependecy Style -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
	<h3>TOAST UI EDITOR - VIEWER</h3>
	<div id="viewer"></div>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>
	<script>
	let content = localStorage.getItem("content");
    const viewer = new toastui.Editor({
        el: document.querySelector('#viewer'),
        viewer: true,
        height: '500px',
		initialValue: content
    });
	</script>
</body>
</html>