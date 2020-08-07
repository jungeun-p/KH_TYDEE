<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	function emailChkConfirm() {
		window.open("controller.do?command=emailChk", "", "width=500px,height=500px");
	}
	/* 닉네임 중복체크  */
	function nickChk(){
		var doc = document.getElementsByName("user_nickname")[0];
		if (doc.value.trim() == "" || doc.value == null) {
			alert("닉네임을 입력해주세요.!");
		} else {
			window.open("controller.do?command=nickChk&user_nickname="+doc.value,
				"",
				"width=500, height=300");
		}
	}
		
</script>







</head>
<body>

	<h1>회원가입</h1>

	<form action="controller.do" method="post">
		<input type="hidden" name="command" value="registformres" />

		<table border="1">
			<col width="100" />
			<col width="100" />
			<col width="100" />
			<tr>
				<th>I D</th>
				<td><input type="email" id="user_id" name="user_id"
					class="form-group" placeholder="Email" required="required"
					readonly="readonly" onclick="emailChkConfirm();" /> <!-- 필수 정보 입니다. --></td>

			</tr>
			<tr>
				<th>P W</th>
				<td><input type="password" name="user_pw" class="form-group"
					placeholder="password" required="required" /></td>
			</tr>
			<tr>
				<th>NICKNAME</th>
				<td>
					<input type="text"  name="user_nickname"  placeholder="닉네임은 필수 입니다." required="required" title="n"/>
					<input type="button" value="중복체크" onclick="nickChk();"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="가입" />
					<input type="button" value="취소"
					onclick="location.href='controller.do?command=login'" /></td>
			</tr>
			<tr>
				<td colspan="2">TYDEE 회원이신가요 → <a
					href="controller.do?command=login">로그인하기</a>
				</td>
			</tr>
		</table>

	</form>

</body>
</html>