<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="com.cs336.pkg.*" import="java.util.*" import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Bid</title>
		<%	ApplicationDAO dao = new ApplicationDAO(); %>
		<%
								Auction auction = null;
								boolean isClosed = false;
								for (Auction a : dao.getAuctions()) {
									if (null==request.getParameter("auction")) {
										response.sendRedirect("success.jsp");
										return;
									}
									if (a.getAuctionId() == Integer.parseInt(request.getParameter("auction"))) {
										auction = a;
										session.setAttribute("aid", String.valueOf(a.getAuctionId()));
										session.setAttribute("auction", a);
										break;
									}
								}
								if (null==auction) {
									response.sendRedirect("success.jsp");
								}
								Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
										"root", "BecauseCBC2");
								Statement st = con.createStatement();
								ResultSet rs;
								rs = st.executeQuery("SELECT NOW(), endDate FROM Auction WHERE aid=" + auction.getAuctionId() + ";");
								if (rs.next() && rs.getDate("NOW()").after(rs.getDate("endDate"))) {
									isClosed = true;
								}
	%>
		
    </head>
	<body>
<%
	if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
	<table>
		<tr> 
			<th>Skin Name</th> 
			<th>Seller</th> 
			<th>Current Bid</th>
			<th><%= (isClosed)? "Winner" : "Time Remaining" %></th>
			
		</tr>
		<%	Skin s = dao.getSkin(auction.getSkinId()); 
			User u = dao.getUser(auction.getSellerId());
			NumberFormat formatter = new DecimalFormat("#0.00"); %>
		<tr> 
			<td><a href="bidonauclayout.jsp?auction=<%= auction.getAuctionId() %>" >
					<%= s.getName() %></a></td> 
			<td><%= u.getUsername() %> </td>			
			<td><%= formatter.format(auction.getCurrPrice()) %>
			<td><%= (isClosed)? (null==dao.getWinner(auction.getAuctionId())? "N/A" : dao.getWinner(auction.getAuctionId()).getUsername()) : auction.getTimeDifference(dao.getNOW()) %>
		</tr>
		</table>

<%
	}
%>

	</body>