<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
</head>

<body>
<br>
	<div class="panel-body form-group col-sm-12">
		<form action="Login" id="loginForm" name="loginForm" method="post">
			<table>
				<tr>
					<td><label for="name">User ID:</label></td>
					<td><input type="text" class="form-control " id="userid"
						name="userid"></td>
				</tr>
				<tr>
					<td><label for="userpass">Password:</label></td>
					<td><input type="password" class="form-control" id="userpass"
						name="userpass"></td>
				</tr>
				<tr>
					<td></td>
					<td><button id="loginBtn" type="submit"
							class="btn btn-primary">Login</button></td>
				</tr>
			</table>

		</form>
	</div>
</body>



<script type="text/javascript">
	$("#loginBtn").click(function() {

		$("form[name='loginForm']").validate({
			// Specify validation rules
			rules : {
				userid : {
					required : true
				},
				userpass : {
					required : true,
					minlength : 5,
					maxlength : 20
				}
			},
			// Specify validation error messages
			messages : {
				userid : "Please enter your user ID",
				userpass : {
						required : "Please provide a password",
						minlength : "Your password must be at least 5 characters long",
						maxlength : "Your password must not more than 20 characters"
				},
												
				submitHandler : function(form) {
					form.submit();
				}
			}
		});
	});
</script>
</html>