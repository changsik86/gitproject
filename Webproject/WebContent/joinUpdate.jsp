<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="pcac.userInfo" %>
<%@ page import="pcac.userDAO" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="user" class="pcac.userInfo"/>
<jsp:setProperty property="*" name="user"/>
<%
	userDAO udao = new userDAO();
	udao.dbUpdate(user);
	request.setAttribute("target", "joinListView");
%>
<jsp:forward page="template.jsp"/>
</body>
</html>