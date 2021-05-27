<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="pcac.DBCon" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Connection con = DBCon.getCon();
	out.print("연결 성공<br>");
	DBCon.close(con, null, null);
} catch(Exception e) {
	out.print("연결 실패<br>");
}
%>
</body>
</html>