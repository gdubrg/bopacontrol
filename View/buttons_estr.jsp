<html>
	<head>
		<!--Incluse librerie bootstrap e css -->
		<%@ include file="lib.jsp" %>
	</head>
	
	<body>
		<div id="btnPnl">
			<!--Pulsante di dettaglio dell'estrusore -->
		    <form method="post" action="detail_estr.jsp">
				<button type="submit" class="btn btn-primary btn-large btn-block">Dettaglio</button>
		    </form>
		    
		    <!--Pulsante di impostazione dell'estrusore -->
		    <form method="post" action="settings_estr.jsp">
				<button type="submit" class="btn btn-primary btn-large btn-block">Impostazioni</button>
		    </form>
		    <br>
		</div>

	</body>
</html>
