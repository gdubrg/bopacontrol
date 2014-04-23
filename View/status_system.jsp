<html>
<%@ include file="lib.jsp" %>

<BODY STYLE="background-color:#DDDDDD">

<%
if(session.getAttribute("alrm11")=="1" || session.getAttribute("alrm12")=="1" || session.getAttribute("alrm13")=="1" ||
	session.getAttribute("alrm21")=="1" || session.getAttribute("alrm22")=="1" || session.getAttribute("alrm23")=="1"||
	session.getAttribute("alrm31")=="1" || session.getAttribute("alrm32")=="1" || session.getAttribute("alrm33")=="1"){
		out.println("<div class=\"alert alert-danger\">Warning! Sono presenti degli allarmi</div>");
	}
else
	out.println("<div class=\"alert alert-success\">Non sono stati riscontrati problemi</div>");
%>
</body>

</html>
