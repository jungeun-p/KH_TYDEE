<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	var idChk = false;

function PwSearch() {
	var id = document.getElementById("id");
	if(id.value==""){
		alert("Email를 작성해주세요.");
	}else{
		 $.ajax({
				url:"controller.do",
				type:"post",
				async: true,
				data:{
					command:"PwSearch",
					id: id.value,

				},
				dataType:"text",
				success: function(msg){
					if(msg === "ok"){
						alert("정보확인완료!!");
						idChk = true;
						document.getElementById( 'InfoFirm' ).setAttribute('style','display: none')	
						document.getElementById( 'PwSubmit' ).setAttribute('style','display: ')
					} else if(msg === "fail"){
						alert("email을 확인 해주세요.");
						idChk = false;
					}
				},
				error: function(){
					alert("통신 실패");
				}
        	 });
		}
	}

	

</script>
</head>
<body>

	<h1>비밀번호 찾기</h1>
	<form action="controller.do" method="post" >
		<input type="hidden" name="command" value="PwSearchres"/>
	
		<input  type="email" name="id" placeholder="Email작성" id="id" required="required"/>
	
		<input type="button" value="정보확인" id="InfoFirm" onclick="PwSearch();"/>
	
		<input  type="submit" value="비밀번호 찾기" id="PwSubmit" style="display: none;"/>
	
	</form>
</body>
</html>




