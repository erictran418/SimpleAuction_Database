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
	String acctype = (String)session.getAttribute("acctype");
	%>
	<form action="logout.jsp">
		<button type="submit">Logout</button>
	</form>
	<%
	if(acctype.equals("user")){
	%>
	<form action="customerserviceuser.jsp">
		<button type="submit">Back</button>
	</form>
	<%}
	else{%>
	<form action="customerservicecr.jsp">
		<button type="submit">Back</button>
	</form>
	<%}%>
	
	<% 
	String user = request.getParameter("usern");
	String pass = request.getParameter("pswd");

	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/336proj";
	String duser = "root"; //mySQl Username
	String dpass = "aaaa"; //mySQl Password
	Connection con = DriverManager.getConnection(url, duser, dpass);
	
	String searchQuery = request.getParameter("searchkeys"); 
	PreparedStatement query;
	
	StringTokenizer st = new StringTokenizer(searchQuery);
	
	int wordCount = st.countTokens();
	
	if(wordCount == 0 || searchQuery == null || searchQuery.isEmpty()){
		if(acctype.equals("user")){
			response.sendRedirect("customerserviceuser.jsp");
		}
		else{
			response.sendRedirect("customerservicecr.jsp");
		}
	}
	String s1 = "";
	String s2 = "";
	String s3 = "";
	String s4 = "";
	String s5 = "";
	
	if(wordCount == 1){
		s1 = "%" + st.nextToken() + "%";
		query = con.prepareStatement("select * from mail WHERE (question LIKE ?)",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		query.setString(1, s1);
	}
	else if(wordCount == 2){
		s1 = "%" + st.nextToken() + "%";
		s2 = "%" + st.nextToken() + "%";
		query = con.prepareStatement("select * from mail WHERE (question LIKE ? OR question LIKE ?)",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		query.setString(1, s1);
		query.setString(2, s2);
	}
	else if(wordCount == 3){
		s1 = "%" + st.nextToken() + "%";
		s2 = "%" + st.nextToken() + "%";
		s3 = "%" + st.nextToken() + "%";
		query = con.prepareStatement("select * from mail WHERE (question LIKE ? OR question LIKE ? OR question LIKE ?)",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		query.setString(1, s1);
		query.setString(2, s2);
		query.setString(3, s3);
	}
	else if(wordCount == 4){
		s1 = "%" + st.nextToken() + "%";
		s2 = "%" + st.nextToken() + "%";
		s3 = "%" + st.nextToken() + "%";
		s4 = "%" + st.nextToken() + "%";
		query = con.prepareStatement("select * from mail WHERE (question LIKE ? OR question LIKE ? OR question LIKE ? OR question LIKE ?)",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		query.setString(1, s1);
		query.setString(2, s2);
		query.setString(3, s3);
		query.setString(4, s4);
	}
	else{ //Wordcount greater than 5
		s1 = "%" + st.nextToken() + "%";
		s2 = "%" + st.nextToken() + "%";
		s3 = "%" + st.nextToken() + "%";
		s4 = "%" + st.nextToken() + "%";
		s5 = "%" + st.nextToken() + "%";
		query = con.prepareStatement("select * from mail WHERE (question LIKE ? OR question LIKE ? OR question LIKE ? OR question LIKE ? OR question LIKE ?)",ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		query.setString(1, s1);
		query.setString(2, s2);
		query.setString(3, s3);
		query.setString(4, s4);
		query.setString(4, s5);
	}

	
	
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
 		 <b><%=question%></b>
		<br>
		
	<%
		if(rs.getString(3) == null){%><br><%
			continue;
		}
		String answer = rs.getString(3);
		String rep = rs.getString(5);%>
		
 		 &emsp;&emsp;&emsp;Support: <%=rep%>&emsp;&emsp;&emsp;Date: <%=date%><br>
 		 &emsp;&emsp;&emsp;<b><%=answer%></b>
		<br><br>
	
	<%}%>
	
	
	
	
	
	
</body>
</html>