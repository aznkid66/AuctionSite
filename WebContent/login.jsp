<%@ page import ="java.sql.*" %>
<%
String userid = request.getParameter("uname");
String pwd = request.getParameter("pass");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
"root", "BecauseCBC2");
Statement st = con.createStatement();
ResultSet rs;
if (userid.equals("admin")) {
	rs = st.executeQuery("select * from Admin a where a.username='" + userid + "' and a.password='" + pwd + "'");
	if (rs.next()) {
		session.setAttribute("userid", userid);
		//out.println("welcome " + userid);
		//out.println("<a href='logout.jsp'>Log out</a>");
		response.sendRedirect("admin.jsp");
	}
} else {
	rs = st.executeQuery("select * from CustomerRep cr where cr.username='" + userid + "' and cr.password='" + pwd + "'");
	if (rs.next()) {
		session.setAttribute("userid", userid);
		//out.println("welcome " + userid);
		//out.println("<a href='logout.jsp'>Log out</a>");
		response.sendRedirect("custrep.jsp");
	}
}
rs = st.executeQuery("select * from User u where u.username='" + userid + "' and u.password='" + pwd + "'");
if (rs.next()) {
	session.setAttribute("userid", userid);
	session.setAttribute("id", rs.getString("userid"));
	//out.println("welcome " + userid);
	//out.println("<a href='logout.jsp'>Log out</a>");
	response.sendRedirect("success.jsp");
} else {
	out.println("Invalid password <a href='index.jsp'>try again</a>");
	}
%>