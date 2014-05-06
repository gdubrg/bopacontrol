<html>
	<head>
		<%@ include file="lib.jsp" %>
		<%@page language="java"%>
		<%@ page import="java.io.*" %>
		<%@ page import="java.util.*" %>
		<%@ page import="java.sql.DriverManager" %> 
		<%@ page import="java.sql.Statement" %> 
		<%@ page import="java.sql.ResultSet" %> 
		<%@ page import="java.sql.Date" %>
	</head>

	<body>
		<%
		//Estrazione dal DB del LOG degli allarmi
		
		// Dichiarazione variabili
		ArrayList<String> mac = new ArrayList<String>();
		ArrayList<String> descr = new ArrayList<String>();
		ArrayList<String> date = new ArrayList<String>();
		
		// Imposta frequenza aggiornamento della pagina
		response.setIntHeader("Refresh", 3);
		
		// Apertura connessione col db
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		java.sql.Connection conn;
		
		conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
		Statement sqlStatement = conn.createStatement();
		
		// Select degli ultimi 50 allarmi
		String query = "SELECT * FROM allarmi ORDER BY data DESC LIMIT 0,50";
		
		ResultSet sqlResult = sqlStatement.executeQuery(query);
		while(sqlResult.next()) {
		    mac.add(sqlResult.getString("macchina"));
		    descr.add(sqlResult.getString("descr"));
		    date.add(sqlResult.getString("data"));
		    }
		
		// Chiusura connessione col db
		sqlResult.close(); sqlStatement.close(); conn.close();
		%>
	
		<!-- Inizio tabella log allarmi -->
		<table class="table">
		  <thead>
		    <tr>
		      <th>Macchina</th>
		      <th>Descrizione</th>
		      <th>Data</th>
		    </tr>
		  </thead>
		  
		<%
			// La tabella degli allarmi è riempita con i risultati della query
			for(int i=0;i<mac.size();i++){
				out.println("<tbody><tr><td>"+mac.get(i)+"</td><td>"+descr.get(i)+"</td><td>"+date.get(i)+"</td></tr>");
			}
		%>
		<!-- fine tabella log allarmi -->
		</tbody>
	</table>
</body>
</html>
