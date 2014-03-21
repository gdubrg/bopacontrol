<html>
<body>
<%@ page language="java"%>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
%>
<p> You are logging in with:<br/>
username: <%=username%><br/>
password: <%=password%><br/>
</p>
<body>
<html>

