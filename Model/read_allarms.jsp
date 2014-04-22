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



if(session.getAttribute("alrm11")=="1")
	alrm11 = "Temp";
else
	alrm11 = "";
	
if(session.getAttribute("alrm12")=="1")
	alrm12 = "Carico";
else
	alrm12 = "";

if(session.getAttribute("alrm13")=="1")
	alrm13 = "Pot";
else
	alrm13 = "";

if(session.getAttribute("alrm11")=="1" || session.getAttribute("alrm12")=="1" || session.getAttribute("alrm13")=="1")
	out.println("<div class=\"alert alert-danger\">Allerta Silos:"+alrm11+" "+alrm12+" "+alrm13+"</div>");

out.println("<background-color: \"#ff4444\">");
%>
</head>
<BODY STYLE="background-color:#DDDDDD">


<!--
<div id="tab">
<table class="table">
<tbody>
    <thead>
    <tr>
      <th>Macchina</th>
      <th>Problema</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><%=macc[0]%></td>
      <td><%=descr[0]%></td>
    </tr>
    <tr>
       <td><%=macc[1]%></td>
      <td><%=descr[1]%></td>
    </tr>
    <tr>
       <td><%=macc[2]%></td>
      <td><%=descr[2]%></td>
    </tr>
    </tbody>
</table>
</div>
-->

</body>
</html>
