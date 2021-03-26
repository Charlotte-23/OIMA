<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.ParseException.*"%>
<%@page
	import="java.sql.*,java.lang.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
</head>
<%
	String lastAg = null, agent_id = null;
	int numOfAg = 0;
	try {
		Connection con = databasecon.getconnection();
		PreparedStatement ps = con.prepareStatement("select * from agent");
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			lastAg = rs.getString("ac_no");
		}
		if (lastAg == null) {
			numOfAg = 0;
		} else {
			numOfAg = Integer.valueOf(lastAg.substring(2));
		}
		agent_id = "AG" + Integer.toString(numOfAg + 1);

	} catch (Exception e1) {
		out.println(e1.getMessage());
	}
%>

<body class="bg-light">
	<div class="container">

		<h1 class="text-center">New Agent Registration</h1><br>
		<div class="col">

			<form action="agent/agent_signup_verification.jsp" method="get"
				onsubmit="return valid()" class="needs-validation" novalidate>
				<div class="row mb-3">
					<div class="col-md-4 mb-3">
						<label for="username">Agent Account Number</label>
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><%=agent_id%></span> <input
									type="hidden" name="ac_no" value="<%=agent_id%>" />
							</div>
						</div>
					</div>
					<div class="col-md-8 mb-3">
						<label for="lastName">PassWord</label> <input type="password"
							class="form-control" name="pass" placeholder="PassWord" value=""
							required>
						<div class="invalid-feedback">Valid password is required.</div>
					</div>
				</div>


				<div class="row mb-3">
					<div class="col-md-2 mb-3">
						<label for="zip">Full Name</label> <input type="text"
							class="form-control" name="fullname" placeholder="" required>
						<div class="invalid-feedback">FullName required.</div>
					</div>
					<div class="col-md-2 mb-3">
						<label for="zip">Bank</label> <input type="text"
							class="form-control" name="bank" placeholder="" required>
						<div class="invalid-feedback">Bank required.</div>
					</div>
					<div class="col-md-2 mb-3">
						<label for="zip">Occupation</label> <input type="text"
							class="form-control" name="occu" placeholder=""
							required>
						<div class="invalid-feedback">Occupation required.</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="zip">Age</label> <input type="number"
							class="form-control" name="age" placeholder="" required>
						<div class="invalid-feedback">Age required.</div>
					</div>
					<div class="col-md-3 mb-3">
						<label for="zip">Sex</label>
						<div class="form-group">
							<select class="form-control" name="sex">
								<option>Male</option>
								<option>Female</option>
							</select>
						</div>
					</div>
					</div>

					<div class="row mb-3">
						<div class="col-md-6 mb-3">
							<label for="lastName">Phone Number</label> <input type="text"
								class="form-control" name="mobile" placeholder="Phone Number" value=""
								required>
							<div class="invalid-feedback">Valid phone number is required.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">email</label> <input type="email"
								class="form-control" name="email" placeholder="PassWord" value=""
								required>
							<div class="invalid-feedback">Valid password is required.</div>
						</div>
					</div>


					<div class="col-md-12 mb-3">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">Address</span>
							</div>
							<textarea class="form-control" name="address" required rows="5"></textarea>
							<div class="invalid-feedback">Address required.</div>
						</div>
					</div>

					<hr class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">Sign Me Up</button>
			</form>

		</div>

	</div>
</body>
</html>
