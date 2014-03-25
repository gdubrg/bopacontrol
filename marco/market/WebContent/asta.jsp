<%@ page import="model.Asta" %>
<%@ page import="model.Offerta" %>
<%@ page import="model.Prodotto" %>

<%
Prodotto p = (Prodotto) session.getAttribute("prod");
Offerta o = (Offerta) session.getAttribute("offer"); 
Asta a = (Asta) session.getAttribute("ast");
int numa = a.countAsta();
%>

<%@ include file="header.jsp" %>
       
<div id="content">

<% if (numa<=0){%>
Non ci sono aste aperte. 
<%return;}else{ %>
<table width="100%" class="table-data">
	<tr bgcolor="#FFFFFF" class="thead">
    	<td colspan="7">TUTTE LE ASTE APERTE</td>
    </tr>
	<tr bgcolor="#FFFFFF" class="thead">
        	<td>Prodotto</td>
        	<td>Descrizione</td>
        	<td>Scadenza</td>
        	<td>Prezzo Base</td>
        	<td>Ultima Offerta</td>
        	<td>Ultimo Offerente</td>
       	    <td>&nbsp;</td>
    </tr>
	<% for(int i=0;i<numa;i++){ %>
	<tr class="tbody">
	        <%
	        String idAsta = a.getAstaId(i);
	        o.viewOfferta(idAsta);
	     	p.viewOneProd(a.getProdId(i));
	     	Integer lastoffert = o.getOfferta(i);
	     	Integer prezzobase = a.getAstaPrezzo(i);
	     	Integer startamount = 0;
	     	if (prezzobase > lastoffert)
	     		startamount = prezzobase;
	     	else
	     		startamount = lastoffert+1;
	     	Integer minoffert = startamount;
	     	%>
	        <td><%= p.getProdName(i)%></td>
	        <td><%= p.getProdDesc(i)%></td>
	        <td><%= a.getAstaScad(i)%></td>
	        <td><%= prezzobase%> euro</td>
	        <td><%= lastoffert%> euro</td>
	        <td><%= o.getOfferente(i)%></td>
	        <td>
	        	<form name="offertform" method=post action="ControllerServlet" >
				<input type="hidden" name="op" value="off">
				<input type="hidden" name="idAsta" value="<%=idAsta%>">
		        <input type="number" name="offerta" size="2" min="<%=minoffert%>" max="65535" value="<%=minoffert%>"> euro
		        <input type="submit" value="Offri">
				</form>
	     	</td>
	 </tr>
	<%}%>
</table>
<%}%>

</div>

</body>
</html>