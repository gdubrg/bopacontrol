<html>
<title>Impostazioni Stampa</title>
<%@ include file="header.jsp" %>
<body>

<%@ include file="getCookie.jsp" %>

<%
    String tmp1 = soglia11;
    String sogliaT = request.getParameter("sogliaTemp");
if(request.getParameter("sogliaTemp") != null){
    Cookie cookieT = new Cookie("sogliaT", sogliaT);
    cookieT.setMaxAge(60*60*24);
    response.addCookie(cookieT);
    tmp1 = sogliaT;
    }

    String tmp2 = soglia12;
    String sogliaP = request.getParameter("sogliaPres");
if(request.getParameter("sogliaPres") != null){
    Cookie cookieP = new Cookie("sogliaP", sogliaP);
    cookieP.setMaxAge(60*60*24);
    response.addCookie(cookieP);
    tmp2 = sogliaP;
    }

    String tmp3 = soglia13;
    String sogliaE = request.getParameter("sogliaEner");
if(request.getParameter("sogliaEner") != null){
    Cookie cookieE = new Cookie("sogliaE", sogliaE);
    cookieE.setMaxAge(60*60*24);
    response.addCookie(cookieE);
    tmp3 = sogliaE;
    }
%>


<div id="pnlTop">
    <h1>Impostazioni Macchina Stampa</h1>
</div>

<div id="pnlOnlyCenter">
    <form method="POST">
    <p>Soglia <b>Temperatura</b>: <INPUT TYPE="text" NAME="sogliaTemp" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia della temperatura a: <b><%=tmp1%></b>
    </form>
    <br><br>
    <form method="POST">
    <p>Soglia <b>Pressione</b>:&nbsp&nbsp&nbsp&nbsp<INPUT TYPE="text" NAME="sogliaPres" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia della pressione a: <b><%=tmp2%></b>
    </form>
    <br><br>
    <form method="POST">
    <p>Soglia <b>Energia</b>:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<INPUT TYPE="text" NAME="sogliaEner" />
    <button type="submit" class="btn btn-primary btn-large"/>Salva</button>
    </p>
    Hai impostato il valore di soglia dell'energia a: <b><%=tmp3%></b>
    </form>
    <br><br>
</div>



<br>


<p>Grafico sensore</p>
</body>
</html>
