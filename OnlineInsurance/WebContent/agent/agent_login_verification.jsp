<%@ page import="java.sql.*" import="databaseconnection.*"%>
<%
	String ac_no = null, pass = null;
	try {
		ac_no = request.getParameter("ac_no");
		pass = request.getParameter("pass");

		Connection con = databasecon.getconnection();
		Statement st = con.createStatement();

		String sss = "select * from agent where ac_no='" + ac_no + "' && pass='" + pass + "'";

		ResultSet rs = st.executeQuery(sss);
		if (rs.next()) {
			ResultSet rs1 = st.executeQuery(sss);
			while (rs1.next()) {
				session.setAttribute("ac_no", ac_no);
				session.setAttribute("pass", pass);
			}
			response.sendRedirect("agent_home.jsp");
		} else {
			response.sendRedirect("agent_login.jsp?message=fail");
		}
	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>