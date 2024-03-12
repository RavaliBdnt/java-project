<%@page import="com.entities.Librarian"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.LibrarianDao"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.table {
	margin: auto;
	width: 90%;
	margin-top: 5%;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<div class="w3-sidebar w3-light-gray w3-bar-block" style="width: 15%"><%@include
			file="sideBar.jsp"%></div>
			
			
	<div class="mainBar" style="margin-left: 15%">




		<div class="table">
				<c:if test="${not empty deleteSuccess}">
			<div class="w3-panel w3-green">
				<h3>${deleteSuccess }</h3>

			</div>
			<c:remove var="deleteSuccess" />
		</c:if>
		<div class="table">
				<c:if test="${not empty updateSuccess}">
			<div class="w3-panel w3-green">
				<h3>${updateSuccess }</h3>

			</div>
			<c:remove var="updateSuccess" />
		</c:if>

		<c:if test="${not empty deleteFailed}">
			<div class="w3-panel w3-red">
				<h3>${deleteFailed }</h3>

			</div>
			<c:remove var="deleteFailed" />
		</c:if>
		
				<c:if test="${not empty updateFailed}">
			<div class="w3-panel w3-red">
				<h3>${updateFailed }</h3>

			</div>
			<c:remove var="updateFailed" />
		</c:if>
		
			<table class="w3-table ">
				<tr class="w3-amber">
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

				<%
				LibrarianDao dao1 = new LibrarianDao(DbConnection.getConnection());
				List<Librarian> librarians = dao1.getAllLibrarians();
				for (Librarian e : librarians) {
				%>


				<tr>
					<td><%=e.getId()%></td>
					<td><%=e.getName()%></td>
					<td><%=e.getEmail()%></td>

					<td><a
						href="/ELibrary/admin/editLibrarian.jsp?id=<%=e.getId()%>"><img
							src="../img/edit (1).png" width="32px" height="32px"></a> <a
						href="../delete?id=<%=e.getId()%>"><img
							src="../img/delete.png" width="32px" height="32px"></a></td>

				</tr>
				<%
				}
				%>
			</table>
		</div>

	</div>
</div>
</body>
</html>