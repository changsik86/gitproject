<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="pcac.userDAO" %>
<%@ page import="pcac.userInfo" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	userDAO userdao = new userDAO();
	userInfo user = userdao.readDB(id);
	if(password.equals(user.getPassword())){
		session.setAttribute("user_name", user.getName());
		session.setAttribute("user_id", user.getId());
		request.setAttribute("target", "home");
	}else
		request.setAttribute("target", "loginForm");
%>
<jsp:forward page="template.jsp"/>
</body>
</html>