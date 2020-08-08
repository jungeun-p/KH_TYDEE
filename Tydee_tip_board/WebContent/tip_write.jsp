<%@page import="com.tydee.tip.dto.tip_file_dto"%>
<%@page import="com.tydee.tip.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
	<script type="text/javascript">	
		
		function upload_popup(){
			//open(파일, 이름, 옵션)
			window.open("tip_upload_popup.jsp","upload_popup","width=400px, height=500px");		
		}	
	</script>   
   

<head>
    <meta charset="UTF-8" />
    <title>TOAST UI EDITOR</title>
   <!-- Styles -->
    <link rel="stylesheet" href="https://uicdn.toast.com/tui-editor/latest/tui-editor.css" />
    <link rel="stylesheet" href="https://uicdn.toast.com/tui-editor/latest/tui-editor-contents.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/github.min.css" />
    <!-- Scripts -->
    <script src="https://uicdn.toast.com/tui-editor/latest/tui-editor-Editor-full.js"></script>
</head>

<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
if (loginuser == null) {
	pageContext.forward("tip_index.jsp");
}
%>

<body>
	<h1> Tydee Tip 글쓰기</h1>
	<!-- 파일 업로드 버튼 -->
	<input type="button" onclick="upload_popup()" value="파일 업로드 하기">
	<p id="upload_area"></p>


<!--     <form action="toast_editor_result.jsp" method="POST"> -->
    <form action="tip.do?command=write" method="POST">
    	<input type="text" name="tip_title" />
    	
    	<textarea rows="5" cols="60" name="tip_summary"></textarea>
    	
        <div id="editor" name="content"></div>
        
        <input type="submit" value="전송" onclick="contentHidden()" />
        <input type="button" value="목록보기" onclick="location.href='tip.do?command=list'" />
       
    </form>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
        const editor = new toastui.Editor({
            el: document.querySelector('#editor'),
            height: '500px',
            initialEditType: 'markdown',
            previewStyle: 'tab',
            toolbarItems: [
                'heading',
                'bold',
                'italic',
                'strike',
                'divider',
                'hr',
                'quote',
                'ul',
                'ol',
                'divider',
                'task',
                'indent',
                'outdent'
            ]
        });
        editor.getMarkdown();

        function contentHidden() {
            let form = document.getElementsByTagName("form")[0];
            let input = document.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("name", "tip_content")
            input.setAttribute("value", editor.getMarkdown());
            document.querySelector("#editor").append(input);
        }
    </script>
</body>

</html>