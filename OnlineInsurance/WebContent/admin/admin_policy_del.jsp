<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*"%>>


<%
	Connection con = null;

	PreparedStatement psmt1 = null;

	try {
		con = databasecon.getconnection();

		String sql = "delete from policy where policy_id='" + request.getParameter("policy_id") + "'";
		psmt1 = con.prepareStatement(sql);

		psmt1.executeUpdate();
		response.sendRedirect("admin_home.jsp?view=policy");

	} catch (Exception ex) {

		out.println("Error in connection : " + ex);

	}
%>
