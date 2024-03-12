<%@page import="com.entities.Book"%>
<%@page import="com.connection.DbConnection"%>
<%@page import="com.dao.BookDao"%>
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
			int sno = Integer.parseInt(request.getParameter("sno"));
			BookDao dao = new BookDao(DbConnection.getConnection());

			Book book = dao.getBookBySNO(sno);
			%>


			<div class="w3-card-4">





				<div class="w3-container w3-center w3-amber">
					<h2>Update Book</h2>
				</div>

				<form class="w3-container" action="../updateBook" method="post">


					<input type="hidden" name="sno" value="<%=book.getSno()%>"> <label>Title</label>
					<input class="w3-input w3-border" value="<%=book.getTitle()%>"
						name="title" type="text" required> <label>Author</label> <input
						class="w3-input w3-border" name="author"
						value="<%=book.getAuthor()%>" type="text" required> 




					<label>Date</label> <input class="w3-input w3-border"
						value="<%=book.getDateOfPurchase()%>" name="date" type="date"
						required>
						<label>Quantity</label> <input class="w3-input w3-border"
						value="<%=book.getPrice()%>" name="quantity" type="text"
						required>
					<div class="w3-center">
						<br>
						<button class="w3-btn  w3-blue-grey w3-hover-pink">Update Book</button>
					</div>
				</form>

			</div>

		</div>

	</div>

</body>
</html>