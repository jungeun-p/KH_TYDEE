<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>

<head>
    <!--
    <link href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" rel="stylesheet" />
    <link href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" rel="stylesheet" />
    <link href="https://uicdn.toast.com/editor/latest/toastui-editor-only.min.css" rel="stylesheet" />
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script> -->
    <!-- Styles -->
    <link rel="stylesheet" href="https://uicdn.toast.com/tui-editor/latest/tui-editor.css" />
    <link rel="stylesheet" href="https://uicdn.toast.com/tui-editor/latest/tui-editor-contents.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/github.min.css" />
    <!-- Scripts -->
    <script src="https://uicdn.toast.com/tui-editor/latest/tui-editor-Editor-full.js"></script>
</head>

<body>
    <form action="toast_result.jsp" method="GET">
        <input type="text" name="example">
        <div id="editorSection"></div>
        <input type="submit" id="editorSubmit" />
        <input type="button" id="clickTest" value="hidden?" />
        <input type="button" value="뒤로가기" onclick="location.href='index.jsp'" />
    </form>
    <script>
        let editorSection = document.querySelector("#editorSection");
        let editor = new tui.Editor({
            el: editorSection,
            initialEditType: 'markdown',
            previewStyle: 'vertical',
            height: '300px'
        });
        editorSection.editor = editor;
        document.querySelector("#clickTest").addEventListener("click", () => {
            let input = document.createElement("input");
            input.setAttribute("type", "hidden");
            input.setAttribute("name", "toastContent");
            // input.setAttribute("value", editor.getMarkdown());
            input.setAttribute("value", editor.getHtml());
            document.getElementById("clickTest").appendChild(input);
            console.log(editor.getMarkdown());
            console.log(editor.getHtml());
        });
    </script>
</body>

</html>