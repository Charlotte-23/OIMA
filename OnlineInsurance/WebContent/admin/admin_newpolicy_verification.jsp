<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*" %>>


<%
	Connection con = null;

	PreparedStatement psmt1 = null;

	String policy_id = request.getParameter("policy_id");
	String policy_name = request.getParameter("policy_name");
	String w_i = request.getParameter("w_i");
	String m_i = request.getParameter("m_i");
	String q_i = request.getParameter("q_i");
	String h_i = request.getParameter("h_i");
	String y_i = request.getParameter("y_i");

	String details = request.getParameter("details");
	String ff = "unregistered";

	try {
		con = databasecon.getconnection();

		psmt1 = con.prepareStatement("insert into `policy` values(?,?,?,?,?,?,?,?)");
		psmt1.setString(1, policy_id);
		psmt1.setString(2, policy_name);
		psmt1.setString(3, w_i);
		psmt1.setString(4, m_i);
		psmt1.setString(5, q_i);
		psmt1.setString(6, h_i);
		psmt1.setString(7, y_i);
		psmt1.setString(8, details);

		psmt1.executeUpdate();
		response.sendRedirect("admin_home.jsp?view=policy");

	} catch (Exception ex) {

		out.println("Error in connection : " + ex);

	}
%>
