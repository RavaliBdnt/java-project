<%@page import="com.dao.ManagerDao"%>
<%@page import="com.entities.Manager"%>
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


				<c:if test="${not empty success}">
					<div class="w3-panel w3-green">
						<h3>${success }</h3>

					</div>
					<c:remove var="success" />
				</c:if>
				<div class="w3-container">
					<form id="frmSearchByBranch" class="w3-third">
						<input id="branchName" placeholder="Search By Branch Name"
							name="branchName" value="<%= session.getAttribute("branchName")%>" type="hidden" required>
						<button id="tName" class="w3-button w3-amber" type="submit"
							onclick="searcByBranchName()">Search Your Branch Trucks</button>
					</form>



				</div>
				<br>

				<%
				String branchName = request.getParameter("branchName");
				
				List<Truck> trucks = new ArrayList<Truck>();
				TruckDao tdao = new TruckDao();
				if(branchName==null){
				%>



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
				

					
					

					trucks = tdao.getAllTrucks();
					
						

						
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

					</tr>
					<%
						}
					%>





				</table>
				<%
					
				}else{
					
					trucks = tdao.getTruckByBranch(branchName);
					
					
					%>

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
						
						<%
						String b2 = (String) session.getAttribute("branchName");
						if(branchName.equals(b2)){

						%>
												<td>
							<button type="button" data-bs-toggle="dropdown">⋮</button>
							<ul class="dropdown-menu">

								<li><a
									href="/TransportCompany/manager/editTruck.jsp?id=<%=t.getId()%>"
									class="dropdown-item">Edit</a></li>

							</ul>


						</td>
						
						<%
						
						}
						%>

					</tr>

					<%
						}
					%>




				</table>




				<%
				
				}
					%>
			</div>

		</div>
	</div>













	<script type="text/javascript">
		function searcByBranchName() {
			$.ajax({

				type : "post",
				url : "viewInstalledTrucks.jsp",
				data : {
					"truckName" : $("#branchName").val()
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