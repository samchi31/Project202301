<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

<title>HurryUP 로그인</title>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
	<script>
		alert("${SPRING_SECURITY_LAST_EXCEPTION.message}");
	</script>
	<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
</c:if>
<link rel="stylesheet" href="<c:url value = '/resources/css/login-style.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/menu-style.css'/>">
<style type="text/css">
	a { text-decoration-line: none; }
</style>


<%-- <form method="post" action="<c:url value='/login'/>" id="loginForm"> --%>
<%-- 	<security:csrfInput/> --%>
<!-- 	<div class="row mb-3"> -->
<!-- 		<div class="col-auto"> -->
<!-- 			<input type="text" name="empNo" placeholder="아이디" class="form-control"/> -->
<!-- 		</div> -->
<!-- 		<div class="col-auto"> -->
<!-- 			<div class="form-check"> -->
<!-- 			<label><input type="checkbox" class="form-check-input" name="rememberMe" />아이디기억하기</label> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-auto"> -->
<!-- 			<input type="password" name="empPw" placeholder="비밀번호" class="form-control"/> -->
<!-- 		</div> -->
<!-- 		<div class="col-auto"> -->
<!-- 			<input type="submit" value="로그인" class="btn btn-primary"/> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </form> -->

<security:authorize access="isAnonymous()">
<div class="login-body">
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">
	
			<div class="signup">
				<label for="chk" aria-hidden="true">HurryUp</label> 
			</div>
	
			<div class="login">
	<!-- 			<form> -->
	<!-- 				<input type="email" name="email" placeholder="Email" required=""> -->
	<!-- 				<input type="password" name="pswd" placeholder="Password" required=""> -->
	<!-- 				<button>Login</button> -->
	<!-- 			</form> -->
				<form method="post" action="<c:url value='/login'/>" id="loginForm">
					<security:csrfInput/>
					<label for="chk" aria-hidden="true">Login</label>				
					<input type="text" name="empNo" placeholder="아이디" />			
					<input type="password" name="empPw" placeholder="비밀번호" />			
					<span><input type="checkbox" name="rememberMe"/>아이디 기억하기</span>			
					<input type="submit" value="로그인" class="button"/>
						
				</form>
				${exceptionMessage }
				${error }
				${message }
			</div>
	</div>
</div>

</security:authorize>

<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.realMember" var="employeeVO"/>
	<p>jobCd : ${employeeVO.jobCd}</p>
	<h4>메뉴화면 일단 각자 링크만</h4>
	<form:form name="logoutForm" action="${pageContext.request.contextPath }/logout" method="post"></form:form>
	<a class="nav-link logoutBtn" href="javascript::">로그아웃</a>
	<script type="text/javascript">
		$(document).on("click", ".logoutBtn", function(event){
			event.preventDefault();
			document.logoutForm.submit();
			return false;
		});
	</script>
	
	<div class="container">
		<div class="card">
			<h2>
				<!-- HEAD, REC만 접근 가능 -->
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_HEAD' or employeeVO.jobCd eq 'ROLE_REC'}">
						<a href="<c:url value='/receiption/receiptionView'/>">receiption</a>
					</c:when>
					<c:otherwise>
						<a href="#">receiption</a>
					</c:otherwise>
				</c:choose>
			</h2>
		</div>
		
		<div class="card">
			<h2>
				<!-- DOC만 접근 가능 -->
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_DOC' or employeeVO.jobCd eq 'ROLE_HEAD'}">
						<a href="<c:url value='/doctor/main'/>">doctor</a>
					</c:when>
					<c:otherwise>
						<a href="#">doctor</a>
					</c:otherwise>
				</c:choose>
			</h2>
		</div>
		
		<div class="card">
			<h2>
				<!-- RAD만 접근 가능 -->			
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_RAD'  or employeeVO.jobCd eq 'ROLE_HEAD'}">
						<a href="<c:url value='/radiology/radiologyView'/>">radiology</a>
					</c:when>
					<c:otherwise>
						<a href="#">radiology</a>
					</c:otherwise>
				</c:choose>
			</h2>
		</div>
		
		<div class="card">
			<h2>
				<!-- PHY만 접근 가능 -->
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_PHY'  or employeeVO.jobCd eq 'ROLE_HEAD'}">
						<a href="<c:url value='/pt/ptView'/>">pt</a>
					</c:when>
					<c:otherwise>
						<a href="#">pt</a>
					</c:otherwise>
				</c:choose>
			</h2>
		</div>
		
		<div class="card">
			<h2>
				<!-- CHN, NUR 만 접근 가능 -->
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_CHN' or employeeVO.jobCd eq 'ROLE_NUR' or employeeVO.jobCd eq 'ROLE_HEAD'}">
						<a href="<c:url value='/nurse/wardMain'/>">nurse</a>
					</c:when>
					<c:otherwise>
						<a href="#">nurse</a>
					</c:otherwise>
				</c:choose>
			</h2>
		</div>
	</div>
</security:authorize>