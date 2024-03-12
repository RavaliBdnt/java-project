


<%@page import="com.dao.ContactDao"%>
<%@page import="com.entities.Contact"%>
<%@page import="com.dao.ManagerDao"%>
<%@page import="com.entities.Manager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Truck"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.TruckDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<style>
.table {
	margin: auto;
	width: 70%;
	margin-top: 2%;
}

.w3-quarter {
	margin: 25px;
	padding: 20px;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<%
	List<Truck> trucks = new ArrayList<Truck>();
	TruckDao dao = new TruckDao();
	trucks = dao.getAllTrucks();
	
	List<Manager> managers = new ArrayList<Manager>();
	ManagerDao dao1 = new ManagerDao();
	managers = dao1.getAllManager();
	
	List<Contact> contacts = new ArrayList<Contact>();
	ContactDao dao2 = new ContactDao();
	contacts = dao2.getAllContact();
	Contact contact = contacts.get(contacts.size()-1);
	String shortMessage = contact.getMessage().substring(0,15);
	
	%>

	<div class="main">

		<div class="row table" >
		
			<div class="w3-card w3-quarter" style="cursor: pointer;" onclick="window.location='/TransportCompany/admin/viewInstalledTrucks.jsp';">
			
				<div class="w3-center ">
					<img src="/TransportCompany/img/truck.png" width="100px"
						height="100px">
					<h4>No of Truck Installed</h4>
					<h2><%=trucks.size()%></h2>
				</div>
				
			</div>
		

			<div class="w3-card w3-quarter" style="cursor: pointer;" onclick="window.location='/TransportCompany/admin/viewManager.jsp';">
				<div class="w3-center">
					<img src="/TransportCompany/img/manager.png" width="100px"
						height="100px">
					<h4>No of Manager</h4>
					<h2><%=managers.size()%></h2>
				</div>
			</div>

			<div class="w3-card w3-quarter" style="cursor: pointer;" onclick="window.location='/TransportCompany/admin/viewNotification.jsp';">
				<div class="w3-center">
					<img src="/TransportCompany/img/comments.png" width="100px"
						height="100px">
					<h4>Recent Message</h4>
					<h3><%= shortMessage %>... </h3>
				</div>
			</div>

		</div>

	</div>
</body>
</html>
</body>
</html>