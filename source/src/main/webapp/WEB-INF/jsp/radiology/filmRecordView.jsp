<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath }/resources/css/filmRecord.css" rel="stylesheet" />
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.2/dist/bootstrap-table.min.css" />
<script src="https://unpkg.com/bootstrap-table@1.21.2/dist/bootstrap-table.min.js"></script>
<%-- <%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %> --%>
<!DOCTYPE html>
<html>
<head>
<title>촬영기록</title>
<style type="text/css">
    /*tab css*/
	.tab { overflow:hidden;}
	.tabnav{font-size:0;}
	.tabnav li{display: inline-block; text-align:center; border-right:1px solid #ddd;}
	.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
	.tabnav li a.active:before{background:#7ea21e;}
	.tabnav li a.active{border-bottom:1px solid #fff;}
	.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 15px; line-height:230%; text-decoration:none; font-size:16px;}
	.tabnav li a:hover, .tabnav li a.active{background:#fff; color:#7ea21e; }
	.tabcontent{ border-top:none; background:#fff;}
	.tabcontentWrap{ overflow-y:auto; overflow-x:auto;  border-top:none; background:#fff;} 
	
</style>

</head>
<body>
	<div id="wrapper">
	<!-- 전체-->
	<div id="content"><!--         -->
		<div id="left" class="raditable">
			<div class="patient-info">
				<div class="patient-info-in">
					<div class="patient-info-in-top">
						<h4 id="radi-title">촬영기록</h4>
						<form id="radi-search-form" class="search-form" name="searchForm" onkeydown="f_block()">
							<select id="searchOption" class="radi-select">
								<option value>검색하기</option>
								<option value="filmName">촬영실</option>
								<option value="name">이름</option>
							</select> 
							<input name="searchBtn" class="radi-input" id="searchWord" type="text" value="">
							<input class="btn-submit" id="Search" type="button" value="검색">
						</form>
					</div>
					<div id="film-record-in">
					<table class="table-bordered table-hover table1" >
						<thead>
							<tr>
								<td>촬영실구분</td>
								<td>환자명</td>
								<td>대기상태</td>
								<td>진료일자</td>
							</tr>
						</thead>
						<tbody id="radiTBody">
						
						</tbody>
					</table>
					</div>
				</div>
				<div class="film-submit">
					<div class="film-submit-in">
						<h4>촬영결과전송</h4>
						<table class="film-submit-table w-100 table1 table-bordered table-hover" >
							<thead>
								<tr> 
									<td>촬영실구분</td>
									<td>환자명</td>
									<td>대기상태</td>
									<td>진료일자</td>
								</tr>
							</thead>
								<tbody id="film-submit-tbody">
										
								</tbody>
							</table>
					</div>
				</div>
			</div>
		</div>
		<div id="right">
			<div class="grid-title">
			</div>
			<div id="grid-container">
				<div class="grid-item" id="1">
					<img alt="HTML" src="${pageContext.request.contextPath}/resources/imagesRadi/일자목Xray.png" width="220" height="140">
					<p class="p_list_con"><span class="p_name" style="padding-right:20px">위고굼</span>ㅇㅇ</p>
				</div>
				<div class="grid-item" id="item2">
					<img alt="HTML" src="${pageContext.request.contextPath}/resources/imagesRadi/발목ct.jfif" width="220" height="140">
					<p class="p_list_con"><span class="p_name" style="padding-right:20px">홍감자</span>ㅇㅇ</p>
				</div>
				<div class="grid-item" id="item3">
					<img alt="HTML" src="${pageContext.request.contextPath}/resources/imagesRadi/척추CT.jfif" width="220" height="140">
					<p class="p_list_con"><span class="p_name" style="padding-right:20px">박춘식</span>ㅇㅇ</p>
				</div>
				<div class="grid-item" id="item4">4</div>
				<div class="grid-item" id="item5">5</div>
				<div class="grid-item" id="item6">6</div>
				<div class="grid-item" id="item7">7</div>
				<div class="grid-item" id="item8">8</div>
				<div class="grid-item" id="item9">9</div>
				<div class="grid-item" id="item10">10</div>
				<div class="grid-item" id="item11">11</div>
				<div class="grid-item" id="item12">12</div>
				<!-- <div id="pagingArea"> -->
				<!-- 스크립트단으로 감 -->
				<%-- 	<ui:pagination pagingVO="${pagingVO }" type="bootstrap"/> --%>
				<!-- </div> -->
			</div><!-- grid-contents -->
			<div id="paging"><!-- paging 처리 박스 -->
			<style>
				#paging { position:relative; overflow:hidden; width:250px; margin:3% auto; text-align:center;font-size:20px; }
				
				.prev {display:block; float:left; color:#4169E1;font-weight:200;}
				.paging_number {display:block; float:left; margin:0 20px}
				.paging_number a {color:#4169E1; }
				.paging_number a.active { color:yellow; font-weight:800;}
				.next {display:block; float:left; color:#4169E1;font-weight:200;}
			</style>
				<a href="#" class="prev">Prev</a>
				<div class="paging_number">
					<a href="#" class="active">1</a> 
					<a href="#">2</a> 
					<a href="#">3</a>
					<a href="#">4</a>
				</div>
				<a href="#" class="next">Next</a>
			</div>
		</div>
	</div><!-- content tag End -->
</div>

<!-- 오프 캔버스 -->
<div class="offcanvas offcanvas-end" data-bs-scroll="true"
		data-bs-backdrop="false" tabindex="-1" id="offcanvasscrolling"
		aria-labelledby="offcanvasscrollinglabel">
	<div class="offcanvas-header">
		<h3 class="offcanvas-title" id="offcanvasscrollinglabel">촬영결과전송</h3>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="close"></button>
	</div>
	<!-- body -->
	<div class="offcanvas-body">
	  	<div class="form-group">
		    <label class="film_title" for="paNo">환자번호</label>
		    <input type="text" name="paNo" id="paNo_offcanvas" class="film_input" readonly="readonly" />
		</div>
              <div class="form-group">
		    <label class="film_title" for="paName">환자명</label>
		    <input type="text" name="paName" id="paName_offcanvas" class="film_input" readonly="readonly" />
		</div>
		<div class="form-group">
		    <label class="film_title" for="trmCd">차트번호</label>
		    <input type="text" name="trmCd" id="trmCd_offcanvas" readonly="readonly">
		</div>
		<div class="form-group">
		    <label class="film_title" for="divNm">촬영실</label>
		    <input type="text" name="divNm" id="divNm_offcanvas" readonly="readonly">
		</div>
		<div class="filebox">
		    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
		    <label for="file">파일업로드</label> 
		    <input type="file" id="file">
		</div>
        <div class="form-group">
		    <label class="ward_title" for="prMemo">비고</label>
		    <textarea class="ward_input" id="film_ne"></textarea>
		</div>
		</div>
	    <!-- Footer -->
	    <div class="modal-footer">
	       <button type="button" id="filmInsertBtn" class="btn_blue" data-dismiss="modal">저장</button>
	    </div>
</div>
	

<script type="text/javascript">
	$("a.paging").on("click", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (!page)
			return false;
		searchForm.find("[name=page]").val(page);
		searchForm.submit();
		return false;
	});
	
</script>


<script>

/* 파일을 선택했을 때에 인풋 안에 파일명이 적히도록 바꾸는 js */
$("#file").on('change',function(){
  var fileName = $("#file").val();
  $(".upload-name").val(fileName);
});

function f_block(){
	if(event.keyCode==13){
		event.preventDefault();
	}
}

//엔터키 누르면 검색실행되게 하는 코드
$(document).ready(function(){
    $("input[name=searchBtn]").keydown(function () {
		//event.stopPropagation();
        if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	console.log("체크");
            searchList();
        }
    });
    $("#Search").on("click", function(){
    	searchList();
    });
    
    searchList = function (){
        //검색 찾는 로직 구현
        let searchOption = $("#searchOption option:selected").val();
		let searchWord = $("#searchWord").val();
		
		console.log(searchOption);
		console.log(searchWord);
		
		if(searchWord == ''){
			swal('검색 실패!', "검색어를 입력해주세요", 'error');
			return false;
		}
		
		let data = {
			searchOption:searchOption,
			searchWord:searchWord
		}
		
		$.ajax({
			url : "filmSearch",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) { 
				console.log(result);
				console.log(result.length);
				
				if(result == null || result.length == 0){
					// 기록이 없을 때
					swal('검색실패', "촬영 기록이 없습니다.", "error");
				}else if(result.length == 1){
					// 기록이 하나일 때
					let trTags = [];
					$.each(result, function(i, v){
						console.log(v);
						let trTag = $("<tr>")
						.append(
							$("<td>").html(v.divNm)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.waitstNm)
							, $("<td>").html(v.waitDt)
						).data("waitVO",v);
						trTags.push(trTag);
					})
					$("#radiTBody").html(trTags);
				}else{
					// 기록이 여러개일 때
					let trTags = [];
					$.each(result, function(i, v){
						console.log(v);
						let trTag = $("<tr>")
						.append(
							$("<td>").html(v.divNm)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.waitstNm)
							, $("<td>").html(v.waitDt)
						).data("waitVO",v);
						trTags.push(trTag);
					})
					$("#radiTBody").html(trTags);
					
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		$("#searchWord").val("");
    };
});


	$.ajax({
		url : "filmList",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) { 
			console.log(result);
			console.log(result.length);
			if(result == null || result.length == 0){
				// 기록이 없을 때
				swal('검색실패', "촬영 기록이 없습니다.", "error");
			}else if(result.length == 1){
				// 기록이 하나일 때
			}else{
				// 기록이 여러개일 때
				let trTags = [];
				$.each(result, function(i, v){
					console.log(v);
					let trTag = $("<tr>").attr("class","filmClass")
					.append(
						$("<td>").html(v.rcpCd)
						, $("<td>").html(v.paName)
						, $("<td>").html(v.waitstNm)
						, $("<td>").html(v.waitDt)
						, $("<input>").attr({
							"type":"hidden",
							"value": `\${v.paNo}`
							})
					).data("waitVO",v);
					trTags.push(trTag);
				})
				$("#radiTBody").html(trTags);
				$(".filmClass").on("click",function(){
					console.log(this);
					let value = $(this).children('input').val();
					console.log(value);
					filmsubmit(value);
				})	
				
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
		
	});
	
// 촬영완료 환자 출력
function filmsubmit(value){
	console.log(value);
	let data = {
		paNo : value	
	}
	console.log(data);
	$.ajax({
		url : "filmResultList",
		method : "post",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			if(result == null || result.length == 0){
				// 촬영완료 환자가 없을 때
				swal('촬영 완료 환자 없음', "촬영 완료 상태의 환자가 없습니다.", "error");
			}else{
				let trTags = [];
					let trTag = $("<tr>").attr({
							"class":"filmsubmitClass",
							"data-bs-toggle" : "offcanvas",
							"data-bs-target" : "#offcanvasScrolling",
							"aria-controls" : "offcanvasScrolling"
							
					}).append(
								$("<td>").html(result[0].divNm).attr({
									"id":"waitNumTd"
								})					
								, $("<td>").html(result[0].paName).attr({
									"id":"paNameTd"
								})			
								, $("<td>").html(result[0].waitstNm).attr({
									"id":"waitstNmTd"
								})	
								, $("<td>").html(result[0].waitDt).attr({
									"id":"waitDtTd"
								})			
							);
					trTags.push(trTag)
					console.log("trTags", trTags);
				$("#film-submit-tbody").html(trTags);
				$(".filmsubmitClass").on("click",function(){
					console.log(this);
					$('div.offcanvas').offcanvas('show');
					f_radi_register(result[0].paNo, result[0].paName, result[0].trmCd, result[0].divNm);
				});
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});	
}

function f_radi_register(pa_no, pa_name, trm_cd, div_nm){
	$(".offcanvas-body #paNo_offcanvas").val(pa_no);
	$(".offcanvas-body #paName_offcanvas").val(pa_name);
	$(".offcanvas-body #trmCd_offcanvas").val(trm_cd);
	$(".offcanvas-body #filmCd_offcanvas").val(div_nm);
}

</script>
</body>
</html>