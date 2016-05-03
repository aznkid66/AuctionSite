<%@page contentType="text/html" pageEncoding="UTF-8" 
	import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Report</title>
    </head>
    <body>
		<br/>
		<%
			String report_type = request.getParameter("report_type");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
			"root", "BecauseCBC2");
			Statement st = con.createStatement();
			ResultSet rs;
			if (null==report_type) {
				response.sendRedirect("reportshome.jsp");
			} else if (report_type.equals("total")) {
				out.write("Total earnings: <br/>");
				rs = st.executeQuery("SELECT SUM(currPrice) FROM AUCTION WHERE TIMESTAMPDIFF(Second, NOW(), endDate) < 0;");
				if (rs.next()) {
					out.write("$" + rs.getDouble(1) + "<br/>");
				}
			} else if (report_type.equals("per_x")){
				System.out.println(request.getParameter("test"));
			}
		%>
		<a href="reportshome.jsp">Back</a>
    </body>
</html>