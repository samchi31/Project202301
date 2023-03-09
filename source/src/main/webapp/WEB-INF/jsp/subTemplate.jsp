<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<tiles:insertAttribute name="preScript" />
	<style type="text/css">
	
		.content {
			width:100%;
			height:100%;
		}
	</style>
	<script type="text/javascript">
	//서버에서 발행된 헤더네임과 토큰갑사 저장
	var header = '${_csrf.headerName}';
	var token =  '${_csrf.token}';
	</script>
</head>
<body>
	<div class="content">
		<img src="${pageContext.request.contextPath }/resources/images/Hurry UPOP70.png" style="
		    position: fixed;
    		left: 59%;
    		top: 88%;
    		z-index: -10;"/>
		<tiles:insertAttribute name="content" />
	</div>
<%-- 	<tiles:insertAttribute name="postScript" /> --%>
</body>
</html>