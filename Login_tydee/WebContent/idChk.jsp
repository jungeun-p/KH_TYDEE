<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 체크</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function EmailChk() {
		console.log(opener.window.document.getElementsByName("user_id")[0]);
		opener.window.document.getElementsByName("user_id")[0].value =document.getElementById("EmailID").value;
		window.close();
	}
	function EmailChk2(RandomNumber) {
		if(RandomNumber == document.getElementById("EmailCode").value){
			alert("인증되었습니다.");
		$("#chk").show();	
		$("#chk2").hide();
		$("#EmailCode").hide();
	}else if(RandomNumber != document.getElementById("EmailCode").value){
		alert("인증번호를 확인하시오.");
		}
	}
	function validate() {
		/*이메일 형식  */
		 var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 var email = document.getElementById("emailCheck");
		 if(email.value=="") {
             alert("이메일을 입력해 주세요");
             email.focus();
             return false;
         }
         if(!re2.test(email.value)) {
        	 alert("이메일 형식을 지켜주세요...");
        	 return false;
         }else{
        	 alert("사용가능한 이메일 입니다.");
        	 $("#feildeID").show();
        	 document.getElementById("EmailID").value=document.getElementById("emailCheck").value
        	 
        	 
         }
		 
		
	}
	
	
</script>
</head>
<%
	int RandomNumber = (int)(Math.floor(Math.random() * (9999-1000+1))+1000);
	System.out.println(RandomNumber);
%>
<body>
	<form name="a" action="mailSend.jsp" method="post" target="iframe2">
	<input type="hidden" id="number" name="number" value="<%=RandomNumber%>"/>
	
	<fieldset>
		<legend>ID 작성</legend>
		<div>
		<input type="text" id="emailCheck" placeholder="email@.com/.net/.co.kr"/>
		<input type="button" id="validateID" value="유효성검사" onclick="validate();"/>
		</div>
	</fieldset>
	
	<fieldset id="feildeID" style="display: none;">
		<legend>이메일입력</legend>
		<div>
			<input type="email" id="EmailID" name="EmailName"/>
			<input type="submit" value="인증코드전송" id="submit"/><br/>
			<input type="text" id="EmailCode" placeholder="인증번호를 입력하세요."/>
			<input type="button" value="확인하기" id="chk2" onclick="EmailChk2(<%=RandomNumber %>);"/>
			<input type="button" id="chk" value="인증성공" onclick="EmailChk();" style="display: none;"/><br/>
		</div>
	</fieldset>
	
	<iframe name="iframe2" style="display: none"></iframe>
	
	
	
	
	
	</form>


</body>
</html>