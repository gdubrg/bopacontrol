<%@page language="java"%>

<%@ include file ="header.jsp" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>
	
<%	
// Query al DB
ArrayList<String> days = new ArrayList<String>();

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

String query = "SELECT DISTINCT(DATE(data)) FROM estrusione";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
	days.add(sqlResult.getString(1));
}

%>
<html>
<div class="dropdown">
 <!-- Link o pulsante per l'attivazione del dropdown -->
 <a data-toggle="dropdown" href="#" class="btn btn-primary">Data di partenza</a>
 <!-- Menu dropdown -->
 <ul class="dropdown-menu">
	<%
	// Compila la lista con le date possibili
	for(int i=0; i<days.size(); ++i)
		out.print("<li><a href=\"#\">"+days.get(i)+"</a></li>");
	%>
 </ul>
</div>

<iframe src="../prove_jsp/storico2.jsp" frameborder="0" scrolling="No" height="610px" width="1290px"></iframe>

<!--Footer -->
<div id="pnlDown">
    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
</div>
</html>
