	<%@page language="java"%>

	<%@ page import="org.jfree.chart.ChartFactory"        %>

    <%@ page import="org.jfree.chart.ChartFrame"          %>

    <%@ page import="org.jfree.chart.JFreeChart"          %>

    <%@ page import="org.jfree.chart.plot.PlotOrientation"%>

    <%@ page import="org.jfree.data.xy.XYDataset"         %>

    <%@ page import="org.jfree.data.xy.XYSeries"          %>

    <%@ page import="org.jfree.data.xy.XYSeriesCollection"%>

    <%@ page import="org.jfree.chart.ChartUtilities"      %>

	<%@ page import="java.sql.DriverManager" %> 
	
	<%@ page import="java.sql.Statement" %> 
	
	<%@ page import="java.sql.ResultSet" %> 
	
	<%@ page import="java.sql.Date" %>
	
	<%@ page import="java.io.*" %>
	
	<%@ page import="java.util.*" %>

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
	
	String query = "SELECT * FROM estrusione ORDER BY data DESC LIMIT 0,5";

	ResultSet sqlResult = sqlStatement.executeQuery(query);
	while(sqlResult.next()) {
		temperatures.add(sqlResult.getString("temperatura"));
		ener = sqlResult.getString("pressione");
		press = sqlResult.getString("energia");
		dates.add(sqlResult.getString("data"));
		
		//out.print("Temp: " + temp + " Energia: " + ener + " Press: " + press + " Data:  " + date + "  Sec:" + date.substring(17) + "<br/>");
		
	}
	out.print(temperatures);
	out.print(dates);

	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
      //ENTER POINTS.

      XYSeries        series      = new XYSeries("Andamento della temperatura");
      
      for (int i=0; i<temperatures.size(); ++i)
		series.add(i*10, Integer.parseInt(temperatures.get(i)));

 

      //CREATE DATASET. 

      XYDataset       xyDataset   = new XYSeriesCollection(series);

 

      //CREATE CHART.

      boolean         legend      = false;

      boolean         tooltips    = false;

      boolean         urls        = false;

      JFreeChart      chart       = ChartFactory.createXYLineChart("Sample XY Chart","Height","Weight",xyDataset, PlotOrientation.VERTICAL,legend,tooltips,urls);

   

      //CREATE OUTPUT STREAM.
      response.setContentType("image/png");
      ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,1000,500);



 %>

