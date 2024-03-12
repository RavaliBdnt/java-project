<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty adminIn }">
		<c:redirect url="../adminLogin.jsp"></c:redirect>
	</c:if>


	<%@include file="navbar.jsp"%>
	<div class="wrapper">
		<div class="w3-sidebar w3-light-gray w3-bar-block"><%@include
				file="sideBar.jsp"%></div>
		<div class="mainBar" style="margin-left: 15%">Home</div>
	</div>
</body>
</html>