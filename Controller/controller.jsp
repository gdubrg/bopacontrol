<%
if(request.getParameter("sogliaTemp") != null){
	int n=0;
	String userPath;
	
		try{
			n = Integer.parseInt(request.getParameter("sogliaTemp"));
			request.getRequestDispatcher("impSil_db.jsp").forward(request, response);
			//response.sendRedirect("impSil_db.jsp");
		}
		catch(Exception ex){
			request.getRequestDispatcher("impSilErr.jsp").forward(request, response);
		}
		
		
		
}
%>
