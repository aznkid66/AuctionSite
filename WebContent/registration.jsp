<%@ page import ="java.sql.*" %>
<%
	String user = request.getParameter("uname");
	String pwd = request.getParameter("pass");
	String email = request.getParameter("email");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
												"root", "BecauseCBC2");
	Statement st = con.createStatement();
	//ResultSet rs;
	int i = st.executeUpdate("insert into User(email, username, password) values ('" + email + "','" + user + "','" + pwd + "')");
	if (i > 0) {
		//session.setAttribute("userid", user);
		response.sendRedirect("welcome.jsp");
		// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
	} else {
		response.sendRedirect("index.jsp");
	}
%>