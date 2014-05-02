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

	response.setIntHeader("Refresh", 3);
	
	// QUERY
	String cur_load = new String();
	String cur_date = new String();
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;

	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	// Inserire qui la tabella del db giusta a seconda della macchina
	String query = "SELECT carico, data FROM silos ORDER BY data DESC LIMIT 0,1";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		cur_load = sqlResult.getString("carico");
		cur_date = sqlResult.getString("data");
	}

	DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	dataset.setValue(Double.parseDouble(cur_load), "", "");

	// create the chart...
	JFreeChart chart = ChartFactory.createBarChart
		("Attualmente rilevato",cur_date.substring(11), "KG", dataset, 
		PlotOrientation.VERTICAL, false, true, false);
       
	chart.setBackgroundPaint(new java.awt.Color(221,221,221));
	CategoryPlot plot = chart.getCategoryPlot(); 
	
	// Estrazione soglia dalle variabili d'ambiente
	int thresh_value = Integer.parseInt((String)session.getAttribute("s12"));
	
	// Aggiunta della soglia sul grafico
	ValueMarker thresh_marker = new ValueMarker(thresh_value);
	thresh_marker.setPaint(Color.black);
	plot.addRangeMarker(thresh_marker, Layer.BACKGROUND);
	
	// Rendering
	BarRenderer barRenderer = (BarRenderer)plot.getRenderer();
	barRenderer.setSeriesPaint(0, Color.yellow);
	
	// Impostazioni degli assi
	NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
	rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	rangeAxis.setRange(0,1000);
	
	// Chiudi le connessioni col DB
	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
	//CREATE OUTPUT STREAM.
	response.setContentType("image/png");
	ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,340,340);
    
%>
