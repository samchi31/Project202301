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
</head>
<body>
<tiles:insertAttribute name="headerMenu" />
<tiles:insertAttribute name="content" />
<tiles:insertAttribute name="rolling" />
<tiles:insertAttribute name="postScript" />
</body>
</html>