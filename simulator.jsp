<html>
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>
<head> 

<title>Simulatore</title>

<%
String ins;

// Frequenza di inserimento nuovi valori nel db
response.setIntHeader("Refresh", 3);

// Apertura connessione col database
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

// Inseriti nuovi valori per simulare i sensori presenti nel silos
ins = "INSERT INTO silos (temperatura, carico, energia, data) VALUES (FLOOR(30+RAND()*10), FLOOR(500+RAND()*10), FLOOR(2+RAND()*10), CURRENT_TIMESTAMP)";
sqlStatement.executeUpdate(ins);

// Inseriti nuovi valori per simulare i sensori presenti nell'estrusore
ins = "INSERT INTO estrusione (temperatura, pressione, energia, data) VALUES (FLOOR(273+RAND()*100), FLOOR(1000+RAND()*200), FLOOR(1+RAND()*15), CURRENT_TIMESTAMP)";
sqlStatement.executeUpdate(ins);

// Inseriti nuovi valori per simulare i sensori presenti nello stampo
ins = "INSERT INTO stampo (temperatura, pressione, energia, data) VALUES (FLOOR(150+RAND()*10), FLOOR(300+RAND()*10), FLOOR(5+RAND()*10), CURRENT_TIMESTAMP)";
sqlStatement.executeUpdate(ins);

// Chiusura connessione col database
sqlStatement.close();
conn.close();

%>

</html>
