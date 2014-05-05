<html>
	<head>
		<!--Incluse librerie bootstrap e css -->
		<%@ include file="lib.jsp" %>
	</head>
	
	<body>
		<!--Pulsanti di dettaglio e impostazioni dell'estrusore -->	
		<div id="btnPnl">
		    <form method="post" action="detail_estr.jsp">
		    <button type="submit" class="btn btn-primary btn-large btn-block">Dettaglio</button>
		    </form>
		    
		    <form method="post" action="settings_estr.jsp">
		    <button type="submit" class="btn btn-primary btn-large btn-block">Impostazioni</button>
		    </form>
		    <br>
		</div>

	</body>
</html>
