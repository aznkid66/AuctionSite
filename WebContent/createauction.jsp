<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Auction</title>
    </head>
    <body>
        <form method="post" action="createauc.jsp">
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Fill Out Form</th>
                    </tr>
                </thead>
                <tbody>
					<tr>
					<td> Choose Skin</td>
					<td>
					<select id = "auctionSkin" name="auctionSkin">
						<%
						
					  	Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
						"root", "BecauseCBC2");
						Statement st = con.createStatement();
						ResultSet rs;
						
						
						rs = st.executeQuery("select sid, name from Skin");
						while (rs.next()) {
							out.write("<option value=");
							out.write(""+'"'+rs.getInt("sid")+'"');
							out.write(">");
							out.write(rs.getString("name"));
							out.write("</option>");
						}
						%>
					</select>
					</td>
					</tr>
                    <tr>
                        <td>Starting Price</td>
                        <td><input type="text" name="price" value="" /></td>
                    </tr>
					<tr>
					<td> End Date </td>
					<td>
  						<input type="date" name="endDate">
  					</td>
  					</tr>
  					<tr>
  					<td> Time </td>
  					<td>
  						 <input type="time" name="endTime">
					</td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>