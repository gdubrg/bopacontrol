
<!--Incluse librerie bootstrap e css -->
<%@ include file="lib.jsp" %>

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
      <li><a href="allarms.jsp">Allarmi</a></li>
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
    <ul class="nav navbar-nav">
    <li><a href="../View/delete_db.jsp" >Reset</a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
    <li><a href="../View/confirm.jsp" >Esci</a></li>
    </ul>
    
  </div>
</nav>

 <!-- jQuery e plugin JavaScript  -->
 <script src="bootstrap/js/query.js"></script>
 <script src="bootstrap/js/bootstrap.min.js"></script>
