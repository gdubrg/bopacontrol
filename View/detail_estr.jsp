<html>
<title>Dettaglio Estrusore</title>
<%@ include file="header.jsp" %>
<body>

<!--Pannello con nome della pagina -->
<div id="pnlTop">
<h2>Dettaglio Macchina Estrusione</h2>
</div>

<!--Tab con i 3 grafici dell'estrusione -->
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
		<iframe src="charts/estrusore/estr_temp_trend.jsp" frameborder="0" scrolling="No" height="350px" width="750px"></iframe>
    </div>
    <div id="graRight">
		<iframe src="charts/estrusore/estr_temp_current.jsp" frameborder="0" scrolling="No" height="350px" width="350px"></iframe>
    </div>
</div>
<div id="pnlSlim">
	<div id="btnOne">
		<form method="post" action="history_estr.jsp">
		<button type="submit" class="btn btn-primary btn-large btn-block">Storico</button>
		</form>
    </div>
</div>
</div>
<div class="tab-pane" id="tab-2">
 <h3>Pressione</h3>
<div id="pnlOnly">
    <div id="graLeft">
		<iframe src="charts/estrusore/estr_pressure_trend.jsp" frameborder="0" scrolling="No" height="350px" width="750px"></iframe>
    </div>
    <div id="graRight">
		<iframe src="charts/estrusore/estr_pressure_current.jsp" frameborder="0" scrolling="No" height="350px" width="350px"></iframe>
    </div>
</div>
<div id="pnlSlim">
	<div id="btnOne">
		<form method="post" action="history_estr.jsp">
		<button type="submit" class="btn btn-primary btn-large btn-block">Storico</button>
		</form>
    </div>
</div>
</div>
<div class="tab-pane" id="tab-3">
 <h3>Potenza</h3>
<div id="pnlOnly">
    <div id="graLeft">
		<iframe src="charts/estrusore/estr_energy_trend.jsp" frameborder="0" scrolling="No" height="350px" width="750px"></iframe>
    </div>
    <div id="graRight">
		<iframe src="charts/estrusore/estr_energy_current.jsp" frameborder="0" scrolling="No" height="350px" width="350px"></iframe>
    </div>
</div>
<div id="pnlSlim">
	<div id="btnOne">
		<form method="post" action="history_estr.jsp">
		<button type="submit" class="btn btn-primary btn-large btn-block">Storico</button>
		</form>
    </div>
</div>
</div>
</div>

<iframe src="../Model/check_alarms.jsp" frameborder="0" height="0" width="0"></iframe>

<!--Footer -->
<div id="pnlDown">
    <h5>BoPa Controller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
</div>


</body>
</html>
