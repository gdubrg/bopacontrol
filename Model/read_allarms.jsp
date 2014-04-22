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
String macc ="";
String descr="";
String date="";

response.setIntHeader("Refresh", 3);

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;
conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

String query = "SELECT * FROM allarmi ORDER BY data DESC LIMIT 0,3";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    macc = sqlResult.getString("macchina");
    descr = sqlResult.getString("descr");
    date = sqlResult.getString("data");
    }
sqlResult.close(); sqlStatement.close(); conn.close();
%>

</head>
<body>
<div id="tab">
<table class="table">
<tbody>
    <thead>
    <tr>
      <th>Macchina</th>
      <th>Problema</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><%=macc%></td>
      <td><%=descr%></td>
    </tr>
    <tr>
       <td>001</td>
      <td>temp max</td>
    </tr>
    <tr>
       <td>001</td>
      <td>temp max</td>
    </tr>
    </tbody>
</table>
</div>


</body>
</html>
