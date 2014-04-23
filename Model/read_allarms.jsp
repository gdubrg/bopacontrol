<html>
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>
<head> 
  <!-- Fogli di stile -->
  <link rel="stylesheet" href="../View/bootstrap/css/bootstrap.css">
  <link href="../View/bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="../View/style.css">
<title>Allarmi</title>

<%
String[] macc = new String[3];
String[] descr= new String[3];
String date="";

response.setIntHeader("Refresh", 3);

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;
conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

String query = "SELECT * FROM allarmi ORDER BY data DESC LIMIT 0,3";

ResultSet sqlResult = sqlStatement.executeQuery(query);
int i = 0;
while(sqlResult.next()) {
    macc[i] = sqlResult.getString("macchina");
    descr[i] = sqlResult.getString("descr");
    date = sqlResult.getString("data");
    i = i+1;
    }
sqlResult.close(); sqlStatement.close(); conn.close();
%>

<%
String alrm11="";
String alrm12="";
String alrm13="";
String alrm21="";
String alrm22="";
String alrm23="";
String alrm31="";
String alrm32="";
String alrm33="";

//Controllo soglie Silos
if(session.getAttribute("alrm11")=="1")
	alrm11 = "Temperatura";
else
	alrm11 = "";
	
if(session.getAttribute("alrm12")=="1")
	alrm12 = "Carico";
else
	alrm12 = "";

if(session.getAttribute("alrm13")=="1")
	alrm13 = "Potenza";
else
	alrm13 = "";

if(session.getAttribute("alrm11")=="1" || session.getAttribute("alrm12")=="1" || session.getAttribute("alrm13")=="1")
	out.println("<div class=\"alert alert-danger\"><b>(!) Silos</b>: "+alrm11+" "+alrm12+" "+alrm13+"</div>");

//Controllo soglie Macchina Estrusione
if(session.getAttribute("alrm21")=="1")
	alrm21 = "Temperatura";
else
	alrm21 = "";
	
if(session.getAttribute("alrm22")=="1")
	alrm22 = "Pressione";
else
	alrm22 = "";

if(session.getAttribute("alrm23")=="1")
	alrm23 = "Potenza";
else
	alrm23 = "";

if(session.getAttribute("alrm21")=="1" || session.getAttribute("alrm22")=="1" || session.getAttribute("alrm23")=="1")
	out.println("<div class=\"alert alert-danger\"><b>(!) Estrusore</b>: "+alrm21+" "+alrm22+" "+alrm23+"</div>");
	
//Controllo soglie Macchina Stampo
if(session.getAttribute("alrm31")=="1")
	alrm31 = "Temperatura";
else
	alrm31 = "";
	
if(session.getAttribute("alrm32")=="1")
	alrm32 = "Pressione";
else
	alrm32 = "";

if(session.getAttribute("alrm33")=="1")
	alrm33 = "Potenza";
else
	alrm33 = "";

if(session.getAttribute("alrm31")=="1" || session.getAttribute("alrm32")=="1" || session.getAttribute("alrm33")=="1")
	out.println("<div class=\"alert alert-danger\"><b>(!) Stampo</b>: "+alrm31+" "+alrm32+" "+alrm33+"</div>");
%>
</head>
<BODY STYLE="background-color:#DDDDDD">
</body>
</html>
