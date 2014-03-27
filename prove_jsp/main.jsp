<html>
   <head>
      <title> Reading Checkbox Data </title>
   </head>
   <body>
      <center>
      <h1> Reading Checkbox Data </h1>
      <ul>
      
      <li><p>Maths Flag:
      <% if(request.getParameter("maths")!=null){ %>
      YES MATH
      <% } else { %>
      NO MATH
      <% } %>
      </p></li>
      
      <li><p>Physics Flag:
      <% if(request.getParameter("physics")!=null){ %>
      YES PHYSICS
      <% } else { %>
      NO PHYSICS
      <% } %>
      </p></li>
      
      <li><p>Chemistry Flag:
      <% if(request.getParameter("chemistry")!=null){ %>
      YES CHEMISTRY
      <% } else { %>
      NO CHEMISTRY
      <% } %>
      </p></li>
      

      </ul>
   </body>
</html>
