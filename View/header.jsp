<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" ><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js" ><!--<![endif]-->
<%@ page contentType="text/html; charset=UTF-8" %>

 <head>
  <meta charset="utf-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Fogli di stile -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <link href="bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="style.css">

  <!-- Modernizr -->
  <script src="bootstrap/js/bootstrap-min.js"></script>
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
    <a class="navbar-brand" href="panel.jsp">BoPa Controller</a>
  </div>
 
  <div class="collapse navbar-collapse">
    <ul class="nav navbar-nav">
      <li><a href="#">Allarmi</a></li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Impostazioni<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="settings_sil.jsp">Silos Polimeri</a></li>
          <li><a href="settings_estr.jsp">Macchina Estrusione</a></li>
          <li><a href="settings_sta.jsp">Macchina Stampo</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dettaglio<b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="detail_sil.jsp">Silos Polimeri</a></li>
          <li><a href="detail_estr.jsp">Macchina Estrusione</a></li>
          <li><a href="detail_sta.jsp">Macchina Stampo</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>

 <!-- jQuery e plugin JavaScript  -->
 <script src="bootstrap/js/query.js"></script>
 <script src="bootstrap/js/bootstrap.min.js"></script>
