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
	String uid = null, pass = null, view = null;
	try {
		uid = (String) session.getAttribute("uid");
		pass = (String) session.getAttribute("pass");
		view = "admin_" + request.getParameter("view") + ".jsp";
		Connection con = databasecon.getconnection();
		Statement st = con.createStatement();
		String sss = "select * from admin where uid='" + uid + "' && pass='" + pass + "'";
		ResultSet rs = st.executeQuery(sss);
		if (!rs.next()) {
			out.println(
					"<script type=\"text/javascript\">alert(\"You are not admin, redirecting to HomePage.\");location='../index.jsp'</script>");
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
				Welcome,
				<%=uid%>
			</p>
		</nav>

		<jsp:include page="<%=view%>" />

	</main>

	<footer class="container text-center">
		<p>&copy; Online Insurance Management System 2020</p>
	</footer>
</body>
<script src="../res/jquery-3.5.1.slim.min.js"></script>
<script src="../res/bootstrap/js/bootstrap.bundle.js"></script>
</html>
