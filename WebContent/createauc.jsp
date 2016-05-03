<%@ page import ="java.sql.*" %>
<%
	//String skinName = request.getParameter("skinName");
	//String champName = request.getParameter("champName");
	int skinId = Integer.parseInt(request.getParameter("auctionSkin"));
	Date endDate = request.getParameter("endDate");
	String price = request.getParameter("price");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
												"root", "BecauseCBC2");
	//Statement stmt = con.createStatement();
	
	//ResultSet rs = stmt.executeQuery("Select Sid FROM Skins WHERE name = skinName && Champion = champName");
	//int skinId = rs.getInt("Sid");
	//int skinId = auctionSkin.value;
	

	Statement st = con.createStatement();
	//ResultSet rs;
	int i = st.executeUpdate("insert into Auction(endDate, currPrice, Skin) values ('" + endDate + "','" + price + "','" + skinId + "')");
	if (i > 0) {
		//session.setAttribute("userid", user);
		response.sendRedirect("welcome.jsp");
		// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
	} else {
		response.sendRedirect("index.jsp");
	}
%>