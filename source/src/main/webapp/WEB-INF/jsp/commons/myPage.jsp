<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
body {
    background: #f2f6ff; 
}
.content{
    margin-top: 80px;
}
.btn{
	background : #F7AA00;
    float: right;
	
}
.btn-info{
	--bs-btn-border-color: #F7AA00;
	--bs-btn-hover-bg: #c7750a;
    --bs-btn-hover-border-color: #c7750a;
    --bs-btn-active-bg: #c7750a;
    --bs-btn-active-border-color: #c7750a;
}
.card-body{
	box-shadow: 0px 11px 35px 2px rgb(0 0 0 / 14%);
}
</style>

<%-- <c:if test="${employee eq }"> --%>

<%-- </c:if> --%>
<!-- 	<div> -->
<!-- 		<table class="table table-bordered" style="width:60rem; text-align:center;"> -->
<%-- 			<tr><th>사번</th><td>${employee.empNo}</td></tr> --%>
<%-- 			<tr><th>성명</th><td>${employee.empNm}</td></tr> --%>
<%-- 			<tr><th>전화번호</th><td>${employee.empTel}</td></tr> --%>
<%-- 			<tr><th>이메일</th><td>${employee.empMail}</td></tr> --%>
<%-- 			<tr><th>주민번호1</th><td>${employee.empReg1}</td></tr> --%>
<%-- 			<tr><th>우편번호</th><td>${employee.empZip}</td></tr> --%>
<%-- 			<tr><th>주소</th><td>${employee.empAdd1}</td></tr> --%>
<%-- 			<tr><th>상세주소</th><td>${employee.empAdd2}</td></tr> --%>
<%-- 			<tr><th>직무코드</th><td>${employee.jobCd}</td></tr> --%>
<%-- 			<tr><th>직급코드</th><td>${employee.posiCd}</td></tr> --%>
<%-- 			<tr><th>전공코드</th><td>${employee.majorCd}</td></tr> --%>
<!-- 		</table> -->
<!-- 	</div> -->
<%-- 	<a href="<c:url value='/employee/edit' />" class="a_btn">수정</a> --%>
	

<security:authorize access="isAuthenticated()">
<security:authentication property="principal.realMember" var="employee"/>
	<div class="container">
		<div class="main-body">
			<div class="row gutters-sm">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="${pageContext.request.contextPath}/resources/images/Animation.gif" alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									<h4>${employee.empNm}</h4>
									<p class="text-secondary mb-1">${employee.jobName}</p>
									<p class="text-muted font-size-sm">${employee.empMail}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8">
					<div class="card mb-3">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">사번</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.empNo}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">성명</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.empNm}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">전화번호</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.empTel}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">이메일</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.empMail}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">생년월일</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.empReg1}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">우편번호</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.empZip}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">주소</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.empAdd1}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">상세주소</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.empAdd2}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">직무코드</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.jobCd}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">직급코드</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.posiCd}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-3">
									<h6 class="mb-0">전공코드</h6>
								</div>
								<div class="col-sm-9 text-secondary">${employee.majorCd}</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-sm-12">
									<a class="btn btn-info" href="<c:url value='/employee/edit' />">수정하기</a><!-- target="__blank" -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</security:authorize>