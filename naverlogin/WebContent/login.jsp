<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<!-- google script -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
	content="471251670271-apad6mrd805m4baikvt9crccijbva5vr.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
</head>


<style>
table {
	border: none;
}
</style>

<body>
	<h1>로그인</h1>

	<form action="login.do" method="post">
		<input type="hidden" name="command" value="login" />
		<table border="1">
			<col width="100" />
			<col width="100" />
			<tr>
				<th>ID💻</th>
				<td><input type="text" name="myemail" /></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="mypw" /></td>
			</tr>
			<tr>
				<td colspan="4" align="right"><input type="submit"
					value="login" /> <input type="button" value="sign"
					onclick="location.href='signform.jsp'" /></td>
			</tr>
		</table>
	</form>

	<%
	String clientId = "7ZPJsKGFasjwFQDmC76r";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8787/login/callback.jsp", "UTF-8");//callback page;
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
	%>
	
	<!-- naver login -->
	<div>
		<a href="<%=apiURL%>"><img height="50"
			src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
	</div>
	
	<!-- google login -->
	<script>
		function onSignIn(googleUser) {
			// Useful data for your client-side scripts:
			var profile = googleUser.getBasicProfile();
			console.log("ID: " + profile.getId()); // Don't send this directly to your server!
			console.log('Full Name: ' + profile.getName());
			console.log('Given Name: ' + profile.getGivenName());
			console.log('Family Name: ' + profile.getFamilyName());
			console.log("Image URL: " + profile.getImageUrl());
			console.log("Email: " + profile.getEmail());
			alert("test");
			
			// The ID token you need to pass to your backend:
			var id_token = googleUser.getAuthResponse().id_token;
			console.log("ID Token: " + id_token);
			
			location.href="glogin.do?command=googlelogin&myemail="+profile.getId()+"&myemail"+profile.getEmail();
		};
	</script>
	
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>

</body>
</html>