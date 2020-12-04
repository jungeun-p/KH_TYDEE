<%@page import="com.login.dto.UserInfoDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등급변경</title>
 <!--google font-->
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./login_css/tydee__admin__edit.css" />
    <!-- Editor's Dependecy Style -->
</head>
<body>

<%
	List<UserInfoDto> list = (List<UserInfoDto>)request.getAttribute("list");
%>

    <form action="login.do?command=admin" method="POST">
      <section class="tydee__admin__edit">
        <div class="edit__menu">
          <a href="#"><p>user edit</p></a>
          <a href="#"><p>shop edit</p></a>
        </div>
        <div class="side__menu">
          <div class="edit__contents">
<% 
	if (list.size() == 0){
		
%>			<div class="edit__list">
			<span>---no user---</span>
			</div>
<%
	}else{
		for(UserInfoDto dto : list){
%>			
			<div class="edit__list">
              <span><%=dto.getUser_no() %></span>
              <span><%=dto.getUser_nickname() %></span>
              <span><%=dto.getUser_id() %></span>
              <span><%=dto.getUser_role() %></span><input type="button" class="edit" value="edit" onclick="location.href='controller.do?command=updaterole&user_no=<%=dto.getUser_no()%>'"/>
            </div>

<%
		}
	}
%>			
			</div>
          <input class="submit" type="submit" value="submit"/>
        </div>
      </section>
    </form>


</body>
</html>







