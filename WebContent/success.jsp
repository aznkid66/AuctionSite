<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" import="java.text.*" import="java.sql.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<%
		if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
	%>
	You are not logged in<br/>
	<a href="index.jsp">Please Login</a>
	<%} else {
	%>
	Welcome <%=session.getAttribute("userid")%>
	<a href='logout.jsp'>Log out</a>
	<a href='createauction.jsp'>Create Auction</a>
	<%
		}
	%>
	<h1>Welcome to League Of Legends Skins Auction Site!</h1>
	<hr/>
	<% ApplicationDAO dao = new ApplicationDAO();%>	
	
	<table> 
		<tr>
			<select id="sortBy">
				<option value="1">Current Price (High to Low)</option>
				<option value="2">Current Price (Low to High)</option>
				<option value="3">Skins (A to Z)</option>
				<option value="4">Skins (Z to A)</option>
				<option value="5">Sellers (A to Z)</option>
				<option value="6">Sellers (Z to A)</option>
				<option value="7">Time (Ending Soon)</option>
				<option value="8">Time (Newly Listed)</option>
			</select>
			<button>Sort</button>
		</tr>
		<tr> 
			<th>Skin Name</th> 
			<th>Seller</th> 
			<th>Current Bid</th>
			<th>Time Remaining</th>
			
		</tr> 
		<% 
		
		//int valu = Integer.parseInt(val);
		LinkedList<Auction> listOfOpenAuctions =dao.getOpenAuctions();
		LinkedList<Auction> listOfClosedAuctions = dao.getClosedAuctions();
		//LinkedList<OutBidAlert> alerts = dao.getOutBidAlerts(userId);
		 
		 %>
		
		<% for (int i=0; i<listOfOpenAuctions.size();i++){ 
			Skin s = dao.getSkin(listOfOpenAuctions.get(i).getSkinId()); 
			User u = dao.getUser(listOfOpenAuctions.get(i).getSellerId());
			NumberFormat formatter = new DecimalFormat("#0.00"); %>
		<tr> 
			<td><a href="bidonauclayout.jsp?auction=<%= listOfOpenAuctions.get(i).getAuctionId() %>" >
					<%= s.getName() %></a></td> 
			<td><%= u.getUsername() %> </td>			
			<td><%= formatter.format(listOfOpenAuctions.get(i).getCurrPrice()) %>
			<td><%= listOfOpenAuctions.get(i).getTimeDifference(dao.getNOW()) %>
		</tr>
		<% } %>
				<tr> 
			<th>Skin Name</th> 
			<th>Seller</th> 
			<th>Winning Bid</th>
			<th>Winner</th>
			
		</tr> 
		<% for (int i = 0; i<listOfClosedAuctions.size();i++){ 
			Skin s = dao.getSkin(listOfClosedAuctions.get(i).getSkinId()); 
			User u = dao.getUser(listOfClosedAuctions.get(i).getSellerId());
			NumberFormat formatter = new DecimalFormat("#0.00"); %>
		<tr> 
			<td><a href="winner.jsp?auction=<%= listOfClosedAuctions.get(i).getAuctionId() %>" >
					<%= s.getName() %></a></td> 
			<td><%= u.getUsername() %> </td>			
			<td><%= formatter.format(listOfClosedAuctions.get(i).getCurrPrice()) %>
			<td><%= (null==dao.getWinner(listOfClosedAuctions.get(i).getAuctionId())? "N/A" : dao.getWinner(listOfClosedAuctions.get(i).getAuctionId()).getUsername()) %>
		</tr>
		<%} %> 
		<!-- <tr>
			<th>Auction</th>
		</tr> -->
		<tr>
			<th>Questions</th>
		</tr>
		
	</table> 
	<%
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
					"root", "BecauseCBC2");
			Statement st = con.createStatement();
			ResultSet rs;
			rs = st.executeQuery("SELECT * FROM Question");
			while (rs.next()) {
				out.write("<a href=");
				out.write('"' + "" + '"');
				out.write(">");
				out.write(rs.getString("content"));
				out.write("</a><br>");
			}
	%>
	<a href="questioncreate.jsp">New Question</a>
	
</body>