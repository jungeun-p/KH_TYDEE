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
    <link rel="stylesheet" href="./include/main_tydee.css" />
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
     <section class="tydee__index">
     <section class="tydee__index_part">
        <div class="image part1"><img src="img/tydee1.png" /></div>
        <div class="image part3"><img src="img/tydee3.png" /></div>
        <div class="image part4"><img src="img/tydee4.png" /></div>
        <div class="image part5"><img src="img/tydee5.png" /></div>
        <div class="image part6"><img src="img/tydee6.png" /></div>
        <div class="image part7"><img src="img/tydee7.png" /></div>
        <div class="image part8"><img src="img/tydee8.png" /></div>
        <div class="image part9"><img src="img/tydee9.png" /></div>
        <div class="image part2"><img src="img/tydee2.png" /></div>
      </section>
      <section class="tydee__index_part">
        <article class="image"><img src="img/7.jpg" alt="" /></article>
        <article class="image"><img src="img/8.jpg" alt="" /></article>
      </section>
    </section>	
	 <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", () => {
            window.addEventListener("scroll", () => {
                let currentScrollPos = window.scrollY || document.documentElement.scrollTop;
                let images = document.querySelectorAll("div.image");
                for (let i = 0; i < images.length; i++) {
                    images[i].style.transform = ("translateX(" + images[i].getAttribute("class")
                        .substring(10) * currentScrollPos / 7 + "px)");
                }
                // body에 overflow-x: hidden css 주었습니다!
            });
        });
    </script>	
   </header>
</body>
</html>