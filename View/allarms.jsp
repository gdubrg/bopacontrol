	<html>
<%@page language="java"%>
	
	<%@ page import="java.io.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.sql.DriverManager" %> 
	<%@ page import="java.sql.Statement" %> 
	<%@ page import="java.sql.ResultSet" %> 
	<%@ page import="java.sql.Date" %>
<%@ include file="header.jsp" %>

<%

ArrayList<String> mac = new ArrayList<String>();
ArrayList<String> descr = new ArrayList<String>();
ArrayList<String> date = new ArrayList<String>();

response.setIntHeader("Refresh", 3);

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

String query = "SELECT * FROM allarmi ORDER BY data DESC LIMIT 0,50";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
    mac.add(sqlResult.getString("macchina"));
    descr.add(sqlResult.getString("descr"));
    date.add(sqlResult.getString("data"));
    }

sqlResult.close(); sqlStatement.close(); conn.close();
%>

<table class="table">
  <thead>
    <tr>
      <th>Macchina</th>
      <th>Descrizione</th>
      <th>Data</th>
    </tr>
  </thead>
  
<%
for(int i=0;i<mac.size();i++){
	out.println("<tbody><tr><td>"+mac.get(i)+"</td><td>"+descr.get(i)+"</td><td>"+date.get(i)+"</td></tr>");
}
%>

 </tbody>
</table>
<body>


  
  
</body>
</html>
