<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.sql.Timestamp" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.Date" %>
	<%@ page import="java.util.StringTokenizer" %>
	
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
		
	%>
	
	<% 
	String user = request.getParameter("user");
	String item_id = request.getParameter("bid");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/336proj";
	String duser = "root"; //mySQl Username
	String dpass = "aaaa"; //mySQl Password
	Connection con = DriverManager.getConnection(url, duser, dpass);
	
	PreparedStatement query;
	
	
	String bid = request.getParameter("bid");

	query = con.prepareStatement("select * from items WHERE item_id=?",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	query.setString(1, bid);
	
	ResultSet rs = query.executeQuery();
	rs.next();
	
	String currBid = rs.getString(6);
	String bidHistory = rs.getString(8);
	
	if(bidHistory == null || bidHistory.isEmpty() || bidHistory == ""){
		query = con.prepareStatement("UPDATE items SET current_bid='' WHERE item_id=?",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		query.setString(1, item_id);
	}
	else{
		String lastBid = "";
		StringTokenizer st = new StringTokenizer(bidHistory, ",", false);
		
		int historyLen = bidHistory.length();
		int count = st.countTokens();

		
		while(count != 0 && st.hasMoreTokens()){
			lastBid = st.nextToken();
		}
		
		
		if(count > 0 ){
			int lastBidLen = lastBid.length();
			if(bidHistory.length() == lastBidLen){
				bidHistory = "";
			}
			else{
				bidHistory = bidHistory.substring(0,historyLen-lastBidLen-1);
			}
			query = con.prepareStatement("UPDATE items SET current_bid=?, bid_history=? WHERE item_id=?",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			query.setString(1, lastBid);
			query.setString(2, bidHistory);
			query.setString(3, item_id);
		}
		
	}
	if(query.executeUpdate() < 0){
		//Failed
	}
	else{
		response.sendRedirect("Search1.jsp");
	}

	%>
	
	
	
	
	
	
</body>
</html>