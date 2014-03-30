<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" ><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js" ><!--<![endif]-->
<html>
 <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bootstrap Starter Template</title>

  <!-- Fogli di stile -->
  <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
  <link href="../bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">

  <!-- Modernizr -->
  <script src="../bootstrap/js/bootstrap-min.js"></script>

  <!-- respond.js per IE8 -->
  <!--[if lt IE 9]>
  <script src="js/respond.min.js"></script>
  <![endif]-->
 </head>
 <body>

<%@ include file="../header.jsp" %>

<%@page language="java"%>

<%@ page import="java.io.*" %>
<%@ page import="org.jfree.chart.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="org.jfree.data.general.DefaultPieDataset" %>

<%
	//response.setIntHeader("Refresh", 1);
	
	// Generazione di un valore casuale
	int lowerBound = 1;
	int upperBound = 20;
	
	double randomValue = Math.random()*100*(upperBound-lowerBound)/100+lowerBound;
    randomValue = randomValue * 100;
    long tmp1 = Math.round(randomValue);
    double roundedRandomValue=Math.round((double)tmp1 / 100);
    
    // Creazione del dataset del diagramma a torta

	DefaultPieDataset pieDataset = new DefaultPieDataset();

	int valore1 = (int)(roundedRandomValue);
	int valore2 =  100 - valore1;
	pieDataset.setValue("Legna fine", valore1);
	pieDataset.setValue("Legna grossa", valore2);

	JFreeChart chart = ChartFactory.createPieChart("Legna tagliata oggi", pieDataset, true, true, true);

	//PiePlot P = (PiePlot)chart.getPlot();

	BufferedImage image = chart.createBufferedImage(500, 500);
	try {
		File outputfile = new File("webapps/ROOT/img/Chart2.png");
		ImageIO.write(image, "png", outputfile);
	} catch (FileNotFoundException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}

%>

<META HTTP-EQUIV="refresh" CONTENT="5">

<img src="../img/Chart2.png" class="img-responsive">

<% out.print("<h2>Legna fine: "+valore1+"</h2>"); %>
<% out.print("<h2>Legna grossa: "+valore2+"</h2>"); %>

 <!-- jQuery e plugin JavaScript  -->
 <script src="http://code.jquery.com/jquery.js"></script>
 <script src="../bootstrap/js/bootstrap.min.js"></script>
 
 </body>
</html>











