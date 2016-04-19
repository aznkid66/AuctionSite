<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Welcome to jsp!</h1>
	<hr/>
	<% ApplicationDAO dao = new ApplicationDAO();%>	
	<table> 
		<tr> 
			<th>ID</th> 
			<th>FirstName</th> 
			<th>LastName</th> 
		</tr> 	
		<% LinkedList<Person> listOfPeople =dao.getAllPeople();%>
		
		<% for (int i=0; i<listOfPeople.size();i++){ %>
		<tr> 
			<td><%= listOfPeople.get(i).getId() %></td> 
			<td><%= listOfPeople.get(i).getFirstName() %></td> 
			<td><%= listOfPeople.get(i).getLastName() %></td> 
		</tr>
		<%} %> 
	</table> 
	
	
</body>
</html>