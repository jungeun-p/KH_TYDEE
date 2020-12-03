<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
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
	<h3>TOAST UI EDITOR</h3>
	<div id="editor"></div>
	<input type="button" value="show" onclick="send()"/><br />
	<!-- toast ui editor와 viewer 이용법
		TOAST UI Editor webpage : https://ui.toast.com/tui-editor/
		github : https://github.com/nhn/tui.editor
		오픈 소스 사용 가이드 : https://docs.toast.com/ko/Open%20Source/ToastUI%20Editor/ko/opensource-guide/
		(!) TOAST UI Editor / repo : https://nhn.github.io/tui.editor/latest/
		
		1. dependency style과 editor style을 head 단에 넣어준다
			참고로 오픈 소스 사용 가이드에서 첨부하라고 하는 사항은 다음과 같다:
				javascript files
					jquery/dist/jquery.js
					tui-code-snippet/code-snippet.js
					marked/lib/marked.js
					toMark/dist/toMark.js
					codemirror/lib/codemirror.js
					highlightjs/highlight.pack.js
					squire-rte/build/squire.js
					tui-editor/dist/tui-editor.min.js
					
				css files	
					codemirror/lib/codemirror.css
					highlightjs/styles/github.css
					tui-editor/dist/tui-editor.css
					tui-editor/dist/tui-editor-contents.css
			프로젝트에는 github-nhn-tui.editor의 getting started에 기재된 대로
				codemirror/codemirror.js
				editor/latest/toastui-editor.min.css
			이 둘만을 첨부했다
		2. body 단에 에디터를 넣을 div를 생성해둔다
		3. body 단 하단에 toastui-editor-(version).min.js 스크립트를 넣어준다
			https://uicdn.toast.com/를 확인해본 결과, editor/latest 안에는
				toastui-editor-all(.min).js
				toastui-editor-viewer(.min).js
				toastui-jquery-editor(.min).js
				toastui-jquery-editor-viewer(.min).js 등이 있다
				최신 버전이 아니라 다른 버전을 쓸 경우에는 latest 부분을 변경하면 된다
		4. 그 밑으로 toastui.Editr 객체를 생성하는 자바스크립트 구문을 넣어준다
			el : container element
			height : Editor's height style value
			initialValue : Editor's initial value
			previewStyle : markdown editor's preview style(tab, vertical)
			initialEditType : initial edit type (markdown, wysiwyg)
			viewer : default false, true로 할 경우 뷰어 역할을 하게 된다
			toastui.Editor의 다른 옵션들은 https://nhn.github.io/tui.editor/latest/ToastUIEditor 를 참조할 것
		5. editor의 내용을 가져오고자 할 때에는 .getMarkdown()과 .getHTML() 두 가지를 이용할 수 있다
			input[type=hidden]을 이용하면 form submit 처리가 수월하다
			localStorage를 이용해서 간단하게 viewpage.jsp로 넘겼다
			(localStorage 관련 유튜브 영상 : https://youtu.be/GNZg1KRsWuU )
	 -->
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
	function send() {
		let content = editor.getMarkdown();
		localStorage.setItem("content", content);
		location.href="viewpage.jsp";
	}
	</script>
</body>
</html>