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
		//this is called from other classes or jsps rather than using listeners.
		//so every time a change is made in the items table, it should call this jsp to double check for updates.
		//MAKE SURE MANUAL BIDDING ONLY CHECKS ITEMS NOT IN THE AUTOBID TABLE
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/336proj";
		String duser = "root"; //mySQL Username
		String dpass = "aaaa"; //mySQL Password
		Connection con = DriverManager.getConnection(url, duser, dpass);
		
		while (true) {
			boolean changed_something = false;
			
			PreparedStatement query = con.prepareStatement(
				"SELECT a.item_id, a.username, a.bid_increment, a.upper_limit, " + 
						"i.current_bid, i.last_bidder, i.reserve, i.closing_time, i.bid_history " + 
				"FROM autobid a, items i " + 
				"WHERE a.item_id = i.item_id " +
				"ORDER BY a.date_started ASC");
			ResultSet rs = query.executeQuery();
			while (rs.next() == true) {
				String autobid_item_id = rs.getString(1);
				String username = rs.getString(2);
				String bid_increment = rs.getString(3);
				String upper_limit = rs.getString(4);
				String current_bid = rs.getString(5);
				String last_bidder = rs.getString(6);
				String reserve = rs.getString(7);
				String closing_time = rs.getString(8);
				String bid_history = rs.getString(9);
				
				if (current_bid == null) current_bid = "0";
				if (reserve == null) reserve = "0";
				if (closing_time == null) closing_time = "3000-01-01 11:59:59"; //no closing time set so bid stays open 
				
				//if it's past closing time
				String pattern = "yyyy-MM-dd HH:mm:ss";
				SimpleDateFormat format = new SimpleDateFormat(pattern, new Locale("en", "US"));
				String datetime = format.format(new Date());
				
				if (closing_time.compareTo(datetime) <= 0) {
					
					//if the seller's reserve is greater than the current bid, no winner
					if (Integer.parseInt(current_bid) < Integer.parseInt(reserve)) {
						
						//update status in items table
						PreparedStatement query2 = con.prepareStatement(
							"UPDATE items " + 
							"SET status = ? " +
							"WHERE item_id = ?");
						query2.setString(1, "0");
						query2.setString(2, autobid_item_id);
						query2.executeUpdate();
						
						//delete all rows with this item id from autobid table
						query2 = con.prepareStatement(
							"DELETE FROM autobid " + 
							"WHERE item_id = ? ");
						query2.setString(1, autobid_item_id);
						query2.executeUpdate();
						
					}
					
					else {
						
						//winner alert
						if (last_bidder != null) { //the auction did not close with no bidders
							PreparedStatement query3 = con.prepareStatement(
								"UPDATE accounts " + 
								"SET unread_alerts = ? " +
								"WHERE username = ?");
							query3.setString(1, "1");
							query3.setString(2, last_bidder);
							query3.executeUpdate();

							query3 = con.prepareStatement(
								"INSERT INTO alerts " + 
								"VALUES (\'" + last_bidder + "\', \'You won item #" + autobid_item_id + "!\')");
							query3.executeUpdate();
						}
						
						//update winner in items table
						PreparedStatement query2 = con.prepareStatement(
							"UPDATE items " + 
							"SET winner = ?, status = ? " +
							"WHERE item_id = ?");
						query2.setString(1, last_bidder);
						query2.setString(2, "0");
						query2.setString(3, autobid_item_id);
						query2.executeUpdate();
						
						//delete all rows with this item id from autobid table
						query2 = con.prepareStatement(
							"DELETE FROM autobid " + 
							"WHERE item_id = ? ");
						query2.setString(1, autobid_item_id);
						query2.executeUpdate();
					}
					
					changed_something = true;
					
				}
				
				//if the username is the same as the last person to place a bid, skip this row
				else if (last_bidder != null && username.equals(last_bidder)) continue;
				
				//if the current bid  plus the user's bid increment is less than or equal to the user's upper limit, increment
				else if ((Integer.parseInt(current_bid) + Integer.parseInt(bid_increment)) <= Integer.parseInt(upper_limit)) {
					
					//update tables
					PreparedStatement query2 = con.prepareStatement(
						"UPDATE items " + 
						"SET current_bid = ?, last_bidder = ?, bid_history = ? " +
						"WHERE item_id = ?");
					query2.setString(1, (Integer.parseInt(current_bid) + Integer.parseInt(bid_increment)) + "");
					query2.setString(2, username);
					if (bid_history == null) query2.setString(3, (Integer.parseInt(current_bid) + Integer.parseInt(bid_increment)) + "");
					else query2.setString(3, bid_history + ", " + (Integer.parseInt(current_bid) + Integer.parseInt(bid_increment)));
					query2.setString(4, autobid_item_id);
					query2.executeUpdate();
					
					//INSERT INTO iteminfo (type, brand, count) values (?, ?, ?)
					 
					query2 = con.prepareStatement("select * from items WHERE item_id = ?");
					query2.setString(1, autobid_item_id);
					ResultSet res = query2.executeQuery();
 
					res.next();
 
					String cType = res.getString(2);
					String brand = res.getString(5);
					String earnings = res.getString(6);
 
					query2 = con.prepareStatement("select * from iteminfo WHERE clothing_type=? AND brand=?");
					query2.setString(1, cType);
					query2.setString(2, brand);
 
					res = query2.executeQuery();
 
					int count = 0;
					if(res.next()){
						count = res.getInt(4);
					}
 
					query2 = con.prepareStatement("INSERT INTO iteminfo (clothing_type, brand, count, earnings) values (?, ?, ?, ?)");
					query2.setString(1, cType);
					query2.setString(2, brand);
					query2.setInt(3, count+1);
					query2.setString(4, earnings);
 
					query2.executeUpdate();
					
					changed_something = true;
					
				}
				
				//if the current bid  plus the user's bid increment is greater than the user's upper limit, alert user and remove row
				else if ((Integer.parseInt(current_bid) + Integer.parseInt(bid_increment)) > Integer.parseInt(upper_limit)) {
					
					//outbid user upper limit alert
					PreparedStatement query2 = con.prepareStatement(
						"UPDATE accounts " + 
						"SET unread_alerts = ? " +
						"WHERE username = ?");
					query2.setString(1, "1");
					query2.setString(2, username);
					query2.executeUpdate();

					query2 = con.prepareStatement(
						"INSERT INTO alerts " + 
						"VALUES (\'" + username + "\', \'Someone outbid you!\')");
					query2.executeUpdate();
					
					//remove row
					query2 = con.prepareStatement(
						"DELETE FROM autobid " + 
						"WHERE item_id = ? " +
						"AND username = ?");
					query2.setString(1, autobid_item_id);
					query2.setString(2, username);
					query2.executeUpdate();

					changed_something = true;
					
				}
			}
				
			//break if it gets through the whole table with no changes
			if (changed_something == false) break;
		}
			
		response.sendRedirect("welcome.jsp");
		%>
	</body>
</html>