<script>setTimeout('window.close()', 3000)</script>
<html>
<h1> Processo fermato! </h1>

<%
Cookie stato = new Cookie("stato", "0");
    stato.setMaxAge(60*60*24);
    response.addCookie(stato);    
%>
