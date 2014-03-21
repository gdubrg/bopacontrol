<html>
<head>
<title> Primo Esempio JSP </title>
</head>
<body>
<%@ page language="java"%>
<h1> I quadrati dei numeri </h1>
<% for (int i=0;i<11;i++) { %>
<br>
<%=i%>
Al quadrato fa
<%=i*i%>
<% } %>
</body>
</html> 
