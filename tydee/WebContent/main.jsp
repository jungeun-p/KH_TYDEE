<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--google font-->
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
	rel="stylesheet" />
    <!--css-->
    <link rel="stylesheet" href="./include/main_tydee.css" />
<style>
	.header{
	  position: sticky;
	  top:0;
	}
</style>
</head>
<body>
	<%@ include file="./include/main_header_test.jsp"%>
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
    
</body>
</html>