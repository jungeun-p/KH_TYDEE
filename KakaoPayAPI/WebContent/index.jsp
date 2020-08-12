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
<form action="kakaopay_run.jsp" method="POST">
	<h3>주문 상품 선택</h3>
	<select id="product" required="required">
		<option value="">==선택==</option>
		<option value="1900">닭꼬치</option>
		<option value="3300">아이스티</option>
		<option value="5900">서브웨이</option>
		<option value="6200">과자</option>
		<option value="12000">컵냉면</option>
		<option value="21000">연어</option>
	</select>
	<input type="hidden" name="name" readonly="readonly" placeholder="상품명"/>
	<input type="hidden" name="amount" readonly="readonly" placeholder="상품가격" /><br/>
	<input type="tel" name="buyer_tel" placeholder="연락처" required="required"/><br />
	<input type="button" value="결제" onclick="readyToSubmit()" />
</form>
<script>
	function readyToSubmit(){
		let form = document.getElementsByTagName("form")[0];
		if (document.querySelector("[name=amount]").value == null || document.querySelector("[name=amount]").value == ""){
			alert("상품을 선택해주세요!");
		} else if(document.querySelector("[name=buyer_tel]").value.trim() == ""){
			alert("연락처를 입력해주세요!");			
		} else {
			form.submit();
		}
	}
	window.addEventListener("DOMContentLoaded", () => {
		let whereName = document.querySelector("[name=name]");
		let whereCost = document.querySelector("[name=amount]");
		let products = document.getElementById("product");
		products.addEventListener("change", () => {
			let what = products.options[products.selectedIndex];
			whereCost.value = what.value;
			whereName.value = what.textContent;
		});
	});
</script>


</body>
</html>