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



	<div id="mainContent">



		<div class="form1">

			<c:if test="${not empty branchFailed }">
				<div class="w3-panel w3-red">
					<h3>${branchFailed}</h3>
				</div>
				<c:remove var="branchFailed" />
			</c:if>

			<c:if test="${not empty success }">
				<div class="w3-panel w3-green">
					<h3>${success}</h3>
				</div>
				<c:remove var="success" />
			</c:if>

			<c:if test="${not empty success }">
				<div class="w3-panel w3-green">
					<h3>${success}</h3>
				</div>
				<c:remove var="success" />
			</c:if>

			<c:if test="${not empty failed }">
				<div class="w3-panel w3-red">
					<h3>${failed}</h3>
				</div>
				<c:remove var="failed" />
			</c:if>

			<div class="w3-card-4 table">

				<div class="w3-container w3-center"
					style="background-color: #A765DC">
					<h2 style="color: white;">Install New Truck</h2>
				</div>

				<form class="w3-container" action="../installTruck" method="post"
					enctype="multipart/form-data">

					<label>Name</label> <input class="w3-input w3-border" name="name"
						type="text" required> <label>Color</label> <input
						class="w3-input w3-border" name="color" type="text" required>
					<label>Truck Number</label> <input class="w3-input w3-border"
						name="truckNumber" type="text" required> <label>Company
						Name</label> <input class="w3-input w3-border" name="companyName"
						type="text" required>
						
						<label>Branch Name</label>
						
						 <select class="w3-select"
						name="branchName">
						<option value="none">Choose your option</option>
						<option value="Adilabad">Adilabad</option>
						<option value="Utnoor">Utnoor</option>
						<option value="Nirmal">Nirmal</option>
						<option value="Hyderabad">Hyderabad</option>
						<option value="Mumbai">Mumbai</option>
						<option value="Medchal">Medchal</option>
					</select> <label>Purchase Date</label> <input class="w3-input w3-border"
						name="pd" type="Date" required> <input
						class="w3-input w3-border"
						value="<%=session.getAttribute("name")%>" name="installedBy"
						type="hidden" required> <label>Image</label> <input
						class="w3-input w3-border" name="image" type="file" required>





					<div class="w3-center">
						<br>
						<button class="w3-btn   w3-hover-amber"
							style="background-color: #A765DC; color: white;">Install
							Truck</button>
					</div>
				</form>
			</div>

		</div>

	</div>


</body>
</html>