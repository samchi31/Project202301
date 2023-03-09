<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <link href="${pageContext.request.contextPath }/resources/css/button.css" rel="stylesheet" /> --%>
<title>HurryUP 로그인</title>
<style>

a{
text-decoration-line: none;
}

.aaa {
	text-decoration-line: none;
	color : #ffffff;
}

.menubtn {
    font-weight: 600;
    color: #382b22; /* 글씨 */
    text-transform: uppercase;
    padding: 2em 2em;
    background: #ffffff; /* 눌렀을 때*/
    border: 2px solid #004262;  /* 위에선 */
    border-radius: 0.75em;
    transform-style: preserve-3d;
    transition: transform 150ms cubic-bezier(0, 0, 0.58, 1);
    box-sizing: border-box;
    position: relative;
    display: inline-block;
    font-size:1.5rem;
    min-width:15rem;
    min-height:8rem;
    text-align:center;
}
.menubtn::before {
    position: absolute;
    content: '';
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: #86B1E5;
    border-radius: inherit;
    box-shadow: 0 0 0 2px #004262, 0 0.625em 0 0 #DCE4ED;
    transform: translate3d(0, 0.75em, -1em);
    transition: transform 150ms cubic-bezier(0, 0, 0.58, 1), box-shadow 150ms cubic-bezier(0, 0, 0.58, 1);
    box-sizing: border-box;
    z-index: 999;
}
.menubtn::after {
    box-sizing: border-box;
}
.menubtn:hover {
    background: #ffe593;
    transform: translate(0, 0.25em);
}
.menubtn:hover::before {
    box-shadow: 0 0 0 2px #004262, 0 0.5em 0 0 #DCE4ED;
    transform: translate3d(0, 0.5em, -1em);
}
.menubtn:active {
    background: #D7E8FF;
    transform: translate(0em, 0.75em);
}
.menubtn:active::before {
    box-shadow: 0 0 0 2px #004262, 0 0 #DCE4ED;
    transform: translate3d(0, 0, -1em);
}

.menubtn_disable{ 
	background: #D7E8FF; 
	font-weight: 600;
    color: #382b22; /* 글씨 */
    text-transform: uppercase;
    padding: 2em 2em;
    border: 2px solid #004262;  /* 위에선 */
    border-radius: 0.75em;
    transform-style: preserve-3d;
    transition: transform 150ms cubic-bezier(0, 0, 0.58, 1);
    box-sizing: border-box;
    position: relative;
    display: inline-block;
    font-size:1.5rem;
    min-width:15rem;
    min-height:8rem;
    text-align:center;
    transform: translate3d(0, 0.75em, -1em);
  }

.button_area{display:inline-block;margin: 1rem 0.5rem;}

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
    <div style=" width: 34%; height: 100%; background-color: #4E73DF;">
		<div class="profile-div" style="box-sizing: border-box; 
									width: 22%;
	    							position: absolute; 
	    							left: 6%; top: 14%">
			<img src="${pageContext.request.contextPath}/resources/images/homemain.png" class="profileimgPlace" />
			<div style="text-align: center; ">
				<div class="v234_2198">반갑습니다</div>
				<div class="v234_2196"><a href="${pageContext.request.contextPath}/employee/mypage" class="aaa">${employeeVO.empNm}님</a></div>
				<div class="v234_2197">(${employeeVO.posiName})</div>
			</div>
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
	
	<!-- button Start -->
<!-- 	<div style="position: absolute; -->
<!--    				top: 20%"> -->
<!-- 		<div class="btnTable"> -->
<!-- 			<div class="card1"> -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${employeeVO.jobCd eq 'ROLE_HEAD' or employeeVO.jobCd eq 'ROLE_REC'}"> --%>
<!-- 						<div> -->
<%-- 							<a class="menubtn draw-border" href="<c:url value='/receiption/receiptionView?menu=1'/>" >원무과</a> --%>
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<div class="menubtn draw-border-none">원무과</div> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</div> -->
	
<!-- 			<div class="card1"> -->
<!-- 				DOC만 접근 가능 -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${employeeVO.jobCd eq 'ROLE_DOC' or employeeVO.jobCd eq 'ROLE_HEAD'}"> --%>
<%-- 						<a href="<c:url value='/doctor/main?menu=2'/>" class="menubtn draw-border">의사</a> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<div  class="menubtn draw-border-none">의사</div> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</div> -->
	
<!-- 			<div class="card1"> -->
<!-- 				RAD만 접근 가능 -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${employeeVO.jobCd eq 'ROLE_RAD'  or employeeVO.jobCd eq 'ROLE_HEAD'}"> --%>
<%-- 						<a href="<c:url value='/radiology/radiologyView?menu=3'/>" class="menubtn draw-border">영상촬영실</a> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<div class="menubtn draw-border-none">영상촬영실</div> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="btnTable" style=""> -->
<!-- 			<div class="card2"> -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${employeeVO.jobCd eq 'ROLE_PHY'  or employeeVO.jobCd eq 'ROLE_HEAD'}"> --%>
<%-- 						<a href="<c:url value='/pt/ptView?menu=4' />" class="menubtn draw-border">물리치료과</a> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<div class="menubtn draw-border-none">물리치료과</div> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</div> -->
	
<!-- 			<div class="card2"> -->
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${employeeVO.jobCd eq 'ROLE_CHN' or employeeVO.jobCd eq 'ROLE_NUR' or employeeVO.jobCd eq 'ROLE_HEAD'}"> --%>
<%-- 						<a href="<c:url value='/nurse/wardMain?menu=5'/> " class="menubtn draw-border">병동관리</a> --%>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<div class="menubtn draw-border-none">병동관리</div> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</div> -->
	
<!-- 			<div class="card2"> -->
<%-- 				<c:choose> --%>
<%-- 					<c:when --%>
<%-- 						test="${employeeVO.jobCd eq 'ROLE_HEAD' or employeeVO.jobCd eq 'ROLE_REC' or employeeVO.jobCd eq 'ROLE_CHN' or employeeVO.jobCd eq 'ROLE_NUR'}"> --%>
<!-- 						<div> -->
<!-- 							<a class="menubtn draw-border" -->
<%-- 								href="<c:url value='/nurse/operationMain?menu=6'/>">수술/검사</a> --%>
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<div class="menubtn draw-border-none">수술/검사</div> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</div> -->
<!-- 		</div> -->
	
<!-- 		<div class="btnTable" style=""> -->
<!-- 			<div class="card3"> -->
<%-- 				<a href="<c:url value='/notice/notice?menu=7' />" class="menubtn draw-border">공지사항</a> --%>
<!-- 			</div> -->
<!-- 			<div class="card3"> -->
<%-- 				<a href="<c:url value='/employee/mypage' />" class="menubtn draw-border">내정보</a> --%>
<!-- 			</div> -->
<!-- 			<div class="card3"> -->
<%-- 				<a href="<c:url value='/notice/notice?menu=7' />" class="menubtn draw-border">스케줄</a> --%>
<!-- 			</div> -->
	
<!-- 		</div> -->
<!-- 	</div> -->

	<div style="position: absolute;
   				width: 50%;
   				left: 47%;
   				top: 20%">
   		
   		<div class="button_area">
			<c:choose>
				<c:when test="${employeeVO.jobCd eq 'ROLE_HEAD' or employeeVO.jobCd eq 'ROLE_REC'}">
					<div>
						<a class="menubtn " href="<c:url value='/receiption/receiptionView?menu=1'/>" >원무과</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="menubtn_disable ">원무과</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="button_area">
			<!-- DOC만 접근 가능 -->
			<c:choose>
				<c:when test="${employeeVO.jobCd eq 'ROLE_DOC' or employeeVO.jobCd eq 'ROLE_HEAD'}">
					<a href="<c:url value='/doctor/main?menu=2'/>" class="menubtn ">의사</a>
				</c:when>
				<c:otherwise>
					<div  class="menubtn_disable ">의사</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="button_area">
			<!-- RAD만 접근 가능 -->
			<c:choose>
				<c:when test="${employeeVO.jobCd eq 'ROLE_RAD'  or employeeVO.jobCd eq 'ROLE_HEAD'}">
					<a href="<c:url value='/radiology/radiologyView?menu=3'/>" class="menubtn ">영상촬영실</a>
				</c:when>
				<c:otherwise>
					<div class="menubtn_disable ">영상촬영실</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="button_area">
			<c:choose>
				<c:when test="${employeeVO.jobCd eq 'ROLE_PHY'  or employeeVO.jobCd eq 'ROLE_HEAD'}">
					<a href="<c:url value='/pt/ptView?menu=4' />" class="menubtn ">물리치료과</a>
				</c:when>
				<c:otherwise>
					<div class="menubtn_disable ">물리치료과</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="button_area">
			<c:choose>
				<c:when test="${employeeVO.jobCd eq 'ROLE_CHN' or employeeVO.jobCd eq 'ROLE_NUR' or employeeVO.jobCd eq 'ROLE_HEAD'}">
					<a href="<c:url value='/nurse/wardMain?menu=5'/> " class="menubtn ">병동관리</a>
				</c:when>
				<c:otherwise>
					<div class="menubtn_disable ">병동관리</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="button_area">
			<c:choose>
				<c:when
					test="${employeeVO.jobCd eq 'ROLE_HEAD' or employeeVO.jobCd eq 'ROLE_REC' or employeeVO.jobCd eq 'ROLE_CHN' or employeeVO.jobCd eq 'ROLE_NUR'}">
					<div>
						<a class="menubtn "
							href="<c:url value='/nurse/operationMain?menu=6'/>">수술/검사</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="menubtn_disable ">수술/검사</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div class="button_area">
			<a href="<c:url value='/notice/notice?menu=7' />" class="menubtn ">공지사항</a>
		</div>
		<div class="button_area">
			<a href="<c:url value='/employee/mypage' />" class="menubtn ">내정보</a>
		</div>
		<div class="button_area">
			<a href="<c:url value='/notice/notice?menu=7' />" class="menubtn ">스케줄</a>
		</div>
	</div>
 
 <script>
    
  </script>
</security:authorize>