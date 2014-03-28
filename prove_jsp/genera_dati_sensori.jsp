<%@page language="java"%>

<html>
<%
        response.setIntHeader("Refresh", 3);
        
        // Dichiarazione limiti dei sensori
        int lowerTempLimit = 400;
        int upperTempLimit = 500;
        
        int lowerPressureLimit = 10;
        int upperPressureLimit = 12;
        
        int lowerEnergyLimit = 3000;
        int upperEnergyLimit = 3500;
        
        long factor = (long)Math.pow(10,2);
        
        // TEMPERATURA
        double randomTempValue = Math.random()*100*(upperTempLimit-lowerTempLimit)/100+lowerTempLimit;

        randomTempValue = randomTempValue * factor;

        long tmp1 = Math.round(randomTempValue);

        double roundedTempRandomValue=Math.round((double)tmp1 / factor);
        
        // PRESSIONE
        double randomPressureValue = Math.random()*100*(upperPressureLimit-lowerPressureLimit)/100+lowerPressureLimit;

        randomPressureValue = randomPressureValue * factor;

        long tmp2 = Math.round(randomPressureValue);

        double roundedPressureRandomValue=Math.round((double)tmp2 / factor);
        
        // ENERGIA
        double randomEnergyValue = Math.random()*100*(upperEnergyLimit-lowerEnergyLimit)/100+lowerEnergyLimit;

        randomEnergyValue = randomEnergyValue * factor;

        long tmp3 = Math.round(randomEnergyValue);

        double roundedEnergyRandomValue=Math.round((double)tmp3 / factor);
        

%>

<head> </head>

<body>

<%= "Temperatura [K]:&nbsp&nbsp&nbsp<b>"+roundedTempRandomValue+"</b>" %>
<br/><br>
<%= "Pressione [Bar]:&nbsp&nbsp&nbsp&nbsp<b>"+roundedPressureRandomValue+"</b>" %>
<br/><br>
<%= "Energia [W]:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b>"+roundedEnergyRandomValue+"</b>" %>


</body>




</html>



























