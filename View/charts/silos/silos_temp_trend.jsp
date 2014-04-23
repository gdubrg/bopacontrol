	<%@page language="java"%>
	
	<%@ page import="java.io.*" %>
	<%@ page import="java.util.*" %>

	// import per DB
	<%@ page import="java.sql.DriverManager" %> 
	<%@ page import="java.sql.Statement" %> 
	<%@ page import="java.sql.ResultSet" %> 
	<%@ page import="java.sql.Date" %>
	
	// import per JFreeChart
	<%@ page import= "java.awt.Color" %>
	<%@ page import="org.jfree.data.category.CategoryDataset"  %>
	<%@ page import="org.jfree.data.category.DefaultCategoryDataset"  %>
	<%@ page import="org.jfree.chart.plot.CategoryPlot" %>
	<%@ page import="org.jfree.chart.ChartFactory"        %>
    <%@ page import="org.jfree.chart.ChartFrame"          %>
    <%@ page import="org.jfree.chart.JFreeChart"          %>
    <%@ page import="org.jfree.chart.plot.PlotOrientation"%>
    <%@ page import="org.jfree.chart.ChartUtilities"      %>
	<%@ page import = "org.jfree.chart.axis.NumberAxis" %>
	<%@ page import = "org.jfree.chart.renderer.category.LineAndShapeRenderer" %>
	<%@ page import = "org.jfree.chart.plot.ValueMarker" %>
	<%@ page import = "org.jfree.ui.Layer" %>
	<%
	
	response.setIntHeader("Refresh", 3);
	
	// Query al DB per ottenere le ultime temperature rilevate nel silos
	ArrayList<String> temperatures = new ArrayList<String>();
	ArrayList<String> dates = new ArrayList<String>();
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;

	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	String query = "SELECT * FROM silos ORDER BY data DESC LIMIT 0,10";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		temperatures.add(sqlResult.getString("temperatura"));
		dates.add(sqlResult.getString("data"));
	}

	// Popola il dataset
    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
      
    for (int i=(temperatures.size()-1); i>=0; --i)
		dataset.addValue(Integer.parseInt(temperatures.get(i)), "Classes", dates.get(i).substring(14));

	// Crea il grafico
	JFreeChart chart = ChartFactory.createLineChart(
		 "Silos: storico temperatura",// chart title
		null, // domain axis label
		"Gradi Celsius", // range axis label
		dataset, // data
		PlotOrientation.VERTICAL, // orientation
		false, // include legend
		true, // tooltips
		false // urls
	);
	chart.setBackgroundPaint(new java.awt.Color(221,221,221));
	
	// Impostazioni plotting
	CategoryPlot plot = (CategoryPlot) chart.getPlot();
	plot.setBackgroundPaint(Color.lightGray);
	plot.setRangeGridlinePaint(Color.white);
	
	// Estrazione soglia dalle variabili d'ambiente
	int thresh_value = Integer.parseInt((String)session.getAttribute("s11"));

	// Aggiunta della soglia sul grafico
	ValueMarker thresh_marker = new ValueMarker(thresh_value);
	thresh_marker.setPaint(Color.black);
	plot.addRangeMarker(thresh_marker, Layer.BACKGROUND);

	// Impostazioni degli assi
	NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
	rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	rangeAxis.setRange(0,50);

	// Impostazioni di rendering
	LineAndShapeRenderer renderer	= (LineAndShapeRenderer) plot.getRenderer();
	renderer.setShapesVisible(true);
	renderer.setDrawOutlines(true);
	renderer.setUseFillPaint(true);
	renderer.setFillPaint(Color.white);

	// Chiudi le connessioni col DB
	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
    // Crea lo stream in output
    response.setContentType("image/png");
    ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,740,340);



 %>

