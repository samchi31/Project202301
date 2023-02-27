<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>

<link rel="stylesheet" href="<c:url value='/resources/css/menu-style.css'/>">
<style type="text/css">
	a { text-decoration-line: none; }
</style>
</head>
<body>
<div class="container">
<h4>메뉴화면</h4>
<div class="card">
		<h2>
			<a href="<c:url value='/receiption/receiptionView'/>">receiption</a>
		</h2>
	</div>
	
	<div class="card">
		<h2>
			<a href="<c:url value='/doctor/main'/>">doctor</a>
		</h2>
	</div>
	
	<div class="card">
		<h2>
			<a href="<c:url value='/radiology/radiologyView'/>">radiology</a>
		</h2>
	</div>
	
	<div class="card">
		<h2>
			<a href="<c:url value='/pt/ptView'/>">pt</a>
		</h2>
	</div>
	
	<div class="card">
		<h2>
			<a href="<c:url value='/nurse/wardMain'/>">nurse</a>
		</h2>
	</div>
</div>

</body>
</html>