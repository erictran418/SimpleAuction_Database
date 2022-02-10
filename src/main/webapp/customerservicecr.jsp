<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    <%@ page import="java.sql.Timestamp" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.util.Date" %>
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
	
		out.println("Welcome: " + session.getAttribute("usern"));
		
	%>
	<form action="logout.jsp">
		<button type="submit">Logout</button>
	</form><br>
	
	<form action="answer.jsp">
		<button type="submit">Unanswered Questions</button>
	</form><br>
	
	<form action="csSearch.jsp" method="post">
	Search keywords (up to 5): <input type="text" name="searchkeys">
	<button value="value" type="submit">Submit</button>
	</form><br>
	
	<h1>Previously Asked Questions:</h1>
	<% 
	String user = request.getParameter("usern");
	String pass = request.getParameter("pswd");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/336proj";
	String duser = "root"; //mySQl Username
	String dpass = "aaaa"; //mySQl Password
	Connection con = DriverManager.getConnection(url, duser, dpass);
	

	PreparedStatement query = con.prepareStatement("select * from mail",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	
	ResultSet rs = query.executeQuery();
	
	int rsSize = 0;
	if(rs != null){
		rs.last();
		rsSize = rs.getRow();
		rs.beforeFirst();
	}
	else{
		out.println("No questions have been asked at this time");
	}
	SimpleDateFormat dateform = new SimpleDateFormat("yyyy-MM-dd");
	for(int i = 0; i<rsSize; i++){
		rs.next();
		String sender = rs.getString(1);
		String question = rs.getString(2);
		String date = (String)dateform.format(rs.getDate(4));%>
		-----------------------------------------------------------------------------------------<br>
 		User: <%=sender%>&emsp;&emsp;&emsp;Date: <%=date%><br>
 		Question:<b><%=question%></b>
		<br>
		
	<%
		if(rs.getString(3) == null){%><br><%
			continue;
		}
		String answer = rs.getString(3);
		String rep = rs.getString(5);%>
		
 		 &emsp;&emsp;&emsp;Support Representative: <%=rep%>&emsp;&emsp;&emsp;Date: <%=date%><br>
 		 &emsp;&emsp;&emsp;Support Answer: <b><%=answer%></b>
		<br><br>
	
	
	<%}%>
	
	
	
	
</body>
</html>