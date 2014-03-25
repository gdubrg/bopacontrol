<%@ page import="model.Prodotto" %>
 <% Prodotto p = (Prodotto) session.getAttribute("prod");%>

<%@ include file="header.jsp" %>
    
<div id="content">
	<h4>Modifica Prodotto</h4>       
       

	<form name="updateform" action="ControllerServlet" >
	<input type="hidden" name="op" value="upProdOK">
	<input type="hidden" name="idProd" value="<%=request.getParameter("idProd")%>">
	<%p.viewOneProd(request.getParameter("idProd")); %>
	
	<table class="table">
			<tr>
				<td>Nome</td> 
				<td><input type="text" name="upName" value="<%=p.getCurrentProdName()%>" maxlength=20></td>
			</tr>
			<tr>
				<td>Descrizione</td>
				<td><input type="text" name="upDesc" value="<%=p.getCurrentProdDesc()%>" maxlength=200></td>
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


