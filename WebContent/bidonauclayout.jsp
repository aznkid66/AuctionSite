<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Bid</title>
    </head>
    <body>
        <form method="post" action="registration.jsp">
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Bid Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= request.getParameter("auction")%></td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>