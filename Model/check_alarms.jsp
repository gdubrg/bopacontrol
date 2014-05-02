<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>

<%

// Refresh della pagina
	response.setIntHeader("Refresh", 3);

// Apertura connesione col DB
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

// Variabili
int thresh1 = 0, thresh2 = 0, thresh3 = 0;
String cur_temp = new String();
String cur_load = new String();
String cur_pressure = new String();
String cur_energy = new String();
String cur_date = new String();

//---------------- SILOS -----------------
String query = "SELECT temperatura, carico, energia, data FROM silos LIMIT 0,1";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
	cur_temp = sqlResult.getString("temperatura");
	cur_load = sqlResult.getString("carico");
	cur_energy = sqlResult.getString("energia");
	cur_date = sqlResult.getString("data");
}

thresh1 = Integer.parseInt((String)session.getAttribute("s11"));
thresh2 = Integer.parseInt((String)session.getAttribute("s12"));
thresh3 = Integer.parseInt((String)session.getAttribute("s13"));

if(Integer.parseInt(cur_temp)>thresh1){
	session.setAttribute("alrm11", "1");
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Silos', 'Temperatura max raggiunta', CURRENT_TIMESTAMP)";
		sqlStatement.executeUpdate(ins);
} else {
	session.setAttribute("alrm11", "0");
}

if(Integer.parseInt(cur_load)>thresh2){
	session.setAttribute("alrm12", "1");
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Silos', 'Carico max raggiunto', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
} else {
	session.setAttribute("alrm12", "0");
}

if(Integer.parseInt(cur_energy)>thresh3){
	session.setAttribute("alrm13", "1");
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Silos', 'Potenza max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
} else {
	session.setAttribute("alrm13", "0");
}

//---------------- ESTRUSORE -----------------
query = "SELECT temperatura, pressione, energia, data FROM estrusione LIMIT 0,1";

sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
	cur_temp = sqlResult.getString("temperatura");
	cur_pressure = sqlResult.getString("pressione");
	cur_energy = sqlResult.getString("energia");
	cur_date = sqlResult.getString("data");
}

thresh1 = Integer.parseInt((String)session.getAttribute("s21"));
thresh2 = Integer.parseInt((String)session.getAttribute("s22"));
thresh3 = Integer.parseInt((String)session.getAttribute("s23"));

if(Integer.parseInt(cur_temp)>thresh1){
	session.setAttribute("alrm21", "1");
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Estr', 'Temperatura max raggiunta', CURRENT_TIMESTAMP)";
		sqlStatement.executeUpdate(ins);
} else {
	session.setAttribute("alrm21", "0");
}

if(Integer.parseInt(cur_pressure)>thresh2){
	session.setAttribute("alrm22", "1");
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Estr', 'Pressione max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
} else {
	session.setAttribute("alrm22", "0");
}

if(Integer.parseInt(cur_energy)>thresh3){
	session.setAttribute("alrm23", "1");
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Estr', 'Potenza max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
} else {
	session.setAttribute("alrm23", "0");
}

//---------------- STAMPO -----------------
query = "SELECT temperatura, pressione, energia, data FROM stampo LIMIT 0,1";

sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()) {
	cur_temp = sqlResult.getString("temperatura");
	cur_pressure = sqlResult.getString("pressione");
	cur_energy = sqlResult.getString("energia");
	cur_date = sqlResult.getString("data");
}

thresh1 = Integer.parseInt((String)session.getAttribute("s31"));
thresh2 = Integer.parseInt((String)session.getAttribute("s32"));
thresh3 = Integer.parseInt((String)session.getAttribute("s33"));

if(Integer.parseInt(cur_temp)>thresh1){
	session.setAttribute("alrm31", "1");
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Stampo', 'Temperatura max raggiunta', CURRENT_TIMESTAMP)";
		sqlStatement.executeUpdate(ins);
} else {
	session.setAttribute("alrm31", "0");
}

if(Integer.parseInt(cur_pressure)>thresh2){
	session.setAttribute("alrm32", "1");
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Stampo', 'Pressione max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
} else {
	session.setAttribute("alrm32", "0");
}

if(Integer.parseInt(cur_energy)>thresh3){
	session.setAttribute("alrm33", "1");
	String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Stampo', 'Potenza max raggiunta', CURRENT_TIMESTAMP)";
	sqlStatement.executeUpdate(ins);
} else {
	session.setAttribute("alrm33", "0");
}
sqlResult.close(); sqlStatement.close(); conn.close();
%>
