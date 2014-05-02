<head>
<link rel="stylesheet" href="../View/bootstrap/css/bootstrap.css">
  <link href="../View/bootstrap/css/stili-custom.css" rel="stylesheet" media="screen">
  <link rel="stylesheet" href="../View/style.css">
  <%@ page import = "java.text.*" %>
  <%@ page import = "java.util.*" %>

  <!-- Modernizr -->
  <script src="../View/bootstrap/js/bootstrap-min.js"></script>
 </head>

<%
// --------------- LOGIN ----------------
if(request.getParameter("numTessera") != null){
	int n=0;
		try{
			n = Integer.parseInt(request.getParameter("numTessera"));
			session.setAttribute("numTessera", n);	
				
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
			String data = sdf.format(new Date());
			
			session.setAttribute("ultimoAcc", data);
			response.sendRedirect("../View/panel.jsp");	
		}
		catch(Exception ex){
			session.setAttribute("loginOk", "0");
			response.sendRedirect("../index.jsp");
		}
}

// --------------- LOGOUT ----------------
else if(request.getParameter("uscita") != null){
	session.invalidate();
	response.sendRedirect("../index.jsp");
}

// --------------- SOGLIE SILOS ----------------
else if(request.getParameter("soglia_temp_silos") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_temp_silos"));
			if (n < 0 || n > 50) 
				response.sendRedirect("../View/settings_sil_err.jsp");
			else
				request.getRequestDispatcher("../Model/write_data_sil.jsp").forward(request, response);	
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_sil_err.jsp");
		}		
}

else if(request.getParameter("soglia_car_silos") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_car_silos"));
			if (n < 0 || n > 1000) 
				response.sendRedirect("../View/settings_sil_err.jsp");
			else
				request.getRequestDispatcher("../Model/write_data_sil.jsp").forward(request, response);	
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_sil_err.jsp");
		}		
}

else if(request.getParameter("soglia_pot_silos") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_pot_silos"));
			if (n < 0 || n > 20) 
				response.sendRedirect("../View/settings_sil_err.jsp");
			else
				request.getRequestDispatcher("../Model/write_data_sil.jsp").forward(request, response);			
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_sil_err.jsp");
		}		
}

//--------------- SOGLIE ESTRUSORE ---------------
else if(request.getParameter("soglia_temp_estr") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_temp_estr"));
			if (n < 100 || n > 700)
				response.sendRedirect("../View/settings_estr_err.jsp");
			else
				request.getRequestDispatcher("../Model/write_data_estr.jsp").forward(request, response);			
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_estr_err.jsp");
		}		
}

else if(request.getParameter("soglia_press_estr") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_press_estr"));
			if (n < 800 || n > 1500)
				response.sendRedirect("../View/settings_estr_err.jsp");
			else
				request.getRequestDispatcher("../Model/write_data_estr.jsp").forward(request, response);			
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_estr_err.jsp");
		}		
}

else if(request.getParameter("soglia_pot_estr") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_pot_estr"));
			if (n < 0 || n > 20)
				response.sendRedirect("../View/settings_estr_err.jsp");
			else
				request.getRequestDispatcher("../Model/write_data_estr.jsp").forward(request, response);			
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_estr_err.jsp");
		}		
}

//--------------- SOGLIE STAMPO --------------- 
else if(request.getParameter("soglia_temp_sta") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_temp_sta"));
			if ( n < 0 || n > 600)
				response.sendRedirect("../View/settings_sta_err.jsp");
			else
				request.getRequestDispatcher("../Model/write_data_sta.jsp").forward(request, response);			
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_sta_err.jsp");
		}		
}

else if(request.getParameter("soglia_press_sta") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_press_sta"));
			if ( n < 0 || n > 500)
				response.sendRedirect("../View/settings_sta_err.jsp");
			else
				request.getRequestDispatcher("../Model/write_data_sta.jsp").forward(request, response);				
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_sta_err.jsp");
		}		
}

else if(request.getParameter("soglia_pot_sta") != null){
	int n=0;	
		try{
			n = Integer.parseInt(request.getParameter("soglia_pot_sta"));
			if ( n < 0 || n > 20)
				response.sendRedirect("../View/settings_sta_err.jsp");
			else
				request.getRequestDispatcher("../Model/write_data_sta.jsp").forward(request, response);			
		}
		catch(Exception ex){
			response.sendRedirect("../View/settings_sta_err.jsp");
		}		
}

//--------------- STORICO SILOS---------------
else if(request.getParameter("storico_silos") != null){
	session.setAttribute("data_inizio", request.getParameter("data1"));
	response.sendRedirect("../View/history_silos.jsp");
}
	
//--------------- STORICO ESTRUSORE---------------
else if(request.getParameter("storico_estr") != null){
	session.setAttribute("data_inizio", request.getParameter("data1"));
	response.sendRedirect("../View/history_estr.jsp");
}

//--------------- STORICO STAMPO---------------
else if(request.getParameter("storico_sta") != null){
	session.setAttribute("data_inizio", request.getParameter("data1"));
	response.sendRedirect("../View/history_sta.jsp");
}

//--------------- CANCELLA LOG ALLARMI---------------
else if(request.getParameter("cancella_allarmi") != null){
	response.sendRedirect("../Model/delete_alarms.jsp");
}

//--------------- CANCELLA LOG ESTRUSORE---------------
else if(request.getParameter("cancella_sensori") != null){
	response.sendRedirect("../Model/delete_sensors.jsp");
}

%>
