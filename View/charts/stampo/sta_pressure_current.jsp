<%@ page language = "java" %>
<%@ page import ="org.jfree.chart.ChartPanel" %>
<%@ page import ="org.jfree.chart.JFreeChart" %>
<%@ page import ="org.jfree.chart.plot.ThermometerPlot" %>
<%@ page import ="org.jfree.data.general.DefaultValueDataset" %>
<%@ page import ="org.jfree.ui.ApplicationFrame" %>
<%@ page import ="java.awt.BasicStroke" %>
<%@ page import ="java.awt.Color" %>
<%@ page import="org.jfree.chart.ChartUtilities"%>
<%@ page import="org.jfree.chart.plot.dial.*" %>
// import per DB
<%@ page import="java.sql.DriverManager" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet" %> 
<%@ page import="java.sql.Date" %>

<%

	response.setIntHeader("Refresh", 3);
	
	// QUERY
	String currentPressure = new String();
	String currentDate = new String();
	
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;

	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	// Inserire qui la tabella del db giusta a seconda della macchina
	String query = "SELECT pressione, data FROM stampo ORDER BY data DESC LIMIT 0,1";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		currentPressure = sqlResult.getString("pressione");
		currentDate = sqlResult.getString("data");
	}

	sqlResult.close();
	sqlStatement.close();
	conn.close();

	DefaultValueDataset dataset = new DefaultValueDataset(Double.parseDouble(currentPressure));
	
	// create the chart...
	DialPlot plot = new DialPlot(dataset);
	
	// Valori del manometro
    int minimumValue = 0, maximumValue = 1000;
    int majorTicks = 100;
    int minTicks_beween_majorTicks = 10;
    
	// Evidenzia la zona di pericolo
    int yellowLine = 700;
    int redLine = 800;
    
    plot.addLayer(new StandardDialRange(minimumValue, yellowLine, Color.green));
	plot.addLayer(new StandardDialRange(yellowLine, redLine, Color.yellow));
	plot.addLayer(new StandardDialRange(redLine, maximumValue, Color.red));
	
    plot.setDialFrame(new StandardDialFrame());
    plot.addLayer(new DialValueIndicator(0));
    plot.addLayer(new DialPointer.Pointer());
    

	StandardDialScale scale = new StandardDialScale(minimumValue, maximumValue,-120, -300, majorTicks, minTicks_beween_majorTicks-1);
    scale.setTickRadius(0.88);
    scale.setTickLabelOffset(0.20);
    plot.addScale(0, scale);	
    
    
    JFreeChart chart = new JFreeChart("Pressione rilevata", JFreeChart.DEFAULT_TITLE_FONT, plot, false);
    chart.setBackgroundPaint(new java.awt.Color(221,221,221));

	//CREATE OUTPUT STREAM.
	response.setContentType("image/png");
	ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,340,340);
    
%>
