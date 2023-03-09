<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/ptStyle.css" rel="stylesheet" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<style>
body {
		padding-top : 70px;
		padding-bottom : 70px;
    	font-size: 14px;
		padding-right: 66px;
    	padding-left: 66px;
}
.btn_blue {
	width: 5.25rem;
	height: 1.7rem;
	background-color: #004262;
	color: white;
	border: none;
	/* margin: 0.188rem; */
	/* box-shadow: 1px 1px 2px grey; */
	font-size: 13px;
}

 #updateDiv{
        display:none
    }
.buttonDiv {
    position: absolute;
    left: 68%;
    top: 12%;
}
#writeUpdate {
position: absolute;
    top: 12%;
    left: 80%;

}
</style>
<div id="noticeDetailDiv">
	<h4 class="h4-title1" style="color: #4E73DF;">공지사항 상세</h4>
	<hr>
	<div id="notice">${notice.ntcCont }</div>

	<security:authorize access="isAuthenticated()">
		<security:authentication property="principal.realMember" var="employeeVO" />
		<c:if test="${employeeVO.empNo eq notice.empNo }">
			<div class="buttonDiv">
				<button class="btn_blue" id="updateButton" >수정</button>
				<button class="btn_blue" id="writedelete" type="submit" value="삭제">삭제</button>
			</div>
		</c:if>
	</security:authorize>
</div>

<div id="updateDiv">
	<div>
		<h4 class="h4-title1" style="color: #4E73DF;" >공지사항 수정하기</h4>
		<hr>
	</div>
	<form:form id="writeForm" modelAttribute="notice" method="post">
		<form:input path="ntcCd" type="hidden" name="ntcCd" value="${notice.ntcCd}"/>
		<div class="mb-3 row">
			<label for="ptDocument-input" class="col-sm-3 col-form-label">제목</label>
			<div class="col-sm-9">
				<form:input path="ntcTitle" type="text" cssClass="form-control writeChartCd " name="ntcTitle" id="writeChartCd" value="${noticeVO.ntcTitle}"/>
			</div>
		</div>
		<div class="mb-3 row">
			<label for="inputPassword" class="col-sm-3 col-form-label">내용</label>
			<div class="col-sm-9">
				<form:textarea path="ntcCont" cssClass="form-control" name="ntcCont" id="ntcCont" value="${noticeVO.ntcCont }"/>
			</div>
		</div>
		<input class="form-input" id="writeUpdate" type="submit" value="수정"/>
	</form:form>
</div>
<hr>
<script>
//ckeditor
CKEDITOR.replace('ntcCont', {
});

$("#updateButton").on("click", function(event) {
	$("#updateDiv").show();
	$("#noticeDetailDiv").hide();
});

let ntcTitle = $("input[name=ntcTitle]");
let formcontol =$(".form-control");
let ntcCd = $("input[name=ntcCd]");
console.log("ntcCdzzzzzzzzzz : " ,ntcCd);

$("#writedelete").on('click', function(event) {
// 	event.preventDefault();
	writeDeleteClick();
	return false;
});


$("#writeUpdate").on('click', function(event){	
	event.preventDefault();
	
	let ntcCont = CKEDITOR.instances.ntcCont.getData();
	let data = {
			"ntcTitle" : ntcTitle.val(),
			"ntcCont" : ntcCont,
			"ntcCd" : ntcCd.val()
	}
	
	console.log(data);
	writeUpdateClick(data);
	return false;
});


function writeDeleteClick() {
	console.log("/HurryUp/notice/noticeDelete/"+'${notice.ntcCd}');
	$.ajax({
		url : "${pageContext.request.contextPath}/notice/noticeDelete/"+'${notice.ntcCd}',
		method : "post",
		dataType : "text",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		success : function(resp) {
			if(resp == "성공") {
				Swal.fire('공지사항 삭제가 완료되었습니다.', '  ', 'success').then((result) => {
					console.log(result);
		            if (result.isConfirmed) {
		            	opener.f_noticeList();
						window.close();
		            } else {
		            	Swal.fire('공지사항 삭제  실패', '  ', 'error');
		            }
		        });
			}
		},
		erro : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);

		}
	});
	
}

function writeUpdateClick(data){
	$.ajax({
		url : "/HurryUp/notice/noticeUpdate",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "text",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		success : function(resp) {
			
			console.log(resp);
			if(resp=="성공"){
				Swal.fire('공지사항 수정이 완료되었습니다', '  ', 'success').then((result) => {
					console.log(result);
		            if (result.isConfirmed) {
		            	opener.f_noticeList();
						window.close();
		            }
		        });
				
			} else {
				Swal.fire('공지사항 수정  실패', '  ', 'error');
			}
			
		},
		erro : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
	
		}
	});
}

</script>