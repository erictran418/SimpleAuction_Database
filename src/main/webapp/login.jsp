<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<body>

	
	<% 
	String user = request.getParameter("usern");
	String pass = request.getParameter("pswd");
	
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/336proj";
	String duser = "root"; //mySQl Username
	String dpass = "aaaa"; //mySQl Password
	Connection con = DriverManager.getConnection(url, duser, dpass);
	
	PreparedStatement query = con.prepareStatement("select * from accounts where username = ? and password = ?");
	query.setString(1, request.getParameter("usern"));
	query.setString(2, request.getParameter("pswd"));
	
	ResultSet rs = query.executeQuery();
	String t = String.valueOf(-1);
	
	boolean check = rs.next();
	if(check == true){
		if(rs.getString(1).equals(user)){
			out.println("Welcome, " + user);
			session.setAttribute("usern",user);
			session.setAttribute("acctype",rs.getString(3));
			session.setAttribute("count", t);
			response.sendRedirect("welcome.jsp");
		}
	}
	else{
		out.println("Bad login info");
		response.sendRedirect("loginpage.html"); 
	}
	

	%>



</body>
</html>