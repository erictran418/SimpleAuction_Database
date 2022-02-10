<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Date"%>
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
	
	try {
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String title = (String) request.getParameter("title");
		String description = (String) request.getParameter("description");
		String endDate = ((String) request.getParameter("endDate")).replace("T"," ") + ":00.00";
		Timestamp sqlEndDate = Timestamp.valueOf(endDate);
		double min_bid = Double.parseDouble(request.getParameter("min_bid"));
		double bid_increment = Double.parseDouble(request.getParameter("bid_increment"));
		boolean category1 = request.getParameter("category1") != null;
		boolean category2 = request.getParameter("category2") != null;
		boolean category3 = request.getParameter("category3") != null;
		String field1 = "";
		String field2 = "";
		String category ="";
		// checks if only one category
		if (((category1 ? 1 : 0) + (category2 ? 1 : 0) + (category3 ? 1 : 0)) == 1){
			if(category1){
				field1 = request.getParameter("cat1field1");
				field2 = request.getParameter("cat1field2");
				category = "category1";
			} else if (category2){
				field1 = request.getParameter("cat2field1");
				field2 = request.getParameter("cat2field2");
				category = "category2";
			} else if (category3){
				field1 = request.getParameter("cat2field1");
				field2 = request.getParameter("cat2field2");
				category = "category3";
			}
			if (field1.length() == 0 || field2.length() == 0){
				out.println("Must enter information for both field values!");
			} else {
				String update = "INSERT INTO items (description, title, mem_name) VALUES ('"+ description + "','" + title + "','"+username+"');";
				int i = stmt.executeUpdate(update, Statement.RETURN_GENERATED_KEYS);
				ResultSet rs = stmt.getGeneratedKeys();
				rs.next();
				update = "INSERT INTO auctions (mem_name, item_id, bid_increment, startDate, endDate, min_price) VALUES ('" + username + "','" + rs.getInt(1) + "','" + bid_increment + "','" +
				new Timestamp(System.currentTimeMillis()) + "','" + sqlEndDate + "','" + min_bid + "');";
				i = stmt.executeUpdate(update);
				
				int id = 0;
				rs = stmt.executeQuery("select * from items");
				if(rs.last()){
					id=rs.getInt("item_id");
				}
				update = "INSERT INTO " + category + " (item_id, field1, field2) VALUES('" + id + "','" + field1 + "','" + field2 + "');";
				i = stmt.executeUpdate(update);
				out.println("You have successfully listed " + title + ".");
			}	
		} else {
			out.println("Must select only one category!");
		}
		
	
	
	
		%>

	
</body>
</html>