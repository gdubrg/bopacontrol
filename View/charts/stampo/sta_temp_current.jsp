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
	String query = "SELECT temperatura, data FROM stampo ORDER BY data DESC LIMIT 0,1";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		cur_temp = sqlResult.getString("temperatura");
		cur_date = sqlResult.getString("data");
	}

	// Estrazione soglia dalle variabili d'ambiente
	int thresh_value = Integer.parseInt((String)session.getAttribute("s31"));

	// Scrittura dell'eventuale allarme
	if(Integer.parseInt(cur_temp)>thresh_value){
		session.setAttribute("alrm31", "1");
		String ins = "INSERT INTO allarmi (macchina, descr, data) VALUES ('Stampo', 'Temperatura max raggiunta', CURRENT_TIMESTAMP)";
		sqlStatement.executeUpdate(ins);
	} else {
		session.setAttribute("alrm31", "0");
	}
	
	DefaultValueDataset dataset = new DefaultValueDataset(Double.parseDouble(cur_temp));

	// Creazione del grafico
	final ThermometerPlot plot = new ThermometerPlot(dataset);
	final JFreeChart chart = new JFreeChart("Attualmente rilevata",  // chart title
									  JFreeChart.DEFAULT_TITLE_FONT,
									  plot,                 // plot
									  false);               // include legend
									  
									  
	chart.setBackgroundPaint(new java.awt.Color(221,221,221));
	plot.setThermometerStroke(new BasicStroke(2.0f));
	plot.setThermometerPaint(new java.awt.Color(0,0,0));
	plot.setBackgroundPaint(new java.awt.Color(221,221,221));
	plot.setOutlineVisible(false);
	
	// Crea i livelli minimi e massimi del termostato
	int max_level = thresh_value + 100;
	int min_level = 0;
	int margin = (int)(max_level/10);
	plot.setRange(min_level, max_level);

	plot.setSubrange(ThermometerPlot.NORMAL, min_level, thresh_value-margin);
	plot.setSubrange(ThermometerPlot.WARNING, thresh_value-margin, thresh_value);
	plot.setSubrange(ThermometerPlot.CRITICAL, thresh_value, max_level);
        
	// Chiudi le connsessioni col DB
	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
	// Crea lo stream di output
	response.setContentType("image/png");
	ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,340,340);
    
%>
