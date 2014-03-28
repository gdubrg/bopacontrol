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
 <%
 response.setIntHeader("Refresh", 1);
 %>

<div id="tab">
<table class="table">
<tbody>
    <tr>
      <th>ID Sensore</th>
      <th>Nome</th>
      <th>Valore</th>
    </tr>
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
