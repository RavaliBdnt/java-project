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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<%@include file="navbar.jsp"%>



	<div id="mainContent">

		<div class="form1">


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

				<div class="w3-container w3-center" style="background-color:#A765DC">
					<h2 style="color:white;">Add Manager</h2>
				</div>

				<form class="w3-container" action="../addManager" method="post">

					<label>Name</label> <input class="w3-input w3-border" name="name"
						type="text" required> <label>Branch Name</label> <input
						class="w3-input w3-border" name="branchName" type="text" required>
					<label>Date of Birth</label> <input class="w3-input w3-border"
						name="dob" type="Date" required> <label>Gender</label> <input
						class="w3-radio" type="radio" name="gender" value="male" checked>
					<label>Male</label> <input class="w3-radio" type="radio"
						name="gender" value="female"> <label>Female</label> 
						<br>
						<label>Email</label>
					<input class="w3-input w3-border" name="email" type="email"
						required>
						
						 <label>Date of Joining</label> <input
						class="w3-input w3-border" name="doj" type="Date" required>
						
						
					<label>Salary</label> <input class="w3-input w3-border"
						name="salary" type="text" required>
						
						 <label>Password</label>
					<input class="w3-input w3-border" name="password" type="password"
						required>
						
						
					<div class="w3-center">
						<br>
						<button class="w3-btn   w3-hover-amber" style="background-color: #A765DC;color:white;">Add
							Manager</button>
					</div>
				</form>
			</div>

		</div>

	</div>


</body>
</html>