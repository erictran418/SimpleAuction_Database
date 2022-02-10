<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//this is called from other classes or jsps rather than using listeners.
	//so every time a change is made in the items table, it should call this jsp to double check for updates.
	//MAKE SURE MANUAL BIDDING ONLY CHECKS ITEMS NOT IN THE AUTOBID TABLE
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/336proj";
	String duser = "root"; //mySQL Username
	String dpass = "aaaa"; //mySQL Password
	Connection con = DriverManager.getConnection(url, duser, dpass);
	
	
	%>

</body>
</html>