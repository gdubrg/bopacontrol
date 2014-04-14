<%
if(request.getParameter("sogliaTemp") != null){
	int n=0;
	String userPath;
	
		try{
			n = Integer.parseInt(request.getParameter("sogliaTemp"));
			%><jsp:forward page="/impSil.jsp" /><%
		}
		catch(Exception ex){
			%><jsp:forward page="/impSilErr.jsp" /><%
		}
		
}
%>
