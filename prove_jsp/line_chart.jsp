	<%@page language="java"%>

	<%@ page import="org.jfree.chart.ChartFactory"        %>

    <%@ page import="org.jfree.chart.ChartFrame"          %>

    <%@ page import="org.jfree.chart.JFreeChart"          %>

    <%@ page import="org.jfree.chart.plot.PlotOrientation"%>

    <%@ page import="org.jfree.chart.ChartUtilities"      %>

	// import per DB
	<%@ page import="java.sql.DriverManager" %> 
	<%@ page import="java.sql.Statement" %> 
	<%@ page import="java.sql.ResultSet" %> 
	<%@ page import="java.sql.Date" %>
	
	<%@ page import="java.io.*" %>
	
	<%@ page import="java.util.*" %>
	
	<%@ page import="org.jfree.data.category.CategoryDataset"  %>
	<%@ page import="org.jfree.data.category.DefaultCategoryDataset"  %>
	<%@ page import="org.jfree.chart.plot.CategoryPlot" %>
	
	<%@ page import= "java.awt.Color" %>
	<%@ page import = "org.jfree.chart.axis.NumberAxis" %>
	<%@ page import = "org.jfree.chart.renderer.category.LineAndShapeRenderer" %>
	


	<%
	
	response.setIntHeader("Refresh", 3);
	
	// QUERY
	ArrayList<String> temperatures = new ArrayList<String>();
	String ener="";
	String press="";
	ArrayList<String> dates = new ArrayList<String>();
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;

	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	String query = "SELECT * FROM estrusione ORDER BY data DESC LIMIT 0,10";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		temperatures.add(sqlResult.getString("temperatura"));
		ener = sqlResult.getString("pressione");
		press = sqlResult.getString("energia");
		dates.add(sqlResult.getString("data"));
				
	}
	out.print(temperatures);
	out.print(dates);

	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
      //ENTER POINTS.

      DefaultCategoryDataset dataset = new DefaultCategoryDataset();
      
      for (int i=(temperatures.size()-1); i>=0; --i)
		dataset.addValue(Integer.parseInt(temperatures.get(i)), "Classes", dates.get(i).substring(14));
		
	

		// create the chart...
		JFreeChart chart = ChartFactory.createLineChart(
		"Andamento temperatura Silos", // chart title
		"Minuti e secondi ora corrente", // domain axis label
		"Gradi Celsius", // range axis label
		dataset, // data
		PlotOrientation.VERTICAL, // orientation
		false, // include legend
		true, // tooltips
		false // urls
		);


	CategoryPlot plot = (CategoryPlot) chart.getPlot();
	plot.setBackgroundPaint(Color.lightGray);
	plot.setRangeGridlinePaint(Color.white);


	// change the auto tick unit selection to integer units only...
	NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
	rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	rangeAxis.setRange(175,225);

	// customise the renderer...
	LineAndShapeRenderer renderer	= (LineAndShapeRenderer) plot.getRenderer();
	renderer.setShapesVisible(true);
	renderer.setDrawOutlines(true);
	renderer.setUseFillPaint(true);
	renderer.setFillPaint(Color.white);


    //CREATE OUTPUT STREAM.
    response.setContentType("image/png");
    ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,1000,500);



 %>

