<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.sql.Timestamp" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Page</title>
</head>
<body>
	<%
		if(session.getAttribute("usern") == null){
			response.sendRedirect("loginpage.html");
		}
	
		out.println("Welcome: " + session.getAttribute("usern"));
		
	%>
	<form action="logout.jsp">
		<button type="submit">Logout</button>
	</form><br><br>
	
	<form action="report.jsp">
		<button type="submit">Generate Sales Report</button>
	</form><br><br>
	
	Create Customer Representative Account:
	<form action="createcr.jsp" method="post">
	Representative Username:<input type="text" name="newcruser">
	Representative Password:<input type="text" name="newcrpass">
	<button value="value" type="submit">Submit</button>
	</form><br>
	
	
</body>
</html>