
<%@ page import="java.sql.*" import="databaseconnection.*"%>
<div class="container">
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="admin_home.jsp?view=policy">Policies</a></li>
		<li class="nav-item"><a class="nav-link"
			href="admin_home.jsp?view=agent">Agents</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="admin_home.jsp?view=holder">Policy Holders</a></li>
	</ul>
	<h2 class="text-center">Policy Holder List</h2>
	<div class="row">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Holder Id</th>
					<th scope="col">Holder Name</th>
					<th scope="col">Policy Type</th>
					<th scope="col">Policy Scheme</th>
					<th scope="col">Occupation</th>
					<th scope="col">Age</th>
					<th scope="col">Sex</th>
					<th scope="col">Mobile</th>
					<th scope="col">Email</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody>
				<%
					String id = null, name = null, policy_type = null, policy_scheme = null, agent_id = null, occu = null,
							age = null, sex = null, mobile = null, email = null, reg = null, auth = null;
					ResultSet rs = null;
					Connection con = null;
					Statement st = null;
					auth = request.getParameter("auth");
					agent_id = request.getParameter("agent_id");
					if(auth != null){
						try {
							con = databasecon.getconnection();
							st = con.createStatement();
							String sql = "update holder set authorize='Registered', agent_id='" + agent_id + "' where ac_no='" + auth + "'";
							st.executeUpdate(sql);
						} catch (Exception e) {
							out.print(e);
						}
					}
					try {
						con = databasecon.getconnection();
						st = con.createStatement();

						String qry = "select * from holder";
						rs = st.executeQuery(qry);
						while (rs.next()) {
							id = rs.getString("ac_no");
							name = rs.getString("fullname");
							policy_type = rs.getString("policy_type");
							policy_scheme = rs.getString("policy_sch");
							agent_id = rs.getString("agent_id");
							occu = rs.getString("occupation");
							age = rs.getString("age");
							sex = rs.getString("sex");
							mobile = rs.getString("mobile");
							email = rs.getString("email");
							reg = rs.getString("authorize");
				%>
				<tr>
					<td><%=id%></td>
					<td><%=name%></td>
					<td><%=policy_type%></td>
					<td><%=policy_scheme%></td>
					<td><%=occu%></td>
					<td><%=age%></td>
					<td><%=sex%></td>
					<td><%=mobile%></td>
					<td><%=email%></td>
					<td>
						<%
							if (reg.equals("Unregistered")) {
						%>
						<form action="admin_home.jsp" method="get"
							onsubmit="return valid()" class="needs-validation" novalidate>
							<input type="hidden" name="view" value="holder" /> <input
								type="hidden" name="auth" value="<%=id%>" />
							<div class="form-group">
								<label for="exampleFormControlSelect1">Assign to</label> <select
									class="form-control" name="agent_id">
									<%
										Statement st2 = con.createStatement();
													String sql = "select * from agent where authorize='Registered'";
													ResultSet rs2 = null;
													rs2 = st2.executeQuery(sql);
													String agent = null;
													while (rs2.next()) {
														agent = rs2.getString("ac_no");
									%>
									<option><%=agent%></option>
									<%
										}
									%>
								</select>
							</div>

							<button class="btn btn-primary btn-sm" type="submit">Authorize</button>
						</form> <%
 	} else {
 %> Registerd to Agent <%=agent_id%> <%
 	}
 %>

					</td>
				</tr>
				<%
					}
					} catch (Exception e1) {
						out.println(e1.getMessage());
					}
				%>
			</tbody>
		</table>

	</div>

</div>