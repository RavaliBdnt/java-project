<%@page import="com.entities.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.BookDao"%>

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
					<th>SNO</th>
					<th>Title</th>
					<th>Author</th>
					<th>Date</th>
					<th>Quantity</th>
					<th>Action</th>
				</tr>

				<%
				BookDao dao1 = new BookDao(DbConnection.getConnection());
				List<Book> books = dao1.getAllBooks();
				for (Book e : books) {
				%>


				<tr>
					<td><%=e.getSno()%></td>
					<td><%=e.getTitle()%></td>
					<td><%=e.getAuthor()%></td>
					<td><%=e.getDateOfPurchase()%></td>
					<td><%=e.getPrice() %></td>

					<td><a
						href="/ELibrary/librarian/editBook.jsp?sno=<%=e.getSno()%>"><img
							src="../img/edit (1).png" width="32px" height="32px"></a> <a
						href="../deleteBook?sno=<%=e.getSno()%>"><img
							src="../img/delete.png" width="32px" height="32px"></a></td>

				</tr>
				<%
				}
				%>
			</table>
		</div>

			</div>
</body>
</html>