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
<%@ include file="getCookie.jsp" %>
<%
String temp="";
String ener="";
String press="";
String date="";



if(statoSis.compareTo("1") == 0){
response.setIntHeader("Refresh", 3);
}

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
      <td><%=soglia12%></td>
    </tr>
    <tr>
      <td>Potenza [KW]</td>
      <td><%=ener%></td>
      <td><%=soglia13%></td>
    </tr>
    </tbody>
</table>
</div>


</body>
</html>