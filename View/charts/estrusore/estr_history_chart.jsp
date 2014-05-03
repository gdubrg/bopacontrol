	<%@page language="java"%>
	
	<%@ page import="java.io.*" %>
	<%@ page import="java.util.*" %>
	<%@ page import="java.text.SimpleDateFormat" %>

	// import per DB
	<%@ page import="java.sql.DriverManager" %> 
	<%@ page import="java.sql.Statement" %> 
	<%@ page import="java.sql.ResultSet" %> 
	<%@ page import="java.sql.Date" %>
	
	// import per JFreeChart
	<%@ page import= "java.awt.Font" %>
	<%@ page import= "java.awt.Color" %>
	<%@ page import= "java.awt.BasicStroke" %>
	<%@ page import="org.jfree.data.category.CategoryDataset"  %>
	<%@ page import="org.jfree.data.category.DefaultCategoryDataset"  %>
	<%@ page import="org.jfree.chart.plot.CategoryPlot" %>
	<%@ page import="org.jfree.chart.ChartFactory"        %>
    <%@ page import="org.jfree.chart.ChartFrame"          %>
    <%@ page import="org.jfree.chart.JFreeChart"          %>
    <%@ page import="org.jfree.chart.plot.PlotOrientation"%>
    <%@ page import="org.jfree.chart.ChartUtilities"      %>
	<%@ page import = "org.jfree.chart.axis.NumberAxis" %>
	<%@ page import = "org.jfree.chart.axis.CategoryAxis" %>
	<%@ page import = "org.jfree.chart.renderer.category.LineAndShapeRenderer" %>
	<%@ page import = "org.jfree.chart.plot.ValueMarker" %>
	<%@ page import = "org.jfree.ui.Layer" %>
	<%@ page import = "org.jfree.chart.title.LegendTitle" %>
	
	<%
	
	// Imposta frequenza refresh del grafico
	response.setIntHeader("Refresh", 3);
		
	// Variabili di appoggio
	ArrayList<Integer> temperatures = new ArrayList<Integer>();
	ArrayList<Integer> pressures = new ArrayList<Integer>();
	ArrayList<Integer> energies = new ArrayList<Integer>();
	ArrayList<String> dates = new ArrayList<String>();
	
	// Selezione dell'intervallo temporale di interesse
	String from_when = (String)session.getAttribute("data_inizio");
	
	// Se la data iniziale non è stata ancora decisa, di default si usa il giorno corrente
	if (from_when==null)
		from_when = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
	
	// Apertura connessioni col DB
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	java.sql.Connection conn;
	conn = DriverManager.getConnection("jdbc:mysql://localhost/controllo?user=root&password=root"); 
	Statement sqlStatement = conn.createStatement();
	
	// Query al DB
	String query = "SELECT * FROM estrusione WHERE data >= '"+from_when+"' ORDER BY data DESC";
	ResultSet sqlResult = sqlStatement.executeQuery(query);
	
	while(sqlResult.next()) {
		temperatures.add(sqlResult.getInt("temperatura"));
		pressures.add(sqlResult.getInt("pressione"));
		energies.add(sqlResult.getInt("energia"));
		dates.add(sqlResult.getString("data"));
	}

	// Popola il dataset
    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
      
    for (int i=(energies.size()-1); i>=0; --i){
		dataset.addValue(temperatures.get(i), "Temperatura [C]", dates.get(i).substring(14));
		dataset.addValue(pressures.get(i), "Pressione [bar]", dates.get(i).substring(14));
		dataset.addValue(energies.get(i), "Potenza [kW]", dates.get(i).substring(14));
	}

	// Crea il grafico
	JFreeChart chart = ChartFactory.createLineChart(
		"Storico sensori Estrusore dal "+from_when, // chart title
		"", // domain axis label
		"", // range axis label
		dataset, // data
		PlotOrientation.VERTICAL, // orientation
		true, // include legend
		true, // tooltips
		false // urls
	);
	chart.setBackgroundPaint(new java.awt.Color(221,221,221));
	
	// Impostazioni plot
	CategoryPlot plot = (CategoryPlot) chart.getPlot();
	plot.setBackgroundPaint(Color.lightGray);
	plot.setRangeGridlinePaint(Color.white);

	// Impostazioni legenda
	LegendTitle legend = chart.getLegend();
	Font labelFont = new Font("Arial", Font.BOLD, 12);
	legend.setItemFont(labelFont);

	// Impostazioni assi
	NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
	rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	if(temperatures.size()>15){ // con troppi valori le labels si sovrappongono
		CategoryAxis domainAxis = (CategoryAxis) plot.getDomainAxis();
		domainAxis.setTickLabelsVisible(false);
	}
	// Cerca i massimi tra le y per visualizzare il grafico correttamente
	int max_range = 1000;
	ArrayList<Integer> maxima = new ArrayList<Integer>();
	if (temperatures.size()>0) {
		maxima.add(Collections.max(temperatures));
		maxima.add(Collections.max(pressures));
		maxima.add(Collections.max(energies));
	max_range = Collections.max(maxima) + 50;
	}
	rangeAxis.setRange(0,max_range);

	// Impostazioni di rendering
	LineAndShapeRenderer renderer	= (LineAndShapeRenderer) plot.getRenderer();
	renderer.setStroke(new BasicStroke(2.0f));

	// Chiudi le connessioni col DB
	sqlResult.close();
	sqlStatement.close();
	conn.close();
	
    // Crea lo stream in output
    response.setContentType("image/png");
    ChartUtilities.writeChartAsJPEG(response.getOutputStream(),chart,1190,600);

 %>

