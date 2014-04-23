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

//Parte di controllo delle soglie
int valore = 0;
int soglia = 0;

//Controllo temperatura
valore = Integer.parseInt(temp);
soglia = Integer.parseInt(soglia11);
if(valore>soglia){
	session.setAttribute("alrm11", "1");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	sqlStatement = conn.createStatement();
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Silos', 'Temperatura max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
	sqlResult.close(); sqlStatement.close(); conn.close();
}
else
	session.setAttribute("alrm11", "0");
	
//Controllo carico
valore = Integer.parseInt(car);
soglia = Integer.parseInt(soglia12);
if(valore>soglia){
	session.setAttribute("alrm12", "1");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	sqlStatement = conn.createStatement();
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Silos', 'Carico max raggiunto', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
	sqlResult.close(); sqlStatement.close(); conn.close();
}
else
	session.setAttribute("alrm12", "0");	
	
//Controllo potenza
valore = Integer.parseInt(ener);
soglia = Integer.parseInt(soglia13);
if(valore>soglia){
	session.setAttribute("alrm13", "1");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	sqlStatement = conn.createStatement();
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Silos', 'Potenza max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
	sqlResult.close(); sqlStatement.close(); conn.close();
}
else
	session.setAttribute("alrm13", "0");
	


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
