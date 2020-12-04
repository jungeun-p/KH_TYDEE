<%@page import="com.login.dto.UserInfoDto"%>
<%@page import="com.login.dto.UserInfoUpdateDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
    <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./login_css/tydee__user__edit.css" />
</head>
<%
	UserInfoDto loginuser = (UserInfoDto)request.getAttribute("loginuser");
%>
<body>
	<form action="controller.do" method="post">
	<input type="hidden" name="command" value="userdateres"/>
	<input type="hidden" name="user_no" value="<%=loginuser.getUser_no()%>"/>
      <section class="tydee__user__edit">
        <div class="edit__menu">
          <a href="controller.do?command=usercheck"><p class="menu__p">edit my account</p></a>
          <a href="#"><p class="menu__p">my contents</p></a>
          <a href="#"><p class="menu__p">my comment</p></a>
          <a href="#"><p class="menu__p">my bookmark</p></a>
        </div>
        <div class="edit__contents">
          <p>email</p>
          <input class="title__inner" type="text" name="email" value="<%=loginuser.getUser_id() %>" readonly="readonly"/>
          <p>nickname</p>
          <input class="title__inner" type="text" name="nick" value="<%=loginuser.getUser_nickname()%>"/>
          <p>password</p>
          <input class="title__inner" type="text" name="pw" value="<%=loginuser.getUser_pw() %>"/>
          <div class="inputs">
         	<input type="submit" value="edit"/>
          	<input type="button" value="main" onclick="location.href='main.jsp'"/>
		  	<input type="button" value="logout" onclick="location.href='controller.do?command=logout'"/>
          </div>
        </div>
      </section>
    </form>

</body>
</html>




