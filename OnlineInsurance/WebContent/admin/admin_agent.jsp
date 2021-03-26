
<%@ page import="java.sql.*" import="databaseconnection.*"%>

<div class="container">
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link"
			href="admin_home.jsp?view=policy">Policies</a></li>
		<li class="nav-item"><a class="nav-link active"
			href="admin_home.jsp?view=agent">Agents</a></li>
		<li class="nav-item"><a class="nav-link"
			href="admin_home.jsp?view=holder">Policy Holders</a></li>
	</ul>
	<h2 class="text-center">Agent List</h2>
	<div class="row">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Agent Id</th>
					<th scope="col">Agent Name</th>
					<th scope="col">Bank</th>
					<th scope="col">Working Details</th>
					<th scope="col">Age</th>
					<th scope="col">Sex</th>
					<th scope="col">Mobile</th>
					<th scope="col">Email</th>
					<th scope="col">Status</th>
				</tr>
			</thead>
			<tbody>
				<%
					String id = null, name = null, bank = null, occu = null, age = null, sex = null, mobile = null,
							email = null, reg = null, auth = null;
					Connection con = null;
					Statement st = null;
					ResultSet rs = null;
					auth = request.getParameter("auth");
					if(auth != null){
						try {
							con = databasecon.getconnection();
							st = con.createStatement();
							String sql = "update agent set authorize='Registered' where ac_no='" + auth + "'";
							st.executeUpdate(sql);
						} catch (Exception e) {
							out.print(e);
						}
					}
					try {
						con = databasecon.getconnection();
						st = con.createStatement();

						String qry = "select * from agent";
						rs = st.executeQuery(qry);
						while (rs.next()) {
							id = rs.getString("ac_no");
							name = rs.getString("fullname");
							bank = rs.getString("bank");
							occu = rs.getString("working_details");
							age = rs.getString("age");
							sex = rs.getString("sex");
							mobile = rs.getString("mobile");
							email = rs.getString("email");
							reg = rs.getString("authorize");
							if (reg.equals("Unregistered")) {
								reg = "<a class=\"btn btn-primary btn-sm\" href=\"admin_home.jsp?view=agent&auth=" + id
										+ "\" role=\"button\">Autorize</a>";
							}
				%>
				<tr>
					<td><%=id%></td>
					<td><%=name%></td>
					<td><%=bank%></td>
					<td><%=occu%></td>
					<td><%=age%></td>
					<td><%=sex%></td>
					<td><%=mobile%></td>
					<td><%=email%></td>
					<td><%=reg%></td>
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