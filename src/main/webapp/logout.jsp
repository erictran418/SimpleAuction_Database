<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<body>
		<% 
		session.invalidate();
		response.sendRedirect("loginpage.html");
		%>
	</body>
</html>