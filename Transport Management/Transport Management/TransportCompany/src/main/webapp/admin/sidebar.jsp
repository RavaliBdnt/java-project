<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>Insert title here</title>






</head>
<body>

	<!-- Sidebar -->
	<div class="w3-sidebar w3-bar-block w3-border-right"
		style="display: none" id="mySidebar">
		<button onclick="w3_close()" class="w3-bar-item w3-large">Close
			&times;</button>
		
	</div>


	<script>
		function w3_open() {
			document.getElementById("mySidebar").style.display = "block";
			document.getElementById("mainContent").style.marginLeft = "15%";
		}

		function w3_close() {
			document.getElementById("mySidebar").style.display = "none";
			document.getElementById("mainContent").style.marginLeft = "0%";
		}
	</script>


</body>
</html>