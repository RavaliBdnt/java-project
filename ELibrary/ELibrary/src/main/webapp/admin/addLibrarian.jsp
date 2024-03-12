<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
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

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="w3-sidebar w3-light-gray sb w3-bar-block"
		style="width: 15%"><%@include file="sideBar.jsp"%></div>

	<div class="mainBar" style="margin-left: 15%">
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

				<div class="w3-container w3-center w3-amber">
					<h2>Add Librarian</h2>
				</div>

				<form class="w3-container" action="../addLibrarian" method="post">

					<label>Name</label> <input class="w3-input w3-border" name="name"
						type="text" required> <label>Email</label> <input
						class="w3-input w3-border" name="email" type="email" required>




					<label>Password</label> <input class="w3-input w3-border"
						name="password" type="password" required>
					<div class="w3-center">
						<br>
						<button class="w3-btn  w3-blue-grey w3-hover-amber">Add
							Librarian</button>
					</div>
				</form>

			</div>

		</div>
		<br> <br>
	</div>





</body>
</html>