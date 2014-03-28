<%@page language="java"%>

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
        

%>

<head> </head>

<body>
<h2> Silos </h2>
<p> <h4>Riempimento:</h4> <% out.print("<h1>roundedRandomValue</h1>"); %>

<br/><br/>
<h2> Estrusione </h2>

<br/><br/>
<h2> Stampo </h2>



</body>




</html>



























