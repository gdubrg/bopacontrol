<html>
<title>Dettaglio Stampo</title>
<%@ include file="header.jsp" %>
<body>
	
<!--Pannello con nome della pagina -->
<div id="pnlTop">
<h2>Dettaglio Stampo</h2>
</div>

<!--Tab con i 3 grafici della macchina di stampa -->
<ul class="nav nav-tabs">
	<li class="active"><a href="#tab-1" data-toggle="tab">Temperatura</a></li>
	<li><a href="#tab-2" data-toggle="tab">Pressione</a></li>
	<li><a href="#tab-3" data-toggle="tab">Potenza</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab-1">
	<h3>Temperatura</h3>
<div id="pnlOnly">
    <div id="graLeft">
		<iframe src="charts/stampo/sta_temp_trend.jsp" frameborder="0" scrolling="No" height="350px" width="750px"></iframe>
    </div>
    <div id="graRight">
		<iframe src="charts/stampo/sta_temp_current.jsp" frameborder="0" scrolling="No" height="350px" width="350px"></iframe>
    </div>
</div>
<div id="pnlSlim">
	<div id="btnOne">
		<form method="post" action="history_sta.jsp">
		<button type="submit" class="btn btn-primary btn-large btn-block">Storico</button>
		</form>
    </div>
</div>
</div>
<div class="tab-pane" id="tab-2">
	<h3>Pressione</h3>
<div id="pnlOnly">
    <div id="graLeft">
		<iframe src="charts/stampo/sta_pressure_trend.jsp" frameborder="0" scrolling="No" height="350px" width="750px"></iframe>
    </div>
    <div id="graRight">
		<iframe src="charts/stampo/sta_pressure_current.jsp" frameborder="0" scrolling="No" height="350px" width="350px"></iframe>
    </div>
</div>
<div id="pnlSlim">
	<div id="btnOne">
		<form method="post" action="history_sta.jsp">
		<button type="submit" class="btn btn-primary btn-large btn-block">Storico</button>
		</form>
    </div>
</div>
</div>
<div class="tab-pane" id="tab-3">
	<h3>Potenza</h3>
<div id="pnlOnly">
    <div id="graLeft">
		<iframe src="charts/stampo/sta_energy_trend.jsp" frameborder="0" scrolling="No" height="350px" width="750px"></iframe>
    </div>
    <div id="graRight">
		<iframe src="charts/stampo/sta_energy_current.jsp" frameborder="0" scrolling="No" height="350px" width="350px"></iframe>
    </div>
</div>
<div id="pnlSlim">
	<div id="btnOne">
		<form method="post" action="history_sta.jsp">
		<button type="submit" class="btn btn-primary btn-large btn-block">Storico</button>
		</form>
    </div>
</div>
</div>
</div>

<!-- Footer -->
<div id="pnlDown">
    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
</div>

</body>
</html>
