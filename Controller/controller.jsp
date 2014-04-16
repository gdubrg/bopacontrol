<head>
<link rel="stylesheet" href="../View/bootstrap/css/bootstrap.css">
  <link href="../View/bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="../View/style.css">

  <!-- Modernizr -->
  <script src="../View/bootstrap/js/bootstrap-min.js"></script>
 </head>

<%
if(request.getParameter("soglia_temp_silos") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_temp_silos"));
			request.getRequestDispatcher("../Model/write_data_sil.jsp").forward(request, response);	
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_sil_err.jsp");
		}		
}

else if(request.getParameter("soglia_temp_estr") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_temp_estr"));
			request.getRequestDispatcher("../Model/write_data_estr.jsp").forward(request, response);			
			//response.sendRedirect("../Model/write_data_sil.jsp");
		}
		catch(Exception ex){
			//request.getRequestDispatcher("../View/settings_sil_err.jsp").forward(request, response);
			response.sendRedirect("../View/settings_estr_err.jsp");
		}		
}

else if(request.getParameter("soglia_temp_sta") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_temp_sta"));
			request.getRequestDispatcher("../Model/write_data_sta.jsp").forward(request, response);			
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_sta_err.jsp");
			//out.print(ex);
		}		
}
%>
