<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
					<td> Choose Skin></td>
					<td>
					<select id = "auctionSkin">
						<option value=1> Justicar Aatrox </option>
						<option value=2> Mecha Aatrox </option>
						<option value=3> Pulsefire Ezreal </option>
						<option value=4> Mecha Zero Sion </option>
						<option value=5> Blood Moon Elise </option>
						<option value=6> Death Blossom Elise </option>
						<option value=7> Project Zed </option>
						<option value=8> Koi Nami </option>
						<option value=9> Blood Moon Kalista </option>
						<option value=10> Lumberjack Sion </option>
						<option value=11> Woad Ashe </option>
						<option value=12> Pool Party Ziggs </option>
						<option value=13> Dunkmaster Darius </option>
						<option value=14> Order of the Banana Soraka </option>
						<option value=15> Jailbreak Graves </option>
						<option value=16> Archduke Nasus </option>
						<option value=17> Battle Boss Blitzcrank </option>
						<option value=18> Challenger Nidalee </option>
						<option value=19> Program Lissandra </option>
						<option value=20> Annie in Wonderland </option>
						<option value=21> High Noon Yasuo </option>
						<option value=22> Dj Sona </option>
						<option value=23> Project Leona </option>
						<option value=24> Mecha Kha Zix </option>
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
                        <form>
  						<input type="date" name="endDate">
  						</form>
  					</td>
  					</tr>
  					<tr>
  					<td> Time <td>
  					<td>
  						<form>
  						 <input type="time" name="endTime">
						</form>
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