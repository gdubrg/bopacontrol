<%@ page language = "java" %>

<%@ page import = "org.jfree.chart.*" %>
<%@ page import = "org.jfree.data.category.*" %>
<%@ page import = "org.jfree.data.general.DefaultPieDataset" %>
<%@ page import = "org.jfree.data.xy.*" %>
<%@ page import = "org.jfree.data.*" %>
<%@ page import = "org.jfree.chart.renderer.category.*" %>
<%@ page import = "org.jfree.chart.plot.*" %>
<%@ page import = "org.jfree.chart.axis.NumberAxis" %>
<%@ page import = "java.awt.*" %>

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

	sqlResult.close();
	sqlStatement.close();
	conn.close();

	DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	dataset.setValue(Double.parseDouble(cur_load), "", "");

	// create the chart...
	JFreeChart chart = ChartFactory.createBarChart
		("Silos: carico rilevato",cur_date.substring(11), "KG", dataset, 
		PlotOrientation.VERTICAL, false, true, false);
       
	chart.setBackgroundPaint(new java.awt.Color(221,221,221));
	CategoryPlot plot = chart.getCategoryPlot(); 
	
	// Rendering
	BarRenderer barRenderer = (BarRenderer)plot.getRenderer();
	barRenderer.setSeriesPaint(0, Color.yellow);
	
	// Impostazioni degli assi
	NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
	rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	rangeAxis.setRange(0,1000);
	
	//CREATE OUTPUT STREAM.
	response.setContentType("image/png");
	ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,340,340);
    
%>