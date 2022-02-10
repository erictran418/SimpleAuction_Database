
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
<title>Search3</title>
</head>
<body>
<h1 align="center">Filtered Page</h1>
<br></br>

<div>
<% 
String str = request.getParameter("sort");
if(str.equals("shirts:size:large")) {
%>
<h1 align="center">Large Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND size = 'large' ";

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
} else if(str.equals("shirts:size:medium")) {
%>
<h1 align="center">Medium Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND size = 'medium' ";

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
} else if(str.equals("shirts:size:small")) {
	%>
<h1 align="center">Small Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND size = 'small' ";

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
	} else if(str.equals("shirts:material:cotton")) {
		%>
<h1 align="center">Cotton Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND material='cotton'";

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
		}else if(str.equals("shirts:material:synthetic")) {
			%>
			<h1 align="center">Synthetic Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND material='synthetic'";

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
			}else if(str.equals("shirts:material:silk")) {
				%>
				<h1 align="center">Silk Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND material='silk'";

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
				}else if(str.equals("shirts:material:wool")) {
					%>
					<h1 align="center">Wool Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND material='wool'";

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
					}else if(str.equals("shirts:brand:nike")) {
						%>
						<h1 align="center">Nike Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND brand='nike'";

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
						}else if(str.equals("shirts:brand:adidas")) {
							%>
							<h1 align="center">Adidas Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND brand='adidas'";

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
							}else if(str.equals("shirts:brand:calvinklein")) {
								%>
								<h1 align="center">CalvinKlein Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND brand='calvinklein'";

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
								}else if(str.equals("shirts:brand:underarmour")) {
									%>
									<h1 align="center">Underarmour Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' AND brand='underarmour'";

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
									}else if(str.equals("shirts:current_bid_ascending")) {
										%>
										<h1 align="center">AscendingBid Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' ORDER BY current_bid ASC";

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
										}else if(str.equals("shirts:current_bid_descending")) {
											%>
											<h1 align="center">DescendingBid Shirt Sort</h1>

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
String sql ="select distinct * from items where clothing_type='shirt' ORDER BY current_bid DESC";

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
											} else if(str.equals("pants:size:large")) {
												%>
												<h1 align="center">Large Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND size = 'large' ";

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
												} else if(str.equals("pants:size:medium")) {
												%>
												<h1 align="center">Medium Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND size = 'medium' ";

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
												} else if(str.equals("pants:size:small")) {
													%>
												<h1 align="center">Small Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND size = 'small' ";

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
													} else if(str.equals("pants:material:cotton")) {
														%>
												<h1 align="center">Cotton Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND material='cotton'";

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
														}else if(str.equals("pants:material:synthetic")) {
															%>
															<h1 align="center">Synthetic Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND material='synthetic'";

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
															}else if(str.equals("pants:material:silk")) {
																%>
																<h1 align="center">Silk Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND material='silk'";

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
																}else if(str.equals("pants:material:wool")) {
																	%>
																	<h1 align="center">Wool Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND material='wool'";

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
																	}else if(str.equals("pants:brand:nike")) {
																		%>
																		<h1 align="center">Nike Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND brand='nike'";

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
																		}else if(str.equals("pants:brand:adidas")) {
																			%>
																			<h1 align="center">Adidas Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND brand='adidas'";

												resultSet = statement.executeQuery(sql);
												while(resultSet.next()){
												%>
												<tr>

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
																			}else if(str.equals("pants:brand:calvinklein")) {
																				%>
																				<h1 align="center">CalvinKlein Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND brand='calvinklein'";

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
																				}else if(str.equals("pants:brand:underarmour")) {
																					%>
																					<h1 align="center">Underarmour Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' AND brand='underarmour'";

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
																					}else if(str.equals("pants:current_bid_ascending")) {
																						%>
																						<h1 align="center">AscendingBid Pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' ORDER BY current_bid ASC";

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
																						}else if(str.equals("pants:current_bid_descending")) {
																							%>
																							<h1 align="center">DescendingBid pants Sort</h1>

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
												String sql ="select distinct * from items where clothing_type='pants' ORDER BY current_bid DESC";

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
																							}else if(str.equals("shoes:size:large")) {
																								%>
																								<h1 align="center">Large Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND size = 'large' ";

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
																								} else if(str.equals("shoes:size:medium")) {
																								%>
																								<h1 align="center">Medium Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND size = 'medium' ";

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
																								} else if(str.equals("shoes:size:small")) {
																									%>
																								<h1 align="center">Small Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND size = 'small' ";

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
																									} else if(str.equals("shoes:material:cotton")) {
																										%>
																								<h1 align="center">Cotton shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND material='cotton'";

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
																										}else if(str.equals("shoes:material:synthetic")) {
																											%>
																											<h1 align="center">Synthetic Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND material='synthetic'";

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
																											}else if(str.equals("shoes:material:silk")) {
																												%>
																												<h1 align="center">Silk Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND material='silk'";

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
																												}else if(str.equals("shoes:material:wool")) {
																													%>
																													<h1 align="center">Wool Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND material='wool'";

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
																													}else if(str.equals("shoes:brand:nike")) {
																														%>
																														<h1 align="center">Nike Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND brand='nike'";

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
																														}else if(str.equals("shoes:brand:adidas")) {
																															%>
																															<h1 align="center">Adidas Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND brand='adidas'";

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
																															}else if(str.equals("shoes:brand:calvinklein")) {
																																%>
																																<h1 align="center">CalvinKlein Shoes Sort</h1>

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
																								String sql ="select distinct * from items where type='shoes' AND brand='calvinklein'";

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
																																}else if(str.equals("shoes:brand:underarmour")) {
																																	%>
																																	<h1 align="center">Underarmour Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' AND brand='underarmour'";

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
																																	}else if(str.equals("shoes:current_bid_ascending")) {
																																		%>
																																		<h1 align="center">AscendingBid Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' ORDER BY current_bid ASC";

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
																																		}else if(str.equals("shoes:current_bid_descending")) {
																																			%>
																																			<h1 align="center">DescendingBid Shoes Sort</h1>

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
																								String sql ="select distinct * from items where clothing_type='shoes' ORDER BY current_bid DESC";

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
																																			}else if(str.equals("hats:size:large")) {
																																				%>
																																				<h1 align="center">Large Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND size = 'large' ";

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
																																				} else if(str.equals("hats:size:medium")) {
																																				%>
																																				<h1 align="center">Medium Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND size = 'medium' ";

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
																																				} else if(str.equals("hats:size:small")) {
																																					%>
																																				<h1 align="center">Small Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND size = 'small' ";

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
																																					} else if(str.equals("hats:material:cotton")) {
																																						%>
																																				<h1 align="center">Cotton Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND material='cotton'";

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
																																						}else if(str.equals("hats:material:synthetic")) {
																																							%>
																																							<h1 align="center">Synthetic Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND material='synthetic'";

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
																																							}else if(str.equals("hats:material:silk")) {
																																								%>
																																								<h1 align="center">Silk Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND material='silk'";

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
																																								}else if(str.equals("hats:material:wool")) {
																																									%>
																																									<h1 align="center">Wool Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND material='wool'";

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
																																									}else if(str.equals("hats:brand:nike")) {
																																										%>
																																										<h1 align="center">Nike Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND brand='nike'";

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
																																										}else if(str.equals("hats:brand:adidas")) {
																																											%>
																																											<h1 align="center">Adidas Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND brand='adidas'";

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
																																											}else if(str.equals("hats:brand:calvinklein")) {
																																												%>
																																												<h1 align="center">CalvinKlein Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND brand='calvinklein'";

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
																																												}else if(str.equals("hats:brand:underarmour")) {
																																													%>
																																													<h1 align="center">Underarmour Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' AND brand='underarmour'";

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
																																													}else if(str.equals("hats:current_bid_ascending")) {
																																														%>
																																														<h1 align="center">AscendingBid Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' ORDER BY current_bid ASC";

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
																																														}else if(str.equals("hats:current_bid_descending")) {
																																															%>
																																															<h1 align="center">DescendingBid Hats Sort</h1>

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
																																				String sql ="select distinct * from items where clothing_type='hats' ORDER BY current_bid DESC";

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
</body>
</html>
