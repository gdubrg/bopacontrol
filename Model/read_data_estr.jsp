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

String query = "SELECT * FROM estrusione ORDER BY data DESC LIMIT 0,1";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    temp = sqlResult.getString("temperatura");
    ener = sqlResult.getString("energia");
    press = sqlResult.getString("pressione");
    date = sqlResult.getString("data");
    }
    
String soglia21="";
String soglia22="";
String soglia23="";
 
query = "SELECT * FROM soglie_estr";

sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    soglia21 = sqlResult.getString("temp_estr");
    soglia22 = sqlResult.getString("press_estr");
    soglia23 = sqlResult.getString("ene_estr");
    }
    
session.setAttribute("s21", soglia21);
session.setAttribute("s22", soglia22);
session.setAttribute("s23", soglia23);

sqlResult.close(); sqlStatement.close(); conn.close();

//Parte di controllo delle soglie
int valore = 0;
int soglia = 0;

//Controllo temperatura
valore = Integer.parseInt(temp);
soglia = Integer.parseInt(soglia21);
if(valore>soglia){
	session.setAttribute("alrm21", "1");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	sqlStatement = conn.createStatement();
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Estr', 'Temp max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
	sqlResult.close(); sqlStatement.close(); conn.close();
}
else
	session.setAttribute("alrm21", "0");
	
//Controllo pressione
valore = Integer.parseInt(press);
soglia = Integer.parseInt(soglia22);
if(valore>soglia){
	session.setAttribute("alrm22", "1");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	sqlStatement = conn.createStatement();
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Estr', 'Pressione max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
	sqlResult.close(); sqlStatement.close(); conn.close();
}
else
	session.setAttribute("alrm22", "0");	
	
//Controllo potenza
valore = Integer.parseInt(ener);
soglia = Integer.parseInt(soglia23);
if(valore>soglia){
	session.setAttribute("alrm23", "1");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	sqlStatement = conn.createStatement();
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Estr', 'Pot max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
	sqlResult.close(); sqlStatement.close(); conn.close();
}
else
	session.setAttribute("alrm23", "0");
	
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
      <td><%=soglia21%></td>
    </tr>
    <tr>
      <td>Pressione [Bar]</td>
      <td><%=press%></td>
      <td><%=soglia22%></td>
    </tr>
    <tr>
      <td>Potenza [KW]</td>
      <td><%=ener%></td>
      <td><%=soglia23%></td>
    </tr>
    </tbody>
</table>
</div>


</body>
</html>
