<%@ page import ="java.sql.*" %>
<%
	String userid = (String)session.getAttribute("id");
	String content = request.getParameter("content");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
												"root", "BecauseCBC2");
	

	//ResultSet rs;
	String query = "insert into Question(content, uid) values (?,"+ userid + ");";
	PreparedStatement pst = con.prepareStatement(query);
	pst.setString(1, content);
	int i = pst.executeUpdate();
	if (i > 0) {
		out.write("Success");
	} else {
		out.write("Failure");
	}
%>
<a href='success.jsp'>Back</a>