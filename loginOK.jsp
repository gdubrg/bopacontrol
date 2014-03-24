<%@ page import="java.sql.DriverManager" %> <%@ page import="java.sql.Statement" %> <%@ page import="java.sql.ResultSet" %> <html> <head> <title>JDBC test with Connector/J</title> </head> <body>

<%
String unita;
String val1;
String val2;
%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

String query = "SELECT * FROM sensoreA";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
unita = sqlResult.getString("unita");
val1 = sqlResult.getString("valore1");
val2 = sqlResult.getString("valore2");
out.println("<b>" + unita + "</b>" + "     " + val1 +"    " + val2 + "<hr>" + "<br />"); 
}

sqlResult.close(); sqlStatement.close(); conn.close(); %> </body> </html> 



