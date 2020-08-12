<%@page import="java.util.ArrayList"%>
<%@page import="com.tydee.dto.MyTydeeDto"%>
<%@page import="java.util.List"%>
<%@page import="com.login.dto.UserInfoDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-control", "no-store");
    response.setHeader("Expires", "0");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>TYDEE</title>
</head>
<%
	UserInfoDto loginuser = (UserInfoDto) session.getAttribute("loginuser");
    int user_no = loginuser.getUser_no();
    if (user_no == 0 || loginuser == null) {
%>
	<script type="text/javascript">
        self.close();
	</script>
<%
    }
%>

<body>
    <form action="vision.do?command=insert" method="post" enctype="multipart/form-data">
        <section>
            <input type="submit" value="저장" />
            <input type="file" accept="image/*" id="image" name="imagefile" />
            <input type="button" value="닫기" onclick="self.close();"/>
        </section>
        <section>
            <img id="frame" />
        </section>
    </form>
    <script type="text/javascript" src="mytydee_js/mytydee_popup.js"></script>
</body>

</html>