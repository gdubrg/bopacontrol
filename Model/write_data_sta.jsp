
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>

<%
//leggo i valori delle soglie attuali
String s31 = (String)session.getAttribute("s31");
String s32 = (String)session.getAttribute("s32");
String s33 = (String)session.getAttribute("s33");
String query = "";
String sT = "";
String sP = "";
String sE = "";

//creo connessione con il db
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

//verifico quale sia la soglia aggiornata; trovata, aggiorno il valore attuale su db e variabile sessione
sT = request.getParameter("soglia_temp_sta");
if( sT != null){
    query = "UPDATE soglie_sta SET temp_sta='"+sT+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s31", sT);
    }
    
    sP = request.getParameter("soglia_press_sta");
if( sP != null){
    query = "UPDATE soglie_sta SET press_sta='"+sP+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s32", sP);
    }
    
    sE = request.getParameter("soglia_pot_sta");
if( sE != null){
    query = "UPDATE soglie_sta SET ene_sta='"+sE+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s33", sE);
    } 
    
    response.sendRedirect("../View/settings_sta.jsp"); 
%>



