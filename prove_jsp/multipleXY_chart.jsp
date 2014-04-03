	<%@page language="java"%>

	<%@ page import="org.jfree.chart.ChartFactory"        %>

    <%@ page import="org.jfree.chart.ChartFrame"          %>

    <%@ page import="org.jfree.chart.JFreeChart"          %>

    <%@ page import="org.jfree.chart.plot.PlotOrientation"%>

    <%@ page import="org.jfree.data.xy.XYDataset"         %>

    <%@ page import="org.jfree.data.xy.XYSeries"          %>

    <%@ page import="org.jfree.data.xy.XYSeriesCollection"%>

    <%@ page import="org.jfree.chart.ChartUtilities"      %>
    
    <%@ page import="org.jfree.chart.plot.CategoryPlot" %>
    
    <%@ page import = "org.jfree.chart.axis.NumberAxis" %>
    
    <%@ page import = "org.jfree.chart.plot.XYPlot" %>


	// import per DB
	<%@ page import="java.sql.DriverManager" %> 
	<%@ page import="java.sql.Statement" %> 
	<%@ page import="java.sql.ResultSet" %> 
	<%@ page import="java.sql.Date" %>
	
	<%@ page import="java.io.*" %>
	
	<%@ page import="java.util.*" %>
	
	<%@ page import= "java.awt.Color" %>
	<%@ page import = "org.jfree.chart.renderer.xy.*" %>

	<%
	
	response.setIntHeader("Refresh", 3);
	
	ArrayList<String> silos_temperatures = new ArrayList<String>();
	ArrayList<String> silos_dates = new ArrayList<String>();
	ArrayList<String> estr_temperatures = new ArrayList<String>();
	ArrayList<String> estr_dates = new ArrayList<String>();
	ArrayList<String> stampo_temperatures = new ArrayList<String>();
	ArrayList<String> stampo_dates = new ArrayList<String>();

	
	// QUERY 1 - ULTIME TEMPERATURE SILOS
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	
	java.sql.Connection conn1;
	conn1 = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement1 = conn1.createStatement();
	
	String query1 = "SELECT temperatura,data FROM silos ORDER BY data DESC LIMIT 0,5";

	ResultSet sqlResult1 = sqlStatement1.executeQuery(query1);
	while(sqlResult1.next()) {
		silos_temperatures.add(sqlResult1.getString("temperatura"));
		silos_dates.add(sqlResult1.getString("data"));		
	}
	sqlResult1.close();
	sqlStatement1.close();
	conn1.close();
	
	// QUERY 2 - ULTIME TEMPERATURE ESTRUSIONE
	Class.forName("com.mysql.jdbc.Driver").newInstance();

	java.sql.Connection conn2;
	conn2 = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement2 = conn2.createStatement();
	
	String query2 = "SELECT temperatura,data FROM estrusione ORDER BY data DESC LIMIT 0,5";

	ResultSet sqlResult2 = sqlStatement2.executeQuery(query2);
	while(sqlResult2.next()) {
		estr_temperatures.add(sqlResult2.getString("temperatura"));
		estr_dates.add(sqlResult2.getString("data"));		
	}
	sqlResult2.close();
	sqlStatement2.close();
	conn2.close();
	
	// QUERY 3 - ULTIME TEMPERATURE SILOS
	Class.forName("com.mysql.jdbc.Driver").newInstance();

	java.sql.Connection conn3;
	conn3 = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement3 = conn3.createStatement();
	
	String query3 = "SELECT temperatura,data FROM stampo ORDER BY data DESC LIMIT 0,5";

	ResultSet sqlResult3 = sqlStatement3.executeQuery(query3);
	while(sqlResult3.next()) {
		stampo_temperatures.add(sqlResult3.getString("temperatura"));
		stampo_dates.add(sqlResult3.getString("data"));		
	}
	sqlResult3.close();
	sqlStatement3.close();
	conn3.close();

	// AGGIUNGI AL DATASET LE TEMPERATURE DEL SILOS
	XYSeries series1 = new XYSeries("First");
	for (int i=silos_temperatures.size()-1; i>=0; --i)
		series1.add(Double.parseDouble(silos_dates.get(i).substring(17)),Integer.parseInt(silos_temperatures.get(i)));
		
	// AGGIUNGI AL DATASET LE TEMPERATURE ESTRUSIONE
	XYSeries series2 = new XYSeries("Second");
	for (int i=estr_temperatures.size()-1; i>=0; --i)
		series2.add(Double.parseDouble(estr_dates.get(i).substring(17)),Integer.parseInt(estr_temperatures.get(i)));
		
	// AGGIUNGI AL DATASET LE TEMPERATURE DELLO STAMPO
	XYSeries series3 = new XYSeries("Third");
	for (int i=stampo_temperatures.size()-1; i>=0; --i)
		series3.add(Double.parseDouble(stampo_dates.get(i).substring(17)),Integer.parseInt(stampo_temperatures.get(i)));

	// CREA IL DATASET COMPLESSIVO	
	XYSeriesCollection dataset = new XYSeriesCollection();
	dataset.addSeries(series1);
	dataset.addSeries(series2);
	dataset.addSeries(series3);

    //CREATE CHART.
    boolean legend = false;
    boolean tooltips = false;
    boolean urls = false;

    JFreeChart chart = ChartFactory.createXYLineChart("Temperature rilevate","Minuti e secondi ora corrente","Gradi [Celsius]",dataset, PlotOrientation.VERTICAL,legend,tooltips,urls);

	// PLOT OPTIONS
	XYPlot plot = (XYPlot) chart.getPlot();
	plot.setBackgroundPaint(Color.lightGray);
	plot.setRangeGridlinePaint(Color.white);
	
	// AXIS OPTIONS
	NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
	rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	rangeAxis.setRange(175,300);
	
	// RENDERER OPTIONS
	XYLineAndShapeRenderer renderer	= (XYLineAndShapeRenderer) plot.getRenderer();
	renderer.setShapesVisible(true);
	renderer.setDrawOutlines(true);
	renderer.setUseFillPaint(true);
	renderer.setFillPaint(Color.white);

    //CREATE OUTPUT STREAM.
    response.setContentType("image/png");
    ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,1000,500);



 %>

