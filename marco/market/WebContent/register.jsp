<%@ include file="headerempty.jsp" %>
<div id="content">
	<h4>User Registration</h4>
	<form name="registerform" method=post action="ControllerServlet" >
	<input type="hidden" name="op" value="reg">
	<table class="table">
		<tr>
			<td>First Name</td> 
			<td><input type="text" name="firstName" value="" maxlength=20></td>
		</tr>
		<tr>
			<td>Last Name</td>
			<td><input type="text" name="lastName" value="" maxlength=20></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><input type="text" name="email" value="" maxlength=125></td>
		</tr>
		<tr>
			<td>Username</td>
			<td><input type="text" name="usernameins" value="" maxlength=10></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="password1" value="" maxlength=10></td>
		</tr>
		<tr>
			<td>Confirm Password</td>
			<td><input type="password" name="password2" value="" maxlength=10></td>
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

