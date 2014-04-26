<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en" ><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js" ><!--<![endif]-->
<html>
 <head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Fogli di stile -->
  <link rel="stylesheet" href="View/bootstrap/css/bootstrap.css">
  <link href="View/bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="View/style.css">

  <!-- Modernizr -->
  <script src="View/bootstrap/js/bootstrap-min.js"></script>

  <!-- jQuery e plugin JavaScript  -->
 <script src="View/bootstrap/js/query.js"></script>
 <script src="View/bootstrap/js/bootstrap.min.js"></script>
 </head>
 
 <body>
 <div id="loginTop">
 <p>BoPa Controller</p>
 </div>
 <br>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="View/img/1.jpg" alt="">
      <div class="carousel-caption">
      </div>
    </div>
<div class="item">
      <img src="View/img/2.jpg" alt="">
      <div class="carousel-caption">
      </div>
    </div>
<div class="item">
      <img src="View/img/3.jpg" alt="">
      <div class="carousel-caption">
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
    <span class="icon-prev"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
    <span class="icon-next"></span>
  </a>
</div>

    <div id="loginBottom">
            <p>Inserisci il numero della tessera</p>
            <form action="Controller/controller.jsp" method="post">
             Numero:&nbsp;<input type="text" name="numTessera">
            <input type="submit" value="Submit">
            </form>
            <%if(session.getAttribute("loginOk") == "0")
            out.print("<p><font color=red>Attenzione, numero della tessera non valido!</p></font>");%>
            </div>
    </body>
</html>


