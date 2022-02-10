<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Date"%>
<!-- Tracy Yang (tly15) -->
<!DOCTYPE html>
<html>
	<body>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/336proj";
		String duser = "root"; //mySQL Username
		String dpass = "aaaa"; //mySQL Password
		Connection con = DriverManager.getConnection(url, duser, dpass);
		
		//item id
		String item_id = request.getParameter("item_id"); //currently item id requires user input for testing, change to getAttribute later
		session.setAttribute("item_id", item_id);
		
		//prevent autobids on a closed auction
		PreparedStatement query10 = con.prepareStatement(
				"SELECT item_id, status " +
				"FROM items " +
				"WHERE item_id = ?");
		query10.setString(1, item_id);
		ResultSet rs10 = query10.executeQuery();
		if (rs10.next() == true) {
			if (rs10.getString(2).equals("0")) {
				out.println("This auction is closed.");
				return;
			}
		}
		
		//user
		String user = session.getAttribute("usern").toString();
		
		//datetime
		String pattern = "yyyy-MM-dd HH:mm:ss";
		SimpleDateFormat format = new SimpleDateFormat(pattern, new Locale("en", "US"));
		String datetime = format.format(new Date());
		String date_started = datetime;
		
		//increment + limit
		String bid_increment = request.getParameter("bid_increment");
		String upper_limit = request.getParameter("upper_limit");
		
		try {
			Integer.parseInt(bid_increment);
			Integer.parseInt(upper_limit);
		} catch (NumberFormatException e) {
			out.println("Invalid input. Please input an integer.");
			return;
		}
		
		//check if an autobid already exists
		PreparedStatement query = con.prepareStatement(
				"SELECT * " +
				"FROM autobid " +
				"WHERE item_id = ? " +
				"AND username = ?");
		query.setString(1, item_id);
		query.setString(2, user);
		ResultSet rs = query.executeQuery();
		boolean check = rs.next();
		if (check == true) {
			if (rs.getString(1).equals(item_id) && rs.getString(2).equals(user)) {
				out.println("You've already set up autobid for this item.");
				return;
			}
		}
		
		//queries
		query = con.prepareStatement(
				"INSERT INTO autobid (item_id, username, date_started, bid_increment, upper_limit) " +
				"VALUES (?, ?, ?, ?, ?)");
		query.setString(1, item_id);
		query.setString(2, user);
		query.setString(3, date_started);
		query.setString(4, bid_increment);
		query.setString(5, upper_limit);
		
		if (query.executeUpdate() == 1) {
			out.println("Autobid request on item #" + item_id + " submitted.");
			response.sendRedirect("autobid_increment.jsp");
		}
		else out.println("Failed to submit autobid request.");
		%>
	</body>
</html>