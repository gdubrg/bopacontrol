<html>
	<head>
		<%@ include file="lib.jsp" %>
		<title>Conferma Reset</title>
	</head>
	
	<body>
		<%@ include file="header.jsp" %>
		<div id="pnlOnlyCenter">
			<h3>Elimina <b>tutti</b> i valori dei <b>sensori</b> dal database</h3>
			<div style="text-align:center">
				<form action="../Controller/controller.jsp" method="post">
	            <button type="submit" name="cancella_sensori" class="btn btn-primary btn-lg">Elimina</button>  
				</form>
			</div>
	
	    <br/>
	    
			<h3>Elimina <b>tutti</b> i valori degli <b>allarmi</b> dal database</h3>
			<div style="text-align:center">
				<form action="../Controller/controller.jsp" method="post">
	            <button type="submit" name="cancella_allarmi" class="btn btn-primary btn-lg">Elimina</button> 
				</form>
			</div>
	    
	    <br/><br/>
	    
		
			<form action="panel.jsp" method="post">
	            <button type="submit" class="btn btn-primary btn-lg">Torna indietro</button> 
			</form>
	   
			<%
			if(session.getAttribute("cancellazione_ok") == "1")
				out.println("<br/><p style=\"color:green; text-align:center\">Tabella database svuotata correttamente</p>");
				session.setAttribute("cancellazione_ok", "0");
			%>		
	</div>
	</body>
</html>
