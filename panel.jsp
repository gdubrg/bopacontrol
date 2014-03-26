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
<br>
<div class="btn-toolbar">
<div class="btn-group">
  <button type="button" class="btn btn-default">Home</button>
  <button type="button" class="btn btn-default">Impostazioni</button>
</div>
<div class="btn-group">
  <button type="button" class="btn btn-default">Silos Polimeri</button>
  <button type="button" class="btn btn-default">Macchina Estrusione</button>
  <button type="button" class="btn btn-default">Macchina Stampo</button>
</div>
</div>

<div id="pnlTop">
<h1>Pannello di controllo</h1>
</div>

<div id="imgTop">
<img src="img/ingmoul.png" class="img-responsive">
</div>

<div id="cont">
<div id="pnlRight">
<h2>Macchina Stampo</h2>
<p>Qui vengono inserite le variabili di controllo</p>
<input class="btn btn-default" type="submit" value="Storico">
<br>
<input class="btn btn-default" type="submit" value="STOP">
</div>
<div id="pnlCenter">
<h2>Macchina Estrusione</h2>
<p>Qui ci vanno i controlli della macchina di estrusione</p>
<input class="btn btn-default" type="submit" value="Storico">
<br>
<input class="btn btn-default" type="submit" value="STOP">
</div>
</div>

<div id="pnlLeft">
<h2>Silos Polimeri</h2>
<p>Variabili di controllo</p>

<div id="tab">
<table class="table">
  <thead>
    <tr>
      <th>ID Sensore</th>
      <th>Nome</th>
      <th>Valore</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>001</td>
      <td>Temp</td>
      <td>500</td>
    </tr>
    <tr>
      <td>002</td>
      <td>Liv</td>
      <td>400</td>
    </tr>
    <tr>
      <td>003</td>
      <td>Ext</td>
      <td>0.02</td>
    </tr>
  </tbody>
</table>
</div>

</div>


<div id="pnlDown">
<h3>Impostazioni Generali</h3>
</div>





