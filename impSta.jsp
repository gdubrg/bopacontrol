<html>
<title>Impostazioni Stampa</title>
<%@ include file="header.jsp" %>
<body>

<%
String sogliaT = request.getParameter("sogliaTemp");
if(request.getParameter("sogliaTemp") != null){
    Cookie cookieT = new Cookie("sogliaT", sogliaT);
    cookieT.setMaxAge(60*60*24);
    response.addCookie(cookieT);
    }

String sogliaP = request.getParameter("sogliaPres");
Cookie cookieP = new Cookie("sogliaP", sogliaP);
cookieP.setMaxAge(60*60*24);
response.addCookie(cookieP);

String sogliaE = request.getParameter("sogliaEner");
Cookie cookieE = new Cookie("sogliaE", sogliaE);
cookieE.setMaxAge(60*60*24);
response.addCookie(cookieE);
%>

<div id="pnlTop">
    <h1>Impostazioni Macchina Stampa</h1>
</div>

<div id="pnlOnly">
    <form method="POST">
    <p>Soglia <b>Temperatura</b>: <INPUT TYPE="text" NAME="sogliaTemp" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia della temperatura a: <%=sogliaT%>
    </form>
    <br><br>
    <form method="POST">
    <p>Soglia <b>Pressione</b>:&nbsp&nbsp&nbsp&nbsp<INPUT TYPE="text" NAME="sogliaPres" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia della pressione a: <%=sogliaP%>
    </form>
    <br><br>
    <form method="POST">
    <p>Soglia <b>Energia</b>:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<INPUT TYPE="text" NAME="sogliaEner" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia dell'energia a: <%=sogliaE%>
    </form>
    <br><br>
</div>



<br>


<p>Grafico sensore</p>
</body>
</html>
