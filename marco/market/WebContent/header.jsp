<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="model.User" %>
<% User user = (User) session.getAttribute("user");
   if (user==null){%>
<jsp:forward page="/login.jsp" /> 
<%return;}%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="mymarket.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,700italic,400,300,700' rel='stylesheet' type='text/css'>
<title>My Market</title>
</head>  
<body>

<div id="header"><h4>myMARKET</h4></div>

<div id ="menu">
	<ul>
		<li><a href="ControllerServlet?op=home">HOME</a></li>
		<li><a href="ControllerServlet?op=prodotto">PRODOTTI</a></li>
		<li><a href="ControllerServlet?op=asta">ASTE</a></li>
		<li><a href="ControllerServlet?op=asteuser">LE MIE ASTE</a></li>
		<li><a href="ControllerServlet?op=logout">ESCI</a></li>
	</ul>
</div>
