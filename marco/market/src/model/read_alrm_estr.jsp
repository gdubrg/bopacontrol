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
  
response.setIntHeader("Refresh", 3);

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
