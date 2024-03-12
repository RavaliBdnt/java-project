<%@page import="com.entities.IssueBook"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.IssueBookDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style>
.table {
	margin: auto;
	width: 90%;
	margin-top: 5%;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

	<%@include file="navbar.jsp"%>

	<div class="w3-sidebar w3-light-gray w3-bar-block" style="width: 15%"><%@include
			file="sideBar.jsp"%></div>

	<div class="mainBar" style="margin-left: 15%">

		<div class="table form1">
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
						<th>Registration SNO</th>
						<th>Title</th>
						<th>Author</th>
						<th>Date of Issue</th>
						<th>Name of The Candidate</th>
						<th>Address</th>
						<th>Return Date</th>
						<th>Issued Librarian</th>
						
					</tr>

					<%
					IssueBookDao dao1 = new IssueBookDao(DbConnection.getConnection());
					List<IssueBook> issuebooks = dao1.getAllIssueBooks();
					for (IssueBook e : issuebooks) {
					%>


					<tr>
						<td><%=e.getSno()%></td>
						<td><%=e.getRegNo()%></td>
						<td><%=e.getTitle()%></td>
						<td><%=e.getAuthor()%></td>
						<td><%=e.getDateOfIssue()%></td>
						<td><%=e.getName()%></td>
						<td><%=e.getAddress()%></td>
						<% if(e.getDateOfReturn()!=null) { %>
						
						<td><%= e.getDateOfReturn() %></td><%} else { %>
						<td>Not Return Yet</td><%} %>
						<td><%=e.getLibrarian()%></td>

						

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