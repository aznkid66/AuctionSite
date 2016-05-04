<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="com.cs336.pkg.*"%>
<%@ page import ="java.lang.NumberFormatException" %>
<%
	String aid = (String)session.getAttribute("aid");
	String bidAmount = request.getParameter("bidAmount");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
											"root", "BecauseCBC2");
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("SELECT currPrice FROM Auction WHERE aid=" + aid + ";");
	try {
		Double.parseDouble(bidAmount);
	} catch (NumberFormatException e) {
		out.write("Bid failed. Invalid format.");
		out.write("<a href=bidonauclayout.jsp?auction=" + aid + ">Try again</a>");
		return;
	}
	if (rs.next() && Double.parseDouble(bidAmount)<=rs.getDouble(1)) {
		out.write("Bid failed. Bid too low.");
		out.write("<a href=bidonauclayout.jsp?auction=" + aid + ">Try again</a>");
		return;
	}
	if (Integer.parseInt((String)session.getAttribute("id"))==
			((Auction)session.getAttribute("auction")).getSellerId()) {
		out.write("You can't bid on your own auction!");
		out.write("<a href=bidonauclayout.jsp?auction=" + aid + ">Try again</a>");
		return;
	}
	int i = st.executeUpdate("insert into Bid(bidder, time, price, higherBidAlert, aid) values ("
			+ (String)session.getAttribute("id") + ", "
			+ "NOW(), "
			+ bidAmount + ", " 
			+ "b'0'" + ", "
			+  aid + ");");
	if (i > 0) {
		st.executeUpdate("UPDATE Bid SET higherBidAlert=b'1'"
						+ "WHERE aid=" + aid + " AND higherBidAlert=b'0' AND price<" + bidAmount + ";");
		response.sendRedirect("success.jsp");
	} else {
		out.write("Bid failed.");
		out.write("<a href=bidonauclayout.jsp?auction=" + aid + ">Try again</a>");
		return;
	}





%>