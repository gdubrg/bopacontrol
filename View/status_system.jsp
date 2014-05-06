<html>
	<head>
		<!-- incluse librerie bootstrap e fogli di stile -->
		<%@ include file="lib.jsp" %>
	</head>

	<body>
		<body style="background-color:#DDDDDD">
		
		<%
		response.setIntHeader("Refresh", 3);
		//Controllo che sia presente almeno uno degli allarmi
		if(session.getAttribute("alrm11")=="1" || session.getAttribute("alrm12")=="1" || session.getAttribute("alrm13")=="1" ||
			session.getAttribute("alrm21")=="1" || session.getAttribute("alrm22")=="1" || session.getAttribute("alrm23")=="1"||
			session.getAttribute("alrm31")=="1" || session.getAttribute("alrm32")=="1" || session.getAttribute("alrm33")=="1"){
				out.println("<div class=\"alert alert-danger\">Attenzione! Stato di allarme</div>");
			}
		else //non è presente nessun allarme, stato del sistema ok
			out.println("<div class=\"alert alert-success\">Nessun problema rilevato</div>");
		%>
	</body>

</html>
