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
</head>
<body>
	<nav class="navbar navbar-dark " style="background-color: #A765DC;">
		<div class="container-fluid">
			<a href="/TransportCompany/index.jsp" class="navbar-brand">Transport Company</a>


			<div class="justify-content-end d-flex flex-row ">
				<div class="dropdown ms-auto">


					<button type="button" class="btn dropdown-toggle  mr-2"
						data-bs-toggle="dropdown"
						style="background-color: black; color: white"">Login As</button>

					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="adminLogin.jsp">Admin</a></li>
						<li><a class="dropdown-item" href="ManagerLogin.jsp">Manager</a></li>

					</ul>
				</div>
				<div class="ms-auto">


					<button type="button" class="btn mr-2"
						style="background-color: black; color: white"
						onclick="window.location='/TransportCompany/viewInstalledTrucks.jsp'">View
						Installed Trucks</button>

				</div>
				<div class="ms-auto">


					<button type="button" class="btn "
						style="background-color: black; color: white"
						onclick="window.location='/TransportCompany/contactAdmin.jsp'">Contact
						to Admin</button>

				</div>
			</div>

		</div>
	</nav>

</body>
</html>