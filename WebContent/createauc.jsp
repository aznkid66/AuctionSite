<%@ page import ="java.sql.*" %>
<%@ page import ="java.text.*" %>
<%@ page import ="java.util.*" %>
<%
	//String skinName = request.getParameter("skinName");
	//String champName = request.getParameter("champName");
	//System.out.println(request.getParameter("auctionSkin"));
	String skinId = request.getParameter("auctionSkin");
	String endDate = request.getParameter("endDate");
	String endTime = request.getParameter("endTime");
	String price = request.getParameter("dollars") + "." + request.getParameter("cents");
	String seller = (String)session.getAttribute("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
												"root", "BecauseCBC2");
	String dateTime = endDate + " " + endTime;
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-mm-dd HH:mm");
	java.util.Date dateFormat = sdf.parse(dateTime);
	long lDate = dateFormat.getTime();
	Timestamp ts = new Timestamp(lDate);
	
	//String[] splitDate = endDate.split("-");
	//int year = Integer.valueOf(splitDate[0]);
	//int month = Integer.valueOf(splitDate[1]);
	//int day = Integer.valueOf(splitDate[2]);
	
	//String[] splitTime = endTime.split(":");
	//int hours = Integer.valueOf(splitTime[0]);
	//int minutes = Integer.valueOf(splitTime[1]);
	//Timestamp endD = new Timestamp(year, month, day, hours, minutes);
	
	
	
	//Statement stmt = con.createStatement();
	
	//ResultSet rs = stmt.executeQuery("Select Sid FROM Skins WHERE name = skinName && Champion = champName");
	//int skinId = rs.getInt("Sid");
	//int skinId = auctionSkin.value;
	

	Statement st = con.createStatement();
	//ResultSet rs;
	int i = st.executeUpdate("insert into Auction(endDate, currPrice, Skin, seller) values ('" + ts + "','" + price + "','" + skinId + "','" + seller + "')");
	if (i > 0) {
		//session.setAttribute("userid", user);
		response.sendRedirect("success.jsp");
		// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
	} else {
		response.sendRedirect("createauction.jsp");
	}
%>