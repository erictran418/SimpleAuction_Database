<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<body>
		<% 
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/336proj";
		String duser = "root"; //mySQL Username
		String dpass = "aaaa"; //mySQL Password
		Connection con = DriverManager.getConnection(url, duser, dpass);
		
		String user = request.getParameter("usern");
		String pass = request.getParameter("pswd");
		
		PreparedStatement query = con.prepareStatement("select * from accounts where username = ? and password = ?");
		query.setString(1, user);
		query.setString(2, pass);
		
		ResultSet rs = query.executeQuery();
		
		boolean check = rs.next();
		if (check == true) {
			if (rs.getString(1).equals(user)) {
				out.println("Account with these credentials already exists - Go back and log in");
			}
		}
		else {
			PreparedStatement query2 = con.prepareStatement("insert into accounts (username, password, user_type) values (?, ?, ?)");
			query2.setString(1, user);
			query2.setString(2, pass);
			query2.setString(3, "user");
			
			if (query2.executeUpdate() == 1) out.println("Successfully created account for user: " + user);
			else out.println("Account with these credentials already exists - Go back and log in"); //This statement should never be reached
		}
		%>
	</body>
</html>