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




		<div class="table form1">
			<c:if test="${not empty SuccessDeleteTruck}">
				<div class="w3-panel w3-green">
					<h3>${SuccessDeleteTruck }</h3>

				</div>
				<c:remove var="SuccessDeleteTruck" />
			</c:if>
			<div class="table">
				<c:if test="${not empty updateSuccess}">
					<div class="w3-panel w3-green">
						<h3>${updateSuccess }</h3>

					</div>
					<c:remove var="updateSuccess" />
				</c:if>

				<c:if test="${not empty deleteFailed}">
					<div class="w3-panel w3-red">
						<h3>${deleteFailed }</h3>

					</div>
					<c:remove var="deleteFailed" />
				</c:if>

				<c:if test="${not empty updateFailed}">
					<div class="w3-panel w3-red">
						<h3>${updateFailed }</h3>

					</div>
					<c:remove var="updateFailed" />
				</c:if>
				<div class="w3-container">
					<form id="frmSearchByName" class="w3-third">
						<input id="truckName" placeholder="Search By Truck Name"
							name="truckName" type="text" required>
						<button id="tName" class="w3-button w3-amber" type="submit"
							onclick="searcByName()">Search</button>
					</form>

					<form class="w3-third">
						<input placeholder="Search By Person" id="person" name="person"
							type="text" required>
						<button class="w3-button w3-amber" type="submit"
							onclick="searcByPerson()">Search</button>
					</form>

					<form class="w3-third ">
						<input placeholder="Search By Truck Number" id="truckNumber"
							name="truckNumber" type="text" required>
						<button class="w3-button w3-amber" type="submit"
							onclick="searcByNumber()">Search</button>
					</form>

				</div>
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
						<th>Action</th>
					</tr>

					<%
					String truckName = request.getParameter("truckName");

					String name = request.getParameter("person");
					String truckNumber = request.getParameter("truckNumber");
					List<Truck> trucks = new ArrayList<Truck>();
					TruckDao tdao = new TruckDao();

					if (truckName == null && name == null && truckNumber != null) {
						trucks = tdao.searchByNumber(truckNumber);

						if (trucks == null) {
							out.print("No records Found");
						}

						for (Truck t : trucks) {
					%>

					<tr>
						<td><%=t.getId()%></td>
						<td><%=t.getName()%></td>
						<td><%=t.getTruckNumber()%></td>
						<td><%=t.getColor()%></td>
						<td><%=t.getCompanyName()%></td>
						<td><%=t.getBranchName()%></td>
						<td><%=t.getPurchaseDate()%></td>
						<td><img src="../truckImages/<%=t.getImage()%>" width="100px"
							height="100px"></td>
						<td><%=t.getInstalledBy()%></td>

						<td>
							<button type="button" data-bs-toggle="dropdown">⋮</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="/TransportCompany/admin/deleteTruck.jsp?id=<%=t.getId()%>"
									onclick="document.getElementById('id01').style.display='block'"
									href="#">Delete</a></li>
								<li><a
									href="/TransportCompany/admin/editTruck.jsp?id=<%=t.getId()%>"
									class="dropdown-item" href="#">Edit</a></li>

							</ul>


						</td>

					</tr>
					<%
					}
					} else if (truckName != null && name == null && truckNumber == null) {
					trucks = tdao.searchByTruckName(truckName);
					if (trucks == null) {
					out.print("No records Found");
					}
					for (Truck t : trucks) {
					%>

					<tr>
						<td id="id"><%=t.getId()%></td>
						<td><%=t.getName()%></td>
						<td><%=t.getTruckNumber()%></td>
						<td><%=t.getColor()%></td>
						<td><%=t.getCompanyName()%></td>
						<td><%=t.getBranchName()%></td>
						<td><%=t.getPurchaseDate()%></td>
						<td><img src="../truckImages/<%=t.getImage()%>" width="100px"
							height="100px"></td>
						<td><%=t.getInstalledBy()%></td>

						<td><button type="button" data-bs-toggle="dropdown">⋮</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="/TransportCompany/admin/deleteTruck.jsp?id=<%=t.getId()%>"
									onclick="document.getElementById('id01').style.display='block'"
									href="#">Delete</a></li>
								<li><a
									href="/TransportCompany/admin/editTruck.jsp?id=<%=t.getId()%>"
									class="dropdown-item" href="#">Edit</a></li>

							</ul>
					</tr>
					<%
					}
					} else if (truckName == null && name != null && truckNumber == null) {
					trucks = tdao.searchByPerson(name);
					if (trucks == null) {
					out.print("No records Found");
					}
					int id = 0;
					for (Truck t : trucks) {
					int a = t.getId();

					id = a;
					%>

					<tr>
						<td id="id"><%=t.getId()%></td>
						<td><%=t.getName()%></td>
						<td><%=t.getTruckNumber()%></td>
						<td><%=t.getColor()%></td>
						<td><%=t.getCompanyName()%></td>
						<td><%=t.getBranchName()%></td>
						<td><%=t.getPurchaseDate()%></td>
						<td><img src="../truckImages/<%=t.getImage()%>" width="100px"
							height="100px"></td>
						<td><%=t.getInstalledBy()%></td>

						<td><button type="button" data-bs-toggle="dropdown">⋮</button>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item"
									href="/TransportCompany/admin/deleteTruck.jsp?id=<%=t.getId()%>"
									onclick="document.getElementById('id01').style.display='block'"
									href="#">Delete</a></li>
								<li><a
									href="/TransportCompany/admin/editTruck.jsp?id=<%=t.getId()%>"
									class="dropdown-item" href="#">Edit</a></li>

							</ul>
					</tr>
					<%
					}
					} else {
					out.print("Something went refresh the page");
					}
					%>




				</table>
			</div>

		</div>
	</div>













	<script type="text/javascript">
		function searcByName() {
			$.ajax({

				type : "post",
				url : "viewInstalledTrucks.jsp",
				data : {
					"truckName" : $("#truckName").val()
				},

				success : function(message) {

				},
				error : function(xhr) {
					alert("error");
				}

			});

		}

		function searcByPerson() {
			$.ajax({

				type : "post",
				url : "viewInstalledTrucks.jsp",
				data : {
					"person" : $("#person").val()
				},

				success : function(message) {

				},
				error : function(xhr) {
					alert("error");
				}

			});

		}

		function searcByNumber() {
			$.ajax({

				type : "post",
				url : "viewInstalledTrucks.jsp",
				data : {
					"truckNumber" : $("#truckNumber").val()
				},

				success : function(message) {

				},
				error : function(xhr) {
					alert("error");
				}

			});

		}
	</script>

</body>
</html>