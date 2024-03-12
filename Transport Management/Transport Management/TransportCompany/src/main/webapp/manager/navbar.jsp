<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<!-- Sidebar -->
	<div class="w3-sidebar w3-bar-block w3-border-right"
		style="display: none" id="mySidebar">
		<button onclick="w3_close()" class="w3-bar-item w3-large">Close
			&times;</button>
		<a href="/TransportCompany/manager/index.jsp" class="w3-bar-item w3-button">Home</a> <a href="/TransportCompany/manager/viewInstalledTrucks.jsp"
			class="w3-bar-item w3-button">View Install Trucks</a> <a href="/TransportCompany/manager/contactAdmin.jsp"
			class="w3-bar-item w3-button">Contact With Admin</a>  <a href="../managerLogout"
			class="w3-bar-item w3-button">Logout</a>
	</div>

	<!-- Page Content -->
	<div class="" style="background-color:#A765DC;color:white;">

		<div>
			<button class="w3-button w3-xlarge" onclick="w3_open()">☰</button>
			<a href="/TransportCompany/index.jsp" id="header" style="text-decoration:none;">Transport Company</a>
			<a href="#" class="w3-right" style="margin-top:15px;margin-right:10px;text-decoration:none;">Hi, <%= session.getAttribute("name") %></a>

		</div>

	</div>


	<script>
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("mainContent").style.marginLeft = "15%";
			document.getElementById("header").style.marginLeft = "15%";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("mainContent").style.marginLeft = "0%";
			document.getElementById("header").style.marginLeft = "0%";
		}
	</script>
</body>
</html>
