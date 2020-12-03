<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TYDEE</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
<!--tydee__login.css-->
<link rel="stylesheet" href="./login_css/login.css" />
<script type="text/javascript">
	function registForm() {
		location.href = "controller.do?command=registform";
	}
</script>
</head>
<body>
	<!-- naver login -->
	<%
	String clientId = "1S3rTODmrQPhGWH9f_1L";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8787/Project_TYDEE_final/callback.jsp", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
	%>
	
	<form action="controller" method="post">
		<input type="hidden" name="command" value="login" />
		<div id="tydee__login">
			<div class="tydee__wrap">
				<h1>LOGIN</h1>
				<div class="email">
					<span>email</span> <input class="title__inner" type="text"
						name="user_id" />
				</div>
				<div class="pw">
					<span>pw</span> <input class="title__inner" type="password"
						name="user_pw" />
				</div>
				
				<!-- naver login -->
				<div class="login">
					<a href="<%=apiURL%>"><img id="naver_id_login" height="40"
						src="./login_img/naver__login.png" /></a>
				</div>
				<div class="input">
					<input type="button" value="sign"
						onclick="location.href='controller.do?command=registform'" /> <input
						type="submit" value="login" onclick="" />
				</div>
			</div>
		</div>
	</form>

</body>
</html>



