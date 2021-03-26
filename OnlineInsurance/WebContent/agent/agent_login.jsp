<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<title>Online Insurance</title>

<!-- Bootstrap core CSS -->
<link href="../res/bootstrap/css/bootstrap.css" rel="stylesheet">



<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="../res/bootstrap/css/signin.css" rel="stylesheet">
</head>
<body class="text-center">
	<nav class="navbar navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="../index.jsp">Home</a>

		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Login</button>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="../holder/holder_login.jsp">Policy
					Holder</a> <a class="dropdown-item" href="../agent/agent_login.jsp">Agent</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="../admin/admin_login.jsp">Admin</a>
			</div>
		</div>
	</nav>
	<form class="form-signin" action="agent_login_verification.jsp"
		method="get" onsubmit="return valid()">
		<h1 class="h3 mb-3 font-weight-normal">Agent Login</h1>
		<label for="inputEmail" class="sr-only">ID</label> <input type="text"
			name="ac_no" class="form-control" placeholder="Agent Account Number"
			required autofocus> <label for="inputPassword"
			class="sr-only">Password</label> <input type="password" name="pass"
			class="form-control" placeholder="Password" required>
		<div class="checkbox mb-3">
			<label> <input type="checkbox" value="remember-me">
				Remember me
			</label>
		</div>

		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
			in</button>

		<%
			String message = request.getParameter("message");
			if (message == null) {
				out.println("<br><br>");
			} else {
				if (message.equals("fail")) {
					out.println("<br><font color='red'>Incorrect ID or Password.</font>");
				} else {
					out.println("<br><font color='red'>You have successfully registered!</font>");
				}
			}
		%>

		<p class="mt-5 mb-3 text-muted">&copy; Online Insurance 2020</p>
	</form>
	<script src="../res/jquery-3.5.1.slim.min.js"></script>
	<script src="../res/bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>
