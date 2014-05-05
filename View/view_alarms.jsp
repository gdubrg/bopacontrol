<html>
	<head>
		<title>Log Allarmi</title>
		<%@ include file="lib.jsp" %>
	</head>

	<body>
		<!-- Barra di navigazione -->
		<%@ include file="header.jsp" %>
		
		<!-- Elenco allarmi -->
		<iframe src="alarms.jsp" frameborder="0" height="600" width="1215"></iframe>
		
		<!-- controllo nuovi allarmi -->
		<iframe src="../Model/check_alarms.jsp" frameborder="0" height="0" width="0"></iframe>
	</body>

</html>
