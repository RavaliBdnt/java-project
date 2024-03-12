<%@page import="com.utils.Reversed"%>
<%@page import="com.dao.ContactDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Contact"%>
<%@page import="java.util.List"%>
<%@page import="com.utils.Reversed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.table {
	margin:auto;
	width: 80%;
	margin-top: 5%;
}
</style>
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="mainContent">
		<div class="table">
		<table class="w3-table ">
			<tr class="" style="background-color: #A765DC; color: white;">
				<th>Id</th>
				<th>Name</th>
				<th>Topic</th>
				<th>Message</th>
			</tr>



			<%
			List<Contact> contacts = new ArrayList<Contact>();
			ContactDao dao = new ContactDao();
			contacts = dao.getAllContact();

			for (Contact c : Reversed.reversed(contacts)) {
			%>

			<tr>
				<td><%=c.getId()%></td>
				<td><%=c.getNameOfContactPerson()%></td>
				<td><%=c.getTopic()%></td>
				<td><%=c.getMessage()%></td>


			</tr>
			<%
			}
			%>





		</table>
		</div>
		</div>
</body>
</html>