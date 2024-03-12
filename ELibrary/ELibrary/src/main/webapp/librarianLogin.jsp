<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.form1{
margin:auto;
width:40%;
margin-top:5%;
}

</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="form1">
	
	<c:if test="${not empty empLoginFailed }">
	<div class="w3-panel w3-green">
	<h3>${empLoginFailed }</h3>
	</div>
	<c:remove var="empLoginFailed"/>
	</c:if>
	
	<c:if test="${not empty empLogoutSuccess }">
	<div class="w3-panel w3-green">
	<h3>${empLogoutSuccess }</h3>
	</div>
	<c:remove var="empLogoutSuccess"/>
	</c:if>
	
	
		<div class="w3-card-4">

			<div class="w3-container w3-center w3-amber">
				<h2>Librarian Login</h2>
			</div>

			<form class="w3-container" action="librarianLogin" method="post">

				<label>Email id</label> <input class="w3-input w3-border" name="email" type="email" required>

				<label>Password</label> <input class="w3-input w3-border" name="password" type="password" required>
				<div class="w3-center">
				<br>
				 <button class="w3-btn  w3-blue-grey w3-hover-amber">Login</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>