<html>
	<head>
		<title>Impostazioni Macchina Estrusione</title>
		<%@ include file="lib.jsp" %>
		<%@page language="java"%>
		<%@ page import="java.sql.DriverManager" %> 
		<%@ page import="java.sql.Statement" %> 
		<%@ page import="java.sql.ResultSet" %> 
		<%@ page import="java.sql.Date" %>
		<%@ include file="header.jsp" %>
	</head>
	
	<body>
	
		<%
		String s21 = (String)session.getAttribute("s21");
		String s22 = (String)session.getAttribute("s22");
		String s23 = (String)session.getAttribute("s23");
		 %>
		
		<div id="pnlTop">
		<h1>Impostazioni Macchina Estrusione</h1>
		</div>
		
		<div id="pnlOnlyCenter">
			
		    <form ACTION="../Controller/controller.jsp" method="POST">
			    <p>Soglia <b>Temperatura</b>: 
			    <INPUT TYPE="text" NAME="soglia_temp_estr"/>
			    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
			    </p>
			    Hai impostato il valore di soglia della temperatura a: <b><%=s21%> </b>C
		    </form>
		    
		    <br><br>
		    
		    <form ACTION="../Controller/controller.jsp" method="POST">
			    <p>Soglia <b>Pressione</b>:&nbsp&nbsp&nbsp&nbsp
			    <INPUT TYPE="text" NAME="soglia_press_estr" />
			    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
			    </p>
			    Hai impostato il valore di soglia della pressione a: <b><%=s22%> </b>bar
		    </form>
		    
		    <br><br>
		    
		    <form ACTION="../Controller/controller.jsp" method="POST">
			    <p>Soglia <b>Potenza</b>:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			    <INPUT TYPE="text" NAME="soglia_pot_estr" />
			    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
			    </p>
			    Hai impostato il valore di soglia della potenza a: <b><%=s23%> </b>kW
		    </form>
		    
		    <br><br>
		    
		</div>
		
		<div id="pnlDown">
		    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
		</div>
	</body>
</html>
