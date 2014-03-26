<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" ><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js" ><!--<![endif]-->
<html>
 <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pannello Principale</title>

  <!-- Fogli di stile -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <link href="bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="stile.css">

  <!-- Modernizr -->
  <script src="bootstrap/js/bootstrap-min.js"></script>

  <!-- respond.js per IE8 -->
  <!--[if lt IE 9]>
  <script src="js/respond.min.js"></script>
  <![endif]-->
 </head>

<br>
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
