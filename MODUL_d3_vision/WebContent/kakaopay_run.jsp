<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String postcode = request.getParameter("postcode");
	String address = request.getParameter("address");
	String total_price = request.getParameter("total_price");
	String item_number = request.getParameter("item_number");
	String item_lead_name = request.getParameter("item_lead_name");
	String email = request.getParameter("email");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<script>
		const IMP = window.IMP;
		IMP.init("imp00320262");
		IMP.request_pay({
			pg:'kakaopay',
			pay_method: 'card',
			merchant_uid : 'tydeeeshop_' + new Date().getTime(),
			name : '<%=item_lead_name%>',
			amount : '<%=total_price%>',
			buyer_email: '<%=email%>',
			buyer_name : '<%=name%>',
			buyer_tel :  '<%=phone%>',
			buyer_addr : '<%=address%>',
			buyer_postcode : '<%=postcode%>'
		}, rsp => {
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
            location.href="kakaopay_success.jsp";
        });

	</script>
</body>
</html>