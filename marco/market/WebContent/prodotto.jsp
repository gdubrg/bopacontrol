<%@ page import="model.Prodotto" %>
<% Prodotto p = (Prodotto) session.getAttribute("prod");
	int nump = p.countProd(); %>    

<%@ include file="header.jsp" %>

 
	 
<div id="content">

<div class="tab">
<div class="linkcell">
<a href="ControllerServlet?op=ins" class="reminder">
Inserisci un prodotto da mettere in vendita.</a></div> </div> 

<% if (nump<=0){%>
Non hai prodotti da mettere in vendita. 
<%return;}else{ %>
<table width="100%" class="table-data">
	<tr bgcolor="#FFFFFF" class="thead">
    	<td colspan="7">PRODOTTI</td>
    </tr>
	<tr bgcolor="#FFFFFF" class="thead">
        	<td>Prodotto</td>
        	<td>Descrizione</td>
        	<td></td>
    </tr>
	<% for(int i=0;i<nump;i++){ %>   
	     <tr class="tbody">
	        <td><%= p.getProdName(i)%></td>
	        <td><%= p.getProdDesc(i)%></td>
	        <td>
	        <% String ProdId = p.getProdId(i); %>
	        <a href="ControllerServlet?op=sell&idProd=<%=ProdId%>" class="reminder">Vendi</a>
	        <a href="ControllerServlet?op=upProd&idProd=<%=ProdId%>" class="reminder">Modifica</a>
	        <a href="ControllerServlet?op=del&idProd=<%=ProdId%>" class="reminder">Elimina</a></td>
	    </tr>
	<%}%>
</table>
<%}%>

</div>

</body>
</html>