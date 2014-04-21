<html>
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>
<head> 
  <!-- Fogli di stile -->
  <link rel="stylesheet" href="../View/bootstrap/css/bootstrap.css">
  <link href="../View/bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="../View/style.css">
<title>JDBC test with Connector/J</title>

<%
%>

</head>
<body>
<div id="tab">
<table class="table">
<tbody>
    <thead>
    <tr>
      <th>ID allarme</th>
      <th>Problema</th>
      <th>Data</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>001</td>
      <td>temp max</td>
      <td>12-12-2003</td>
    </tr>
    <tr>
       <td>001</td>
      <td>temp max</td>
      <td>12-12-2003</td>
    </tr>
    <tr>
       <td>001</td>
      <td>temp max</td>
      <td>12-12-2003</td>
    </tr>
    </tbody>
</table>
</div>


</body>
</html>
