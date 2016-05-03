<%@page contentType="text/html" pageEncoding="UTF-8"
	import ="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Reports</title>
		<script>
			function test(select) {
				var selectList = document.getElementsByTagName("select");
				for (var i = 0; i<selectList.length; i++) {
					selectList[i].style.display = "none";
				}
				select.style.display = "inline"
				var select2 = document.getElementsByName(select.value)[0];
				select2.style.display = "inline";
			}
		</script>
    </head>
    <body>
		<br/>
		Generate sales report for:<br/>
		<form action="reportaction.jsp">
		  <input type="radio" name="report_type" value="total" checked="checked"> Total earnings<br>
		  <input type="radio" name="report_type" value="per_x"> Earnings per...
		  	<%
			  	Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myDB",
				"root", "BecauseCBC2");
				Statement st = con.createStatement();
				ResultSet rs;
		  	%>
		  	<select name="x" onchange="test(this)">
			  <option value="skin">Skin</option>
			  <option value="rarity">Skin Rarity</option>
			  <option value="champion">Champion</option>
			  <option value="user">User</option>
			</select>
			<select name="skin">
			<%
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
			<select name="rarity" style="display:none">
			<% 	
				rs = st.executeQuery("select distinct rarity from Skin");
				while (rs.next()) {
					out.write("<option value=");
					out.write('"' + rs.getString("rarity") + '"');
					out.write(">");
					out.write(rs.getString("rarity"));
					out.write("</option>");
				}
			%>
			</select>
			<select name="champion" style="display:none">
			<% 
				rs = st.executeQuery("select distinct champion from Skin");
				while (rs.next()) {
					out.write("<option value=");
					out.write('"' + rs.getString("champion") + '"');
					out.write(">");
					out.write(rs.getString("champion"));
					out.write("</option>");
				}
			%>
			</select>
			<select name="user" style="display:none">
			<% 
				rs = st.executeQuery("select userid, username from User");
				while (rs.next()) {
					out.write("<option value=");
					out.write(""+'"'+rs.getInt("userid")+'"');
					out.write(">");
					out.write(rs.getString("username"));
					out.write("</option>");
				}
			%>
			</select>
			<br>
		  <input type="radio" name="report_type" value="best_selling"> Best-selling items<br>
		  <input type="radio" name="report_type" value="best_buyers"> Best buyers
		  <input type="submit" value="Go!" />
		</form>
		<br/>
    </body>
</html>