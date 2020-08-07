<%@page import="com.tydee.dto.BoardItemDto"%>
<%@page import="java.util.List"%>
<%@page import="com.tydee.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-control", "no-store");
	response.setHeader("Expires", "0");
%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/3914a9940d.js"
	crossorigin="anonymous"></script>
<style>
img {
width: 200px;
}
</style>
</head>
<%
	List<BoardItemDto> itemList = (List<BoardItemDto>) request.getAttribute("itemList");
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
%>
<body>
	<div class="userinfo">
		<c:choose>
			<c:when test="${empty loginuser }">
				<a href="userinfo_login.jsp">login</a>
			</c:when>
			<c:otherwise>
				<a href="#">logout</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="tydee__basket">
		<div class="tydee__eshop__title">
			<h1>TYDEE ESHOP :: ORDER</h1>
			<!-- no hashtag in this page -->
		</div>
		<div class="basket">
			<c:forEach items="${list }" var="item">
			<div class="basket__item">
				<div class="item__image">
					<img src="./images/${empty item.item_image ? '1.jpg' : item.item_image }" />
				</div>
				<div class="item__title">
					<span>${item.item_title }</span>
				</div>
				<div class="item__price">
					<span>
						<fmt:setLocale value="ko_KR"/>
						<fmt:formatNumber type="currency" value="${item.item_price}"></fmt:formatNumber>
					</span>
				</div>
				<div class="item__quantity">
					<span>${item.item_quan }</span>
				</div>
			</div>
			</c:forEach>
		</div>
	<div class="total__price">
		<span id="total_price">
			<fmt:formatNumber type="currency" value="${totalPrice gt 50000 ? totalPrice : totalPrice + 3000 }"></fmt:formatNumber>
		</span>
	</div><hr />
	</div>
	<form action="order.do?command=order&user_no=${loginuser.user_no }" method="POST">
	<div class="order__info">
		<div class="order__menu">
			<p><label for="name">name</label></p>
			<p><label for="phone_first">phone</label></p>
			<p><label for="recent">address</label></p>
		</div>
			<div class="order__contents">
				<div class="order__info_name">
					<input type="text" id="name" name="user_name"/>
				</div>
				<div class="order__info_phone">
					<input type="text" id="phone_first" onkeypress="onlyNumber();" /><span>-</span>
					<input type="text" id="phone_second" onkeypress="onlyNumber();" /><span>-</span>
					<input type="text" id="phone_third" onkeypress="onlyNumber();" />
				</div>
				<div class="order__info_address">
					<div class="address_select">
						<input type="radio" name="address_type" id="recent" /><label for="recent">최근 주소록</label>
						<input type="radio" name="address_type" id="new" /><label for="new">새 주소록</label>
					</div>
					<input type="text" id="sample6_postcode" name="user_postcode" placeholder="우편번호"  onkeypress="onlyNumber();">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" name="user_address_first" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" name="user_address_second" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" name="user_address_extra" placeholder="참고항목">
				</div>
			</div>
		<input type="hidden" name="total_price" value="${totalPrice gt 50000 ? totalPrice : totalPrice + 3000 }" />
	</div>
	<div class="order__buttons">
		<input type="button" value="취소" onclick="location.href='item.do?command=list'" />
		<button onclick="readyToSubmit();"><img src="./images/kakaopay/payment_icon_yellow_medium.png" /></button>
	</div>
	</form>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function readyToSubmit(){
		let number1 = document.getElementById("phone_first").value;
		let number2 = document.getElementById("phone_second").value;
		let number3 = document.getElementById("phone_third").value;
		let phone = document.createElement("input");
		phone.setAttribute("type","hidden");
		phone.setAttribute("name","user_phone");
		phone.setAttribute("value",number1+number2+number3);
		let where = document.getElementsByTagName("form")[0];
		where.appendChild(phone);
	}
	function onlyNumber(){
	
	    if((event.keyCode<48)||(event.keyCode>57))
	
	       event.returnValue=false;
	
	}
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>