
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>

<%
//leggo i valori delle soglie attuali
String s11 = (String)session.getAttribute("s11");
String s12 = (String)session.getAttribute("s12");
String s13 = (String)session.getAttribute("s13");
String query = "";
String sT = "";
String sC = "";
String sE = "";

//creo connessione con il db
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

//verifico quale sia la soglia aggiornata; trovata, aggiorno il valore attuale su db e variabile sessione
sT = request.getParameter("soglia_temp_silos");
if( sT != null){
    query = "UPDATE soglie_silos SET temp_sil='"+sT+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s11", sT);
    }
    
    sC = request.getParameter("soglia_car_silos");
if( sC != null){
    query = "UPDATE soglie_silos SET car_sil='"+sC+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s12", sC);
    }
    
    sE = request.getParameter("soglia_pot_silos");
if( sE != null){
    query = "UPDATE soglie_silos SET ene_sil='"+sE+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s13", sE);
    } 
    
    response.sendRedirect("../View/settings_sil.jsp"); 
%>



