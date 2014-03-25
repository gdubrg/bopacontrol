<%@ include file="headerempty.jsp" %>

<%String erru =session.getAttribute("erru").toString();%>
<%String errp1 =session.getAttribute("errp1").toString();%>
<%String errp2 =session.getAttribute("errp2").toString();%>
<%String erre =session.getAttribute("erre").toString();%>
<%String errl =session.getAttribute("errl").toString();%>
<%String errf =session.getAttribute("errf").toString();%>
<%String usernameins =session.getAttribute("usernameins").toString();%>
<%String password1 =session.getAttribute("password1").toString();%>
<%String password2 =session.getAttribute("password2").toString();%>
<%String email =session.getAttribute("email").toString();%>
<%String ln =session.getAttribute("lastName").toString();%>
<%String fn =session.getAttribute("firstName").toString();%>

<div id="content">
	<h4>User Registration</h4>
	<form name="registerform" action="ControllerServlet" method=post>
	<input type="hidden" name="op" value="reg">
	<table class="table">
		<tr>
			<td>First Name</td> 
			<td><input type="text" name="firstName" value='<%=fn%>' maxlength=20></td>
			<td><font size=1 color=red><%=errf%></font></td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td><input type="text" name="lastName" value='<%=ln%>' maxlength=20></td>
			<td><font size=1 color=red><%=errl%></font></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" value='<%=email%>' maxlength=125></td>
			<td><font size=1 color=red><%=erre%></font></td>
		</tr>
		<tr>
			<td>Username</td>
			<td><input type="text" name="usernameins" value='<%=usernameins%>' maxlength=10></td>
			<td><font size=1 color=red><%=erru%></font></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="password1" value='<%=password1%>' maxlength=10></td>
			<td><font size=1 color=red><%=errp1%></font></td>
		</tr>
		<tr>
			<td>Confirm Password</td>
			<td><input type="password" name="password2" value='<%=password2%>' maxlength=10></td>
			<td><font size=1 color=red><%=errp2%></font></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="Submit"></td>
		</tr>
	</table>
	</form>

<a href="ControllerServlet?op=loginreturn" class="reminder">Ti sei già registrato in precedenza? Clicca qui</a>

</div>	
</body>
</html>


