<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<security:authorize access="isAuthenticated()">
	<security:authentication property="principal.realMember" var="employee"/>
	<div>
		<form:form id="updateForm">
			<table class="table table-bordered" style="width:60rem; text-align:center;">
				<tr><th>사번</th><td><input class="form-control" type="number"  required name="empNo" value="${employee.empNo}" readonly disabled/><span class="text-danger">${errors.empNo}</span></td></tr>
				<tr><th>성명</th><td><input class="form-control" type="text" name="empNm" value="${employee.empNm}" /><span class="text-danger">${errors.empNm}</span></td></tr>
				<tr><th>전화번호</th><td><input class="form-control" type="text" name="empTel" value="${employee.empTel}" /><span class="text-danger">${errors.empTel}</span></td></tr>
				<tr><th>이메일</th><td><input class="form-control" type="text" name="empMail" value="${employee.empMail}" /><span class="text-danger">${errors.empMail}</span></td></tr>
				<tr><th>주민번호1</th><td><input class="form-control" type="number" name="empReg1" value="${employee.empReg1}" /><span class="text-danger">${errors.empReg1}</span></td></tr>
				<tr><th>주민번호2</th><td><input class="form-control" type="number" name="empReg2" value="${employee.empReg2}" /><span class="text-danger">${errors.empReg2}</span></td></tr>
				<tr><th>우편번호</th><td><input class="form-control" type="number" name="empZip" value="${employee.empZip}" /><span class="text-danger">${errors.empZip}</span></td></tr>
				<tr><th>주소</th><td><input class="form-control" type="text" name="empAdd1" value="${employee.empAdd1}" /><span class="text-danger">${errors.empAdd1}</span></td></tr>
				<tr><th>상세주소</th><td><input class="form-control" type="text" name="empAdd2" value="${employee.empAdd2}" /><span class="text-danger">${errors.empAdd2}</span></td></tr>
				<tr><th>직무코드</th><td><input class="form-control" type="text" name="jobCd" value="${employee.jobCd}" /><span class="text-danger">${errors.jobCd}</span></td></tr>
				<tr><th>직급코드</th><td><input class="form-control" type="text" name="posiCd" value="${employee.posiCd}" /><span class="text-danger">${errors.posiCd}</span></td></tr>
				<tr><th>전공코드</th><td><input class="form-control" type="text" name="majorCd" value="${employee.majorCd}" /><span class="text-danger">${errors.majorCd}</span></td></tr>
			</table>		
		</form:form>
	</div>
	
	<a href="<c:url value='#' />" class="a_btn" id="btn_complete">완료</a>
	<a href="<c:url value='/employee/mypage' />" class="a_btn">취소</a>
</security:authorize>

<script>
	let btn_complete = $("#btn_complete").on('click', function(event){
		event.preventDefault();
		
		updateForm.submit();
		
		return false;
	});

</script>