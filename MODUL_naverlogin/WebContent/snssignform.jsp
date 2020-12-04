<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.login.dto.loginDto"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--google font-->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap" rel="stylesheet" />
<!--tydee__sign.css-->
<link rel="stylesheet" href="./login_css/registform.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
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
</head>
<body>
	<%
		loginDto snsdto = (loginDto) request.getAttribute("snsdto");
	%>

	<h1>회원가입</h1>

	<form action="naverlogin.do?command=loginres" method="post">
		<%
			if (snsdto != null) {
		%>
		<input type="hidden" name="sns_id" value="<%=snsdto.getSns_id()%>">
		<%
			}
		%>
			<div id="tydee__login">
			<div class="tydee__wrap">
				<h1>SIGN</h1>
				<div class="email">
					<p>email</p>
					<%
						if (snsdto.getMyemail() != null) {
					%>
					<input class="title__inner" type="text" id="myemail" name="myemail"
						required="required" readonly="readonly"
						value="<%=snsdto.getMyemail()%>" />
					<%
						} else {
					%>

					<input class="title__inner" type="text" id="myemail" name="myemail"
						required="required" />
					<%
						}
					%>
					<input type="button" value="check" onclick="" />
				</div>
				<div class="pw">
					<p>pw</p>
					<input class="title__inner" type="text" name="mypw"
						placeholder="password" required="required" /> <input
						type="button" value="check" onclick="" />
				</div>
				<div class="name">
					<p>nickname</p>
					<input class="title__inner" type="text" name="myname"
						placeholder="name is essential element." title="n"
						required="required" /> <input type="button" value="check"
						onclick="nickChk();" />
				</div>
				<div class="input">
					<input type="submit" value="sign" /> <input type="button"
						value="back"
						onclick="location.href='login.jsp'"/>
				</div>
				<div class="login">
					<span>already a member? 💨 </span> <a href="login.jsp">LOGIN</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>