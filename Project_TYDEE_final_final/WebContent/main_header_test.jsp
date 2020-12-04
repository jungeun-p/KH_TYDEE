<%@page import="com.login.dto.UserInfoDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TYDEE</title>
    <!--google font-->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet"/>
    <!--font awsome-->
    <script src="https://kit.fontawesome.com/9378bc4c66.js" crossorigin="anonymous"></script>
    <!-- css -->
    <link rel="stylesheet" href="./include/main_header_test.css" />
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
if (loginuser == null) {
	pageContext.forward("login.jsp");
}
%>
<body>
	<header>
  <nav id="tydee__nav">
      <div class="tydee__menu">
        <ul class="tydee__menu__items">
        
          <li class="tydee__menu__item"><a href="">SHOP</a></li>
          <li class="tydee__menu__item"><a href="secondhand_controller.do?command=list&user_id=${loginuser.user_id }">SECONDHAND SHOP</a></li>
          <li class="tydee__menu__item"><a href="tip.do?command=main">TIPS</a></li>
          <li class="tydee__menu__item"><a href="">STORE</a></li>
        </ul>
        <div class="tydee__logo">
          <a href="main.jsp">♟</a>
        </div>
        <div class="tydee__mymenu">
          <ul class="tydee__mymenu__items">
      <%
      	if(loginuser.getUser_nickname() != null) {
      %>
        <li class="tydee__mymenu__item"><a href=""><%=loginuser.getUser_nickname() %></a></li>
            <li class="tydee__mymenu__item"><a href="controller.do?command=mytydee">My TYDEE</a></li>
            <li class="tydee__mymenu__item">
              <a href=""><div class="tydee__mymenu__item__line"></div></a>
            </li>
            <li class="tydee__mymenu__item"><a href="controller.do?command=usermain">My Account</a></li>
            <li class="tydee__mymenu__item"><a href="controller.do?command=logout">Logout</a></li>
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
       <% 
      		} else {
       %>
        <li class="tydee__mymenu__item"><a href="">LOGIN</a></li>
		<a href="login.jsp">LOGIN</a>
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
    <%
      		}
    %>
	</header>	
</body>
</html>