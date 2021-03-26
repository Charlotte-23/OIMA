<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.Date.*,java.text.SimpleDateFormat.*,java.text.ParseException.*"%>
<%@page
	import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<%
	java.util.Date now = new java.util.Date();
	String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
	String strDateNew1 = sdf1.format(now);
	String lastPo = null, policy_id = null;
	int numOfPo = 0;
	try {
		Connection con = databasecon.getconnection();
		PreparedStatement ps = con.prepareStatement("select * from policy");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			lastPo = rs.getString("policy_id");
		}
		if (lastPo == null) {
			numOfPo = 0;
		} else {
			numOfPo = Integer.valueOf(lastPo.substring(2));
		}
		policy_id = "PO" + Integer.toString(numOfPo + 1);

	} catch (Exception e1) {
		out.println(e1.getMessage());
	}
%>

<body class="bg-light">
	<div class="container">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				href="admin_home.jsp?view=policy">Policies</a></li>
			<li class="nav-item"><a class="nav-link"
				href="admin_home.jsp?view=agent">Agents</a></li>
			<li class="nav-item"><a class="nav-link"
				href="admin_home.jsp?view=holder">Policy Holders</a></li>
		</ul>
		<h2 class="text-center">Add New Policy</h2>
		<div class="col">

			<form action="admin_newpolicy_verification.jsp" method="get"
				onsubmit="return valid()" class="needs-validation" novalidate>
				<div class="row mb-3">
					<div class="col-md-2 mb-3">
						<label for="username">Policy ID</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><%=policy_id%></span>
								<input type="hidden" name="policy_id" value="<%=policy_id %>" />
							</div>
						</div>
					</div>
					<div class="col-md-10 mb-3">
						<label for="lastName">Policy Name</label> <input type="text"
							class="form-control" name="policy_name" placeholder="Policy Name"
							value="" required>
						<div class="invalid-feedback">Valid name is required.</div>
					</div>
				</div>


				<div class="row mb-3">
					<div class="col-md-2 mb-3">
						<label for="zip">Weekly Interest</label> <input type="text"
							class="form-control" name="w_i" placeholder="" required>
						<div class="invalid-feedback">Interest required.</div>
					</div>
					<div class="col-md-2 mb-3">
						<label for="zip">Monthly Interest</label> <input type="text"
							class="form-control" name="m_i" placeholder="" required>
						<div class="invalid-feedback">Interest required.</div>
					</div>
					<div class="col-md-2 mb-3">
						<label for="zip">Quarter Interest</label> <input type="text"
							class="form-control" name="q_i" placeholder="" required>
						<div class="invalid-feedback">Interest required.</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="zip">Half Year Interest</label> <input type="text"
							class="form-control" name="h_i" placeholder="" required>
						<div class="invalid-feedback">Interest required.</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="zip">Year Interest</label> <input type="text"
							class="form-control" name="y_i" placeholder="" required>
						<div class="invalid-feedback">Interest required.</div>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-md-12 mb-3">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">Details</span>
							</div>
							<textarea class="form-control" name="details" required rows="5"></textarea>
							<div class="invalid-feedback">Details required.</div>
						</div>
					</div>

					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">Add</button>
				</div>
			</form>

		</div>

	</div>

	<script src="../res/jquery-3.5.1.slim.min.js"></script>
	<script src="../res/bootstrap/js/bootstrap.bundle.js"></script>
	<script src="../res/bootstrap/js/form-validation.js"></script>
</body>
</html>
