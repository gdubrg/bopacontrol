<html>
<%@ include file="header.jsp" %>
<title>Pannello Principale</title>

<body>

<div id="pnlTop">
    <h1>Pannello di controllo</h1>
</div>

<div id="infoSisSx">
    <h2>Stato del sistema: <b>OK</b></h2>
    <form method="post">
    <button type="submit" class="btn btn-primary btn-lg btn-success" onclick="window.open('', 'Start', 'width=400, height=200, left=screen.width/2, resizable=no, status, scrollbars=1, location=no');">START</button>
    </form>
    <form method="post">
    <button type="button" class="btn btn-primary btn-lg btn-danger" onclick="window.open('', 'Stop', 'width=400, height=200, resizable=no, status, scrollbars=1, location');">STOP</button>
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
        <iframe src="../../Model/read_data_sta.jsp" frameborder="0" scrolling="No" height="150">
        </iframe>
        <br><br>
        <%@ include file="buttons_sta.jsp" %>
    </div>
    <div id="pnlCenter">
        <h2>Macchina Estrusione</h2>
        <iframe src="../../Model/read_data_estr.jsp" frameborder="0" scrolling="No" height="150">
        </iframe>
        <br><br>
        <%@ include file="buttons_estr.jsp" %>
    </div>
</div>

<div id="pnlLeft">
    <h2>Silos Polimeri</h2>
    <iframe src="../../Model/read_data_sil.jsp" frameborder="0" scrolling="No" height="150">
    </iframe>
    <br><br>
    <%@ include file="buttons_sil.jsp" %>
</div>

<div id="pnlDown">
    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
</div>

</html>







