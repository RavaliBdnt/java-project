<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.form1 {
	margin: auto;
	margin-top: 10px;
	width: 60%;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

	<div class="w3-container form1 w3-card" >

		<div class="w3-container" style="background-color:#A765DC;color:white;">
			<%
			int id = Integer.parseInt(request.getParameter("id"));
			%>
			<h2>
				Do you want to delete truck with id =
				<%=id%>
			</h2>
		</div>
		<br>
	<div class="w3-center">
	<div class="w3-row">
	<form action = "../deleteTruck" method="post">
	<input type="hidden" value="<%=id%>" name="id">
	<button type="submit" class="w3-btn w3-red w3-quarter">Confirm Delete</button>
	</form>	
	<form>
		
	</form>
	
		</div>
	</div>
	</div>

</body>
</html>