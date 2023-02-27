<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- <title>test</title> -->
	<c:if test="${not empty message }">
		<script type="text/javascript">
			alert("${message}");
		</script>
	</c:if>
	<tiles:insertAttribute name="preScript" />
	<style type="text/css">
	
		.content {
			width:100%;
			height:100%;
		}
		footer {
			position: fixed; 
			bottom: 0; 
			width: 100%;
		}
	</style>
	
<script type="text/javascript">
//서버에서 발행된 헤더네임과 토큰갑사 저장
var header = '${_csrf.headerName}';
var token =  '${_csrf.token}';
</script>
</head>
<body>
	<div class="header">
		<tiles:insertAttribute name="headerMenu" />
	</div>
	<div class="content">
		<tiles:insertAttribute name="content" />
	</div>
	<footer class="footer">
		<tiles:insertAttribute name="rolling" />
	</footer>
	<tiles:insertAttribute name="postScript" />
</body>
</html>