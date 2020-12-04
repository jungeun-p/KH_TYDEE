<%@page import="com.login.dto.UserInfoDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
      rel="stylesheet"
    />
    <!--font awsome-->
    <script
      src="https://kit.fontawesome.com/9378bc4c66.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="./mytydee_css/mytydee_header.css" />
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
	if(loginuser == null) {
		pageContext.forward("login.jsp");
	}
%>
<body>
	<header>
	 <nav id="mytydee__nav">
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
      <div class="mytydee__menu">
        <ul class="mytydee__menu">
          <li class="alert"><div class="circle">2</div></li>
          <li class="login">
          <% 
      		if(loginuser.getUser_nickname() != null) {
     	  %>
     	  <a href="mytydee.jsp"><%=loginuser.getUser_nickname() %></a>
         </li>
        </ul>
      </div>
    </nav>
    <nav id="mytydee__menubar">
      <div class="tydee__mymenu">
        <ul class="tydee__mymenu__items">
          <li class="tydee__mymenu__item"><a href="controller.do?command=mytydee">My TYDEE</a></li>
          <li class="tydee__mymenu__item">
            <a href=""><div class="tydee__mymenu__item__line"></div></a>
          </li>
          <li class="tydee__mymenu__item"><a href="controller.do?command=usermain">My Account</a></li>
          <li class="tydee__mymenu__item"><a href="controller.do?command=logout">Logout</a></li>
        </ul>
      </div>
    </nav>
      <% 
      		} else {
      %>
 		<a href="main.jsp">LOGIN</a>
         </li>
        </ul>
      </div>
     </nav>
      <%
      	}
      %>
  </header>	
</body>
</html>