<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h4>마이페이지</h4>

<%-- <c:if test="${employee eq }"> --%>

<%-- </c:if> --%>
<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.realMember" var="employee"/>
	<div>
		<table class="table table-bordered" style="width:60rem; text-align:center;">
			<tr><th>사번</th><td>${employee.empNo}</td></tr>
			<tr><th>성명</th><td>${employee.empNm}</td></tr>
			<tr><th>전화번호</th><td>${employee.empTel}</td></tr>
			<tr><th>이메일</th><td>${employee.empMail}</td></tr>
			<tr><th>주민번호1</th><td>${employee.empReg1}</td></tr>
			<tr><th>우편번호</th><td>${employee.empZip}</td></tr>
			<tr><th>주소</th><td>${employee.empAdd1}</td></tr>
			<tr><th>상세주소</th><td>${employee.empAdd2}</td></tr>
			<tr><th>직무코드</th><td>${employee.jobCd}</td></tr>
			<tr><th>직급코드</th><td>${employee.posiCd}</td></tr>
			<tr><th>전공코드</th><td>${employee.majorCd}</td></tr>
		</table>
	</div>
	<a href="<c:url value='/employee/edit' />" class="a_btn">수정</a>
	
</security:authorize>