<%@page import="member.login.dto.loginDto" %>
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
    <link rel="stylesheet" href="main_header.css" />
</head>
<%
	loginDto loginuser = (loginDto) session.getAttribute("loginuser");
	if(loginuser == null) {
		pageContext.forward("login.jsp");
	}
%>
<body>
	<header>
	 <nav id="tydee__nav">
      <div class="logo">
        <i class="fas fa-dot-circle"></i>
        <a href="#">TYDEE</a>
      </div>
      <div class="tydee__menu">
        <ul class="tydee__menu">
          <li class="item"><a href="#">TYDEE</a></li>
          <li class="item"><a href="#">SHOP</a></li>
          <li class="item"><a href="#">TIPS</a></li>
        </ul>
      </div>
      <div class="login">
       <% 
      		if(loginuser.getMyname() != null) {
       %>
        <a href="#"><%=loginuser.getMyname() %></a>
      </div>
  	  </nav>
  	<nav id="mytydee">
      <div class="tydee__mymenu">
        <ul class="tydee__mymenu__items">
          <li class="tydee__mymenu__item"><a href="mytydee.jsp">My TYDEE</a></li>
          <li class="tydee__mymenu__item">
            <a href=""><div class="tydee__mymenu__item__line"></div></a>
          </li>
          <li class="tydee__mymenu__item"><a href="#">My Account</a></li>
          <li class="tydee__mymenu__item"><a href="login.do?command=logout">Logout</a></li>
        </ul>
      </div>
    </nav>
       <% 
      		} else {
       %>
        <a href="login.jsp">LOGIN</a>
      </div>
    </nav>
        <%
      		}
        %>
	</header>	
</body>
</html>