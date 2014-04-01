<html>
<title>Impostazioni Stampa</title>
<%@ include file="header.jsp" %>
<body>

<div id="pnlTop">
<h1>Impostazioni Macchina Stampa</h1>
</div>

<FORM method="POST">
Soglia Temperatura: <INPUT TYPE="text" NAME="sogliaTemp" />
<INPUT TYPE="submit" VALUE="Salva"/>
</FORM>


<%
String soglia = request.getParameter("sogliaTemp");
Cookie cookie = new Cookie("sogliaT", soglia);
cookie.setMaxAge(60*60*24);
response.addCookie(cookie);
%>
<br>
Hai impostato il valore di soglia a: <%=soglia%>

<p>Grafico sensore</p>
</body>
</html>
