<%@page import="com.entities.Manager"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.ManagerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.table {
	margin:auto;
	width: 80%;
	margin-top: 5%;
}
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>




	<div class="mainContent">






		<%
		List<Manager> managers = new ArrayList<Manager>();
		ManagerDao dao = new ManagerDao();
		%>
		


		<div class="w3-center table">
				<div class="w3-container w3-center" style="background-color:#A765DC">
					<h2 style="color:white;">View Managers</h2>
				</div>
				<br>
			<table class="w3-table  form1">
				<tr class="" style="background-color: #A765DC; color: white;">
					<th>ID</th>
					<th>Name</th>
					<th>Branch</th>
					<th>Date of Birth</th>
					<th>Gender</th>
					<th>Email</th>
					<th>Salary</th>

				</tr>
				<%
				managers = dao.getAllManager();
				for (Manager m : managers) {
				%>
				<tr>

					<td><%=m.getId()%></td>
					<td><%=m.getName()%></td>
					<td><%=m.getBranch()%></td>
					<td><%=m.getDob()%></td>
					<td><%=m.getGender()%></td>
					<td><%=m.getEmail()%></td>
					<td><%=m.getSalary()%></td>


					<%
					}
					%>
				</tr>

			</table>
		</div>
	</div>
</body>
</html>