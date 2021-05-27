<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="pcac.userInfo" %>
<%@ page import="pcac.userDAO" %>
<%@ page import="java.util.*" %>
<% userDAO udao = new userDAO();
	List<userInfo> userlist = udao.readAllDB();
%>
<style>
	body,html{width:100%; height:100%}
	table{
		position:absolute; left:50%; top:50%;
		transform:translate(-50%, -50%);
		cellpadding:10px;
		width:600px;
	}
	th{background-color:rgba(33,33,33,.2);}
	td:nth-child(2n){background-color:rgba(99,99,99,.2);}
	td:nth-child(2n+1){background-color:rgba(00,57,66,.2);}
</style>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr><th>이름</th><th>ID</th><th>전화번호</th><th>직업</th><th width=50>성별</th></tr>
<% for(int i=0; i<userlist.size(); i++){
	userInfo user = (userInfo)userlist.get(i);
	out.print("<tr><th><a href='idx_Jsp.jsp?id="+user.getId()+"&idx=joinltemView'>"+user.getName()+"</a></td>");
	out.print("<td>"+user.getId()+"</td>");
	out.print("<td>"+user.getTel()+"</td>");
	out.print("<td>"+user.getJob()+"</td>");
	if(user.getGender().equals("1"))
		out.print("<td>"+"남자"+"</td></tr>");
	else
		out.print("<td>"+"여자"+"</td></tr>");
}
%>
</table>
</body>
</html>