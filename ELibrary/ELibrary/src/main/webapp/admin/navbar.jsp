<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="w3-bar w3-amber navigation">
  <a href="#" class="w3-bar-item w3-button">ELibrary</a>
  
 <div class="w3-dropdown-hover w3-right">
  <button class="w3-button w3-margin-left"><%= session.getAttribute("name") %></button>
  
</div>
</div>
</body>
</html>