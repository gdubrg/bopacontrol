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
String temp="";
String ener="";
String car="";
String date="";

response.setIntHeader("Refresh", 3);

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

String query = "SELECT * FROM silos ORDER BY data DESC LIMIT 0,1";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    temp = sqlResult.getString("temperatura");
    car = sqlResult.getString("carico");
    ener = sqlResult.getString("energia");
    date = sqlResult.getString("data");
    }

String soglia11="";
String soglia12="";
String soglia13="";
 
query = "SELECT * FROM soglie_silos";

sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    soglia11 = sqlResult.getString("temp_sil");
    soglia12 = sqlResult.getString("car_sil");
    soglia13 = sqlResult.getString("ene_sil");
    }
    
session.setAttribute("s11", soglia11);
session.setAttribute("s12", soglia12);
session.setAttribute("s13", soglia13);

sqlResult.close(); sqlStatement.close(); conn.close();

%>
</head>
<body>
<div id="tab">
<table class="table">
<tbody>
    <thead>
    <tr>
      <th>Sensore</th>
      <th>Valore</th>
      <th>Soglia</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>Temperatura [K]</td>
      <td><%=temp%></td>
      <td><%=soglia11%></td>
    </tr>
    <tr>
      <td>Carico [kg]</td>
      <td><%=car%></td>
      <td><%=soglia12%></td>
    </tr>
    <tr>
      <td>Potenza [kW]</td>
      <td><%=ener%></td>
      <td><%=soglia13%></td>
    </tr>
    </tbody>
</table>
</div>


</body>
</html>
