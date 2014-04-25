<html>
<%@ include file="header.jsp" %>
<title>Pannello Principale</title>

<body>

<!--Pannello con nome della pagina -->
<div id="pnlTop">
    <h1>Pannello di controllo</h1>
</div>

<!--Pannello con lo stato del sistema -->
<div id="infoSisSx">
	<h2>Sessione corrente:</h2>
	<b>Numero Tessera: </b><%=session.getAttribute("numTessera")%><br>
	<b>Ultimo accesso: </b><%=session.getAttribute("ultimoAcc") %>
    <h2>Stato del sistema:</h2>
    <iframe src="../../View/status_system.jsp" frameborder="0" scrolling="No" height="50" width="320";></iframe>
</div>

<!--Pannello con immagine riassuntiva e box allarmi -->
<div id="infoSisDx">
    <div id="imgTop">       
        <img src="img/ingmoul.gif" class="img-responsive">
    </div>
    <div id="alrm">
        <h2>Allarmi</h2>
        <iframe src="../../Model/read_allarms.jsp" frameborder="0" scrolling="No" height="150" width="320">
        </iframe>
    </div>
</div>

<!--Pannelli lettura dati macchina estrusione e stampa, bottoni dettaglio e impostazioni -->
<div id="cont">
    <div id="pnlRight">
        <h2>Macchina Stampo</h2>
        <iframe src="../../Model/read_data_sta.jsp" frameborder="0" scrolling="No" height="150"></iframe>
        <br><br>
        <%@ include file="buttons_sta.jsp" %>
    </div>
    <div id="pnlCenter">
        <h2>Macchina Estrusione</h2>
        <iframe src="../../Model/read_data_estr.jsp" frameborder="0" scrolling="No" height="150"></iframe>
        <br><br>
        <%@ include file="buttons_estr.jsp" %>
    </div>
</div>

<!--Pannelli lettura dati silos, bottoni dettaglio e impostazioni -->
<div id="pnlLeft">
    <h2>Silos Polimeri</h2>
    <iframe src="../../Model/read_data_sil.jsp" frameborder="0" scrolling="No" height="150"></iframe>
    <br><br>
    <%@ include file="buttons_sil.jsp" %>
</div>

<!-- Footer -->
<div id="pnlDown">
    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
</div>

</body>
</html>








