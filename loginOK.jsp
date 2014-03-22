<web-app>
<security-constraint>
	<!-- web resources that are protected -->
	<web-resource-collection>
      <web-resource-name>Protected Resource</web-resource-name>
      <url-pattern>/loginOK.jsp</url-pattern> 
   </web-resource-collection>
   <auth-constraint>
   <!--	role-name indicates roles that are allowed
	to access the web resources specified above -->
   <role-name>customer</role-name>
   </auth-constraint>
</security-constraint>
</web-app>

