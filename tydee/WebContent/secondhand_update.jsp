<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>TYDEE</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./sec_css/secondhand__write.css" />
<!-- Editor's Dependecy Style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<!-- Editor's Style -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

</head>

<body>
	<!-- <form action="toast_editor_result.jsp" method="POST"> -->
<div id="write__modal">
	<form action="secondhand_controller.do" method="POST">
		<input type="hidden" name="command" value="update" />
		<input type="hidden" name="sec_no" value="${dto.sec_no}" />
		<input type="hidden" name="user_no" value="${sessionScope.loginuser.user_no}">
		<!-- <img alt="image" src="resources/img/img00.jpg" /> -->
			<div class="title">
				<span>title</span><input class="title__inner" type="text" name="sec_title" value="${dto.sec_title}" />
				<span>price</span><input class="title__inner" type="text" name="sec_price" value="${dto.sec_price}"/>
			</div>
		<div id="editor">${dto.sec_content }</div>
			<div class="input__button">
				<input type="submit" value="submit" onclick="contentHidden()" />
				<input type="button" value="list" onclick="location.href='secondhand_controller.do?command=list&user_id=${loginuser.user_id }'" />
				<input type="button" value="back" onclick="location.href='secondhand_boardlist.jsp'" />
			</div>
	</form>
</div>
	<script
		src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<script>
		const editor = new toastui.Editor({
			el : document.querySelector('#editor'),
			height : '420px',
			initialEditType : 'markdown',
			previewStyle : 'tab',
			toolbarItems : [ 'heading', 'bold', 'italic', 'strike', 'divider',
					'hr', 'quote', 'ul', 'ol', 'divider', 'task', 'indent',
					'outdent' ]
		});
		editor.getHtml();

		function contentHidden() {
			let form = document.getElementsByTagName("form")[0];
			let input = document.createElement("input");
			input.setAttribute("type", "hidden");
			input.setAttribute("name", "sec_content")
			input.setAttribute("value", editor.getHtml());
			document.querySelector("#editor").append(input);
		}
	</script>
</body>

</html>