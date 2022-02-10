<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<body>
		<form action="confirmauction.jsp" method="post">
		
		<h2>Item Details</h2>
        <label>Create New Item ID:</label> <input type="number" name="item_ID" required min=1> <br>
        <br/><label>Enter Category Number:</label> <input type="number" name="category_number" required> <br>
        <br/><label>Enter Sub-Category:</label> <input type="name" name="subcategory" required> <br>
        <br/><label>Enter Name:</label> <input type="name" name="name" required> <br>
        <br/><label>Enter Brand:</label> <input type="name" name="brand" required> <br>
        <br/><label>Enter Color:</label> <input type="name" name="color" required> <br>
        <label>Set Closing Date:</label> <input type="date" name="close_date" required> <br>
        <br/><label>Set Closing Time:</label> <input type="time" name="close_time" required> <br>
        <br/><label>Set Initial Price: </label> <input type="number" name="init_price" required> <br> 
        <br/><label>Set Minimum Price: </label> <input type="number" name="minimum" required> <br> 
        <br/><label>Set Bid Increment:</label> <input type="number" name="bid_increment" required min=00.01 step="0.01"> <br>
            

        <br/><input type="submit" value="Submit">
			<button type="submit">Auction</button>
		</form>
	</body>
</html>