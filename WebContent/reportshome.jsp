<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Reports</title>
    </head>
    <body>
		<br/>
		Generate sales report for:<br/>
		<form action="">
		  <input type="radio" name="report_type" value="total" checked="checked"> Total earnings<br>
		  <input type="radio" name="report_type" value="per_x"> Earnings per...
		  	<select>
			  <option value="skin">Skin</option>
			  <option value="rarity">Skin Rarity</option>
			  <option value="champion">Champion</option>
			  <option value="user">User</option>
			</select>
		  <br>
		  <input type="radio" name="report_type" value="best_selling"> Best-selling items<br>
		  <input type="radio" name="report_type" value="best_buyers"> Best buyers
		</form>
		<a href="">Go!</a>
    </body>
</html>