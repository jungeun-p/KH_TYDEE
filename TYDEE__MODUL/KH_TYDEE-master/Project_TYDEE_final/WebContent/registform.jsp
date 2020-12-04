<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<!--tydee__sign.css-->
<link rel="stylesheet" href="./login_css/registform.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>
<script type="text/javascript">
	function emailChkConfirm() {
		window.open("controller.do?command=emailChk", "",
				"width=500px,height=500px");
	}
	/* 닉네임 중복체크  */
	function nickChk() {
		var doc = document.getElementsByName("user_nickname")[0];
		if (doc.value.trim() == "" || doc.value == null) {
			alert("닉네임을 입력해주세요.!");
		} else {
			window.open("controller.do?command=nickChk&user_nickname="
					+ doc.value, "", "width=500, height=300");
		}
	}
</script>
<script>
   var joinFormSubmitted = false;
   
   function submitJoinForm(form){
      form.user_pwReal.value = sha256(form.user_pw.value);
      
      form.user_pw.value = '';
      
      form.submit();
      joinFormSubmitted = true;
   }
</script>


</head>
<body>

	<form action="controller.do" method="post" onsubmit="submitJoinForm(this); return false;">
		<input type="hidden" name="user_pwReal"/>
		<input type="hidden" name="command" value="registformres" />

		<div id="tydee__login">
			<div class="tydee__wrap">
				<h1>SIGN</h1>
				<div class="email">
					<p>email</p>
					<input class="title__inner" type="text" id="user_id" name="user_id"
						required="required" readonly="readonly" placeholder="email"
						onclick="emailChkConfirm();" /> <input type="button"
						value="check" onclick="" />
				</div>
				<div class="pw">
					<p>pw</p>
					<input class="title__inner" type="password" name="user_pw"
						placeholder="password" required="required" /> <input
						type="button" value="check" onclick="" />
				</div>
				<div class="name">
					<p>nickname</p>
					<input class="title__inner" type="text" name="user_nickname"
						placeholder="name is essential element." title="n"
						required="required" /> <input type="button"
						value="check" onclick="nickChk();" />
				</div>
				<div class="input">
					<input type="submit" value="sign" /> <input type="button"
						value="back" onclick="location.href='login.jsp'" />
				</div>
				<div class="login">
					<span>already a member? 💨 </span> <a
						href="login.jsp">LOGIN</a>
				</div>
			</div>
		</div>
</form>

</body>
</html>