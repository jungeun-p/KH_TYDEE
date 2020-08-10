<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>TOAST UI EDITOR</title>
    <!-- Editor's Dependecy Style -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
    <!-- Editor's Style -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <style>
        #editor {
            width: 50%;
        }
    </style>
</head>

<body>
    <!-- <form action="toast_editor_result.jsp" method="POST"> -->
    <form action="secondhand_controller.do" method="POST">
    	<input type="hidden" name="command" value="writeres" />
    	<input type="hidden" name="user_id" value=${sessionScope.loginuser.user_id }/>
		<input type="hidden" name="user_no" value="${sessionScope.loginuser.user_no}"/>
		
    	제목 : <input type="text" name="sec_title"/>
    	가격 : <input type="text" name="sec_price"/>
        <div id="editor" valeu="sec_content"> </div>
        <input type="submit" value="전송" onclick="contentHidden()" />
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