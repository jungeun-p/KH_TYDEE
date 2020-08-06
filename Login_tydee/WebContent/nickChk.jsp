<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복확인</title>
<script type="text/javascript">
	onload = function(){
		var id = opener.document.getElementsByName("user_nickname")[0].value;
		document.getElementsByName("nick")[0].value = id;
	}
	function confirmId(bool){
		if (bool == "true"){
		}
		self.close();
	}
</script>
</head>
<body>
<%
	String nickid = request.getParameter("nickid");
%>
	<table border="1">
		<tr>
			<td>
				<input type="text" name="nick"/>
			</td>
		</tr>
		<tr>
			<td><%=nickid.equals("true")?" 사용 가능 닉네임 입니다.":"중복된 닉네임 존재!" %></td>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirmId('<%=nickid %>')" />
				<!-- quotation problem -->
			</td>
		</tr>
	</table>
</body>
</html>