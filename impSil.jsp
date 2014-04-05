<html>
<title>Impostazioni Silos</title>
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>
<%@ include file="header.jsp" %>
<body>

<%
String s11 = (String)session.getAttribute("s11");
String s12 = (String)session.getAttribute("s12");
String s13 = (String)session.getAttribute("s13");
String query = "";
String sT = "";
String sC = "";
String sE = "";

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

sT = request.getParameter("sogliaTemp");
if( sT != null){
    query = "UPDATE soglie_silos SET temp_sil='"+sT+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s11", sT);
    s11 = (String)session.getAttribute("s11");
    }
    
    sC = request.getParameter("sogliaCar");
if( sC != null){
    query = "UPDATE soglie_silos SET car_sil='"+sC+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s12", sC);
    s12 = (String)session.getAttribute("s12");
    }
    
    sE = request.getParameter("sogliaEner");
if( sE != null){
    query = "UPDATE soglie_silos SET ene_sil='"+sE+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s13", sE);
    s13 = (String)session.getAttribute("s13");
    }
 %>

<div id="pnlTop">
<h1>Impostazioni Silos Polimeri</h1>
</div>

<div id="pnlOnlyCenter">
    <form method="POST">
    <p>Soglia <b>Temperatura</b>: <INPUT TYPE="text" NAME="sogliaTemp" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia della temperatura a: <b><%=s11%> </b>K
    </form>
    <br><br>
    <form method="POST">
    <p>Soglia <b>Pressione</b>:&nbsp&nbsp&nbsp&nbsp<INPUT TYPE="text" NAME="sogliaCar" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia del carico a: <b><%=s12%> </b>kg
    </form>
    <br><br>
    <form method="POST">
    <p>Soglia <b>Potenza</b>:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<INPUT TYPE="text" NAME="sogliaEner" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia dell'energia a: <b><%=s13%> </b>kW
    </form>
    <br><br>
</div>

</body>
</html>
