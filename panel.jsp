<html>
<%@ include file="header.jsp" %>
<title>Pannello Principale</title>

<body>

<div id="pnlTop">
    <h1>Pannello di controllo</h1>
</div>

<div id="infoSisSx">
    <h2>Stato del sistema: <b>OK</b></h2>
    <button type="button" class="btn btn-primary btn-lg btn-success">START</button>
    &nbsp;&nbsp;&nbsp;
    <button type="button" class="btn btn-primary btn-lg btn-danger">STOP</button>
</div>

<div id="infoSisDx">
    <div id="imgTop">       
        <img src="img/ingmoul.gif" class="img-responsive">
    </div>
    <div id="alrm">
        <h2><b>Allarmi</b></h2>
    </div>
</div>

<div id="cont">
    <div id="pnlRight">
        <h2>Macchina Stampo</h2>
        <iframe src="genera_dati_stampa.jsp" frameborder="0" scrolling="No" height="150">
        </iframe>
        <br><br>
        <%@ include file="threeBtnSta.jsp" %>
    </div>
    <div id="pnlCenter">
        <h2>Macchina Estrusione</h2>
        <iframe src="genera_dati_estrusione.jsp" frameborder="0" scrolling="No" height="150">
        </iframe>
        <br><br>
        <%@ include file="threeBtnEstr.jsp" %>
    </div>
</div>

<div id="pnlLeft">
    <h2>Silos Polimeri</h2>
    <iframe src="genera_dati_silos.jsp" frameborder="0" scrolling="No" height="150">
    </iframe>
    <br><br>
    <%@ include file="threeBtnSil.jsp" %>
</div>

<div id="pnlDown">
    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
</div>

</html>








