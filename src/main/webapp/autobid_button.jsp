<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!-- Tracy Yang (tly15) -->
<!DOCTYPE html>
<html>
	<body>
		<form action="initialize_autobid.jsp" method="post">
			Item ID: <input type="text" name="item_id" required><br> <!-- temp values for testing -->
			Bid Increment: <input type="text" name="bid_increment" required><br>
			Upper Limit: <input type="text" name="upper_limit" required><br>
			<button type="submit">Autobid</button>
		</form>
	</body>
</html>