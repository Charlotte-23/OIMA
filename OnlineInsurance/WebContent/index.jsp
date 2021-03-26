<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" import="databaseconnection.*"%>
<!DOCTYPE html>
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
<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">

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
<link href="res/bootstrap/css/jumbotron.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="index.jsp">Home</a>

		<div class="dropdown">
			<button class="btn btn-primary dropdown-toggle" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Login</button>
			<div class="dropdown-menu dropdown-menu-right"
				aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="holder/holder_login.jsp">Policy
					Holder</a> <a class="dropdown-item" href="agent/agent_login.jsp">Agent</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="admin/admin_login.jsp">Admin</a>
			</div>
		</div>
	</nav>

	<main role="main">

		<!-- Main jumbotron for a primary marketing message or call to action -->
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">Welcome to Online Insurance</h1>
				<p>The Online Insurance provide security to your Life, Home,
					Motor vehicle and even more.</p>

				<div class="dropright">
					<button class="btn btn-primary btn-lg" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Sign Me Up
						&raquo;</button>
					<div class="dropdown-menu dropdown-menu-right"
						aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href="signup.jsp?mode=holder">I am
							new Policy Holder</a> <a class="dropdown-item"
							href="signup.jsp?mode=agent">I am new Agent</a>
					</div>
				</div>

			</div>
		</div>

		<div class="container">
			<div class="row">


				<%
					String name = null, details = null;
					ResultSet rs = null;
					try {
						Connection con = databasecon.getconnection();
						Statement st = con.createStatement();

						String qry = "select * from policy";
						rs = st.executeQuery(qry);
						while (rs.next()) {
							name = rs.getString("policy_name");
							details = rs.getString("details");
				%>
				<div class="col-md-4">
					<h2><%=name%></h2>
					<p><%=details%></p>
				</div>
				<%
					}
					} catch (Exception e1) {
						out.println(e1.getMessage());
					}
				%>


			</div>
			<p>
				<a class="btn btn-secondary btn-block" href="#" role="button">View
					more insurance details &raquo;</a>
			</p>
			<hr>

		</div>

	</main>

	<footer class="container text-center">
		<p>&copy; Online Insurance Management System 2020</p>
	</footer>
	<script src="res/jquery-3.5.1.slim.min.js"></script>
	<script src="res/bootstrap/js/bootstrap.bundle.js"></script>
</body>
</html>