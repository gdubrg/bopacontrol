<html>
<title>Impostazioni Macchina Stampa</title>
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
<h1>Impostazioni Macchina Stampa</h1>
</div>

<div id="pnlError">
    <h2>Errore!<br>Le soglie devono essere valori numerici!</h2>
</div>

<div id="pnlOnlyCenter">
    <form ACTION="../Controller/controller.jsp" method="POST">
    <p>Soglia <b>Temperatura</b>: 
    <INPUT TYPE="text" NAME="soglia_temp_sta" STYLE="color: black"/>
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia della temperatura a: <b><%=s31%> </b>K
    </form>
    <br><br>
    <form method="POST">
    <p>Soglia <b>Pressione</b>:&nbsp&nbsp&nbsp&nbsp
    <INPUT TYPE="text" NAME="soglia_press_sta" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia della pressione a: <b><%=s32%> </b>kg
    </form>
    <br><br>
    <form method="POST">
    <p>Soglia <b>Potenza</b>:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <INPUT TYPE="text" NAME="soglia_pot_sta" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia della potenza a: <b><%=s33%> </b>kW
    </form>
    <br><br>
</div>

</body>
</html>
