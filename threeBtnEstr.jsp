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

<div id="btnPnl">
    <form method="post" action="detEstr.jsp">
    <button type="submit" class="btn btn-primary btn-large btn-block">Dettaglio</button>
    </form>
    <br>
    <form method="post" action="impEstr.jsp">
    <button type="submit" class="btn btn-primary btn-large btn-block">Impostazioni</button>
    </form>
    <br>
</div>
