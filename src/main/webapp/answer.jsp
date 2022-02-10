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
	<form action="customerservicecr.jsp">
		<button type="submit">Back</button>
	</form>
	<form action="answer.jsp">
		<button type="submit">Next</button>
	</form>
	
	
	<h1>Unanswered Questions</h1>
	<% 
	int count = Integer.parseInt((String)session.getAttribute("count"));
	count = count+1;
	session.setAttribute("count", String.valueOf(count));
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
	for(int i = 0; i<count+1; i++){
		rs.next();
	}
	if(count == rsSize - 1){
		count = -1;
	}
	session.setAttribute("count", String.valueOf(count));
	if(rs.getString(3) == null){
		String sender = rs.getString(1);
		String question = rs.getString(2);
		String date = (String)dateform.format(rs.getDate(4));
		session.setAttribute("sender", sender);
		session.setAttribute("question", question);%>
 		 User: <%=sender%>&emsp;&emsp;&emsp;Date: <%=date%><br>
 		 <b><%=question%></b>
 		 <form action="doAns.jsp" method="post">
		Answer Question: <input type="text" name="qresp"><br>
		<button value="value" type="submit">Submit</button>
		</form>
		<br>
	<%}
	else{
		response.sendRedirect("answer.jsp");
	}%>
		
	
	
	
	
	
	
</body>
</html>