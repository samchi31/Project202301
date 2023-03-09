<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>doctor-go</title>

<style>
	.tab-big{height: 235px;}
	.tab-mid{height: 150px;}
	.tab-bigger{height: 375px;} 
	
	.dblclick-on{
		background-color : antiquewhite;
	}
	
	h4{font-family: 'Nanum Gothic', sans-serif; color: #6A6A6A;}
	h1{font-family: 'Nanum Gothic', sans-serif; color: #6A6A6A;}
	i {box-sizing: border-box ; padding : 5px; font-size : 1rem; float:right;}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<div class="wrapper">
	<div style="margin:0.5rem">
		<h1>그룹오더 관리</h1>
	</div>
	<div class="grid-stack">
		<div class="grid-stack-item "
			gs-x="0" gs-y="0" gs-w="4" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<h4 class="h4-title2">그룹오더목록<i class="bi bi-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="현재 작성된 그룹오더 목록입니다. 더블클릭하여 상세 관리 가능합니다."></i></h4>
				<div class="tabcontentWrap tab-mid">
			    	<div class="tabcontent">
						<table class="table-blue">
			      			<colgroup>
					      		<col style="width: 40%;" />
					      		<col style="width: 40%;" />
					      	</colgroup>
				      		<thead class="fixedHeader">
				      			<tr>
				      				<th>그룹오더코드</th>
									<th>그룹오더명</th>
								</tr>
				      		</thead>
				      		<tbody id="tbodyGoList">
<%-- 				      			<c:forEach items="${goList }" var="go"> --%>
<!-- 				      				<tr> -->
<%-- 				      					<td>${go["goCd"] }</td> --%>
<%-- 				      					<td>${go["goKo"] }</td> --%>
<!-- 				      				</tr> -->
<%-- 				      			</c:forEach> --%>
				      		</tbody>
				      	</table>
					</div>
				</div>
			</div>
		</div>
		<div class="grid-stack-item" 
			gs-x="4" gs-y="0" gs-w="8" gs-h="5" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<h4 class="h4-title2">그룹오더정보<i class="bi bi-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="그룹오더를 새로 작성하거나 그룹오더목록에서 선택한 그룹오더를 수정, 삭제할 수 있습니다."></i></h4>
				<div>
					<div>
						<button id="btnSave" class="btn btn-primary">저장</button>
						<button id="btnUpdate" class="btn btn-primary">수정</button>
						<button id="btnDelete" class="btn btn-primary">삭제</button>
						<button id="btnClear" class="btn btn-primary">초기화</button>
					</div>
					<div>
						<div>그룹오더코드</div>
						<div><input name="goCd" type="text" class="form-control"></div>
						<div>한글명칭</div>
						<div><input name="goKr" type="text" class="form-control"></div>
					</div>
					<div>
						<label>상병목록</label>
						<table class="table-blue">
			      			<colgroup>
					      		<col style="width: 20%;" />
					      		<col style="width: 40%;" />
					      		<col style="width: 40%;" />
					      	</colgroup>
				      		<thead class="fixedHeader">
				      			<tr >
				      				<th>상병코드</th>
				      				<th>영문</th>
				      				<th>한글</th>
				      			</tr>
				      		</thead>
				      		<tbody id="goDise">
				      		</tbody>
				      	</table>
					</div>
					<div>
						<label>처방목록</label>
						<table class="table-blue">
							<colgroup>
					      		<col style="width: 18%;" />
					      		<col style="width: 42%;" />
					      		<col style="width: 9%;" />
					      		<col style="width: 16%;" />
					      		<col style="width: 16%;" />
					      	</colgroup>
				      		<thead class="fixedHeader">
				      			<tr>
				      				<th>약품코드</th>
									<th>약품명</th>
									<th>투여</th>
									<th>단위</th>
									<th>급여구분</th>
								</tr>
				      		</thead>
							<tbody id="goPre">
							</tbody>
						</table>
					</div>
					<div>
						<label>증상목록</label>
						<table class="table-blue">
							<colgroup>
					      		<col style="width: 15%;" />
					      		<col style="width: 40%;" />
					      	</colgroup>
				      		<thead class="fixedHeader">
				      			<tr>
				      				<th>증상코드</th>
									<th>증상</th>
								</tr>
				      		</thead>
							<tbody id="goSym">
							</tbody>
						</table>
					</div>
				</div>
				
			</div>	
		</div>		
		<div class="grid-stack-item" 
			gs-x="0" gs-y="3" gs-w="4" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<h4 class="h4-title2">기초자료<i class="bi bi-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="그룹오더로 등록할 자료입니다. 선택하여 그룹오더정보에 추가할 수 있습니다."></i></h4>
				 <div class="tab doc-basic">
				    <ul class="tabnav">
				      <li><a href="#dise">상병</a></li>
				      <li><a href="#medi">처방</a></li>
				      <li><a href="#sym">증상</a></li>
				    </ul>
				    <div class="tabcontentWrap tab-big">
					    <div class="tabcontent">
					      <div id="dise" >
					      	<table class="table-blue">
						      	<colgroup>
						      		<col style="width: 15%;" />
						      		<col style="width: 25%;" />
						      		<col style="width: 50%;" />
						      	</colgroup>
					      		<thead class="fixedHeader">
					      			<tr>
					      				<th>상병코드</th>
					      				<th>영문</th>
					      				<th>한글</th>
					      			</tr>
					      		</thead>
					      		<tbody>
					      			<c:forEach items="${disList }" var="disease">
					      				<tr>
					      					<td>${disease["diseaseCd"] }</td>
					      					<td>${disease["enNm"] }</td>
					      					<td>${disease["korNm"] }</td>
					      				</tr>
					      			</c:forEach>
					      		</tbody>
					      	</table>
					      </div>
					      <div id="medi" >
					      	<table class="table-blue">
				      			<colgroup>
						      		<col style="width: 18%;" />
						      		<col style="width: 42%;" />
						      		<col style="width: 9%;" />
						      		<col style="width: 16%;" />
						      		<col style="width: 16%;" />
						      	</colgroup>
					      		<thead class="fixedHeader">
					      			<tr>
					      				<th>약품코드</th>
										<th>약품명</th>
										<th>투여</th>
										<th>단위</th>
										<th>급여구분</th>
									</tr>
					      		</thead>
					      		<tbody id="tbody_medi">
					      		</tbody>
					      	</table>
					      </div>
					      <div id="sym" >
					      	<table class="table-blue">
				      			<colgroup>
						      		<col style="width: 15%;" />
						      		<col style="width: 40%;" />
						      	</colgroup>
					      		<thead class="fixedHeader">
					      			<tr>
					      				<th>증상코드</th>
										<th>증상</th>
									</tr>
					      		</thead>
					      		<tbody >
					      			<c:forEach items="${symList }" var="symptom">
					      				<tr>
					      					<td>${symptom["symCd"] }</td>
					      					<td>${symptom["symDetail"] }</td>
					      				</tr>
					      			</c:forEach>
					      		</tbody>
					      	</table>
					      </div>
					    </div>
					</div>
				</div>		
			</div>	
		</div>	
		
	</div>
</div>

<!--  xml을 json으로 바꿔주는 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>
<script>		
	
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
	
	/* make table 약품 공공데이터 테이블 만들기 */
	let $tbody_medi =$("#tbody_medi");
	let f_makeTable = function(v_sel, v_data){
		let trTags = [];
		for(let i=0;i<v_data.length;i++){
			let $tr = $("<tr>").append(
				$("<td>").html(v_data[i]["mdsCd"])	  
				,$("<td>").html(v_data[i]["itmNm"])
				,$("<td>").html(v_data[i]["injcPthNm"])
				,$("<td>").html(v_data[i]["unit"])
				,$("<td>").html(v_data[i]["payTpNm"])
			);
			$tr.data("object",v_data[i]);
			trTags.push($tr);
		}
		v_sel.append(trTags);
	}
	
	// 공공데이터 가져오기
	let f_medicineList = function(){
		let url = "https://apis.data.go.kr/B551182/dgamtCrtrInfoService/getDgamtList?ServiceKey=m3zTXtgIgwkhr2WboRC5nIwTq5fQN7q8T2ZteWypCKCrIdm2eM4fUcWZ5PKNFiONOv6Xmj%2FAYqckvEgAmB6oEA%3D%3D&numOfRows=30&pageNo=1&mdsCd=65"
		let xhr = new XMLHttpRequest();
		xhr.open("get", url, true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let x2js = new X2JS();
				let jsonObj = x2js.xml_str2json(xhr.responseText); // xml을 편하게 json으로 변환
	//				console.log(xhr.responseText);
	//				console.log(jsonObj.response.body.items.item); // 눈으로 확인!
				let data = jsonObj.response.body.items.item;
				
				f_makeTable($tbody_medi, data);
	//				console.log($medi.find("tr").eq(1).data("object"));
			}
		};
		xhr.send();
	}	
	f_medicineList();
	
	// 그리드 스택 시작
	GridStack.init();
	
	// 기초자료 탭 이벤트
	let $basicContents = $(".doc-basic .tabcontent > div");	
	$('.tabcontent > div').hide();	
	let $basicNavs = $('.doc-basic li a').click(function () {
		$basicContents.hide().filter(this.hash).fadeIn();
		$basicNavs.removeClass('active');
		$(this).addClass('active');
		return false;
	});
	$basicNavs.eq(0).click();
	
	// 그룹오더정보 테이블 바디들
	let tbody_goDise = $("#goDise").on('dblclick','tr', function(){
		$(this).remove();
	});
	let tbody_goPre = $("#goPre").on('dblclick','tr', function(){
		$(this).remove();
	});
	let tbody_goSym = $("#goSym").on('dblclick','tr', function(){
		$(this).remove();
	});

	// input result 기초자료에서 그룹오더정보로 클릭 시 넘어감
	$('.doc-basic tbody').on('click', 'tr', function(event){
		// console.log($td.parent("tr"));
		// console.log($(this).parents().filter("div").attr("id"));
		let $tr = $(this);
		let v_id = $(this).parents().filter("div").attr("id");
		if(v_id == "dise"){
			tbody_goDise.append($tr.clone());
		} else if (v_id == "medi"){
			let newTr = $tr.clone(true);
			// console.log(newTr.data("object"));
			tbody_goPre.append(newTr);
		} else if (v_id == "sym"){
			tbody_goSym.append($tr.clone());			
		} 
	});
	
	// 그룹오더정보 text 
	let $goCd = $("input[name=goCd]");
	let $goKr = $("input[name=goKr]");
	
	// 그룹오더정보 초기화
	let f_clearForm = () => {
		$goCd.val("");
		$goKr.val("");
		tbody_goDise.empty();
		tbody_goPre.empty();
		tbody_goSym.empty();
	};

	// 그룹오더 정보 전체 정보 object로 가져오기
	let f_getData = () => {
		let goObject = {
				goCd : $goCd.val()
				, goKo : $goKr.val()
				, prevGoCd : prevGoCd
		};		
		
		// dise
		let diseArr = [];
		$.each(tbody_goDise.find("tr"), function(index, tr){
			// console.log(index, tr);		
			let dise = {};
			dise.icd = $(tr).children().eq(0).html().trim();
			dise.icdEng = $(tr).children().eq(1).html().trim();
			dise.icdName = $(tr).children().eq(2).html().trim();
			
			diseArr.push(dise);
		});
		goObject.goDiseaseVOList = diseArr;
		
		// sym
		let symArr = [];
		$.each(tbody_goSym.find("tr"), function(index, tr){
			// console.log(index, tr);
			let sym = {};
			sym.symCd = $(tr).children().eq(0).html().trim();
			sym.symDetail = $(tr).children().eq(1).html().trim();
			symArr.push(sym);
		});
		goObject.goSymptomVOList = symArr;
		
		//pre
		let preArr = [];
		$.each(tbody_goPre.find("tr"), function(index, tr){
 			// console.log(index, tr, $(tr).data("object"));
 			let pre = {};
 			pre.preCd = $(tr).children().eq(0).html();
 			pre.preDetail = $(tr).children().eq(1).html();
 			pre.injcPthNm = $(tr).children().eq(2).html();
 			pre.unit = $(tr).children().eq(3).html();
 			pre.payTpNm = $(tr).children().eq(4).html();
 			
 			preArr.push(pre);
		});
		goObject.goPrescriptionVOList = preArr;
		
		console.log(goObject);
		
		return goObject;
	};

	let f_resetGOList = () => {
		$.ajax({
			url : "${pageContext.request.contextPath}/group/goList"
			, dataType : "json"
			, success : function(resp){
				// console.log(resp);
				$tbodyGoList.empty();
				let trTags = [];
				$.each(resp, function(i, data){
					let tr = $("<tr>").append(
						$("<td>").html(data["goCd"])
						, $("<td>").html(data["goKo"])
					);
					tr.data("object", data);
					trTags.push(tr);
				});
				$tbodyGoList.append(trTags);
			}, error : function(jqxhr, status, error){
				console.log(jqxhr);
				console.log(status);
				console.log(error);
			}
		});
	};
	f_resetGOList();
	
	// 저장 버튼
	let $btnSave = $("#btnSave").on('click',function(){				
		$.ajax({
			url : "${pageContext.request.contextPath}/group/grouporder",
			method : "post",
			data : JSON.stringify(f_getData()),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			beforeSend: function(xhr) {
		           xhr.setRequestHeader(header, token);
		    },
			success : function(resp) {
				swal({title:resp, icon:"success"});
				// 그룹오더 목록 리셋
				f_resetGOList();
				
				// 그룹오더상세정보
				f_clearForm();
				
				// 메인페이지 그룹오더 목록 리셋
				opener.f_reGOList();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	// 이전 그룹오더 코드
	let prevGoCd = "";
	// 수정 버튼
	let $btnUpdate = $("#btnUpdate").on('click',function(){
		swal({
			title : "그룹오더 수정",
			text : "수정하시겠습니까?",
			icon : "info",
			buttons : {
				cancel : {
					text : "아니오"
					, value : false
					, visible : true
					, closeModal: true
				}
				, confirm : {
					text : "네"
					, value : true
					, visible : true
					, closeModal: true
				}
			}
		}).then((result) => {
			if (result){
				
				$.ajax({
					url : "${pageContext.request.contextPath}/group/goUpdate",
					method : "post",
					data : JSON.stringify(f_getData()),
					contentType : "application/json;charset=UTF-8",
					dataType : "text",
					beforeSend: function(xhr) {
				           xhr.setRequestHeader(header, token);
				    },
					success : function(resp) {
						swal({title:resp, icon:"success"});
						// 그룹오더 목록 수정
						f_resetGOList();

						// 메인페이지 그룹오더 목록 리셋
						opener.f_resetGOList();
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
			}
		});
	});

	// 삭제 버튼
	let $btnDelete = $("#btnDelete").on('click',function(){		
		swal({
			title : "그룹오더 삭제",
			text : "삭제하시겠습니까?",
			icon : "info",
			buttons : {
				cancel : {
					text : "아니오"
					, value : false
					, visible : true
					, closeModal: true
				}
				, confirm : {
					text : "네"
					, value : true
					, visible : true
					, closeModal: true
				}
			}
		}).then((result) => {
			if (result){
				let goCd = $goCd.val();
				
				$.ajax({
					url : "${pageContext.request.contextPath}/group/goDelete/"+goCd,
					method : "get",
					dataType : "text",
					success : function(resp) {
						swal({title:resp, icon:"success"});
						// 그룹오더 목록 리셋
						f_resetGOList();
						// 그룹오더 정보 리셋
						f_clearForm();
						// 메인페이지 그룹오더 목록 리셋
						opener.f_resetGOList();
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
			}
		});

	});
	
	// 그룹오더목록 더블클릭 선택
	let $tbodyGoList = $("#tbodyGoList").on('dblclick', 'tr', function(){
		let $tr = $(this);
		$tr.siblings('tr').removeClass("dblclick-on");		
		$tr.addClass("dblclick-on");
		
		// console.log($tr.children().eq(0).html());
		let goCd = $tr.children().eq(0).html();
		prevGoCd = goCd;
		
		$.ajax({
			url : "${pageContext.request.contextPath}/group/grouporder/"+goCd,
			method : "get",
			dataType : "json",
			success : function(resp) {
				// console.log(resp);
				f_showInfo(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	// 그룹오더정보에 정보 출력
	let f_showInfo = (v_data) => {		
		f_clearForm();

		$goCd.val(v_data["goCd"]);
		$goKr.val(v_data["goKo"]);
		
		let trTags = [];

		if(v_data["goDiseaseVOList"][0].icd != null) {
			$.each(v_data["goDiseaseVOList"], function(index, value){
				// console.log(index, value);	
				let tr = $("<tr>");
				
				tr.append(
					$("<td>").html(value["icd"])
					, $("<td>").html(value["icdEng"])
					, $("<td>").html(value["icdName"])
				);
				
				trTags.push(tr);
			});
			tbody_goDise.append(trTags);
		}
		
		if(v_data["goPrescriptionVOList"][0].preCd != null){
			trTags = [];
			$.each(v_data["goPrescriptionVOList"], function(index, value){
				// console.log(index, value);	
				let tr = $("<tr>");
				
				tr.append(
					$("<td>").html(value["preCd"])
					, $("<td>").html(value["preDetail"])
					, $("<td>").html(value["injcPthNm"])
					, $("<td>").html(value["unit"])
					, $("<td>").html(value["payTpNm"])
				);
				
				trTags.push(tr);
			});
			tbody_goPre.append(trTags);
		}

		if(v_data["goSymptomVOList"][0].symCd != null){
			trTags = [];
			$.each(v_data["goSymptomVOList"], function(index, value){
				// console.log(index, value);	
				let tr = $("<tr>");
				
				tr.append(
					$("<td>").html(value["symCd"])
					, $("<td>").html(value["symDetail"])
				);
				
				trTags.push(tr);
			});
			tbody_goSym.append(trTags);
		}
	};
	
	$("#btnClear").on('click',function(){
		f_clearForm();
	});
</script>