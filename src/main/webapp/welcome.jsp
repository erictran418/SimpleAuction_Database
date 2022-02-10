<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
	<%
	if (session.getAttribute("usern") == null) response.sendRedirect("loginpage.html");
	out.println("Welcome: " + session.getAttribute("usern"));
	%>
	
	<%
	String acctype = (String)session.getAttribute("acctype"); //t
	if (acctype.equals("cr") || acctype.equals("admin")) {
	%>
	
	<form action="customerservicecr.jsp">
		<button type="submit">Customer Service</button>
	</form>
	
	<% } else { %>
	
	<form action="customerserviceuser.jsp">
		<button type="submit">Customer Service</button>
	</form>
	
	<% } %>
	
	<% if (acctype.equals("admin")) { %>
	
	<form action="adminpage.jsp">
		<button type="submit">Administrator Access</button>
	</form>
	
	<% } %>
	
	<% if (acctype.equals("cr")) { %>
	
	<form action="crpanel.jsp">
		<button type="submit">Account Management</button>
	</form>
	
	<% } %>
	
	<form action="Search1.jsp">
			<button type="submit" name="item_id">Search</button>
	</form>
	
	<form action="autobid_button.jsp">
		<button type="submit">Autobid</button>
	</form>
	
	<form action="createAuction.jsp">
        <button type="submit" name="item_id">Create Auction</button>
    </form>
	
	<form action="logout.jsp">
		<button type="submit">Logout</button>
	</form>
	
</body>
</html>
