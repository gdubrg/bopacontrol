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
String press="";
String date="";

response.setIntHeader("Refresh", 3);

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();


String query = "SELECT * FROM stampo ORDER BY data DESC LIMIT 0,1";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    temp = sqlResult.getString("temperatura");
    ener = sqlResult.getString("energia");
    press = sqlResult.getString("pressione");
    date = sqlResult.getString("data");
    }

String soglia31="";
String soglia32="";
String soglia33="";
 
query = "SELECT * FROM soglie_sta";

sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    soglia31 = sqlResult.getString("temp_sta");
    soglia32 = sqlResult.getString("press_sta");
    soglia33 = sqlResult.getString("ene_sta");
    }
    
session.setAttribute("s31", soglia31);
session.setAttribute("s32", soglia32);
session.setAttribute("s33", soglia33);   

sqlResult.close(); sqlStatement.close(); conn.close();

//Parte di controllo delle soglie
int valore = 0;
int soglia = 0;

//Controllo temperatura
try{
valore = Integer.parseInt(temp);
soglia = Integer.parseInt(soglia31);
}
catch(NumberFormatException ex){
	valore = 0;
}
if(valore>soglia){
	session.setAttribute("alrm31", "1");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	sqlStatement = conn.createStatement();
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Stampo', 'Temperatura max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
	sqlResult.close(); sqlStatement.close(); conn.close();
}
else
	session.setAttribute("alrm31", "0");
	
//Controllo pressione
try{
valore = Integer.parseInt(press);
soglia = Integer.parseInt(soglia32);
}
catch(NumberFormatException ex){
	valore = 0;
}
if(valore>soglia){
	session.setAttribute("alrm32", "1");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	sqlStatement = conn.createStatement();
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Stampo', 'Pressione max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
	sqlResult.close(); sqlStatement.close(); conn.close();
}
else
	session.setAttribute("alrm32", "0");	
	
//Controllo potenza
try{
valore = Integer.parseInt(ener);
soglia = Integer.parseInt(soglia33);
}
catch(NumberFormatException ex){
	valore = 0;
}
if(valore>soglia){
	session.setAttribute("alrm33", "1");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	sqlStatement = conn.createStatement();
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Stampo', 'Potenza max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
	sqlResult.close(); sqlStatement.close(); conn.close();
}
else
	session.setAttribute("alrm33", "0");

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
      <td>Temperatura [C]</td>
      <td><%=temp%></td>
      <td><%=soglia31%></td>
    </tr>
    <tr>
      <td>Pressione [Bar]</td>
      <td><%=press%></td>
      <td><%=soglia32%></td>
    </tr>
    <tr>
      <td>Potenza [kW]</td>
      <td><%=ener%></td>
      <td><%=soglia33%></td>
    </tr>
    </tbody>
</table>
</div>


</body>
</html>
