<%@ page language = "java" %>

// import per DB
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>

<%

// QUERY
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();
	
// Inserire qui la tabella del db giusta a seconda della macchina
String query = "DELETE * FROM allarmi";

ResultSet sqlResult = sqlStatement.executeQuery(query);

session.setAttribute("cancellazione_ok", "1");

// Torna alla pagina di
response.sendRedirect("../View/delete_db.jsp");
%>
