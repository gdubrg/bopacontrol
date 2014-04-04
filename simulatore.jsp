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


response.setIntHeader("Refresh", 3);


Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

ins = "INSERT INTO silos (temperatura, pressione, energia, data) VALUES (FLOOR(30+RAND()*(10-1)), FLOOR(500+RAND()*(10-1)), FLOOR(50+RAND()*(10-1)), CURRENT_TIMESTAMP)";
sqlStatement.executeUpdate(ins);

ins = "INSERT INTO estrusione (temperatura, pressione, energia, data) VALUES (FLOOR(273+RAND()*(10-1)), FLOOR(1200+RAND()*(10-1)), FLOOR(35+RAND()*(10-1)), CURRENT_TIMESTAMP)";
sqlStatement.executeUpdate(ins);

ins = "INSERT INTO stampo (temperatura, pressione, energia, data) VALUES (FLOOR(150+RAND()*(10-1)), FLOOR(800+RAND()*(5-3)), FLOOR(20+RAND()*(10-1)), CURRENT_TIMESTAMP)";
sqlStatement.executeUpdate(ins);


 sqlStatement.close(); conn.close();

%>

</html>
