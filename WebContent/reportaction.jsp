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
			String reportType = request.getParameter("report_type");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
			"root", "BecauseCBC2");
			Statement st = con.createStatement();
			ResultSet rs;
			if (null==reportType) {
				response.sendRedirect("reportshome.jsp");
			} else if (reportType.equals("total")) {
				out.write("Total earnings: <br/>");
				rs = st.executeQuery("SELECT SUM(currPrice) FROM AUCTION WHERE TIMESTAMPDIFF(Second, NOW(), endDate) < 0;");
				if (rs.next()) {
					out.write("$" + rs.getDouble(1) + "<br/>");
				}
			} else if (reportType.equals("per_x")){
				out.write("Earnings for ");
				String xType = request.getParameter("x_type");
				String x = request.getParameter(xType);
				if (xType.equals("skin")) {
					rs = st.executeQuery("SELECT name FROM SKIN WHERE sid=" + 
											x + ";");
					if (rs.next()) {
						out.write("item " + rs.getString(1) + ":<br/>");
					}
					rs = st.executeQuery("SELECT SUM(currPrice) FROM AUCTION "
							+ "WHERE skin IN ( "
							+ "	SELECT sid FROM SKIN "
							+ "	WHERE sid = " + x
							+ ") AND aid IN ( "
							+ "	SELECT aid FROM AUCTION "
							+ "	WHERE TIMESTAMPDIFF(Second, NOW(), endDate) < 0);");
					if (rs.next()) {
						out.write("$" + rs.getDouble(1) + "<br/>");
					}
				} else if (xType.equals("rarity")) {
					out.write("rarity " + x + "<br/>");
					rs = st.executeQuery("SELECT SUM(currPrice) FROM AUCTION "
							+ "WHERE skin IN ( "
							+ "	SELECT sid FROM SKIN "
							+ "	WHERE rarity = " + '"' + x + '"'
							+ ") AND aid IN ( "
							+ "	SELECT aid FROM AUCTION "
							+ "	WHERE TIMESTAMPDIFF(Second, NOW(), endDate) < 0);");
					if (rs.next()) {
						out.write("$" + rs.getDouble(1) + "<br/>");
					}					
				} else if (xType.equals("champion")) {
					out.write("champion " + x + ":<br/>");
					rs = st.executeQuery("SELECT SUM(currPrice) FROM AUCTION "
							+ "WHERE skin IN ( "
							+ "	SELECT sid FROM SKIN "
							+ "	WHERE champion = " + '"' + x + '"'
							+ ") AND aid IN ( "
							+ "	SELECT aid FROM AUCTION "
							+ "	WHERE TIMESTAMPDIFF(Second, NOW(), endDate) < 0);");
					if (rs.next()) {
						out.write("$" + rs.getDouble(1) + "<br/>");
					}
				} else if (xType.equals("user")) {
					out.write("champion " + x + ":<br/>");
					rs = st.executeQuery("SELECT SUM(currPrice) FROM AUCTION "
							+ "	WHERE seller=" + x + " AND "
							+ "	TIMESTAMPDIFF(Second, NOW(), endDate) < 0;");
					if (rs.next()) {
						out.write("$" + rs.getDouble(1) + "<br/>");
					}
				}
			} else if (reportType.equals("best_selling")) {				
		  		out.write("Earnings for 3 best-selling items:<br />");
		  		rs = st.executeQuery("SELECT s.name, SUM(currPrice) FROM SKIN s, AUCTION a "
		  				+ "WHERE s.sid = a.skin AND "
		  				+ "aid IN ( "
		  				+ "	SELECT aid FROM AUCTION " 
		  				+ "	WHERE TIMESTAMPDIFF(Second, NOW(), endDate) < 0) "
		  				+ "GROUP BY Skin " 
		  				+ "ORDER BY SUM(currPrice) DESC " 
		  				+ "LIMIT 3;");
		  		int i = 1;
		  		while (rs.next()) {
		  			out.write(i + ". " + rs.getString(1) + ": $" + rs.getDouble(2) + "<br/>");
		  			i++;
		  		}
			} else if (reportType.equals("best_buyers")) {
		  		out.write("Money spent by 3 biggest spenders:<br />");
		  		rs = st.executeQuery("SELECT u.username, SUM(currPrice) FROM USER u, BID b, AUCTION a "
		  				+ "WHERE u.userid = b.bidder "
		  				+ "AND b.b_id IN ( "
		  				+ "	SELECT h.b_id FROM HASBID h "
		  				+ "	WHERE h.aid IN ( "
		  				+ "		SELECT aid FROM AUCTION "
		  				+ "		WHERE TIMESTAMPDIFF(Second, NOW(), endDate) < 0)) "
		  				+ "GROUP BY u.userid "
		  				+ "ORDER BY SUM(currPrice) DESC " 
		  				+ "LIMIT 3;");
		  		int i = 1;
		  		while (rs.next()) {
		  			out.write(i + ". " + rs.getString(1) + ": $" + rs.getDouble(2) + "<br/>");
		  			i++;
		  		}
			}
		%>
		<a href="reportshome.jsp">Back</a>
    </body>
</html>