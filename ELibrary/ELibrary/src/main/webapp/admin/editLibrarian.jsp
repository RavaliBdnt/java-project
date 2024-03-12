<%@page import="com.entities.Librarian"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.LibrarianDao"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style>
.form1 {
	margin: auto;
	margin-top: 10px;
	width: 60%;
}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="w3-sidebar w3-light-gray w3-bar-block" style="width: 15%"><%@include
			file="sideBar.jsp"%></div>
	<div class="mainBar" style="margin-left: 15%">

		<div class="form1">

			<%
			int id = Integer.parseInt(request.getParameter("id"));
			LibrarianDao dao = new LibrarianDao(DbConnection.getConnection());

			Librarian librarian = dao.getLibrarianById(id);
			%>


			<div class="w3-card-4">





				<div class="w3-container w3-center w3-amber">
					<h2>Update Librarian</h2>
				</div>

				<form class="w3-container" action="../updateLibrarian" method="post">


					<input type="hidden" name="id" value="<%=librarian.getId()%>"> <label>Name</label>
					<input class="w3-input w3-border" value="<%=librarian.getName()%>"
						name="name" type="text" required> <label>Email</label> <input
						class="w3-input w3-border" name="email"
						value="<%=librarian.getEmail()%>" type="email" required> <label>Designation</label>




					<label>Password</label> <input class="w3-input w3-border"
						value="<%=librarian.getPassword()%>" name="password" type="password"
						required>
					<div class="w3-center">
						<br>
						<button class="w3-btn  w3-blue-grey w3-hover-pink">Update</button>
					</div>
				</form>

			</div>

		</div>

	</div>

</body>
</html>