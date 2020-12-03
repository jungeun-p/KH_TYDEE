<%@page import="com.tydee.tip.dto.tip_file_dto"%>
<%@page import="com.login.dto.UserInfoDto"%>
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
<title>TYDEE</title>
   <!-- Styles -->
    <link rel="stylesheet" href="https://uicdn.toast.com/tui-editor/latest/tui-editor.css" />
    <link rel="stylesheet" href="https://uicdn.toast.com/tui-editor/latest/tui-editor-contents.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/github.min.css" />
    <!-- Scripts -->
    <script src="https://uicdn.toast.com/tui-editor/latest/tui-editor-Editor-full.js"></script>
	 <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./tip_css/tip_write.css" />
</head>

<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
if (loginuser == null) {
	pageContext.forward("tip_index.jsp");
}
%>

<body>
<!--     <form action="toast_editor_result.jsp" method="POST"> -->
   <div class="insert">
    <form action="tip.do?command=write" method="POST">
    	<div id="items">
    	<div class="item__menus">
    	   <p><label for="title">title</label></p>
    	   <p><label for="title">summary</label></p>
    	   <p><label for="file">image</label></p>
    	   <p><label for="content">contents</label></p>
    	</div>
    	<div class="item__insert">
    		<div class="item__contents">
    		  <input class="item__title" type="text" name="tip_title" required="required"/>
    		  <input class="item__title" type="text" name="tip_summary" required="required"/>
    		  <input class="button" type="button" onclick="upload_popup()" value="upload">
				<p id="upload_area"></p>
    		  <div id="editor" name="content"></div>
    		</div>
    		<div class="item__buttons">
    		  <input class="button" type="submit" value="send" onclick="contentHidden()"/>
    		  <input class="button" type="button" value="back" onclick="location.href='tip.do?command=list'"/>
    		</div>
    	</div>
    	</div>       
    </form>
    </div>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script>
        const editor = new toastui.Editor({
            el: document.querySelector('#editor'),
            height: '320px',
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