<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.sql.Timestamp" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<body>

	
	<% 
	//TEST
	//TEST
	String user = request.getParameter("usern");
	String pass = request.getParameter("pswd");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/336proj";
	String duser = "root"; //mySQl Username
	String dpass = "aaaa"; //mySQl Password
	Connection con = DriverManager.getConnection(url, duser, dpass);
	
	SimpleDateFormat dateform = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Timestamp timestamp = new Timestamp(System.currentTimeMillis());

	PreparedStatement query = con.prepareStatement("insert into mail (sender, question, date_time) values (?, ?, ?)");
	query.setString(1, (String)session.getAttribute("usern"));
	query.setString(2, request.getParameter("ques"));
	query.setString(3, dateform.format(timestamp));
	
	if(query.executeUpdate() < 1){
		out.println("fail");

	}
	else{
		response.sendRedirect("customerserviceuser.jsp"); 
	}


	%>



</body>
</html>