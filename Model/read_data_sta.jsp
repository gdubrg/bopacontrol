<html>
	<head> 
	<%@page language="java"%>
	<%@ page import="java.sql.DriverManager" %> 
	<%@ page import="java.sql.Statement" %> 
	<%@ page import="java.sql.ResultSet" %> 
	<%@ page import="java.sql.Date" %>
	<!-- Fogli di stile -->
	<link rel="stylesheet" href="../View/bootstrap/css/bootstrap.css">
	<link href="../View/bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="../View/style.css">
	<title>JDBC test with Connector/J</title>
	</head>
	
	<%
	String temp="";
	String ener="";
	String press="";
	String date="";
	
	response.setIntHeader("Refresh", 3);
	
	//creazione connessione db
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;
	
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	
	String query = "SELECT * FROM stampo ORDER BY data DESC LIMIT 0,1";
	
	//lettura valori sensori
	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
	    temp = sqlResult.getString("temperatura");
	    ener = sqlResult.getString("energia");
	    press = sqlResult.getString("pressione");
	    date = sqlResult.getString("data");
	    }
	
	String soglia31="";
	String soglia32="";
	String soglia33="";
	 
	query = "SELECT * FROM soglie_sta";
	
	//lettura valori soglie
	sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
	    soglia31 = sqlResult.getString("temp_sta");
	    soglia32 = sqlResult.getString("press_sta");
	    soglia33 = sqlResult.getString("ene_sta");
	    }
	    
	session.setAttribute("s31", soglia31);
	session.setAttribute("s32", soglia32);
	session.setAttribute("s33", soglia33);   
	
	sqlResult.close(); sqlStatement.close(); conn.close();
	%>
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
		      <td><%=soglia31%></td>
		    </tr>
		    <tr>
		      <td>Pressione [Bar]</td>
		      <td><%=press%></td>
		      <td><%=soglia32%></td>
		    </tr>
		    <tr>
		      <td>Potenza [kW]</td>
		      <td><%=ener%></td>
		      <td><%=soglia33%></td>
		    </tr>
		    </tbody>
		</table>
		</div>	
	</body>
</html>
