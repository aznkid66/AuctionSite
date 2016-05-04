<%@ page import ="java.sql.*" %>

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
		Question:<br>
		 <%
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
					"root", "BecauseCBC2");
			Statement st = con.createStatement();
			ResultSet rs;
			rs = st.executeQuery("SELECT content FROM Question WHERE qid=" + request.getParameter("qid") + ";");
			if (rs.next()) {
				out.write(rs.getString(1));
			}
		 %>
		 <br>
		Answer:
		<br>
		<form action="answercreateaction.jsp?qid= <%= request.getParameter("qid")%>">
			<textarea rows="4" cols="50" name="content" /></textarea><br>
			<input type="submit" value="Answer" />
		</form><br>
		<% } %>
	</body>
</html>