<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
	alert("비밀번호가 이메일로 전송되었습니다.");
	window.close();
	
</script>

<title>비밀번호 이메일전송</title>
</head>
<body>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="com.login.mail.SMTPAuthenticatior"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
UserInfoDto dto = (UserInfoDto)request.getAttribute("dto");


String to = dto.getUser_id();
System.out.print(to);
String pw = dto.getUser_pw();
String nick = dto.getUser_nickname();
  
String id = request.getParameter("id");
Properties p = new Properties(); // 정보를 담을 객체
  
p.put("mail.smtp.host","smtp.naver.com");
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
 
  
try{
    Authenticator auth = new SMTPAuthenticatior();
    Session ses = Session.getInstance(p, auth);
      
    ses.setDebug(true);
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체 
 
    msg.setSubject("TYDEE 비밀번호 전송 이메일입니다."); //  제목
 
    StringBuffer buffer = new StringBuffer();
    buffer.append(nick);
    buffer.append(" 님의 "+"<br>");
    buffer.append("비밀번호: ");
    buffer.append(pw+"<br>");
    Address fromAddr = new InternetAddress("fbtldhk@naver.com");//보내는사람
    msg.setFrom(fromAddr); 
 
    Address toAddr = new InternetAddress(to);// 받는 사람
    msg.addRecipient(Message.RecipientType.TO, toAddr); 
     
    msg.setContent(buffer.toString(), "text/html;charset=UTF-8"); // 내용
    Transport.send(msg); // 전송  
 
} catch(Exception e){
    e.printStackTrace();
    return;
}
%>

</body>
</html>