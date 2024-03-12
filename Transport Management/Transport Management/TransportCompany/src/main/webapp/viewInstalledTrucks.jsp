<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Truck"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.TruckDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.table {
	margin: auto;
	width: 80%;
	margin-top: 5%;
}


</style>
</head>
<body>
	<%@include file="navbar.jsp"%>




	<div class="mainContent">





				<br>



				<table class="w3-table ">
					<tr class="" style="background-color: #A765DC; color: white;">
						<th>ID</th>
						<th>Name</th>
						<th>Truck Number</th>
						<th>Color</th>
						<th>Company Name</th>
						<th>Branch Name</th>
						<th>Purchase Date</th>
						<th>Image</th>
						<th>Installed By</th>
						
					</tr>

					<%
					


					List<Truck> trucks = new ArrayList<Truck>();
					TruckDao tdao = new TruckDao();
					trucks = tdao.getAllTrucks();
				
					for(Truck t : trucks){
		
					%>
					<tr>
						<td><%=t.getId()%></td>
						<td><%=t.getName()%></td>
						<td><%=t.getTruckNumber()%></td>
						<td><%=t.getColor()%></td>
						<td><%=t.getCompanyName()%></td>
						<td><%=t.getBranchName()%></td>
						<td><%=t.getPurchaseDate()%></td>
						<td><img src="truckImages/<%=t.getImage()%>" width="100px"
							height="100px"></td>
						<td><%=t.getInstalledBy()%></td>

						

					</tr>
					<%
					}
					%>
				</table>
			</div>



</body>
</html>