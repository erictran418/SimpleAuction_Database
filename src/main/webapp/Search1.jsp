
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
</head>
<body>
<h1 align="center">Search</h1>

<form action="Search2.jsp">
<br/><br/>
<div align="center">
Filter Search: <select id = "choice" name="choice">
<option value="Shirts">Shirts</option>
<option value="Pants">Pants</option>
<option value="Shoes">Shoes</option>
<option value="Hats">Hats</option>
</select>
</div>
<br/><br/>
<div align="center">
<input type = "submit" value="Submit"/>
</div>
</form>

<br/><br/>

<div align="center">
	<form action="UserSearch.jsp" method="post">
	UserName Search: <input type="text" name="usern"><br>
	<br/><br/>
	<button value="value" type="submit">Submit</button>
	</form>
</div>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "336proj";
String userId = "root";
String password = "aaaa";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Browsing Whole Database</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr>
<td><b>item_id</b></td>
<td><b>clothing_type</b></td>
<td><b>size</b></td>
<td><b>material</b></td>
<td><b>brand</b></td>
<td><b>current_bid</b></td>
<td><b>bid_history</b></td>
<td><b>closing_time</b></td>
<td><b>status</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM items";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getString("item_id") %></td>
<td><%=resultSet.getString("clothing_type") %></td>
<td><%=resultSet.getString("size") %></td>
<td><%=resultSet.getString("material") %></td>
<td><%=resultSet.getString("brand") %></td>
<td><%=resultSet.getString("current_bid") %></td>
<td><%=resultSet.getString("bid_history") %></td>
<td><%=resultSet.getString("closing_time") %></td>
<td><%=resultSet.getString("status") %></td>



</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br/><br/>
<div align = "center">
<form  action="welcome.jsp">
		<button type="submit">Return to Welcome Page</button>
	</form>
</div>
</body>
</html>
