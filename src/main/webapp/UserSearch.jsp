
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<body>
<div>
<table border="1" align="center">

<tr>
<th>username</th>
<th>auction_history</th>
</tr>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String connectionUrl = "jdbc:mysql://localhost:3306/";
		String dbName = "336proj";
		String userId = "root";
		String password = "aaaa";
		Connection con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		Statement st = con.createStatement();
		String user = request.getParameter("usern");
		String sql = "SELECT * from accounts where username='"+user+"'";
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()) {
			%>
			<tr>
			<td><%=rs.getString("username") %></td>
			<td><%=rs.getString("auction_history") %></td>
			</tr>
			<% 
		}

		
	}catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>

</table>
</div>
<br></br>

<div align = "center">
<form  action="Search1.jsp">
		<button type="submit">Return</button>
	</form>
</div>
</body>
</html>
