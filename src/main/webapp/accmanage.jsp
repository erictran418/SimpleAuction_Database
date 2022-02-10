<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.sql.Timestamp" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
	<title>Customer Representative Panel</title>
</head>
<body>
	<%
		if(session.getAttribute("usern") == null){
			response.sendRedirect("loginpage.html");
		}
	%>
	
	<h1>Customer Representative Panel</h1>
	Delete a User Account:
	<form action="deleteaccount.jsp" method="post">
	User Username:<input type="text" name="user">
	<button value="value" type="submit">Submit</button>
	</form><br>
	
	<form action="deleteauction.jsp" method="post">
	<button value="value" type="submit">Delete an Auction</button>
	</form><br>
	
	
	<form action="logout.jsp">
		<button type="submit">Logout</button>
	</form><br><br>
	
	
</body>
</html>