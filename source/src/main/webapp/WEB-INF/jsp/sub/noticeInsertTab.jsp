<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<link href="${pageContext.request.contextPath }/resources/css/ptStyle.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<title>Notice Insert</title>
<style>
body {
		padding : 70px;
		font-size: 12px;
		text-align: center;	
}

</style>
<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
<div id="goodsShowDiv">
	<div>
		<h4 class="h4-title1" style="color: #4E73DF;">공지사항 작성하기</h4>
		<hr>
	</div>
	<form:form id="writeForm" modelAttribute="notice" method="post" action="${pageContext.request.contextPath }/notice/noticeWriteInsert">
		<div class="mb-3 row">
			<label for="ptDocument-input" class="col-sm-3 col-form-label">제목</label>
			<div class="col-sm-9">
				<form:input path="ntcTitle" type="text" cssClass="form-control writeChartCd " name="ntcTitle" id="writeChartCd" /> 
				<input type="hidden" class="form-control writeChartCd " name="ntcTitle"
					id="writeChartCdA">
			</div>
		</div>
		<div class="mb-3 row">
			<label for="inputPassword" class="col-sm-3 col-form-label">내용</label>
			<div class="col-sm-9">
				<form:textarea path="ntcCont" cssClass="form-control" name="ntcCont" id="ntcCont" />
			</div>
		</div>
		<input class="form-input" id="writeInsert" type="submit" value="등록" />
	</form:form>
</div>
<script>
//ckeditor
CKEDITOR.replace('ntcCont', {
	//filebrowserUploadUrl: '${pageContext.request.contextPath}/board/boardImage.do?command=QuickUpload&type=Files&responseType=json'
});

let ntcTitle = $("input[name=ntcTitle]");
let formcontol =$(".form-control");

$("#writeForm").submit(function(event){	
	event.preventDefault();
	
	let ntcCont = CKEDITOR.instances.ntcCont.getData();
	
	let data = {
			"ntcTitle" : ntcTitle.val(),
			"ntcCont" : ntcCont
	}
	
	console.log(data);
	
	writeInsertClick(data);
	
// 	window.close();
	return false;
});


//공지사항 작성 Insert
function writeInsertClick(data){
	
	console.log(data);
	
	
	$.ajax({
		url : "/HurryUp/notice/noticeWriteInsert",
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
				Swal.fire('공지사항 등록이 완료되었습니다', '  ', 'success').then((result) => {
					console.log(result);
		            if (result.isConfirmed) {
		            	opener.f_noticeList();
						window.close();
		            }
		        });
				
			} else {
				Swal.fire('공지사항 등록 실패', '  ', 'error');
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
