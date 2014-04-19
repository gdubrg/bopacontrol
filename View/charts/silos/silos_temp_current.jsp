<%@ page language = "java" %>

// Import per jfreechart
<%@ page import ="org.jfree.chart.ChartPanel" %>
<%@ page import ="org.jfree.chart.JFreeChart" %>
<%@ page import ="org.jfree.chart.plot.ThermometerPlot" %>
<%@ page import ="org.jfree.data.general.DefaultValueDataset" %>
<%@ page import ="org.jfree.ui.ApplicationFrame" %>
<%@ page import ="java.awt.BasicStroke" %>
<%@ page import ="java.awt.Color" %>
<%@ page import="org.jfree.chart.ChartUtilities"%>

// Import per DB
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>

<%
	
	// Refresh della pagina
	response.setIntHeader("Refresh", 3);
	
	// Query al DB
	String cur_temp = new String();
	String cur_date = new String();
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;

	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	// Inserire qui la tabella del db giusta a seconda della macchina
	String query = "SELECT temperatura, data FROM silos ORDER BY data DESC LIMIT 0,1";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		cur_temp = sqlResult.getString("temperatura");
		cur_date = sqlResult.getString("data");
	}

	// Estrazione della soglia dal DB
	query = "SELECT * FROM soglie_silos";
	sqlResult = sqlStatement.executeQuery(query);
	sqlResult.next();
	int thresh_val = sqlResult.getInt("temp_sil");

	DefaultValueDataset dataset = new DefaultValueDataset(Double.parseDouble(cur_temp));

	// Creazione del grafico
	final ThermometerPlot plot = new ThermometerPlot(dataset);
	final JFreeChart chart = new JFreeChart("Silos: temperatura rilevata",  // chart title
									  JFreeChart.DEFAULT_TITLE_FONT,
									  plot,                 // plot
									  false);               // include legend
									  
									  
	chart.setBackgroundPaint(new java.awt.Color(221,221,221));
	plot.setThermometerStroke(new BasicStroke(2.0f));
	plot.setThermometerPaint(new java.awt.Color(0,0,0));
	plot.setBackgroundPaint(new java.awt.Color(221,221,221));
	plot.setOutlineVisible(false);
	
	// Crea i livelli minimi e massimi del termostato
	int max_level = thresh_val + 50;
	int min_level = 0;
	int margin = (int)(max_level/10);
	plot.setRange(min_level, max_level);

	plot.setSubrange(ThermometerPlot.NORMAL, min_level, thresh_val-margin);
	plot.setSubrange(ThermometerPlot.WARNING, thresh_val-margin, thresh_val);
	plot.setSubrange(ThermometerPlot.CRITICAL, thresh_val, max_level);
        
	// Chiudi le connsessioni col DB
	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
	// Crea lo stream di output
	response.setContentType("image/png");
	ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,340,340);
    
%>
