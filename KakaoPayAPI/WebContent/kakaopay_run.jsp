<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<%
	String name = request.getParameter("name");
	String amount = request.getParameter("amount");
	String buyer_tel = request.getParameter("buyer_tel");
%>
<body>
<script type="text/javascript">
	const IMP = window.IMP;
	IMP.init("imp00320262");
	// I'MPORT 회원가입 후 계정 내에서 생성된 가맹점식별코드
	// request_pay 필수 항목 : merchant_uid(중복X), amount, buyer_tel
	// 선택항목 : pg(kakaopay, html5_inicis, kcp 등),
	//          pay_method(card, trans, vbank, phone 등),
	//          name, tax_free, currencyc, language, buyer_name, buyer_email, buyer_addr, buyer_postcode 등
	IMP.request_pay({
		pg:'kakaopay',
		pay_method: 'card',
		merchant_uid : 'tydeeeshop_' + new Date().getTime(),
		name : '<%=name%>',
		amount : '<%=amount%>',
		buyer_tel :  '<%=buyer_tel%>'
		}, rsp => {
			if (rsp.success) {
				var msg = '<h3>결제가 완료되었습니다.</h3>';
				msg += '<p>상점 거래내역 ID : '+ rsp.merchant_uid +'</p>';
				msg += '<p>결제 금액 : &#8361;'+ rsp.paid_amount.toLocaleString() +'</p>';
				msg += '<p>결제 상품 : ' + rsp.name +'</p>';
			} else {
				var msg = '<h3>결제에 실패하였습니다.</h3>';
				msg += '<p>에러 내용 : ' + rsp.error_msg + '</p>';
			}
		localStorage.setItem('msg', msg);
		location.replace("kakaopay_result.jsp");
	});
</script>
</body>
</html>