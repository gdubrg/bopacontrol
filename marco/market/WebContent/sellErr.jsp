<%@ page import="model.Prodotto" %> 
<% Prodotto p = (Prodotto) session.getAttribute("prod");%>

<%@ include file="header.jsp" %>

 <% String sellpb = session.getAttribute("sellpb").toString(); %>
 <% String timedefault = session.getAttribute("timedefault").toString(); %>
 <% String datedefault = session.getAttribute("datedefault").toString(); %>    
 <% String datemax = session.getAttribute("datemax").toString(); %> 
 <%p.viewOneProd(request.getParameter("idProd")); %>
 <%String errd =session.getAttribute("errd").toString();%>
 <%String errs =session.getAttribute("errs").toString();%>
 <%String errspb =session.getAttribute("errspb").toString();%>
 
 <div id="content">
	<h4>Vendita prodotto</h4>      
	<form name="sellform" method=post action="ControllerServlet" >
	<input type="hidden" name="op" value="sellOK">
	<input type="hidden" name="idProd" value="<%=request.getParameter("idProd")%>">

	<table class="table">
			<tr>
				<td>Prodotto</td> 
				<td><%=p.getCurrentProdName()%></td>
			</tr>
			<tr>
				<td>Descrizione</td>
				<td><%=p.getCurrentProdDesc()%></td>
			</tr>
			<tr>
				<td>Prezzo Base</td> 
				<td><input type="number" name="sellpb" value='<%=sellpb%>' min="0" max="65535">euro</td>
				<td><font size=1 color=red><%=errspb%></font></td>
			</tr>
			<tr>
				<td>Data Scadenza</td>			<%--yyyy-mm-dd hh:mm:ss--%>
				<td><input type="date" name="data" min='<%=datedefault%>' max='<%=datemax%>' value='<%=datedefault%>'>
				<input type="time" name="ora" step="1" value='<%=timedefault%>' ></td>
				<td><font size=1 color=red><%=errd%></font></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Ok"></td>
			</tr>
		</table>
	</form>
	<h4>Choose a day between  <%=datedefault%> and <%=datemax%></h4>
	<font size=1 color=red><%=errs%></font>
</body>
</html>


