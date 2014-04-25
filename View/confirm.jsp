<%@ include file="header.jsp" %>
<body>
<div id="pnlOnlyCenter">
	<h3>Seleziona <b>continua</b> per uscire dal programma</h3>
	
	<form action="../Controller/controller.jsp" method="post">
            <button type="submit" name="uscita" class="btn btn-primary btn-lg">Continua</button>  
    </form>

    <br/>
    
   <h3>Seleziona <b>indietro</b> per tornare alla pannello</h3>
    <form action="panel.jsp" method="post">
            <button type="submit" class="btn btn-primary btn-lg">&nbsp;Indietro&nbsp;&nbsp;</button> 
    </form>
   
</div>
</body>
</html>
