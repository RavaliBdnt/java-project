<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rightWholeBar {
	float: right;
}

form {
	padding: 5%;
}

.form1 {
	margin: auto;
	margin-top: 5%;
	width: 40%;
	/* margin-top: 5%; */
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
</head>
<body>

	<%@include file="navbar.jsp"%>
	<div class="mainContent">
		<div class="form1">



			<c:if test="${not empty morethan499 }">
				<div class="w3-panel w3-red">
					<h3>${morethan499}</h3>
				</div>
				<c:remove var="morethan499" />
			</c:if>
			<c:if test="${not empty success }">
				<div class="w3-panel w3-green">
					<h3>${success}</h3>
				</div>
				<c:remove var="success" />
			</c:if>

			<div class="w3-card-4 table">



				<div class="w3-container w3-center"
					style="background-color: #A765DC">
					<h2 style="color: white;">Contact to Manager</h2>
				</div>

				<form action="../contactToManager" method="post">

					<label>Topic/Subject</label> <input class="w3-input w3-border mr"
						name="topic" type="text" required> <label>Message
						(499 character only)</label>
					<textarea class="w3-input w3-border mr" name="message" required></textarea>
					<input type="hidden" value="<%=session.getAttribute("name")%>"
						name="name">

					<div class="w3-center">
						<button type="submit" class="w3-button"
							style="background-color: #A765DC; color: white;">Send</button>
					</div>
				</form>
			</div>

		</div>

	</div>


</body>
</html>