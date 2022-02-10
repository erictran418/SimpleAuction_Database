<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.sql.Timestamp" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
	<title>Customer Support</title>
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
	</form><br>
	
	<form action="answer.jsp">
		<button type="submit">Unanswered Questions</button>
	</form><br>
	
	<form action="csSearch.jsp" method="post">
	Search keywords (up to 5): <input type="text" name="searchkeys">
	<button value="value" type="submit">Submit</button>
	</form><br>
	
	<% 
	String user = request.getParameter("newcruser");
	String pass = request.getParameter("newcrpass");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/336proj";
	String duser = "root"; //mySQl Username
	String dpass = "aaaa"; //mySQl Password
	Connection con = DriverManager.getConnection(url, duser, dpass);
	

	PreparedStatement query = con.prepareStatement("insert into accounts (username, password, type, auction_history) values (?, ?, ?, null)",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	query.setString(1, user);
	query.setString(2, pass);
	query.setString(3, "cr");
	
	
	if(query.executeUpdate() < 0){
		//Failed
	}
	else{
		response.sendRedirect("adminpage.jsp");
	}
	
	
	
	%>
	
	
	
	
	
	
</body>
</html>