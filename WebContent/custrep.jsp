<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*" import ="java.util.*" import="java.text.*" import="java.sql.*"%>
<%
	if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome Customer Rep <%=session.getAttribute("userid")%>
<a href='logout.jsp'>Log out</a>
<br>
<%
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
				"root", "BecauseCBC2");
		Statement st = con.createStatement();
		ResultSet rs;
		rs = st.executeQuery("SELECT * FROM Question");
		while (rs.next()) {
			out.write("<a href=");
			out.write('"' + "answercreate.jsp?qid=" + rs.getInt("qid") + '"');
			out.write(">");
			out.write(rs.getString("content"));
			out.write("</a><br>");
		}
	}
%>