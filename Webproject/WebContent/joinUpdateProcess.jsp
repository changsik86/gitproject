<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pcac.userInfo" %>
<%@ page import="pcac.userDAO" %>
<%
   String cid = request.getParameter("id");

   userDAO userdao = new userDAO();
   userInfo user = userdao.readDB(cid);
   request.setAttribute("user",user);
   request.setAttribute("target","joinUpdateForm");
%>
<jsp:forward page="template.jsp"/>