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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@include file="navbar.jsp"%>
	<div class="wrapper">
		<div class="w3-sidebar w3-light-gray w3-bar-block"><%@include
				file="sideBar.jsp"%></div>
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
					<h2>Add New Book</h2>
				</div>

				<form class="w3-container" action="../addbook" method="post">

					<label>Title of Book</label> <input class="w3-input w3-border" name="title"
						type="text" required> <label>Author Name</label> <input
						class="w3-input w3-border" name="author" type="text" required>




					<label>Date</label> <input class="w3-input w3-border"
						name="date" type="date" required>
						<label>Quantity</label> <input class="w3-input w3-border"
						name="quantity" type="text" required>
					<div class="w3-center">
						<br>
						<button class="w3-btn  w3-blue-grey w3-hover-amber">Add
							Book</button>
					</div>
				</form>

			</div>

		</div>
		</div>
	</div>

</body>
</html>