<%@ page import="model.Prodotto" %>
<% Prodotto p = (Prodotto) session.getAttribute("prod");%>

<%@ include file="header.jsp" %>

<%String errn =session.getAttribute("errn").toString();%>
<%String errd =session.getAttribute("errd").toString();%>
<%String errp =session.getAttribute("errp").toString();%>
<%String insName =session.getAttribute("insName").toString();%>
<%String insDesc =session.getAttribute("insDesc").toString();%>

<div id="content">
	<h4>Inserimento Prodotto</h4>       
	<form name="inserterform" method=post action="ControllerServlet" >
	<input type="hidden" name="op" value="insOK">

	<table class="table">
			<tr>
				<td>Nome</td> 
				<td><input type="text" name="insName" value='<%=insName%>' maxlength=20></td>
				<td><font size=1 color=red><%=errn%></font></td>
			</tr>
			<tr>
				<td>Descrizione</td>
				<td><input type="text" name="insDesc" value='<%=insDesc%>' maxlength=30></td>
				<td><font size=1 color=red><%=errd%></font></td>
			</tr>
			<tr>
				<td><font size=1 color=red><%=errp%></font></td>
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


