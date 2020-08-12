<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TYDEE</title>
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
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="com.login.mail.SMTPAuthenticatior"%>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");

String from = request.getParameter("from");
String to = request.getParameter("to");
String number = request.getParameter("number");
String EmailName = request.getParameter("EmailName");

Properties p = new Properties(); //정보를 담을 객체

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

  msg.setSubject("TYDEE 인증번호 입니다🛒📦😊"); //  제목

  StringBuffer buffer = new StringBuffer();
  buffer.append("인증코드 : ");
  buffer.append(number+"<br>");
  Address fromAddr = new InternetAddress("tydee_adm@naver.com");//보내는사람
  msg.setFrom(fromAddr); 

  Address toAddr = new InternetAddress(EmailName);// 받는 사람
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









