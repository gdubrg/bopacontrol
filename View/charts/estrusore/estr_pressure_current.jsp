<%@ page language = "java" %>

// import per jfreechart
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
	String query = "SELECT pressione, data FROM estrusione ORDER BY data DESC LIMIT 0,1";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		currentPressure = sqlResult.getString("pressione");
		currentDate = sqlResult.getString("data");
	}

	DefaultValueDataset dataset = new DefaultValueDataset(Double.parseDouble(currentPressure));
	
	// create the chart...
	DialPlot plot = new DialPlot(dataset);
	
	// Estrazione della soglia dalle variabili d'ambiente
	int thresh_value = Integer.parseInt((String)session.getAttribute("s22"));
	
	// Valori del manometro
    int minimumValue = 0, maximumValue = 1500;
    int majorTicks = 250;
    int minTicks_beween_majorTicks = 10;
    
	// Evidenzia la zona di pericolo
    int yellowLine = thresh_value-100;
    int redLine = thresh_value;
    
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
    
    JFreeChart chart = new JFreeChart("Attualmente rilevata", JFreeChart.DEFAULT_TITLE_FONT, plot, false);
    chart.setBackgroundPaint(new java.awt.Color(221,221,221));

	// Chiudi le connsessioni col DB
	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
	//CREATE OUTPUT STREAM.
	response.setContentType("image/png");
	ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,340,340);
    
%>
