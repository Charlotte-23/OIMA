<%
	String empty = "";
	session.setAttribute("uid", empty);
	session.setAttribute("ac_no", empty);
	session.setAttribute("pass", empty);
	out.println("<script type=\"text/javascript\">");
	out.println("alert(\"You are safely logged out, redirecting to HomePage.\");");
	out.println("location='index.jsp'</script>");
%>