<%@page import="com.login.dto.UserInfoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급수정</title>
    <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./login_css/updaterole.css" />
</head>
<body>
	<form action="controller.do" method="post">
	<input type="hidden" name="command" value="updateroleres" /> 
	<input type="hidden" name="user_no" value="${dto.user_no }" />
	
	    <section class="userinfo">
      <div class="info__left">
        <div class="now__grade">
          <p>${dto.user_role }</p>
        </div>
      </div>
      <div class="info__right">
        <div class="change__grade">
          <div class="myrole">
            <input type="radio" name="myrole" value="ADMIN" id="admin" />
            <span>ADMIN</span>
          </div>
          <div class="myrole">
            <input type="radio" name="myrole" value="EXPERT" id="expert" />
            <span>EXPERT</span>
          </div>
          <div class="myrole">
            <input type="radio" name="myrole" value="USER" id="user" />
            <span>USER</span>
          </div>
        </div>
        <div class="inputs">
          <input type="submit" value="edit" />
          <input type="button" value="back" onclick="location.href='controller.do?command=adminmain'" />
        </div>
      </div>
    </section>
    </form>
</body>
</html>





