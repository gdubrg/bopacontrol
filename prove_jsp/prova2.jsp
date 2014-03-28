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

<!------- ESPERIMENTO BARRA DI NAVIGAZIONE  ------>
<nav class="navbar navbar-default">
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="#">BoPa Controller</a>
  </div>
 
  <div class="collapse navbar-collapse">
    <ul class="nav navbar-nav">
      <li><a href="#">Stato corrente</a></li>
      <li><a href="#">Evoluzione storica</a></li>
      <li><a href="#">Allarmi</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sensori<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="#">Sensore pressione</a></li>
          <li><a href="#">Sensore temperatura</a></li>
          <li><a href="#">Sensore umidità</a></li>
          <li><a href="#">Energia utilizzata</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>

<%@page language="java"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
        //response.setIntHeader("Refresh", 1);
           
        int lowerLimit = 60;
        int upperLimit = 90;
           
        //Generate a random value - between lower and upper limits
        double randomValue = Math.random()*100*(upperLimit-lowerLimit)/100+lowerLimit;
           
        // Next few steps, to round this double to 2 decimal places
        long factor = (long)Math.pow(10,2);
           
        // Shift the decimal the correct number of places
        // to the right.
        randomValue = randomValue * factor;
           
        // Round to the nearest integer.
        long tmp = Math.round(randomValue);
           
        // Shift the decimal the correct number of places
        // back to the left.
        long roundedRandomValue=Math.round((double)tmp / factor);
           
         
        String bar_width = "width: "+roundedRandomValue+"%;";

        out.print("<h2>Valore sensore: "+roundedRandomValue+"</h2><br/>");

           

           
           
         


%>




 <!-- jQuery e plugin JavaScript  -->
 <script src="http://code.jquery.com/jquery.js"></script>
 <script src="../bootstrap/js/bootstrap.min.js"></script>
 </body>
</html>
