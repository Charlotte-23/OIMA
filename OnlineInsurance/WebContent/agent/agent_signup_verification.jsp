<%@ page
	import="java.util.Date.*,java.text.SimpleDateFormat.*,java.text.ParseException.*"%>
<%@page
	import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@ page
	import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>
<%
	java.util.Date now = new java.util.Date();
	String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
	String strDateNew1 = sdf1.format(now);
	
	Connection con = null;
	PreparedStatement psmt = null;

	String ac_no = null, pass = null, fullname = null, bank = null, occu = null, age = null, sex = null,
			mobile = null, email = null, address = null;
	try {
		ac_no = request.getParameter("ac_no");
		pass = request.getParameter("pass");
		fullname = request.getParameter("fullname");
		bank = request.getParameter("bank");
		occu = request.getParameter("occu");
		age = request.getParameter("age");
		sex = request.getParameter("sex");
		mobile = request.getParameter("mobile");
		email = request.getParameter("email");
		address = request.getParameter("address");

		con = databasecon.getconnection();
		psmt = con.prepareStatement("insert into `agent` values(?,?,?,?,?,?,?,?,?,?,?,?)");
		psmt.setString(1, ac_no);
		psmt.setString(2, pass);
		psmt.setString(3, fullname);
		psmt.setString(4, bank);
		psmt.setString(5, occu);
		psmt.setString(6, age);
		psmt.setString(7, sex);
		psmt.setString(8, address);
		psmt.setString(9, mobile);
		psmt.setString(10, email);
		psmt.setString(11, strDateNew1);
		psmt.setString(12, "Unregistered");

		psmt.executeUpdate();
		response.sendRedirect("agent_login.jsp?message=signup");
	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>