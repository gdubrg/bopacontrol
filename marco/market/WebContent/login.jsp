<%@ include file="headerempty.jsp" %>

<div id="content">
	<h4>User Authentication</h4>
    <form name="loginform"  method="post" action="ControllerServlet">
        <input type="hidden" name="op" value="login">
        <table class="table">
        	<tr>
                <td><br>User</td>
            </tr>
            <tr>
                <td><input type="text" name="username" value=""><br></td>
            </tr>
            <tr>
                <td>Password</td>
            </tr>
            <tr>
                <td><input type="password" name="password1" value=""><br><br></td>
            </tr>
            <tr>
                <td><input type="submit" name="Submit" value="Login"><br><br></td>
            </tr>
        </table>
    </form>
    <a href="ControllerServlet?op=regmodule" class="reminder">Non sei ancora registrato? Clicca qui</a>
</div>

</body>
</html>