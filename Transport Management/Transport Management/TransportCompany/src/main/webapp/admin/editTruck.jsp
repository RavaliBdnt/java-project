<%@page import="com.entities.Truck"%>
<%@page import="com.dao.TruckDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rightWholeBar {
	float: right;
}

.form1 {
	margin: auto;
	width: 40%;
	/* margin-top: 5%; */
}

.table {
	margin-top: 5%;
}

.navigation {
	/* fixed keyword is fine too */
	position: sticky;
	top: 0;
	z-index: 100;
	/* z-index works pretty much like a layer:
   the higher the z-index value, the greater
   it will allow the navigation tag to stay on top
   of other tags */
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="mainContent">
		<div class="form1">


			<c:if test="${not empty branchFailed }">
				<div class="w3-panel w3-green">
					<h3>${branchFailed}</h3>
				</div>
				<c:remove var="branchFailed" />
			</c:if>

			<c:if test="${not empty failed }">
				<div class="w3-panel w3-red">
					<h3>${failed}</h3>
				</div>
				<c:remove var="failed" />
			</c:if>

			<div class="w3-card-4 table">

				<%
				int id = Integer.parseInt(request.getParameter("id"));
				TruckDao dao = new TruckDao();
				Truck truck = dao.getTruckById(id);
				%>

				<div class="w3-container w3-center"
					style="background-color: #A765DC">
					<h2 style="color: white;">Update Truck</h2>
				</div>

				<form action="../editTruck1" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="id" value="<%=truck.getId()%>">
					<label>Name</label> <input class="w3-input w3-border"
						value="<%=truck.getName()%>" name="name" type="text" required>
					<label>Color</label> <input class="w3-input w3-border"
						value="<%=truck.getColor()%>" name="color" type="text" required>
					<label>Truck Number</label> <input class="w3-input w3-border"
						name="truckNumber" value="<%=truck.getTruckNumber()%>"
						type="text" required> <label>Company Name</label> <input
						class="w3-input w3-border" value="<%=truck.getCompanyName()%>"
						name="companyName" type="text" required> 
						
						<label>Branch Name</label>
						
						<select
						class="w3-select" name="option">
						<option value="none" >Choose your option</option>
						<option value="Adilabad">Adilabad</option>
						<option value="Utnoor">Utnoor</option>
						<option value="Nirmal">Nirmal</option>
						<option value="Hyderabad">Hyderabad</option>
						<option value="Mumbai">Mumbai</option>
						<option value="Medchal">Medchal</option>
					</select> <label>Purchase Date</label> <input class="w3-input w3-border"
						value="<%=truck.getPurchaseDate()%>" name="pd" type="Date"
						required> <label>Image</label> <input
						class="w3-input w3-border" name="image" type="file" required>
					<br>
					<div class="w3-center">
						<button type="submit" class="w3-button"
							style="background-color: #A765DC; color: white;">Update
							Truck</button>
					</div>
				</form>
			</div>

		</div>

	</div>
</body>
</html>