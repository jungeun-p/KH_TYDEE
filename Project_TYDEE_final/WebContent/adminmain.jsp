<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminmain</title>
 <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./login_css/tydee__admin.css" />
</head>
<%
	UserInfoDto loginuser = (UserInfoDto)session.getAttribute("loginuser");
%>
<body>
    <section class="admin__page">
    <form action="controller.do" method="post">
    <input type="hidden" name="command" value="admincheck" />
        <div class="admin__login">
          <p>ADMIN</p>
          <span>password</span>
          <input class="title__inner" type="password" name="title" />
          <input class="submit" type="submit" value="login" onclick="" />
        </div>
      </form>
    </section>
</body>
</html>