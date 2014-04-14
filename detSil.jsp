<html>
<title>Dettaglio Silos Polimeri</title>
<%@ include file="header.jsp" %>
<body>

<div id="pnlTop">
<h2>Dettaglio Silos Polimeri</h2>
</div>

<ul class="nav nav-tabs">
  <li class="active"><a href="#tab-1" data-toggle="tab">Temperatura</a></li>
  <li><a href="#tab-2" data-toggle="tab">Carico</a></li>
  <li><a href="#tab-3" data-toggle="tab">Potenza</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="tab-1">
 <h3>Temperatura</h3>
<div id="pnlOnly">
    <div id="graLeft">
		<iframe src="grafici/silos/silos_temp_trend.jsp" frameborder="0" scrolling="No" height="350px" width="750px">
		</iframe>
    </div>
    <div id="graRight">
		<iframe src="grafici/silos/silos_temp_corrente.jsp" frameborder="0" scrolling="No" height="350px" width="350px">
		</iframe>
    </div>
</div>
</div>
<div class="tab-pane" id="tab-2">
 <h3>Carico</h3>
<div id="pnlOnly">
    <div id="graLeft">
    metti qui il grafico che poi si sistema
    </div>
    <div id="graRight">
    metti qui il grafico che poi si sistema
    </div>
</div>
</div>
<div class="tab-pane" id="tab-3">
 <h3>Potenza</h3>
<div id="pnlOnly">
    <div id="graLeft">
    metti qui il grafico che poi si sistema
    </div>
    <div id="graRight">
    metti qui il grafico che poi si sistema
    </div>
</div>
</div>
</div>








</body>
</html>
