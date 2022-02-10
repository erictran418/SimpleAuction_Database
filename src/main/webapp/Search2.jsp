
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
</head>

<body>

<div>
<%
String str = request.getParameter("choice");
if(str.equals("Shirts")) {
%>
<h1 align="center">Results for Shirts</h1>

<form action="Search3.jsp">
<br/><br/>
<div align="center">

Sort By: <select id = "sort" name="sort">
<option value="shirts:size:large">size:large</option>
<option value="shirts:size:medium">size:medium</option>
<option value="shirts:size:small">size:small</option>
<option value="shirts:material:cotton">material:cotton</option>
<option value="shirts:material:synthetic">material:synthetic</option>
<option value="shirts:material:silk">material:silk</option>
<option value="shirts:material:wool">material:wool</option>
<option value="shirts:brand:nike">brand:nike</option>
<option value="shirts:brand:adidas">brand:adidas</option>
<option value="shirts:brand:calvinklein">brand:calvinklein</option>
<option value="shirts:brand:underarmour">brand:underarmour</option>
<option value="shirts:current_bid_ascending">current_bid_ascending</option>
<option value="shirts:current_bid_descending">current_bid_descending</option>

</select>

</div>
<br/><br/>
<div align="center">
<input type = "submit" value="Submit"/>
</div>
</form>
<br/><br/>

<table align="center" cellpadding="5" cellspacing="5" border="1">
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
String sql ="select distinct * from items where clothing_type= 'shirt' ";

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

<%
} else if(str.equals("Pants")){
%>
<h1 align="center">Results for Pants</h1>

<form action="Search3.jsp">
<br/><br/>
<div align="center">

Sort By: <select id = "sort" name="sort">
<option value="pants:size:large">size:large</option>
<option value="pants:size:medium">size:medium</option>
<option value="pants:size:small">size:small</option>
<option value="pants:material:cotton">material:cotton</option>
<option value="pants:material:synthetic">material:synthetic</option>
<option value="pants:material:silk">material:silk</option>
<option value="pants:material:wool">material:wool</option>
<option value="pants:brand:nike">brand:nike</option>
<option value="pants:brand:adidas">brand:adidas</option>
<option value="pants:brand:calvinklein">brand:calvinklein</option>
<option value="pants:brand:underarmour">brand:underarmour</option>
<option value="pants:current_bid_ascending">current_bid_ascending</option>
<option value="pants:current_bid_descending">current_bid_descending</option>

</select>

</div>
<br/><br/>
<div align="center">
<input type = "submit" value="Submit"/>
</div>
</form>
<br/><br/>

<table align="center" cellpadding="5" cellspacing="5" border="1">

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
String sql ="select distinct * from items where clothing_type= 'pants' ";

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



<% 
} else if(str.equals("Shoes")){
%>
<h1 align="center">Results for Shoes</h1>

<form action="Search3.jsp">
<br/><br/>
<div align="center">

Sort By: <select id = "sort" name="sort">
<option value="shoes:size:large">size:large</option>
<option value="shoes:size:medium">size:medium</option>
<option value="shoes:size:small">size:small</option>
<option value="shoes:material:cotton">material:cotton</option>
<option value="shoes:material:synthetic">material:synthetic</option>
<option value="shoes:material:silk">material:silk</option>
<option value="shoes:material:wool">material:wool</option>
<option value="shoes:brand:nike">brand:nike</option>
<option value="shoes:brand:adidas">brand:adidas</option>
<option value="shoes:brand:calvinklein">brand:calvinklein</option>
<option value="shoes:brand:underarmour">brand:underarmour</option>
<option value="shoes:current_bid_ascending">current_bid_ascending</option>
<option value="shoes:current_bid_descending">current_bid_descending</option>

</select>

</div>
<br/><br/>
<div align="center">
<input type = "submit" value="Submit"/>
</div>
</form>
<br/><br/>

<table align="center" cellpadding="5" cellspacing="5" border="1">

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
String sql ="select distinct * from items where clothing_type= 'shoes' ";

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



<% 
} else if(str.equals("Hats")){
%>
<h1 align="center">Results for Hats</h1>

<form action="Search3.jsp">
<br/><br/>
<div align="center">

Sort By: <select id = "sort" name="sort">
<option value="hats:size:large">size:large</option>
<option value="hats:size:medium">size:medium</option>
<option value="hats:size:small">size:small</option>
<option value="hats:material:cotton">material:cotton</option>
<option value="hats:material:synthetic">material:synthetic</option>
<option value="hats:material:silk">material:silk</option>
<option value="hats:material:wool">material:wool</option>
<option value="hats:brand:nike">brand:nike</option>
<option value="hats:brand:adidas">brand:adidas</option>
<option value="hats:brand:calvinklein">brand:calvinklein</option>
<option value="hats:brand:underarmour">brand:underarmour</option>
<option value="hats:current_bid_ascending">current_bid_ascending</option>
<option value="hats:current_bid_descending">current_bid_descending</option>

</select>

</div>
<br/><br/>
<div align="center">
<input type = "submit" value="Submit"/>
</div>
</form>
<br/><br/>

<table align="center" cellpadding="5" cellspacing="5" border="1">

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
String sql ="select distinct * from items where clothing_type= 'hats' ";

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



<% 
}
%>



</div>

<br></br>

<div align = "center">
<form  action="Search1.jsp">
		<button type="submit">Return</button>
	</form>
</div>
<br></br>

</body>

</html>
