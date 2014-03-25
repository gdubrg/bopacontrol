<%@ page import="model.Asta" %>
<%@ page import="model.Offerta" %>
<%@ page import="model.Prodotto" %>

<%
Prodotto p = (Prodotto) session.getAttribute("prod");
Offerta o = (Offerta) session.getAttribute("offer");
int numao = o.countAsteOfferente();//numero di aste per cui l'utente ha fatto un'offerta
Asta a = (Asta) session.getAttribute("ast");
int numa = a.countAsta(); //numero di aste create dall'utente
%>

<%@ include file="header.jsp" %>
       
<div id="content">

<% if (numa<=0){%>
Non hai creato alcuna asta. 
<%}else{ %>
<table width="100%" class="table-data">
	<tr bgcolor="#FFFFFF" class="thead">
    	<td colspan="7">LE ASTE CHE HAI CREATO</td>
    </tr>
	<tr bgcolor="#FFFFFF" class="thead">
        	<td>Prodotto</td>
        	<td>Descrizione</td>
        	<td>Scadenza</td>
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
	     	%>
	        <td><%= p.getProdName(i)%></td>
	        <td><%= p.getProdDesc(i)%></td>
	        <td><%= a.getAstaScad(i)%></td>
	        <td><%= o.getOfferta(i)%> euro</td>
	        <td><%= o.getOfferente(i)%></td>     
	</tr>
	<%}%>
</table>
<%}%>
<% if (numao<=0){%>
Non hai partecipato ad alcuna asta. 
<%}else{ %>
<table width="100%" class="table-data">
	<tr bgcolor="#FFFFFF" class="thead">
    	<td colspan="7">LE ASTE IN CUI HAI FATTO UN'OFFERTA</td>
    </tr>
	<tr bgcolor="#FFFFFF" class="thead">
    		<td>Prodotto</td>
        	<td>Descrizione</td>
        	<td>Scadenza</td>
    		<td>Ultima Offerta</td>
        	<td>Ultimo Offerente</td>
           	<td>&nbsp;</td>
    </tr>    	
	<% for(int j=0;j<numao;j++){ %>
	<tr class="tbody">  
			<% String idAsta2 = o.getAstaIdOfferente(j);
			   o.viewOfferta(idAsta2);
			   p.viewOneProd(a.astatoProd(idAsta2));%>
			<td><%= p.getCurrentProdName()%></td>
	        <td><%= p.getCurrentProdDesc()%></td>
	        <td><%= o.getAstaScad(numa+j)%></td>
	        <td><%= o.getOfferta(numa+j)%> euro</td>
	        <td><%= o.getOfferente(numa+j)%></td>
	    </tr>
	<%}%>
</table>
<%}%>

</div>

</body>
</html>