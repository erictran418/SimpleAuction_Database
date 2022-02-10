<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<body>
		<form action="welcome.jsp" method="post">
			Item ID: <input type="text" name="item_id" required><br> <!-- temp values for testing -->
			Bid amount: <input type="text" name="upper_limit" required><br>
			<button type="submit">Bid</button>
		</form>
	</body>
</html>