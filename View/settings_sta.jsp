<html>
<title>Impostazioni Stampo</title>
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>
<%@ include file="header.jsp" %>
<body>

<%
String s31 = (String)session.getAttribute("s31");
String s32 = (String)session.getAttribute("s32");
String s33 = (String)session.getAttribute("s33");
 %>

<div id="pnlTop">
<h1>Impostazioni Stampo</h1>
</div>

<div id="pnlOnlyCenter">
	
    <form ACTION="../Controller/controller.jsp" method="POST">
		<p>Soglia <b>Temperatura</b>: 
		<INPUT TYPE="text" NAME="soglia_temp_sta"/>
		<button type="submit" class="btn btn-primary btn-large"/>Salva</button>
		</p>
		Hai impostato il valore di soglia della temperatura a: <b><%=s31%> </b>C
    </form>
    
    <br><br>
    
    <form ACTION="../Controller/controller.jsp" method="POST">
		<p>Soglia <b>Pressione</b>:&nbsp&nbsp&nbsp&nbsp
		<INPUT TYPE="text" NAME="soglia_press_sta" />
		<button type="submit" class="btn btn-primary btn-large"/>Salva</button>
		</p>
		Hai impostato il valore di soglia della pressione a: <b><%=s32%> </b>bar
		</form>
		
    <br><br>
    
		<form ACTION="../Controller/controller.jsp" method="POST">
		<p>Soglia <b>Potenza</b>:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<INPUT TYPE="text" NAME="soglia_pot_sta" />
		<button type="submit" class="btn btn-primary btn-large"/>Salva</button>
		</p>
		Hai impostato il valore di soglia della potenza a: <b><%=s33%> </b>kW
		</form>
		
    <br><br>
</div>
<div id="pnlDown">
    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
</div>
</body>
</html>
