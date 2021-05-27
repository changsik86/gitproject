<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="pcac.userDAO" %>
<%@ page import="pcac.userInfo" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:useBean id="user" class="pcac.userInfo"/>
<jsp:setProperty property="*" name="user"/>
<title>Insert title here</title>
</head>
<body>
<%
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	user.setTel(tel1 + "-" + tel2 + "-" + tel3);
	String[] hobbylist = request.getParameterValues("hobby");
	String hobby = "";
	for(int i = 0; i < hobbylist.length; i++) {
		hobby += hobbylist[i] + " ";
	}
	user.setHobby(hobby);
	userDAO udao = new userDAO();
	udao.insertDB(user);
	request.setAttribute("name", user.getName());
	request.setAttribute("target", "join_result");
%>
<jsp:forward page="template.jsp"/>
</body>
</html>