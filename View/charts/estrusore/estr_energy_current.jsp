<%@ page language = "java" %>

// import per JFreeChart
<%@ page import = "java.awt.*" %>
<%@ page import = "org.jfree.chart.*" %>
<%@ page import = "org.jfree.data.category.*" %>
<%@ page import = "org.jfree.data.general.DefaultPieDataset" %>
<%@ page import = "org.jfree.data.xy.*" %>
<%@ page import = "org.jfree.data.*" %>
<%@ page import = "org.jfree.chart.renderer.category.*" %>
<%@ page import = "org.jfree.chart.plot.*" %>
<%@ page import = "org.jfree.chart.axis.NumberAxis" %>
<%@ page import = "org.jfree.chart.plot.ValueMarker" %>
<%@ page import = "org.jfree.ui.Layer" %>


// import per DB
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>

<%

	// Imposta frequenza refresh del grafico
	response.setIntHeader("Refresh", 3);
	
	// Apertura connessione col db
	String cur_energy = new String();
	String cur_date = new String();
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;

	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	// Select al db per ottenere la potenza corrente
	String query = "SELECT energia, data FROM estrusione ORDER BY data DESC LIMIT 0,1";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		cur_energy = sqlResult.getString("energia");
		cur_date = sqlResult.getString("data");
	}

	// Creazione del dataset
	DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	dataset.setValue(Double.parseDouble(cur_energy), "", "");

	// Creazione del grafico
	JFreeChart chart = ChartFactory.createBarChart
		("Attualmente rilevata",cur_date.substring(11), "Potenza [kW]", dataset, 
		PlotOrientation.VERTICAL, false, true, false);
       
	chart.setBackgroundPaint(new java.awt.Color(221,221,221));
	CategoryPlot plot = chart.getCategoryPlot(); 
	
	// Estrazione soglia dalle variabili d'ambiente
	int thresh_value = Integer.parseInt((String)session.getAttribute("s23"));
	
	// Aggiunta della soglia sul grafico
	ValueMarker thresh_marker = new ValueMarker(thresh_value);
	thresh_marker.setPaint(Color.black);
	plot.addRangeMarker(thresh_marker, Layer.BACKGROUND);
	
	// Impostazioni degli assi
	NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
	rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	rangeAxis.setRange(0,20);
		
	// Chiudi le connessioni col DB
	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
	// Creazione dello stream in output
	response.setContentType("image/png");
	ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,340,340);
    
%>
