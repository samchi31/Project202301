<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 주소 API -->
<style>
body {
    background-color: #f2f6ff;
    font-family: 'Ubuntu', sans-serif;
}

.main {
    margin-top: 223px;
    background-color: #FFFFFF;
    width: 400px;
    height: 300px;
    margin: 7em auto;
    border-radius: 1.5em;
    box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
}

.sign {
    padding-top: 40px;
    color: #00334E;
    font-family: 'Ubuntu', sans-serif;
    font-weight: bold;
    font-size: 23px;
}

form.form1 {
    padding-top: 40px;
}

.pass {
    width: 76%;
	color: rgb(38, 50, 56);
	font-weight: 700;
	font-size: 14px;
	letter-spacing: 1px;
	background: rgba(136, 126, 126, 0.04);
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	outline: none;
	box-sizing: border-box;
	border: 2px solid rgba(0, 0, 0, 0.10);
	margin-bottom: 50px;
	margin-left: 46px;
	text-align: center;
	margin-bottom: 27px;
	font-family: 'Ubuntu', sans-serif;
}

.submit {
  cursor: pointer;
    border-radius: 5em;
    color: #fff;
    background: #F7AA00;
    border: 0;
    padding-left: 40px;
    padding-right: 40px;
    padding-bottom: 10px;
    padding-top: 10px;
    font-family: 'Ubuntu', sans-serif;
    margin-left: 35%;
    font-size: 13px;
    box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
}

a {
    text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
    color: #E1BEE7;
    text-decoration: none
}

th {
	vertical-align: middle

}
.card-body{
	box-shadow: 0px 11px 35px 2px rgb(0 0 0 / 14%);
}

@media (max-width: 600px) {
    .main {
        border-radius: 0px;
    }

</style>

<security:authorize access="isAuthenticated()">
<%-- 	<security:authentication property="principal.realMember" var="employee"/> --%>


<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Sign in</title>
</head>
  <div id="div_pw" class="main" style="margin-top: 263px;">
    <p class="sign" align="center">비밀번호를 다시 입력해주세요.</p>
    	<input id="pwText" class="pass" type="password" align="center" placeholder="Password" style="margin-top: 32px;">
    	<div><button id="btn_pw" class="a_btn" style="margin-left: 164px; border-radius: 13px;">입력</button></div>
   </div>
</html>
<!-- 	<div id="div_update" class="container"> -->
<!-- 		<div class="main-body"> -->
<!-- 			<div class="row "> -->
<!-- 				<div class="col-md-8" style="width: 53.666667%"> -->
<!-- 					<div class="card mb-3"> -->
<!-- 						<div class="card-body"> -->
<%-- 							<form:form id="updateForm" action="<c:url value='#' />"> --%>
<!-- 								<table class="table table-bordered" style="width:40rem; text-align:center;"> -->
<%-- 									<tr><th>사번</th><td><input class="form-control" type="number"  required name="empNo" value="${employee.empNo}" readonly disabled/><span class="text-danger">${errors.empNo}</span></td></tr> --%>
<%-- 									<tr><th>성명</th><td><input class="form-control" type="text" name="empNm" value="${employee.empNm}" /><span class="text-danger">${errors.empNm}</span></td></tr> --%>
<!-- 									<tr><th>새비밀번호</th><td><input class="form-control" type="text" name="empPw" /></td></tr> -->
<%-- 									<tr><th>전화번호</th><td><input class="form-control" type="text" name="empTel" value="${employee.empTel}" /><span class="text-danger">${errors.empTel}</span></td></tr> --%>
<%-- 									<tr><th>이메일</th><td><input class="form-control" type="text" name="empMail" value="${employee.empMail}" /><span class="text-danger">${errors.empMail}</span></td></tr> --%>
<%-- 									<tr><th>주소</th><td><input class="form-control" type="text" name="empAdd1" value="${employee.empAdd1}" /><span class="text-danger">${errors.empAdd1}</span></td></tr> --%>
<%-- 									<tr><th>상세주소</th><td><input class="form-control" type="text" name="empAdd2" value="${employee.empAdd2}" /><span class="text-danger">${errors.empAdd2}</span></td></tr> --%>
<%-- 									<tr><th>직무코드</th><td><input class="form-control" type="text" name="jobCd" value="${employee.jobCd}" readonly disabled/><span class="text-danger">${errors.jobCd}</span></td></tr> --%>
<%-- 									<tr><th>직급코드</th><td><input class="form-control" type="text" name="posiCd" value="${employee.posiCd}" readonly disabled/><span class="text-danger">${errors.posiCd}</span></td></tr> --%>
<%-- 									<tr><th>전공코드</th><td><input class="form-control" type="text" name="majorCd" value="${employee.majorCd}" readonly disabled/><span class="text-danger">${errors.majorCd}</span></td></tr> --%>
<!-- 								</table>		 -->
<%-- 							</form:form> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
	
	<div id="div_update" class="container">
		<div class="main-body">
			<div class="row gutters-sm" style="padding-top: 95px;">
				<div class="col-md-4 mb-3">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="/HurryUp/resources/images/Animation.gif" alt="Admin" class="rounded-circle" width="150">
								<div class="mt-3">
									
									<h4 id="imgEmpNm"></h4>
									<p id="imgJobName" class="text-secondary mb-1"></p>
									<p id="imgEmpMail" class="text-muted font-size-sm"></p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8" style="width: 53.666667%">
					<div class="card mb-3">
						<div class="card-body">
							<form:form id="updateForm" modelAttribute="EmployeeVO" action="${pageContext.request.contextPath }/employee/edit" method="post">
								<table class="table" style="width:40rem; text-align:center;">
									
									<tr><th>사번</th><td><input class="form-control" type="number"  required name="empNo" value="${employee.empNo}" readonly /><span class="text-danger">${errors.empNo}</span></td></tr>
									<tr><th>성명</th><td><input class="form-control" type="text" name="empNm" value="${employee.empNm}" /><span class="text-danger">${errors.empNm}</span></td></tr>
									<tr><th>새비밀번호</th><td><input class="form-control" type="password" name="empPw"/></td></tr>
									<tr><th>전화번호</th><td><input class="form-control" type="text" name="empTel" value="${employee.empTel}" /><span class="text-danger">${errors.empTel}</span></td></tr>
									<tr><th>이메일</th><td><input class="form-control" type="text" name="empMail" value="${employee.empMail}" /><span class="text-danger">${errors.empMail}</span></td></tr>
									<tr><th>주소</th><td><div class="input-group"><input class="form-control" type="text" name="empAdd1" value="${employee.empAdd1}" /><button id="address_kakao" class="btn btn-outline-secondary">주소찾기</button></div><span class="text-danger">${errors.empAdd1}</span></td></tr>
									<tr><th>상세주소</th><td><input class="form-control" type="text" name="empAdd2" value="${employee.empAdd2}" /><span class="text-danger">${errors.empAdd2}</span></td></tr>
									<tr><th>직무코드</th><td><input class="form-control" type="text" name="jobCd" value="${employee.jobCd}" readonly disabled/><span class="text-danger">${errors.jobCd}</span></td></tr>
									<tr><th>직급코드</th><td><input class="form-control" type="text" name="posiCd" value="${employee.posiCd}" readonly disabled/><span class="text-danger">${errors.posiCd}</span></td></tr>
									<tr><th>전공코드</th><td><input class="form-control" type="text" name="majorCd" value="${employee.majorCd}" readonly disabled/><span class="text-danger">${errors.majorCd}</span></td></tr>
								</table>
								<input style="float:right; margin-right: 18px" class="btn btn-secondary" type="button" value="취소" onclick="goBack();" />
								<input style="float:right; margin-right: 10px" class="btn btn-primary" type="submit" value="완료" />
<%-- 								<a href="<c:url value='/employee/mypage' />" class="btn btn-">취소</a>		 --%>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</security:authorize>

<script>



	function goBack(){
	    window.history.back();
	}

	let empNo = $("[name=empNo]");
	let empNm = $("[name=empNm]");
	let empPw = $("[name=empPw]");
	let empTel = $("[name=empTel]");
	let empMail = $("[name=empMail]");
	let empAdd1 = $("[name=empAdd1]");
	let empAdd2 = $("[name=empAdd2]");
	let jobCd = $("[name=jobCd]");
	let posiCd = $("[name=posiCd]");
	let majorCd = $("[name=majorCd]");
	
	let imgEmpNm = $("#imgEmpNm");
	let imgJobName = $("#imgJobName");
	let imgEmpMail = $("#imgEmpMail");

	let div_pw = $("#div_pw");
	let div_update = $("#div_update");
	div_update.hide();
	
	let updateForm = $("#updateForm");
	
	let btn_complete = $("#btn_complete").on('click', function(event){
		event.preventDefault();
		
		empNo.attr("disabled", false);
		
		
		updateForm.submit();
		
		return false;
	});
	
	let btn_pw =  $("#btn_pw");
	
	let pwText = $("#pwText").on("keypress",function(event){
		console.log(event.keyCode);
		if (event.keyCode == 13) {
			btn_pw.trigger('click');
		}
	});
	
	btn_pw.on('click', function(){
		console.log(pwText.val());
		let data = { password : pwText.val()}
		$.ajax({
			url : "${pageContext.request.contextPath}/employee/valid",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			beforeSend: function(xhr) {
	           xhr.setRequestHeader(header, token);
		    },
			success : function(resp) {
				console.log(resp);
				if(resp){
					let data = JSON.parse(resp);
					
					imgEmpNm.text(data.empNm);
					imgJobName.text(data.jobName);
					imgEmpMail.text(data.empMail);
					
					empNo.val(data.empNo);
					//empPw.val(data.empPw);
					empNm.val(data.empNm);
					empTel.val(data.empTel);
					empMail.val(data.empMail);
					empAdd1.val(data.empAdd1);
					empAdd2.val(data.empAdd2);
					jobCd.val(data.jobCd);
					posiCd.val(data.posiCd);
					majorCd.val(data.majorCd);
					
					console.log(pwText.val());
					updateForm.append($("<input>").attr("type","hidden").attr("name","authPass").val(pwText.val()));
					console.log(updateForm.serialize());
					
					// div show hide
					div_pw.hide();
					div_update.show();
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		}); 
		
	});
	
	//주소 API) 카카오 //
	document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
		event.preventDefault();

	//카카오 지도 발생
	    new daum.Postcode({
	        oncomplete: function(data) { //선택시 입력값 세팅
//	             document.getElementById("address_kakao").value = data.address; // 주소 넣기
//	             document.querySelector("input[name=memAddr2]").focus(); //상세입력 포커싱
	            empAdd1.val(data.address); // 주소 넣기
	            document.querySelector("input[name=empAdd2]").focus(); //상세입력 포커싱
	        }
	    }).open();
	
	    return false;
	});

</script>