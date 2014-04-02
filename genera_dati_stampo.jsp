<html>
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>
<head> 
  <!-- Fogli di stile -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <link href="bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="stile.css">
<title>JDBC test with Connector/J</title>

<%
String temp="";
String ener="";
String press="";
String date="";

response.setIntHeader("Refresh", 3);

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

String ins = "INSERT INTO stampo (temperatura, pressione, energia, data) VALUES (FLOOR(200+RAND()*(10-1)), FLOOR(3+RAND()*(5-3)), FLOOR(500+RAND()*(10-1)), CURRENT_TIMESTAMP)";
sqlStatement.executeUpdate(ins);

String query = "SELECT * FROM stampo ORDER BY data DESC LIMIT 0,1";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    temp = sqlResult.getString("temperatura");
    ener = sqlResult.getString("energia");
    press = sqlResult.getString("pressione");
    date = sqlResult.getString("data");
    }
    
    
String canc = "DELETE FROM estrusione WHERE data='" + date + "'";


sqlResult.close(); sqlStatement.close(); conn.close();

%>
</head>
<body>

<%@ include file="getCookie.jsp" %>

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
      <td>Pressione [Bar]</td>
      <td><%=press%></td>
<<<<<<< HEAD
      <td><%=soglia12%></td>
=======
      <td>5</td>
>>>>>>> 38b96413e60b8b61c86e3542ed7cef6bd283f6ef
    </tr>
    <tr>
      <td>Potenza [KW]</td>
      <td><%=ener%></td>
<<<<<<< HEAD
      <td><%=soglia13%></td>
=======
      <td>700</td>
>>>>>>> 38b96413e60b8b61c86e3542ed7cef6bd283f6ef
    </tr>
    </tbody>
</table>
</div>


</body>
</html>
