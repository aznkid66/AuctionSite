<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="com.cs336.pkg.*" import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Bid</title>
		<%ApplicationDAO dao = new ApplicationDAO(); %>
		
    </head>
    <body>
        <form method="post" action="bidonauc.jsp">
			<a href='success.jsp'>Back</a>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Auction Details</th>
                    </tr>
                </thead>
                <tbody>
					<tr>
						<td>
							Skin Name
						</td>
						<td>
							Current Price
						</td>
					</tr>
					<tr>
						<td>
							<%
								Auction auction = null;
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
								
								int skinId = auction.getSkinId();
								Skin s = dao.getSkin(skinId);
							%>
							<%=s.getName() %>
						 </td>
						 <td>
						 	<%=auction.getCurrPrice() %>
						 </td>
					</tr>
                </tbody>
            </table>
			<table border="1" width="30%" cellpadding="5">
				<tbody>
					<tr>
						<td>Your Bid Here:
						</td>
					</tr>
					<tr>
						<td>
						<input type="number" name="bidAmount" min="0.00" max="99.99" step="0.01"  placeholder="0.00">
						</td>
					</tr>
					<tr>
						<td><input type="submit" value="Submit"/></td>
					</tr>
				</tbody>
			</table>
        </form>
	<!-- <a href="questions.jsp?auction=<%= request.getParameter("auction") %>">Questions</a>  -->
    </body>
</html>