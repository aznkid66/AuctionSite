<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*"%>
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
	<%
		}
	%>
	<h1>Welcome to jsp!</h1>
	<hr/>
	<% ApplicationDAO dao = new ApplicationDAO();%>	
	<table> 
		<tr> 
			<th>ID</th> 
			<th>Skin Name</th> 
			<th>User</th> 
		</tr> 	
		<% LinkedList<Auction> listOfAuctions =dao.getAuctions();%>
		
		<% for (int i=0; i<listOfAuctions.size();i++){ 
			Skin s = dao.getSkin(listOfAuctions.get(i).getSkinId()); 
			User u = dao.getUser(listOfAuctions.get(i).getSellerId()); %>
		<tr> 
			<td><%= listOfAuctions.get(i).getAuctionId() %></td> 
			<td><%= s.getName() %></td> 
			<td><%= u.getUsername() %>
		</tr>
		<%} %> 
	</table> 
	
	
</body>