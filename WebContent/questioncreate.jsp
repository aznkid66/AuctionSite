<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ask Question</title>
	</head>
	<body>
		<%
		if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
		%>
		You are not logged in<br/>
		<a href="index.jsp">Please Login</a>
		<%} else {
		%>
		Question:
		<br>
		<form action="questioncreateaction.jsp">
			<textarea rows="4" cols="50" name="content" /></textarea><br>
			<input type="submit" value="Ask" />
		</form><br>
		<% } %>
	</body>
</html>