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
	<input type="text" name="buyer_name" placeholder="주문자 이름" /><br/>
	<input type="email" name="buyer_email" placeholder="이메일" /><br />
	<input type="tel" name="buyer_tel" placeholder="연락처" required="required"/><br />
	<input type="text" id="postcode" name="buyer_postcode" placeholder="우편번호" required="required" onkeypress="onlyNumber();">
	<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br />
	<input type="text" id="address" placeholder="주소" required="required"><br />
	<input type="text" id="detailAddress" placeholder="상세주소">
	<input type="text" id="extraAddress" placeholder="참고항목"><br />
	<input type="button" value="결제" onclick="readyToSubmit()" />
</form>
<!-- 도로명주소 API 호출 (http://postcode.map.daum.net/guide) -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function readyToSubmit(){
		let address1 = document.getElementById("address").value;
		let address2 = document.getElementById("detailAddress").value;
		let address3 = document.getElementById("extraAddress").value;
		let address = document.createElement("input");
		address.setAttribute("type", "hidden");
		address.setAttribute("name","buyer_addr");
		address.setAttribute("value", address1 + " " + address2 + " " + address3);
		let form = document.getElementsByTagName("form")[0];
		form.appendChild(address);
		if (document.querySelector("[name=amount]").value == null || document.querySelector("[name=amount]").value == ""){
			alert("상품을 선택해주세요!");
		} else if(document.querySelector("[name=buyer_tel]").value.trim() == ""){
			alert("연락처를 입력해주세요!");			
		} else {
			form.submit();
		}
	}
	function execDaumPostcode() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행됨
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                document.getElementById("extraAddress").value = extraAddr;
	            
	            } else {
	                document.getElementById("extraAddress").value = '';
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("detailAddress").focus();
	        }
	    }).open();
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