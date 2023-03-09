<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<link href="${pageContext.request.contextPath }/resources/css/radiList.css"rel="stylesheet" />
<title>영상의학과/대기실</title>
<style>
.oper-wrapper {
	height: 51.5rem;
}

.oper-pa-list {
	width: 30rem;
	height: 20rem;
}

.scroller {
	height: 16%;
	width: 96%;
	visibility: hidden;
/* 	margin-top: 65px; */
}

.pTag {  
	color: #868e96;
	font-family: 'spo';
	margin-bottom: 0px;
}

#symptomTable2 {
	margin-left: 50px;
}

.scrollshover, .scroller:hover, .scroller:focus {
	visibility: visible;
}

.modalRadio{
	margin-bottom: 12px;
}

p {
	margin-top: 0;
	margin-bottom: 0rem;
}

.btn-submit {
/* 	width: 2.25rem; */
/* 	height: 1.5rem; */
	background-color: #004262;
	color: white;
	border: none;
	margin: 0.188rem;
	box-shadow: 1px 1px 2px grey;
	font-size: 14px;
	width: 3.25rem;
    height: 1.4rem;
}

.film-select {
	width: 72px
}

.film-input {
	width: 131px;
}

.tabnav {
	font-size: 0;
	width: 105%;
}

.film-search-form {
	margin-top: 5px;
	margin-bottom: 5px;
}

.img-film {
	width: 100%;
	height: 17rem;
	padding: 1em;
}
.btn_blue {
    top: 36%;
}
</style>

<div class="raditable">
	<div class="grid-stack raditable">
		<div class="grid-stack-item" gs-w="2" gs-h="3" gs-x="0" gs-y="2">
			<div class="grid-stack-item-content card-grid">
				<h4 class="h4-title1">진료차트내역</h4>
				<p class="pTag">해당 환자를 클릭하면 진료차트가 출력됩니다.</p>
				<hr>
				<table class="table-blue">
					<thead class="fixedHeader">
						<tr>
							<th><a>차트코드</a></th>
							<th><a>환자명</a></th>
							<th><a>접수번호</a></th>
							<th><a>진료일자</a></th>
						</tr>
					</thead>
					<tbody id="chart-tbody">

					</tbody>
				</table>
			</div>
		</div>
		<div class="grid-stack-item" gs-w="4" gs-h="2" gs-x="0" gs-y="0">
			<div class="grid-stack-item-content card-grid">
				<h4 class="h4-title1">촬영실</h4>
				<p class="pTag">촬영실에 대기중인 환자 리스트를 출력하고, 환자를 클릭하면 환자의 이전 진료차트를  확인할 수 있습니다.</p>
				<p class="pTag">해당 환자의 촬영실구분을 선택하여 저장을 클릭하면 촬영실이 배정됩니다.</p>
				<hr>
				<table class="table-blue">
					<thead class="fixedHeader">
						<tr>
							<th><a>접수번호</a></th>
							<th><a>환자명</a></th>
							<th><a>생년월일</a></th>
							<th><a>성별</a></th>
							<th><a>촬영실구분</a></th>
							<th><a>상태</a></th>
						</tr>
					</thead>
					<tbody id="radiWaitBody"></tbody>
				</table>
			</div>
		</div>
		<div class="grid-stack-item" gs-w="2" gs-h="3" gs-x="2" gs-y="2">
			<div class="grid-stack-item-content card-grid" id="film-record-grid">
				<h4 class="h4-title1">촬영현황</h4>
				<p class="pTag">환자를 클릭하면 환자의 촬영 사진을 업로드할 수 있습니다.</p>
				<hr>
				<form id="serarchButton" class="film-search-form" name="xraySearchForm">
					<select id="searchOption" class="film-select">
						<option value="name">환자명</option>
						<option value="reg">생년월일</option>
					</select> 
					<input name="searchBtn" class="film-input" id="searchWord" type="text" value=""> 
					<input class="btn-submit" id="xraySearch" type="button" value="검색"> 
					<input style="display: none;" type="hidden" id="paNoHidden" value="" />
				</form>
				<table class="table-blue">
					<thead class="fixedHeadr">
						<tr>
							<th style="font-size: 11px">환자명</th>
							<th style="font-size: 11px">생년월일</th>
							<th style="font-size: 11px">촬영구분</th>
							<th style="font-size: 11px">촬영일</th>
						</tr>
					</thead>
					<tbody id="xrayListTbody"></tbody>
				</table>
			</div>
		</div>
		<div class="grid-stack-item" gs-w="2" gs-h="5" gs-x="4" gs-y="0">
			<div class="grid-stack-item-content card-grid" style="overflow: hidden;">
				<h4 class="h4-title1" style="margin-bottom: 9px;">진료차트/촬영기록</h4>
				<p class="pTag">선택한 환자의 진료차트를 확인할 수 있고,</p>
				<p class="pTag">환자의 촬영 사진을 업로드할 수 있습니다.</p>
				<hr>
				<div class=" row"><!-- offcanvas-body//class 제거했음 -->
					<div class="col-md-6">
						<label class="form-label" for="trmCd">차트코드</label> 
						<input style="font-size: 12px;" type="text" name="trmCd" id="trmCd_offcanvas" class="form-control  " readonly="readonly" disabled/>
					</div>
					<div class="col-md-6">
						<label class="form-label" for="rcpNo">접수번호</label> 
						<input style="font-size: 12px;" type="text" name="rcpNo" class="form-control " id="rcpNo_offcanvas" readonly="readonly" disabled/>
					</div>
					<div class="col-md-6" style="height: 29px;">
						<label class="form-label" for="paNo" style="margin-top: 53px;">환자번호</label>
						<input style="font-size: 12px;" type="text" name="paNo" id="paNo_offcanvas" class="form-control  " readonly="readonly" disabled/>
					</div>
					<div class="col-md-6">
						<label class="form-label" for="paName" style="margin-top: 53px;">환자명</label>
						<input style="font-size: 12px;" type="text" name="paName" id="paName_offcanvas" class="form-control " readonly="readonly" disabled/>
					</div>
						<div style=" position: absolute; top: 36%;">
						<label class="form-label">증상</label>
						<div class="scroller" id="symChartTable">
							<table class="table-blue scrollshover" id="symptomTable">
								<thead class="fixedHeader">
									<tr>
										<td style="width: 26%; background-color: #73B6E5;">증상코드</td>
										<td style="background-color: #73B6E5;">증상내용</td>
									</tr>
								</thead>
	
								<tbody id="symTbody2"></tbody>
							</table>
						</div>
						<label class="form-label"
							style="margin-bottom: 0.5rem; position: relative; top: 10%;">상병</label>
						<div class="scroller" id="symChartTable">
								<table class="table-blue scrollshover" id="symptomTable">
									<thead class="fixedHeader">
										<tr>
											<td style="width: 26%; background-color: #73B6E5;">상병코드</td>
											<td style="background-color: #73B6E5;">상병이름</td>
										</tr>
									</thead>
	
									<tbody id="diagTbody2"></tbody>
								</table>
						</div>
						<div id="filmOrderTable">
							<label id="filmCdLabel" class="form-label" style="margin-top: 30px;">촬영오더</label> 
							<input type="text" name="filmCd" class="form-control form-control-sm" style=" width: 96%;"
								id="filmCd_offcanvas" readonly="readonly" disabled>
						</div>
						<div class="radiChartTable" id="filmCateTable">
							<label id="filmCdLabel2" class="form-label" style="margin-top: 30px;">촬영구분</label> 
							<input type="text" name="filmCd" class="form-control form-control-sm" id="filmCd2_offcanvas" readonly="readonly" style="font-size: 12px; width: 96%;" disabled>
						</div>
						<div class="filebox" id="filmImageBox">
							<input type="file" class="filmImageInput" name="filmImage" accept="image/*" multiple style=" margin-top: 10px;"/>
							<form:errors path="filmImage" element="span" cssClass="text-danger" />
						</div>
						<div style="margin-top: 30px;">
							<label class="form-label" style="margin-top: 3px">기록</label> 
							<textarea name="mediRecord" class="form-control form-control-sm" id="mediRecord_offcanvas"
								readonly="readonly" style="font-size: 12px; width: 96%; height: 46px;" disabled></textarea> 
						</div>
						<div class="offcanvas-footer col-12" id="filmInsertBtn">
							<button type="button" class="btn_blue" style="float: right; margin-top: 10px;">저장</button>
						</div>
					</div>
				</div> <!-- zzzzzzzzzzzzzzzzzzz -->
			</div>
		</div>
		<div class="grid-stack-item" gs-w="6" gs-h="5" gs-x="6" gs-y="0">
			<div class="grid-stack-item-content card-grid">
				<h4 class="h4-title1">사진</h4>
				<p class="pTag">환자의 촬영 사진이 출력됩니다.</p>
				<hr>
				<div id="grid-container">
				
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal --> 
<div class="modal fade modal-sm" id="layerpop">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<h4 class="modal-title h4-title1">촬영실 배정</h4>
				<button type="button" class="close" data-bs-dismiss="modal"
					style="background-color: white;">&times;</button>
			</div>
			<form id="waitForm">
				<!-- body -->
				<div class="modal-body ">
					<input type="text" name="rcpNo" id="strRcpNo" hidden /> 
					<input type="text" name="divCd" id="strDivCd" hidden /> 
					<input type="text" name="trmCd" id="strTrmCd" hidden />
					<input type="text" name="filmCd" id="strFilmCd" hidden /> 
					<input type="text" name="waitstCd" id="strWaitstCd" hidden />
					<fieldset>
						<div class="form-check modalRadio ">
							<input class="form-check-input" type="radio" id="flexRadioDefault1" name="filmCd" value="X-RAY" readonly> 
							<label class="form-check-label" for="flexRadioDefault1"> <span style="font-size: 14px;">X-RAY</span> </label>
						</div>
						<div class="form-check modalRadio">
							<input class="form-check-input" type="radio" id="flexRadioDefault2" name="filmCd" value="MRI" readonly>
							<label class="form-check-label" for="flexRadioDefault2"> <span style="font-size: 14px;">MRI</span> </label>
						</div>
						<div class="form-check modalRadio">
							<input class="form-check-input" type="radio" id="flexRadioDefault2" name="filmCd" value="CT" readonly>
							<label class="form-check-label" for="flexRadioDefault2"> <span style="font-size: 14px;">CT</span> </label>
						</div>
						<div class="form-check modalRadio">
							<input class="form-check-input" type="radio" id="flexRadioDefault2" name="filmCd" value="URSONIC" readonly>
							<label class="form-check-label" for="flexRadioDefault2"> <span style="font-size: 14px;">초음파</span> </label>
						</div>
					</fieldset>
				</div>
				<!-- Footer -->
				<div class="modal-footer ">
					<button type="button" id="waitFormPost" class="w-btn w-btn-blue">저장</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- JQUERY-UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
GridStack.init();
radiWait_list();
radiRacord_list();
// 버튼 숨기기
let $filmInsertBtn = $("#filmInsertBtn");
let $filmImageBox = $("#filmImageBox");
let $filmCd_offcanvas = $("#filmCd_offcanvas");
let $filmCdLabel = $("#filmCdLabel");
//촬영 이미지 리스트 가져오기
let $gridContainer = $("#grid-container");

let $filmCateTable = $("#filmCateTable");
let $filmCdLabel2 = $("#filmCdLabel2");

$filmInsertBtn.hide();
$filmImageBox.hide();
$filmCd_offcanvas.show();
$filmCdLabel.show();


//촬영결과전송 처리
$("#filmInsertBtn").on("click",function(){
	let rcpNo = $("#rcpNo_offcanvas").val();
	let data = {
			rcpNo : rcpNo
	}
	$.ajax({
		url : "countRadiWaitList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend: function(xhr) {
	    	xhr.setRequestHeader(header, token);
	    },
		success : function(result) { /* 응답데이터 받아오기 */
			console.log("성공ㅇㅇㅇㅇㅇ")
			
			if(result>0){
				swal("저장실패", "촬영실배정이 완료되지 않았습니다!", "warning");
			}else{
				fileUpload();
				$(".filmImageInput").val("");
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});



function insertWaitHistory(){
	let trmCd = $("#trmCd_offcanvas").val();
	let rcpNo = $("#rcpNo_offcanvas").val();
	let waitstCd = $("#strWaitstCd").val();
	let divCd = $("#strDivCd").val();
	let filmCd = $("#strFilmCd").val();

	let data = {
			trmCd : trmCd,
			rcpNo : rcpNo,
			waitstCd : waitstCd,
			divCd : divCd,
			filmCd : filmCd
	};
	console.log("asdfasd : " + rcpNo);
	console.log("asdfasd : " + trmCd);
	
	$.ajax({
		url : "insertWaitList",
		method : "POST",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "text",
		beforeSend: function(xhr) {
	    	xhr.setRequestHeader(header, token);
	    },
		success : function(resp) {
			if(resp == "성공"){
				radiWait_list();
				radiRacord_list();
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
	
	function fileUpload(){
		//가상의 form 태그 생성<form></form>
		let formData = new FormData();
		let filmCd = new Array()
		
// 		let filmDate = $("#filmDate_offcanvas").val(new Date().toISOString().substring(0, 10).replace("-","/"));
		let inputFile = $("input[name='filmImage']");
		let files = inputFile[0].files;
		
		//formdata에다 filedata를 추가
		for(let i=0;i<files.length;i++){
			formData.append("attachFiles",files[i]);
			console.log(files[i]);
		}
		
		let strCsrf = $("input[name='_csrf']").val();
		
		let trmCd = $("#trmCd_offcanvas").val();
		let rcpNo = document.getElementById('rcpNo_offcanvas').value;
		
// 		let paNo = $("input[name='paNo']").val();
// 		let paName = $("input[name='paName']").val();
		filmCd = $("#filmCd2_offcanvas").val();
		formData.append("trmCd",trmCd);
		formData.append("rcpNo",rcpNo);
// 		formData.append("paNo",paNo);
// 		formData.append("paName",paName);
		formData.append("filmCd",filmCd);
		if(!inputFile.val()){
			swal("등록실패", "사진을 선택해주세요!", "warning");
		}else{
			//아작났어유ㅠㅠ 피씨다타써
			$.ajax({
				url:"${pageContext.request.contextPath}/radiology/updateFilmDate",
				processData:false,
				contentType:false,
				data:formData,
				type:"post",
				enctype : 'multipart/form-data', 
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(result){
					//result : FC037
	// 				console.log("그거다 : " + result);
					if(result == "성공"){
						swal("등록성공", "사진 등록이 완료되었습니다!", "success");
						insertWaitHistory()
						radiRacord_list();
						$filmInsertBtn.hide();
						$filmImageBox.hide();
						$filmCd_offcanvas.show();
						$filmCdLabel.show();
						//업로드 된 사진 경로 가져오기
						f_getImageList(rcpNo);
					}
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
		}
	}

	
	
	//촬영실 영억 > 촬영실구분의 특정 촬영실 클릭 시 실행
	$(document).on("click",".filmClass2",function(){
		//this : 선택한 바로 그 요소
		//<p class="filmClass2" data-trm-cd="TC0182" data-film-cd="MRI">MRI</p>
		let strTrmCd = $(this).data("trmCd");
		let strFilmCd = $(this).data("filmCd");
		let strRcpNo = $(this).data("rcpNo");
		let strDivCd = $(this).data("divCd");
		let strWaitstCd = $(this).data("waitstCd");
		
		
		$("#strTrmCd").val(strTrmCd);
		$("#strFilmCd").val(strFilmCd);
		$("#strRcpNo").val(strRcpNo);
		$("#strDivCd").val(strDivCd);
		$("#strWaitstCd").val(strWaitstCd);
		
		$("#layerpop").modal("show");
		
		$("input:radio[name='filmCd']:radio[value='"+strFilmCd+"']").prop('checked', true);
	});
	
    $("input[name=searchBtn]").keydown(function () {
		//event.stopPropagation();
        if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
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
		
// 		console.log(searchOption);
// 		console.log(searchWord);
		
		if(searchWord == ''){
			swal('검색 실패!', "검색어를 입력해주세요", 'error');
			return false;
		}
		
		let data = {
			searchOption:searchOption,
			searchWord:searchWord
		}
		
		
		
		$("#searchWord").val("");
		
    };
    
    //촬영환자 검색
    searchFilmPaList = function (){
        //검색 찾는 로직 구현
        let searchOption = $("#searchOption option:selected").val();
		let searchWord = $("#searchWord").val();
		
		if(searchWord == ''){
			swal('검색 실패!', "검색어를 입력해주세요", 'error');
			return false;
		}
		
		let data = {
			searchOption:searchOption,
			searchWord:searchWord
		}
		
		$.ajax({
			url : "mriSearch",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend: function(xhr) {
	        	xhr.setRequestHeader(header, token);
	   		},
			dataType : "json",
			success : function(result) { 
				if(result == null || result.length == 0){
					// 기록이 없을 때
					swal('검색실패', "환자 정보가 없습니다.", "error");
				}else if(result.length == 1){
					// 기록이 하나일 때
					let trTags = [];
					$.each(result, function(i, v){
						let trTag = $("<tr>").attr("class","filmClass")
						.append(
							$("<td>").html(v.paNo)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.paReg)
							, $("<td>").html(v.paSex)
							, $("<input>").attr({
								"type":"hidden",
								"value": `\${v.paNo}`
								})
						).data("waitVO",v);
						trTags.push(trTag);
					})
					$("#radiTBody").html(trTags);
					$(".filmClass").on("click",function(){
						let value = $(this).children('input').val();
						patientChartList(value);
						
					})	
				}else{
					let trTags = [];
					$.each(result, function(i, v){
						let trTag = $("<tr>")
						.append(
							$("<td>").html(v.paNo)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.paReg)
							, $("<td>").html(v.paSex)
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
    

/* 검색 끝 */
 
/* 기록일지 입력하는 오프캔버스 출력 */ 
function filmregisterList(value){
// 	console.log(value);
	let data = {
		paNo : value	
	}	
}

/* 진료차트 출력 */ 
function patientChartList(value){
// 	console.log(value);
	let data = {
		paNo : value	
	}
// 	console.log(data);
	$.ajax({
		url : "chartList",
		method : "post",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(result){
			if(result == null || result.length == 0){
				// 촬영완료 환자가 없을 때
				swal('진료차트 없음', "환자의 진료차트가 없습니다.", "error");
			}else{
				let trTags = [];
				$.each(result, function(i,v){
					let trTag = $("<tr>").attr({
							"class":"chartClass"
					}).append(
								$("<td>").html(v.trmCd)				
								, $("<td>").html(v.paName)			
								, $("<td>").html(v.rcpNo)
								, $("<td>").html(v.trmDt)
							)
					trTags.push(trTag);
				})
				$("#chart-tbody").html(trTags);
				$(".chartClass").on("click",function(){
					// 클릭했을때 색 변경
					let $tr = $(this);
					$tr.siblings('tr').removeClass("dblclick-on");
					let rcpNo = $tr.data("rcpNo");
					$tr.addClass("dblclick-on");
					
					$filmInsertBtn.hide();
					$filmImageBox.hide();
					$filmCateTable.hide();
					$filmCd_offcanvas.show();
					$filmCdLabel.show();
// 					$('div.trm').offcanvas('show');
					rcpNo = $(this).children('td').eq(2).text();
					$.ajax({
						url : "chart/"+rcpNo,
						method : "get",
						dataType : "json",
						success : function(resp) { 
							f_radi_register(resp);
							symptomList(resp.chartVO.trmCd);
							diseaseList(resp.chartVO.trmCd);
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
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

function radiWait_list(){	
	$.ajax({
		url : "radiwaitinglist",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){

			let trTags = [];
			$.each(result, function(i, v){

				let filmCdArr = v.filmCdList;//v.filmCd.split(",");
				let filmResult = "";
				
				for(let i=0;i<filmCdArr.length;i++){
					filmResult = filmResult + "<p class='filmClass2' data-trm-cd='" + v.trmCd + "' data-film-cd='" + filmCdArr[i] + "' data-rcp-no='" + v.rcpNo + "' data-div-cd='" + v.divCd + "' data-waitst-cd='" + v.waitstCd + "'>" + filmCdArr[i] + "</p>";
				}
				let trTag = $("<tr>").attr("class","filmClass")
								.append(
									$("<td>").html(v.rcpNo)		
									, $("<td>").html(v.paName)		
									, $("<td>").html(v.paReg)		
									, $("<td>").html(v.paSex)		
									, $("<td>").html(filmResult)		
									, $("<td>").html(v.paNo).hide()		
									, $("<td>").html("대기중")		
								).data("waitVO",v);
						trTags.push(trTag)
				
			});
			$("#radiWaitBody").html(trTags);
			$(".filmClass").on("click",function(){
				// 클릭했을때 색 변경
				let $tr = $(this);
				$tr.siblings('tr').removeClass("dblclick-on");
				rcpNo = $tr.data("rcpNo");
				$tr.addClass("dblclick-on");
				
				let value = $(this).children('td').eq(5).text();
				patientChartList(value);
			})	
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
		
	});	

	$("#layerpop").on("shown.bs.modal", function(event){
// 		let trTag = $(event.relatedTarget);
// 		console.log("trTag : ", trTag);
// 		let waitVO = trTag.data("waitVO");
// 		alert("떳다");
// 		sessionStorage.setItem("rcpNo",waitVO.rcpNo);
// 		sessionStorage.setItem("waitstCd",waitVO.waitstCd);
// 		sessionStorage.setItem("divCd",waitVO.divCd);
// 		console.log("waitVO : " + JSON.stringify(waitVO));
// 		console.log($(this).find(`[name="filmCd"][value="\${waitVO.filmCd}"]`));
// 		$(this).find(`[name="filmCd"][value="\${waitVO.filmCd}"]`).prop("checked", true);
	});

}


function filmInput(rcpNo,paName,filmCd,waitstNm){
	
	let data = {
		rcpNo : rcpNo,
		paName : paName,
		filmCd : filmCd,
		waitstNm : waitstNm
	}
	console.log("data : ",data);
}

// 진료차트 오프캔버스
function f_radi_register(resp,array){
	
	console.log("여기가 데이터 : ",resp);
	console.log("들어감");
	let data = resp.chartVO;
	let filmCd = data.filmOrderVOList[0].filmCd
	$("#trmCd_offcanvas").attr("value",data.trmCd);
	$("#rcpNo_offcanvas").attr("value",data.rcpNo);
	$("#paNo_offcanvas").attr("value",data.paNo);
	$("#paName_offcanvas").attr("value",data.paName);
	$("#filmCd_offcanvas").attr("value",data.filmOrderVOList[0].filmCd);
	if(array != null ){
		console.log("있는거체크")
		$("#filmCd2_offcanvas").attr("value",array);
	}
	else{
		console.log("없는거체크")
		$("#filmCd2_offcanvas").attr("value","");
	}
	$("#mediRecord_offcanvas").html(data.mediRecord);
	
}

// 파일업로드 오프캔버스
function f_film_register(result, gubun){
	$("#trmCd_offcanvas2").attr("value",result.chartVO.trmCd);
	$("#rcpNo_offcanvas2").attr("value",result.chartVO.rcpNo);
	$("#paNo_offcanvas2").attr("value",result.chartVO.paNo);
	$("#paName_offcanvas2").attr("value",result.chartVO.paName);
	$("#filmCd_offcanvas2").attr("value",gubun);

	let optionTags = [];
	$.each(result.chartVO.diagHistoryVOList, function(i,v){
		let optionTag = $("<option>").append(v.icdName);
		optionTags.push(optionTag);
	});
	$("#icdNameSelect").html(optionTags);		
}

/*오프캔버스1 증상 리스트 출력 */
function symptomList(trmCd){
	let data = {
		trmCd : trmCd
	};
	$.ajax({
		url : "symptomList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(resp) {
			//console.log("증상1 들왔다 : ",resp);
			let trTags = [];
			let trTag = '';
			$.each(resp, function(i,v){
				//console.log("v : ",v);
				trTag = $('<tr>').append(
							$('<td>').html(v.symCd)
							, $('<td>').html(v.symDetail)							
						)
				trTags.push(trTag);
			})
			$('#symTbody2').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
/*오프캔버스2 증상 리스트 출력 */
function symptomList2(trmCd){

	let data = {
		trmCd : trmCd
	};
	$.ajax({
		url : "symptomList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(resp) {
			//console.log("증상2 들왔다 : ",resp);
			let trTags = [];
			let trTag = '';
			$.each(resp, function(i,v){
				//console.log("v : ",v);
				trTag = $('<tr>').append(
							$('<td>').html(v.symCd)
							, $('<td>').html(v.symDetail)							
						)
				trTags.push(trTag);
			})
			$('#symTbody2').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
/* 오프캔버스1 상병 리스트 출력 */
function diseaseList(trmCd){
	let data = {
		trmCd : trmCd
	};
	$.ajax({
		url : "diagList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(resp) {
			//console.log("상병1 들어옴 : ",resp);
			let trTags = [];
			let trTag = '';
			$.each(resp, function(i,v){
				trTag = $('<tr>').append(
							$('<td>').html(v.diseaseCd)
							, $('<td>').html(v.icdName)							
						)
				trTags.push(trTag);
			})
			$('#diagTbody2').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 오프캔버스2 상병 리스트 출력 */
function diseaseList2(trmCd){
	let data = {
		trmCd : trmCd
	};
	$.ajax({
		url : "diagList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(resp) {
			//console.log("상병2 들어옴 : ",resp);
			let trTags = [];
			let trTag = '';
			$.each(resp, function(i,v){
				trTag = $('<tr>').append(
							$('<td>').html(v.diseaseCd)
							, $('<td>').html(v.icdName)							
						)
				trTags.push(trTag);
			})
			$('#diagTbody2').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 촬영 환자 리스트 출력 */
let xrayListTbody = $("#xrayListTbody");
function radiRacord_list(){	
	$.ajax({
		url : "xrayList",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			let trTags = [];
			$.each(result, function(i, v){
				let trTag = $("<tr>").attr({
								"class":"xraysubmitClass"
							}).append(
									$("<td>").html(v.paName)		
									, $("<td>").html(v.paReg)		
									, $("<td>").html(v.filmCd)		
									, $("<td>").html(v.filmDate)		
									, $("<td>").html(v.rcpNo).hide()		
								).data("waitVO",v);
				trTags.push(trTag)
			});
			xrayListTbody.html(trTags);

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

xrayListTbody.on('click', 'tr', function(event){
		console.log($(this).data("waitVO"));
		let waitVO = $(this).data("waitVO");
		
		// 클릭했을때 색 변경
		let $tr = $(this);
		$tr.siblings('tr').removeClass("dblclick-on");
		rcpNo = $tr.data("rcpNo");
		$tr.addClass("dblclick-on");
		
		
		$filmCd_offcanvas.hide();
		$filmCdLabel.hide();
		$filmCateTable.show();
		
		if(waitVO.filmDate == null){
			$filmInsertBtn.show();
			$filmImageBox.show();
		} else {
			$filmInsertBtn.hide();
			$filmImageBox.hide();
		}

		f_getImageList(waitVO.rcpNo);
	
		$.ajax({
			url : "filmChart/"+waitVO.rcpNo,
			method : "get",
			dataType : "json",
			success : function(resp) { 
				console.log("resp 결과 : ",resp);
				let data = resp.chartVO;
				let filmCdResult = "";
				
				$.each(data.filmOrderVOList, function(i, value){
					filmCdResult += value.filmCd;
					
					if(i != data.filmOrderVOList.length-1){
						filmCdResult += ", "					
					}
				});
				$("#trmCd_offcanvas").attr("value",data.trmCd);
				$("#rcpNo_offcanvas").attr("value",data.rcpNo);
				$("#paNo_offcanvas").attr("value",data.paNo);
				$("#paName_offcanvas").attr("value",data.paName);
				$("#filmCd_offcanvas").attr("value", filmCdResult);
				
				$("#filmCd2_offcanvas").attr("value",waitVO.filmCd);
				$("#mediRecord_offcanvas").attr("value",data.mediRecord);
				
				symptomList2(resp.chartVO.trmCd);
				diseaseList2(resp.chartVO.trmCd);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}

		});
});


/////////////////////모달//////////////////
 
$("#waitFormPost").on("click",function(){
	let trmCd = $("#strTrmCd").val();
	let rcpNo = $("#strRcpNo").val();
	let waitstCd = $("#strWaitstCd").val();
	let divCd = $("#strDivCd").val();
	let filmCd = $("#strFilmCd").val();

	let data = {
			trmCd : trmCd,
			rcpNo : rcpNo,
			waitstCd : waitstCd,
			divCd : divCd,
			filmCd : filmCd
	};
	
	$.ajax({
		url : "changeWaitList",
		method : "POST",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "text",
		beforeSend: function(xhr) {
	    	xhr.setRequestHeader(header, token);
	    },
		success : function(resp) {
			if(resp == "성공"){
				swal("배정성공", "촬영실 배정이 완료되었습니다!", "success");
				radiWait_list();
				radiRacord_list();
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
	$("#layerpop").modal("hide");
});



// 모달 움직이게
let $modal = $("#layerpop");
$modal.draggable({
  handle: ".modal-header",
});
$modal.resizable();

let f_getImageList = (rcpNo) => {
// 	console.log("asdfasdfasdf ",rcpNo);
	if(rcpNo == "") return;
	
	$.ajax({
		url : "${pageContext.request.contextPath}/radiology/filmImage/"+rcpNo,
		method : "get",
		dataType : "json",
		success : function(resp) {
			$gridContainer.empty();
			$.each(resp, function(index, value){
				$gridContainer.append($("<img>").attr("src", 
						"${pageContext.request.contextPath}/resourceFile"+value.attStreCours + value.attSavename)
							.addClass("img-film"));
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
};

</script>

