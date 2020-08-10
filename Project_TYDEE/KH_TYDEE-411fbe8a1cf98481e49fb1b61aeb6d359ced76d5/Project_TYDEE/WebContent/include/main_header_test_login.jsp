<%@page import="com.login.dto.UserInfoDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--google font-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet"/>
    <!--font awsome-->
    <script src="https://kit.fontawesome.com/9378bc4c66.js" crossorigin="anonymous"></script>
    <!-- css -->
    <link rel="stylesheet" href="./include/main_header_test.css" />
</head>
<body>
	<header>
  <nav id="tydee__nav">
      <div class="tydee__menu">
        <ul class="tydee__menu__items">
          <li class="tydee__menu__item"><a href="">SHOP</a></li>
          <li class="tydee__menu__item"><a href="">SECOND SHOP</a></li>
          <li class="tydee__menu__item"><a href="tip.do?command=main">TIPS</a></li>
          <li class="tydee__menu__item"><a href="">STORE</a></li>
        </ul>
        <div class="tydee__logo">
          <a href="main_login.jsp">♟</a>
        </div>
        <div class="tydee__mymenu">
          <ul class="tydee__mymenu__items">
        <li class="tydee__mymenu__item"><a href="login.jsp">LOGIN</a></li>
          </ul>
        </div>
      </div>
      <div class="tydee__footer">
        <div class="tydee__sidelogo">
          <p><i class="fas fa-circle"></i></p>
          <p><i class="fas fa-circle"></i></p>
          <p><i class="fas fa-circle"></i></p>
        </div>
        <div class="tydee__mid">
          <p>arrange your life</p>
        </div>
        <div class="tydee__name">
          TYDEE
        </div>
      </div>
    </nav>
	</header>	
</body>
</html>