<html>
<%@page language="java"%>
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>
<body>
<%
String s31 = (String)session.getAttribute("s31");
String s32 = (String)session.getAttribute("s32");
String s33 = (String)session.getAttribute("s33");
String query = "";
String sT = "";
String sP = "";
String sE = "";

Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection conn;

conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
Statement sqlStatement = conn.createStatement();

sT = request.getParameter("soglia_temp_sta");
if( sT != null){
    query = "UPDATE soglie_sta SET temp_sta='"+sT+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s31", sT);
    s31 = (String)session.getAttribute("s31");
    }
    
    sP = request.getParameter("soglia_car_silos");
if( sP != null){
    query = "UPDATE soglie_silos SET car_sil='"+sP+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s12", sP);
    s32 = (String)session.getAttribute("s12");
    }
    
    sE = request.getParameter("soglia_pot_silos");
if( sE != null){
    query = "UPDATE soglie_silos SET ene_sil='"+sE+"' ";
    sqlStatement.executeUpdate(query);
    session.setAttribute("s13", sE);
    s33 = (String)session.getAttribute("s13");
    } 
    
    response.sendRedirect("../View/settings_sta.jsp"); 
%>



