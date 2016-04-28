<%
	if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>
Welcome Admin <br/>
<a href='custrepcreatepage.jsp'>Make a new Customer Rep account</a><br/>
<a href='reportshome.jsp'>Generate sales reports</a><br/>
<a href='logout.jsp'>Log out</a>

<%
	}
%>