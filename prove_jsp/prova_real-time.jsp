<%@page language="java"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.SimpleDateFormat" %>
<html>
<%
        response.setIntHeader("Refresh", 1);
        
        int lowerLimit = 1;
        int upperLimit = 100;
        
        //Generate a random value - between lower and upper limits
        double randomValue = Math.random()*100*(upperLimit-lowerLimit)/100+lowerLimit;
        
        // Next few steps, to round this double to 2 decimal places
        long factor = (long)Math.pow(10,2);
        
        // Shift the decimal the correct number of places
        // to the right.
        randomValue = randomValue * factor;
        
        // Round to the nearest integer.
        long tmp = Math.round(randomValue);
        
        // Shift the decimal the correct number of places
        // back to the left.
        double roundedRandomValue=Math.round((double)tmp / factor);
        
        //Get label for the data - time in format HH:mm:ss
        Calendar cal = Calendar.getInstance();
        
        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        String timeLabel = sdf.format(cal.getTime());
        
        String dataParameters = "&label=" +timeLabel+ "&value=" +roundedRandomValue;
        //Now write it to output stream
        
        out.print(dataParameters);
        

</div>"
%>


</html>















