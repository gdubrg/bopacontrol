<script>setTimeout('window.close()', 3000)</script>
<html>
<h1> Processo partito! </h1>

<%
Cookie stato = new Cookie("stato", "1");
    stato.setMaxAge(60*60*24);
    response.addCookie(stato);    
%>
