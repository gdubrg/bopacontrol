<head>
<link rel="stylesheet" href="../View/bootstrap/css/bootstrap.css">
  <link href="../View/bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="../View/style.css">

  <!-- Modernizr -->
  <script src="../View/bootstrap/js/bootstrap-min.js"></script>
 </head>

<%
if(request.getParameter("sogliaTemp") != null){
	int n=0;
	String userPath;
	
		try{
			n = Integer.parseInt(request.getParameter("sogliaTemp"));
			request.getRequestDispatcher("../Model/write_data_sil.jsp").forward(request, response);
			//response.sendRedirect("impSil_db.jsp");
		}
		catch(Exception ex){
			request.getRequestDispatcher("../View/settings_sil_err.jsp").forward(request, response);
		}
		
		
		
}
%>
