<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" import="java.text.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	<h1>Welcome to jsp!</h1>
	<hr/>
	<% ApplicationDAO dao = new ApplicationDAO();%>	
	<table> 
		<tr> 
			<th>Skin Name</th> 
			<th>User</th> 
			<th>Current Bid</th>
			<th>Time Remaining</th>
			
		</tr> 	
		<% LinkedList<Auction> listOfAuctions =dao.getAuctions();%>
		
		<% for (int i=0; i<listOfAuctions.size();i++){ 
			Skin s = dao.getSkin(listOfAuctions.get(i).getSkinId()); 
			User u = dao.getUser(listOfAuctions.get(i).getSellerId());
			NumberFormat formatter = new DecimalFormat("#0.00"); %>
		<tr> 
			<td><%= s.getName() %></td> 
			<td><%= u.getUsername() %> </td>			
			<td><%= formatter.format(listOfAuctions.get(i).getCurrPrice()) %>
			<td><%= listOfAuctions.get(i).getTimeDifference(dao.getNOW()) %>
		</tr>
		<%} %> 
	</table> 
	
	
</body>