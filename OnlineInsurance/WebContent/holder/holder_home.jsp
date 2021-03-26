<%@ page import="java.sql.*" import="databaseconnection.*"%>
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

<!-- Check if current user is a logged-in admin. -->
<%
	String ac_no = null, pass = null, fullName = null, reg = null, policy_type = null, policy_scheme = null, agent_id = null,
			occu = null, age = null, sex = null, mobile = null, email = null;
	try {
		ac_no = (String) session.getAttribute("ac_no");
		pass = (String) session.getAttribute("pass");
		Connection con = databasecon.getconnection();
		Statement st = con.createStatement();
		String sss = "select * from holder where ac_no='" + ac_no + "' && pass='" + pass + "'";
		ResultSet rs = st.executeQuery(sss);

		if (!rs.next()) {
			out.println(
					"<script type=\"text/javascript\">alert(\"You are not registered policy holder, redirecting to HomePage.\");location='../index.jsp'</script>");
		} else {
			fullName = rs.getString("fullname");
			reg = rs.getString("authorize");
			policy_type = rs.getString("policy_type");
			policy_scheme = rs.getString("policy_sch");
			agent_id = rs.getString("agent_id");
			occu = rs.getString("occupation");
			age = rs.getString("age");
			sex = rs.getString("sex");
			mobile = rs.getString("mobile");
			email = rs.getString("email");
		}
	} catch (Exception e1) {
		out.println(e1);
	}
%>

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

</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark sticky-top bg-dark">
		<a class="navbar-brand" href="../index.jsp">Home</a>

		<ul class="navbar-nav mr-auto justify-content-center"></ul>

		<a class="btn btn-small btn-danger" href="../LogOut.jsp">LogOut </a>
	</nav>


	<main role="main">
		<nav class="navbar navbar-light">
			<p>
				Welcome
				<%=reg%>
				Policy Holder
				<%=fullName%>.
			</p>
		</nav>
		<%
			if (reg.equals("Registered")) {
		%>
		<h2 class="text-center">My Product Info</h2>

		<div class="container">
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Holder Id</th>
						<th scope="col">Holder Name</th>
						<th scope="col">Policy Type</th>
						<th scope="col">Policy Scheme</th>
						<th scope="col">Agent ID</th>
						<th scope="col">Occupation</th>
						<th scope="col">Age</th>
						<th scope="col">Sex</th>
						<th scope="col">Mobile</th>
						<th scope="col">Email</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td><%=ac_no%></td>
						<td><%=fullName%></td>
						<td><%=policy_type%></td>
						<td><%=policy_scheme%></td>
						<td><%=agent_id%></td>
						<td><%=occu%></td>
						<td><%=age%></td>
						<td><%=sex%></td>
						<td><%=mobile%></td>
						<td><%=email%></td>
					</tr>
				</tbody>
			</table>
			<%
				} else {
			%>

			<h2 class="text-center">Please wait until you are registered.</h2>
			<%
				}
			%>

		</div>

	</main>

	<footer class="container text-center">
		<p>&copy; Online Insurance Management System 2020</p>
	</footer>
</body>
<script src="../res/jquery-3.5.1.slim.min.js"></script>
<script src="../res/bootstrap/js/bootstrap.bundle.js"></script>
</html>
