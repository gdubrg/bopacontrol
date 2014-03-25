<%@ page import="model.Prodotto" %>
<% Prodotto p = (Prodotto) session.getAttribute("prod");%>

<%@ include file="header.jsp" %>
<div id="content">
	<h4>Inserimento Prodotto</h4>       
	<form name="inserterform" method=post action="ControllerServlet" >
	<input type="hidden" name="op" value="insOK">

	<table class="table">
			<tr>
				<td>Nome</td> 
				<td><input type="text" name="insName" value="" maxlength=20></td>
			</tr>
			<tr>
				<td>Descrizione</td>
				<td><input type="text" name="insDesc" value="" maxlength=30></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Ok"></td>
			</tr>
		</table>
	</form>
	
</div>	
</body>
</html>


