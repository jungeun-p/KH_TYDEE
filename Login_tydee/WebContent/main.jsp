<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function registForm(){
		location.href="controller.do?command=registform";
	}
	function PwFind(){
		window.open("controller.do?command=FindPw", "", "width=500px,height=200px;");
	}
</script>
</head>
<body>
	<h1>Welcome to Tydee World!!</h1>
	<form action="controller" method="post">
		<input type="hidden" name="command" value="login"/>
		<table border=1>
			<col width=100 />
			<col width=100 />
			<tr>
				<th>I  D</th>
				<td><input type="text" name="user_id" /></td>
			<tr>
			<tr>
				<th>P  W</th>
				<td><input type="password" name="user_pw" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인" />
					<input type="button" value="회원가입" onclick="location.href='controller.do?command=registform'" />
				</td>
			</tr>
		</table>
		<div>
			회원 가입으로 이동 ~ <a href="controller.do?command=registform"> 클릭!!</a>
		</div>
		<div>
			<a href="controller.do?command=logout" onclick="PwFind();">비밀번호 찾기~</a>
		</div>

	</form>

</body>
</html>



