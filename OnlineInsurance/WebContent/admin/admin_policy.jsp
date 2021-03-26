<%@ page import="java.sql.*" import="databaseconnection.*"%>
<div class="container">
	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active"
			href="admin_home.jsp?view=policy">Policies</a></li>
		<li class="nav-item"><a class="nav-link"
			href="admin_home.jsp?view=agent">Agents</a></li>
		<li class="nav-item"><a class="nav-link"
			href="admin_home.jsp?view=holder">Policy Holders</a></li>
	</ul>
	<h2 class="text-center">Current Policy</h2>
	<div class="row">
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Policy Id</th>
					<th scope="col">Policy Name</th>
					<th scope="col">Weekly Interest</th>
					<th scope="col">Monthly Interest</th>
					<th scope="col">Quarterly Interest</th>
					<th scope="col">Half Year Interest</th>
					<th scope="col">Year Interest</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>

				<%
					String id = null, name = null, w_i = null, m_i = null, q_i = null, h_i = null, y_i = null;
					ResultSet rs = null;
					try {
						Connection con = databasecon.getconnection();
						Statement st = con.createStatement();

						String qry = "select * from policy";
						rs = st.executeQuery(qry);
						while (rs.next()) {
							id = rs.getString("policy_id");
							name = rs.getString("policy_name");
							w_i = rs.getString("weekly_interest");
							m_i = rs.getString("monthly_interest");
							q_i = rs.getString("quarter_interest");
							h_i = rs.getString("half_interest");
							y_i = rs.getString("year_interest");
				%>
				<tr>
					<td><%=id%></td>
					<td><%=name%></td>
					<td><%=w_i%></td>
					<td><%=m_i%></td>
					<td><%=q_i%></td>
					<td><%=h_i%></td>
					<td><%=y_i%></td>
					<td><a class="btn btn-danger btn-sm"
						href="admin_policy_del.jsp?policy_id=<%=id %>" role="button">Del</a></td>
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

	<p>
		<a class="btn btn-primary btn-block"
			href="admin_home.jsp?view=newpolicy" role="button">Add new policy
			&raquo;</a>
	</p>

</div>