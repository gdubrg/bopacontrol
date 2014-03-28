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

 <body>
<%@ include file="header.jsp" %>

<div id="pnlTop">
    <h1>Pannello di controllo</h1>
</div>

<div id="infoSisSx">
    <h2>Stato del sistema: <b>OK</b></h2>
    <button type="button" class="btn btn-primary btn-lg btn-success">START</button>
    &nbsp;&nbsp;&nbsp;
    <button type="button" class="btn btn-primary btn-lg btn-danger">STOP</button>
</div>


<div id="infoSisDx">
    <div id="imgTop">
        
<img src="img/ingmoul.gif" class="img-responsive">
    </div>
    <div id="alrm">
    <h2><b>Allarmi</b></h2>
    </div>
</div>

<div id="cont">
<div id="pnlRight">
<h2><b>Macchina Stampo</b></h2>
<p>Qui vengono inserite le variabili di controllo</p>
<%@ include file="tblSns.jsp" %>
<%@ include file="threeBtn.jsp" %>
</div>
<div id="pnlCenter">
<h2><b>Macchina Estrusione</b></h2>
<p>Qui ci vanno i controlli della macchina di estrusione</p>
<%@ include file="tblSns.jsp" %>
<%@ include file="threeBtn.jsp" %>
</div>
</div>

<div id="pnlLeft">
<h2><b>Silos Polimeri</b></h2>
<p>Variabili di controllo</p>

<%@ include file="tblSns.jsp" %>
<%@ include file="threeBtn.jsp" %>

</div>


<div id="pnlDown">
<h5>BoPa C0ntroller - Progetto SAR 2014 - Guido Borghi, Andrea Palazzi</h5>
</div>








