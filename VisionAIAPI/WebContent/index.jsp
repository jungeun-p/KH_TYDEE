<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
	<form action="vision?command=doVision" method="post" enctype="multipart/form-data">
	<!-- input type=file로 가져온 이미지 파일은 Blob 객체이기 때문에 
		file을 특정 경로에 업로드 하여 그 파일을 vision ai api로 처리한 후
		(용량 차지를 덜기 위해 해당 파일을 삭제하고) 처리한 결과를 화면에 뿌려주는 식으로 구성함
		파일 업로드를 하기 위해서는 entype="multipart/form-data"로 설정
		이렇게 보낸 파일을 받는 역할은 cos.jar가 한다
		(cos.jar download : http://www.servlets.com/cos/)
	 -->
		<input type="submit" value="전송" />
		<input type="file" accept="image/*" id="image" name="imagefile" />
		<img id="frame" height="500px" />
	</form>
	<script>
		// 첨부한 이미지를 화면에 뿌리는 자바스크립트 코드
		var image = document.getElementById('image');
		var frame = document.getElementById('frame');

		image.addEventListener('change', function(e) {
			console.log(e);
			var file = e.target.files[0];
			frame.src = URL.createObjectURL(file);
		});
		
	</script>

</body>
</body>
</html>