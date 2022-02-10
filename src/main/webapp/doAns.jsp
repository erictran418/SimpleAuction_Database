<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.sql.Timestamp" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
	<% 
	String user = request.getParameter("usern");
	String pass = request.getParameter("pswd");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/336proj";
	String duser = "root"; //mySQl Username
	String dpass = "aaaa"; //mySQl Password
	Connection con = DriverManager.getConnection(url, duser, dpass);
	
	
	String sender = (String)session.getAttribute("sender");
	String question = (String)session.getAttribute("question");
	String answer = (String)request.getParameter("qresp");
	String rep = (String)session.getAttribute("usern");
	
	PreparedStatement query = con.prepareStatement("update mail SET response = ?,rep = ? where sender = ? AND question = ?;");
	
	query.setString(1, answer);
	query.setString(2, rep);
	query.setString(3, sender);
	query.setString(4, question);
	
	if(query.executeUpdate() < 1){
		out.println("fail");

	}
	else{
		response.sendRedirect("customerservicecr.jsp"); 
	}
	%>
</html>