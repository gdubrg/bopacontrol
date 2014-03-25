<%@ page import="model.Prodotto" %>
 <% Prodotto p = (Prodotto) session.getAttribute("prod");%>

<%@ include file="header.jsp" %>
 
<%String errud =session.getAttribute("errud").toString();%>
<%String errun =session.getAttribute("errun").toString();%>
<%String upName =session.getAttribute("upName").toString();%>
<%String upDesc =session.getAttribute("upDesc").toString();%>
 
 <div id="content">
	<h4>Modifica Prodotto</h4>  
       
	<form name="updateform" action="ControllerServlet" >
	<input type="hidden" name="op" value="upProdOK">
	<input type="hidden" name="idProd" value="<%=request.getParameter("idProd")%>">
	
	<table class="table">
			<tr>
				<td>Nome</td> 
				<td><input type="text" name="upName" value='<%=upName%>' maxlength=20></td>
				<td><font size=1 color=red><%=errun%></font></td>
			</tr>
			<tr>
				<td>Descrizione</td>
				<td><input type="text" name="upDesc" value='<%=upDesc%>' maxlength=200></td>
				<td><font size=1 color=red><%=errud%></font></td>
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


