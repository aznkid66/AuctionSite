<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" import="com.cs336.pkg.*" import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Auction Over</title>

</head>
<body>
<% ApplicationDAO dao = new ApplicationDAO();
int auctionID = Integer.parseInt(request.getParameter("auction")); %>
<a> Winner: <%=(null==dao.getWinner(auctionID)? "N/A" : dao.getWinner(auctionID).getUsername()) %></a>
</body>
</html>