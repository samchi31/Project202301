<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link
	href="${pageContext.request.contextPath }/resources/css/button.css"
	rel="stylesheet" />
<title>HurryUP 로그인</title>
<style>

a{
text-decoration-line: none;
}

.aaa {
	text-decoration-line: none;
	color : #ffffff;
}
</style>
<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
	<script>
		alert("${SPRING_SECURITY_LAST_EXCEPTION.message}");
	</script>
	<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
</c:if>
<link rel="stylesheet"
	href="<c:url value = '/resources/css/login-style.css'/>">
	
	
<security:authorize access="isAnonymous()">
	<div class="login-body">
		<div class="login">
			<form method="post" action="<c:url value='/login'/>" id="loginForm">
				<security:csrfInput />
				<img src="${pageContext.request.contextPath}/resources/images/loginLog.png" class="imgPlace" /> 
				<label for="chk" aria-hidden="true">Login</label>
				<input type="text" name="empNo" placeholder="아이디" class="login-input-tag" /> 
				<input type="password" name="empPw" placeholder="비밀번호" class="login-input-tag" />
				<div style="padding-top: 14px; padding-bottom: 12px; font-size: 14px;"> 자동 로그인
					<input type="checkbox" name="rememberMe" class="logincheckBox" />
				</div>
				<input type="submit" value="로그인" class="loginInput login-input-tag" style="background-color: #F7AA00;" />
			</form>
			${exceptionMessage } ${error } ${message }
			<div class="videoDiv">
				<video muted autoplay loop>
					<source src="/HurryUp/resources/mp4/mainViedeo.mp4"
						type="video/mp4" />
				</video>
			</div>
		</div>
	</div>
</security:authorize>

<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.realMember" var="employeeVO" />
    
	<div class="profile-div" style="box-sizing: border-box; 
								width: 22%;
    							position: absolute; 
    							left: 20%; top: 10%">
		<img src="${pageContext.request.contextPath}/resources/images/homemain.png" class="profileimgPlace" />
		<div style="text-align: center; ">
			<div class="v234_2198">반갑습니다</div>
			<div class="v234_2196"><a href="${pageContext.request.contextPath}/employee/mypage" class="aaa">${employeeVO.empNm}님</a></div>
			<div class="v234_2197">(${employeeVO.posiName})</div>
		</div>
	</div>
	<form:form name="logoutForm" action="${pageContext.request.contextPath }/logout" method="post"></form:form>
	<a class="logoutBtn " href="#"> 
		<img src="${pageContext.request.contextPath}/resources/images/logout.png" class="imgPlace2" />
	</a>
	<script type="text/javascript">
		$(document).on("click", ".logoutBtn", function(event) {
			//event.preventDefault();
			console.log("logout");
			document.logoutForm.submit();
			return false;
		});
	</script>

	<div style="position: absolute;
   				width: 50%;
   				left: 43%;
   				top: 20%">
		<div class="btnTable">
			<div class="card1">
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_HEAD' or employeeVO.jobCd eq 'ROLE_REC'}">
						<div>
							<a class="menubtn draw-border" href="<c:url value='/receiption/receiptionView?menu=1'/>" >원무과</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="menubtn draw-border-none">원무과</div>
					</c:otherwise>
				</c:choose>
			</div>
	
			<div class="card1">
				<!-- DOC만 접근 가능 -->
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_DOC' or employeeVO.jobCd eq 'ROLE_HEAD'}">
						<a href="<c:url value='/doctor/main?menu=2'/>" class="menubtn draw-border">의사</a>
					</c:when>
					<c:otherwise>
						<div  class="menubtn draw-border-none">의사</div>
					</c:otherwise>
				</c:choose>
			</div>
	
			<div class="card1">
				<!-- RAD만 접근 가능 -->
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_RAD'  or employeeVO.jobCd eq 'ROLE_HEAD'}">
						<a href="<c:url value='/radiology/radiologyView?menu=3'/>" class="menubtn draw-border">영상촬영실</a>
					</c:when>
					<c:otherwise>
						<div class="menubtn draw-border-none">영상촬영실</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="btnTable" style="">
			<div class="card2">
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_PHY'  or employeeVO.jobCd eq 'ROLE_HEAD'}">
						<a href="<c:url value='/pt/ptView?menu=4' />" class="menubtn draw-border">물리치료과</a>
					</c:when>
					<c:otherwise>
						<div class="menubtn draw-border-none">물리치료과</div>
					</c:otherwise>
				</c:choose>
			</div>
	
			<div class="card2">
				<c:choose>
					<c:when test="${employeeVO.jobCd eq 'ROLE_CHN' or employeeVO.jobCd eq 'ROLE_NUR' or employeeVO.jobCd eq 'ROLE_HEAD'}">
						<a href="<c:url value='/nurse/wardMain?menu=5'/> " class="menubtn draw-border">병동관리</a>
					</c:when>
					<c:otherwise>
						<div class="menubtn draw-border-none">병동관리</div>
					</c:otherwise>
				</c:choose>
			</div>
	
			<div class="card2">
				<c:choose>
					<c:when
						test="${employeeVO.jobCd eq 'ROLE_HEAD' or employeeVO.jobCd eq 'ROLE_REC' or employeeVO.jobCd eq 'ROLE_CHN' or employeeVO.jobCd eq 'ROLE_NUR'}">
						<div>
							<a class="menubtn draw-border"
								href="<c:url value='/nurse/operationMain?menu=6'/>">수술/검사</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="menubtn draw-border-none">수술/검사</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	
		<div class="btnTable" style="">
			<div class="card3">
				<a href="<c:url value='/notice/notice?menu=7' />" class="menubtn draw-border">공지사항</a>
			</div>
			<div class="card3">
				<a href="<c:url value='/employee/mypage' />" class="menubtn draw-border">내정보</a>
			</div>
			<div class="card3">
				<a href="<c:url value='/notice/notice?menu=7' />" class="menubtn draw-border">스케줄</a>
			</div>
	
		</div>
	</div>

</security:authorize>