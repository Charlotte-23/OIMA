<%@ page import="java.sql.*" import="databaseconnection.*"%>
<%
	String pass = null, uid = null;
	try {
		uid = request.getParameter("uid");
		pass = request.getParameter("pass");
		session.setAttribute("uid", uid);
		session.setAttribute("pass", pass);
		Connection con = databasecon.getconnection();
		Statement st = con.createStatement();
		String sss = "select * from admin where uid='" + uid + "' && pass='" + pass + "'";

		ResultSet rs = st.executeQuery(sss);
		if (rs.next()) {
			response.sendRedirect("admin_home.jsp?view=policy");
		} else {
			response.sendRedirect("admin_login.jsp?message=fail");
		}
	} catch (Exception e1) {
		out.println(e1.getMessage());
	}
%>