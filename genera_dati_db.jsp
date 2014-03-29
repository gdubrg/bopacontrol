<html>
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>
<head> <title>JDBC test with Connector/J</title>

<%
String temp;
String ener;
String press;
String date="";
%>

<%
response.setIntHeader("Refresh", 3);

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();


String query = "SELECT * FROM estrusione ORDER BY data LIMIT 0,1";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    temp = sqlResult.getString("temperatura");
    ener = sqlResult.getString("pressione");
    press = sqlResult.getString("energia");
    date = sqlResult.getString("data");
    out.println("Temperatura: "+temp+"<br>"+"Pressione: "+press+"<br>"+"Energia: "+ener+"<br>"+date); 
    }
    
    
String canc = "DELETE FROM estrusione WHERE data='" + date + "'";
sqlStatement.executeUpdate(canc);

sqlResult.close(); sqlStatement.close(); conn.close();




%>



</html>
