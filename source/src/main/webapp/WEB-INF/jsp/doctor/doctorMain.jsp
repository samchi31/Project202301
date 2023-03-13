<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>doctor-Main</title>
<head>
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<style type="text/css">
  	  		
	.tab-big{height: 340px;}
	.tab-mid{height: 215px;}
	.tab-bigger{height: 375px;} 
	
	/* 처방 테이블 input tag width */
	input {width:100%;}
	
	/* 대기 테이블 select tag width */
/* 	select {width:100%;} */
	
	#modal {  /* 시퀀스 상 순서를 유지하기 위해서 */
	    position: fixed;
	    width: 100%;
	    height:100%;
	    left:0px; top:0px;
	    background-color: rgba(0,0,0, 0.4);
	    display: none;
	    z-index:100;
	}
	.modal-window {
	    width: 50vh;
	    height: 50vh;
	    margin: 20px auto;
	    background-color: white;
	    border-radius : 5px;
	    padding : 10px;
	}
	.modal-content{
		line-height: 25px;
	}
	/* .modal-header{
		
	} */
	.modal-header .modal-title{
		margin : 10px 10px;
	}
	.modal-body{
		text-align:center
	}
	/* .modal-footer{
	} */
	
		
	#detailText{
		min-height : 260px;
		height : 41rem;
	}
	
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
	}

	.chart-detail-body span{
		display : inline-block;
	}
	
	i {box-sizing: border-box ; padding : 5px; font-size : 1rem; float:right;}
</style>

<!-- modal -->
<div id="modal" onclick="f_modalClose()" class="card">
	<div class="modal-window modal-dialog animate__animated animate__fadeInDownBig animate__faster" onclick="f_block()" >
		<div class="modal-content ">
			<div class="modal-header">
				<h1 class="modal-title fs-5" ></h1>
			  	<button type="button" class="btn-close" aria-label="Close" onclick="f_modalClose()"></button>
			</div>
			<div class="modal-body">
		
			</div>
			<div class="modal-footer">			
			</div>
		</div>
	</div>
</div>   


<div class="wrapper">
	<div class="grid-stack">
		<!-- ui-draggable-disabled ui-resizable-disable 가 있으나 없으나 차이가 없다 -->
		<div class="grid-stack-item "
			gs-x="0" gs-y="0" gs-w="4" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<i class="bi bi-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="기초자료에서 증상과 상병을 클릭하여 작성할 수 있습니다. 진단에서 세부 오더를 내릴 수 있습니다. 더블클릭하여 항목을 삭제할 수 있습니다." style="position: absolute; right: 16px;"></i>
				<div class="tab doc-diag">
				    <ul class="tabnav">
				      <li><a href="#sym">증상</a></li>
				      <li><a href="#diag">진단</a></li>		      
				    </ul>
			    	<div class="tabcontentWrap tab-mid scroller scrollshover">
					    <div class="tabcontent">
					    	<div id="sym">
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
									<tbody>
									</tbody>
								</table>
					    	</div>
					    	<div id="diag">
					    		<table class="table-blue">
					      			<colgroup>
							      		<col style="width: 20%;" />
							      		<col style="width: 40%;" />
							      		<col style="width: 20%;" />
							      		<col style="width: 20%;" />
							      	</colgroup>
						      		<thead class="fixedHeader">
						      			<tr>
						      				<th>상병코드</th>
											<th>상병명</th>
											<th>수술여부</th>
											<th>물리치료</th>
										</tr>
						      		</thead>
						      		<tbody>
						      		</tbody>
						      	</table>
					    	</div>
					    </div>
					</div>
			  	</div>
			</div>
		</div>
		<div class="grid-stack-item" 
			gs-x="0" gs-y="2" gs-w="4" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<i class="bi bi-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="기초자료에서 처방과 방사선을 클릭하여 작성할 수 있습니다. 처방에서 세부 작성을 할 수 있습니다. 촬영오더에서 결과를 확인 할 수 있습니다. 더블클릭하여 항목을 삭제할 수 있습니다." style="position: absolute; right: 16px;"></i>
				<div class="tab doc-pre">
				    <ul class="tabnav">
				      <li><a href="#pre">처방</a></li>
				      <li><a href="#film">촬영오더</a></li>		      
				    </ul>
			    	<div class="tabcontentWrap tab-bigger scroller scrollshover">
					    <div class="tabcontent">
					    	<div id="pre" >
					    		<table class="table-blue">
									<colgroup>
								     	<col style="width: 20%;" />
							      		<col style="width: 40%;" />
							      		<col style="width: 10%;" />
							      		<col style="width: 10%;" />
							      		<col style="width: 10%;" />
							      		<col style="width: 10%;" />
							      		<col style="width: 20%;" />
								    </colgroup>
									<thead class="fixedHeader">
										<tr>
						      				<th>약품코드</th>
											<th>약품명</th>
											<th>일투</th>
											<th>총투</th>
											<th>투여</th>
											<th>단위</th>
											<th>급여구분</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
					    	</div>
					    	<div id="film">
					    		<table class="table-blue">
									<colgroup>
							      		<col style="width: 50%;" />
							      		<col style="width: 50%;" />
							      	</colgroup>
									<thead class="fixedHeader">
										<tr >
											<th>촬영구분</th>
											<th>촬영일시</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
								<div>
									<button style="display:none;" class="btn_blue" id="btn_film">결과상세</button>
								</div>
					    	</div>
					    </div>
					</div>
			  	</div>
			</div>	
		</div>
		
		<div class="grid-stack-item" 
			gs-x="10" gs-y="0" gs-w="2" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid " >
				<h4 class="h4-title1">진료내역<i class="bi bi-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="환자의 과거 진료기록입니다. 클릭하여 상세 확인할 수 있습니다."></i></h4>
				<div class="tabcontentWrap tab-mid scroller scrollshover">
			    	<div class="tabcontent">
			    		<table class="table-blue">
							<colgroup>
					      		<col style="width: 50%;" />
					      		<col style="width: 50%;" />
					      	</colgroup>
							<thead class="fixedHeader">
								<tr>
									<th>진료차트번호</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody id="chartListTable">
								
							</tbody>
						</table>
			    	</div>					    	
				</div>
			</div>	
		</div>	
		<div class="grid-stack-item" 
			gs-x="4" gs-y="0" gs-w="3" gs-h="5" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<h4 class="h4-title1">상세기록<i class="bi bi-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="환자 진료 상세기록을 작성할 수 있습니다. 등록 버튼을 눌러 오더나 진료차트를 작성을 할 수 있습니다. 환자대기 테이블에서 환자를 더블클릭하여 선택 시 진료차트를 이어서 작성할 수 있습니다."></i></h4>
				<div class="tabcontentWrap">
					<div class="tabcontent">
						<textarea rows="13" cols="" class="form-control" id="detailText" style="resize: none;"></textarea>
						<input class="btn_blue" type="button" value="등록" style="float: right; margin-top: 10px;"/>
					</div>
				</div>
			</div>	
		</div>	
		<div class="grid-stack-item" 
			gs-x="7" gs-y="0" gs-w="3" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<h4 class="h4-title1">환자대기<i class="bi bi-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="더블클릭하여 진료할 환자를 선택합니다. 병과구분과 대기상태를 변경합니다. 환자번호를 눌러 환자상세 정보를 확인합니다."></i></h4>
				<button style="position: absolute;right: 50px;top: 21px;" class="btn_blue" id="btn_change">변경</button>
				<div class="tabcontentWrap tab-mid scroller scrollshover">
			    	<div class="tabcontent">
						<table class="table-blue">
							<colgroup>
					      		<col style="width: 15%;" />
					      		<col style="width: 25%;" />
					      		<col style="width: 35%;" />
					      		<col style="width: 25%;" />
					      	</colgroup>
							<thead class="fixedHeader">
								<tr>
									<th>코드</th>
									<th>환자명</th>
									<th>병과구분</th>
									<th>대기상태</th>
								</tr>
							</thead>
							<tbody id="waitTable">
								<c:forEach items="${waitList }" var="wait">
				      				<tr data-rcp-no="${wait['rcpNo'] }">
				      					<td ><a class="paDetail">${wait["paNo"] }</a></td>
				      					<td>${wait["paName"] }</td>
				      					<td>
				      						<select class="divSelect">
				      							<c:forEach items="${divTreat }" var="divTr">
				      								<option value="${divTr['divCd'] }" ${divTr['divCd'] eq wait['divCd'] ? "selected" : "" }>${divTr["divNm"] }</option>
				      							</c:forEach>
				      						</select>
				      					</td>
				      					<td>
				      						<select class="statusSelect">
				      							<c:forEach items="${waitStatus }" var="waitSt">
				      								<option value="${waitSt['waitstCd'] }" ${waitSt['waitstCd'] eq wait['waitstCd'] ? "selected" : "" }>${waitSt["waitstNm"] }</option>
				      							</c:forEach>
				      						</select>
				      					</td>
				      				</tr>
				      			</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>	
		</div>
		<div class="grid-stack-item" 
			gs-x="8" gs-y="2" gs-w="5" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<div style="display:flex">
					<h4 class="h4-title1" style="width:100%">기초자료<i class="bi bi-info-circle" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="진료 시 필요한 정보입니다. 클릭하여 해당 데이터를 기록할 수 있습니다. 그룹오더에서 그룹오더를 관리할 수 있습니다."></i></h4>
					<button style="display:none; position: absolute;right: 50px;top: 21px;" class="btn_blue" id="btn_manage">관리</button>
				</div>
				<div class="tab doc-basic">
					<ul class="tabnav">
				      <li><a href="#dise">상병</a></li>
				      <li><a href="#medi">처방</a></li>
				      <li><a href="#sym">증상</a></li>
				      <li><a href="#radi">방사선</a></li>				      
				      <li><a href="#group">그룹오더</a></li>				      
				    </ul>
				    <div class="tabcontentWrap tab-big scroller scrollshover">
					    <div class="tabcontent">
					      <div id="dise">
					      	<table class="table-blue">
						      	<colgroup>
						      		<col style="width: 15%;" />
						      		<col style="width: 25%;" />
						      		<col style="width: 50%;" />
						      	</colgroup>
					      		<thead class="fixedHeader">
					      			<tr >
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
					      <div id="medi">
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
					      <div id="sym">
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
					      <div id="radi">
					      	<table class="table-blue">
				      			<colgroup>
						      		<col style="width: 40%;" />
						      		<col style="width: 40%;" />
						      		<col style="width: 20%;" />
						      	</colgroup>
					      		<thead class="fixedHeader">
					      			<tr>
					      				<th>촬영구분코드</th>
										<th>촬영명</th>
										<th>담당자</th>
									</tr>
					      		</thead>
					      		<tbody >
					      			<c:forEach items="${filmList }" var="film">
					      				<tr>
					      					<td>${film["filmCd"] }</td>
					      					<td>${film["filmNm"] }</td>
					      					<td>${film["empNm"] }</td>
					      				</tr>
					      			</c:forEach>
					      		</tbody>
					      	</table>
					      </div>
					      <div id="group">
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
					      		<tbody >
					      			<!-- <c:forEach items="${goList }" var="go">
					      				<tr>
					      					<td>${go["goCd"] }</td>
					      					<td>${go["goKo"] }</td>
					      				</tr>
					      			</c:forEach> -->
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


<!-- 오프캔버스 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasRightLabel">진료차트상세</h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body chart-detail-body">
    <span style="width:45%;">차트코드 <input id="off-trmCd" class="form-control" readonly disabled/></span>
    <span style="width:45%;">진료날짜 <input id="off-trmDt" class="form-control" readonly disabled/></span>
    <span style="width:45%;">접수번호 <input id="off-rcpNo" class="form-control" readonly disabled/></span>
    <span style="width:45%;">의사명 <input id="off-empNm" class="form-control" readonly disabled/></span>
    <span style="width:100%;">증상내역 
    	<div>
    		<table class="table-blue">
    			<thead>
    				<tr>
						<th>증상코드</th>
						<th>증상명</th>
					</tr>
    			</thead>
				<tbody id="off-tbody-sym">

				</tbody>
    		</table>
    	</div>
    </span>
    <span style="width:100%;">진단내역 
    	<div>
				<table class="table-blue">
    			<thead>
    				<tr>
							<th>진단코드</th>
							<th>진단명</th>
							<th>수술</th>
							<th>물리치료</th>
						</tr>
    			</thead>
					<tbody id="off-tbody-diag">

					</tbody>
    		</table>
    	</div>
    </span>
    <span style="width:100%;">처방내역 
    	<div>
				<table class="table-blue">
    			<thead>
    				<tr>
							<th>처방코드</th>
							<th>처방명</th>
						</tr>
    			</thead>
					<tbody id="off-tbody-pre">

					</tbody>
    		</table >
    	</div>
    </span>
	<span style="width:100%;">상세기록 <div id="off-mediRecord" class="form-control" style="height: 200px;"></div></span>
    <span>촬영내역 
    	<div>
				<table class="table-blue">
    			<thead>
    				<tr>
							<th>촬영코드</th>
							<th>촬영날짜</th>
						</tr>
    			</thead>
					<tbody id="off-tbody-film">

					</tbody>
    		</table>
    	</div>
    </span>
    <!-- <span style="width:100%;">물리치료기록 
    	<div>
				<table	ble class="table-blue">
					<thead>
						<tr>
							<th>물리치료</th>
						</tr>
					</thead>
					<tbody id="off-tbody-pt">

					</tbody>
    		</table>
    	</div>
    </span> -->
  </div>
</div>

<!--  xml을 json으로 바꿔주는 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>
<script type="text/javascript">
	// gridstack 시작
	GridStack.init();
	
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
	
	// 공공데이터 불러오기
	let f_medicineList = function(){
		let url = "https://apis.data.go.kr/B551182/dgamtCrtrInfoService/getDgamtList?ServiceKey=m3zTXtgIgwkhr2WboRC5nIwTq5fQN7q8T2ZteWypCKCrIdm2eM4fUcWZ5PKNFiONOv6Xmj%2FAYqckvEgAmB6oEA%3D%3D&numOfRows=30&pageNo=1&mdsCd=65"
		let xhr = new XMLHttpRequest();
		xhr.open("get", url, true);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				let x2js = new X2JS();
				let jsonObj = x2js.xml_str2json(xhr.responseText); // xml을 편하게 json으로 변환
// 				console.log(xhr.responseText);
// 				console.log(jsonObj.response.body.items.item); // 눈으로 확인!
				let data = jsonObj.response.body.items.item;
				
				f_makeTable($tbody_medi, data);
// 				console.log($medi.find("tr").eq(1).data("object"));
			}
		};
		xhr.send();
	}	
	f_medicineList();	
    
	// 처방 테이블 데이터 넣기
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
	
	// 그룹오더 관리 버튼
	let $btnManage = $("#btn_manage").on('click',function(){
		// url, name, setting
		window.open("${pageContext.request.contextPath}/group/grouporder","go","top=100em,left=100em,width=1460,height=750");
	});
	
	var trmCd = -1;
	// 촬영 상세 보기
	let $btnFilm = $("#btn_film").on('click',function(){
		let filmWindow = window.open("${pageContext.request.contextPath}/doctor/filmDetail","film","top=100em,left=100em,width=1390,height=850");
	});
  
  /* tab 메뉴 */
//   $(function(){
//   $('.tabcontent > div').hide();
//   $('.tabnav a').click(function () {
//     $('.tabcontent > div').hide().filter(this.hash).fadeIn();
//     $('.tabnav a').removeClass('active');
//     $(this).addClass('active');
//     return false;
//   }).filter(':eq(0)').click();
//   });
	let $basicTab = $(".doc-basic");
	let $basicContents = $(".doc-basic .tabcontent > div");
	let $diagTab = $(".doc-diag");
	let $diagContents = $(".doc-diag .tabcontent > div");
	let $preTab = $(".doc-pre");
	let $preContents = $(".doc-pre .tabcontent > div");
	
	$('.tabcontent > div').hide();
	
	let $basicNavs = $('.doc-basic li a').click(function () {
		$basicContents.hide().filter(this.hash).fadeIn();
		$basicNavs.removeClass('active');
		$(this).addClass('active');

		if(this.hash=='#group'){
			$btnManage.css("display","block");
		} else {
			$btnManage.css("display","none");
		}
		return false;
	});
	
	
	let $diagNavs = $('.doc-diag li a').click(function () {
		$diagContents.hide().filter(this.hash).fadeIn();
		$diagNavs.removeClass('active');
		$(this).addClass('active');
		
		if(this.hash=="#sym"){
			$basicNavs.eq(2).click();
		} else {
			$basicNavs.eq(0).click();
		}
		
		return false;
	});
	$diagNavs.eq(0).click();
	
	let $preNavs = $('.doc-pre li a').click(function () {
		$preContents.hide().filter(this.hash).fadeIn();
		$preNavs.removeClass('active');
		$(this).addClass('active');
		
		if(this.hash=='#film'){
			$btnFilm.css("display","block");
			$basicNavs.eq(3).click();
		} else {
			$btnFilm.css("display","none");
			$basicNavs.eq(1).click();
		}
		return false;
	});
	$preNavs.eq(0).click();
	$basicNavs.eq(0).click();
	
	// 진료차트 테이블 더블클릭
	let tbody_diag = $diagContents.filter("#diag").find("tbody").on('dblclick','tr', function(){
		$(this).remove();
	});
	let tbody_sym = $diagContents.filter("#sym").find("tbody").on('dblclick', 'tr', function(){
		$(this).remove();
	});
	let tbody_pre = $preContents.filter("#pre").find("tbody").on('dblclick', 'tr', function(){
		$(this).remove();
	});
	let tbody_film = $preContents.filter("#film").find("tbody").on('dblclick', 'tr', function(){
		$(this).remove();
	});
	
	// 기초자료 데이터 클릭 이벤트
	$('.doc-basic tbody').on('click', 'tr', function(event){
		// console.log($td.parent("tr"));
		// console.log($(this).parents().filter("div").attr("id"));
		let $tr = $(this);
		let v_id = $(this).parents().filter("div").attr("id");
		if(v_id == "dise"){
			let newTr = $tr.clone();
			newTr.children().eq(1).remove();
			newTr.append($("<td>").html("<input type='checkbox' name='operTf' />"));
			newTr.append($("<td>").html("<input type='checkbox' name='physiotherapyTf' />"));
			tbody_diag.append(newTr);
			$diagNavs.eq(1).click();
		} else if (v_id == "medi"){
// 			console.log($tr.data("object"));
			let v_data = $tr.data("object");
			let newTr = $("<tr>").append(
				$("<td>").html(v_data["mdsCd"])	  
				, $("<td>").html(v_data["itmNm"])
				, $("<td>").html($("<input>").attr("type", "number").attr("min","1").css("text-align","right"))
				, $("<td>").html($("<input>").attr("type", "number").attr("min","1").css("text-align","right"))
				, $("<td>").html(v_data["injcPthNm"])
				, $("<td>").html(v_data["unit"])
				, $("<td>").html(v_data["payTpNm"])
			);
			tbody_pre.append(newTr);
			$preNavs.eq(0).click();
		} else if (v_id == "sym"){
			tbody_sym.append($tr.clone());		
			$diagNavs.eq(0).click();
		} else if (v_id == "radi"){
			let newTr = $tr.clone();
			newTr.children().eq(1).remove();
			newTr.children().eq(1).remove();
			newTr.append($("<td>"));
			tbody_film.append(newTr);
			$preNavs.eq(1).click();
		} else if (v_id == "group"){
			let newTr = $tr.clone(true);
			// console.log(newTr.data("object"));
			f_applyGO(newTr.data("object"));
		}
	});
	
	// 상세기록 텍스트
	let $inputDetail = $("#detailText");
	let f_submitTrmChart = () => {		
		$.ajax({
			method : "post",
			data : JSON.stringify(chartObject),
			contentType : "application/json;charset=UTF-8",
			dataType : "text",
			beforeSend: function(xhr) {
		           xhr.setRequestHeader(header, token);
		    },
			success : function(resp) {
				console.log(resp);

				swal({title:resp, icon:"success"});
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}; 
	
	// 진료차트 object
	let chartObject = {};
	// 진료차트 등록 버튼
	let $submitBtn = $("input[type=button]").on('click', function(){
		
		if(rcpNo == -1) { 
			swal({title:"진료 환자를 선택해주세요", icon:"info"});
			return false; 
		}
		
		// chartObject = {};
		
		// diag
		let diagArr = [];
		$.each(tbody_diag.find("tr"), function(index, tr){
			// console.log(index, tr);		
			let diag = {};
			diag.diseaseCd = $(tr).children().eq(0).html().trim();
			diag.icdName = $(tr).children().eq(1).html().trim();
			
			let checkboxs = $(tr).find("input:checkbox");
			$.each(checkboxs, function(i, ck){
				// console.log(i, ck);
				// console.log(ck.name, $(ck).is(":checked"));
				let isTrue = $(ck).is(":checked");
				diag[ck.name] = isTrue ? "Y" : "N";
			});
			diagArr.push(diag);
		});
		chartObject.diagHistoryVOList = diagArr;
		
		// sym
		let symArr = [];
		$.each(tbody_sym.find("tr"), function(index, tr){
			// console.log(index, tr);
			let sym = {};
			sym.symCd = $(tr).children().eq(0).html().trim();
			sym.symDetail = $(tr).children().eq(1).html().trim();
			symArr.push(sym);
		});
		chartObject.symptomVOList = symArr;
		
		//pre
		let preArr = [];
		$.each(tbody_pre.find("tr"), function(index, tr){
 			//console.log(index, tr, $(tr).data("object"));
 			let pre = {};
 			pre.preCd = $(tr).children().eq(0).html().trim();
 			pre.preDetail = $(tr).children().eq(1).html().trim();
 			pre.preNt = $(tr).children().eq(2).children().val().trim();
 			pre.preTotal = $(tr).children().eq(3).children().val().trim();
 			pre.injcPthNm = $(tr).children().eq(4).html().trim();
 			pre.unit = $(tr).children().eq(5).html().trim();
 			pre.payTpNm = $(tr).children().eq(6).html().trim();
 			
 			preArr.push(pre);
		});
		chartObject.prescriptionVOList = preArr;
		
		//film
		let filmArr = [];
		$.each(tbody_film.find("tr"), function(index, tr){
			// console.log(index, tr);
			let film = {
					filmCd : $(tr).children().eq(0).html().trim()
			};
			filmArr.push(film);
		});
		chartObject.filmOrderVOList = filmArr;
		
		// detail
		chartObject.mediRecord = $inputDetail.val()
		
		// 환자 접수 번호
		
		console.log(chartObject);
		swal({
			title : "진료차트 작성",
			text : "저장하시겠습니까?",
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
				//console.log(result);
				f_submitTrmChart();
			}
		});
		return false;
	});
	
	/* 환자 대기 리스트 */
	let $waitTable = $('#waitTable');
	
	/* 환자 상세 modal */
	let $paDetail = $('.paDetail').on('click',function(){
		let paNo = $(event.target).html();
		let url = "${pageContext.request.contextPath}/doctor/main/paNo/"+paNo;
		$.ajax({
			url : url,
			method : "get",
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(resp) {
// 				console.log(resp);
				f_modalOpen();
				f_modalBody(resp);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return false;
	});
	
	// 모달 이벤트
	const modal = document.querySelector("#modal");
	const modalBody = document.querySelector(".modal-body");
	const f_modalOpen = () => {
		modal.style.display="block";
	}	
	function f_block(){
		event.stopPropagation();
	}
	const f_modalClose = () => {		
		event.stopPropagation();
		modalBody.innerHTML="";
		$modalTitle.empty();
 		modal.style.display="none"; 						
	}
	let $modalTitle = $('.modal-title');

	// 환자 모달 body 만들기
	let f_modalBody = (v_data) => {
// 		console.log(v_data, v_data.size);
// 		console.log(modalContent, $(modalContent));
		modalBody.innerHTML="";
		$modalTitle.empty();
		$modalTitle.html("환자상세");
		let table = $("<table>").append(
			$("<tr>").append($("<th>").html("환자번호"), $("<td>").html(v_data.paNo))
			, $("<tr>").append($("<th>").html("이름"), $("<td>").html(v_data.paName))
			, $("<tr>").append($("<th>").html("생년월일"), $("<td>").html(v_data.paReg))
			, $("<tr>").append($("<th>").html("전화번호"), $("<td>").html(v_data.paHp))
			, $("<tr>").append($("<th>").html("우편번호"), $("<td>").html(v_data.paZip))
			, $("<tr>").append($("<th>").html("주소"), $("<td>").html(v_data.paAdd1))
			, $("<tr>").append($("<th>").html("상세주소"), $("<td>").html(v_data.paAdd2))
			, $("<tr>").append($("<th>").html("성별"), $("<td>").html(v_data.paSex))
		);
		table.addClass("table table-bordered");
		$(modalBody).append(table);
	}		
		
	// 진료차트 rcp 로 가져오기
	let f_getChart = (v_rcpNo, v_function) => {
		let url = "${pageContext.request.contextPath}/doctor/main/chart/"+v_rcpNo;
		$.ajax({
			url : url,
			method : "get",
			//contentType : "application/json;charset=UTF-8",
			dataType:"text",
			success : function(resp) {
 				console.log("f_getChart : ",resp);
 				if(!resp) { return; }
 	
				let data = JSON.parse(resp);
				v_function(data);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	// 진료차트 상세
	let $offTrmCd = $("#off-trmCd");
	let $offTrmDt = $("#off-trmDt");
	let $offRcpNo = $("#off-rcpNo");
	let $offEmpNm = $("#off-empNm");
	let $offTbodySym = $("#off-tbody-sym");
	let $offTbodyDiag = $("#off-tbody-diag");
	let $offTbodyPre = $("#off-tbody-pre");
	let $offMediRecord = $("#off-mediRecord");
	let $offTbodyFilm = $("#off-tbody-film");
	let f_chartDetail = (v_data) => {

		$offTrmCd.empty();
		$offTrmDt.empty();
		$offRcpNo.empty();
		$offEmpNm.empty();
		$offTbodySym.empty();
		$offTbodyDiag.empty();
		$offTbodyPre.empty(); 
		$offMediRecord.empty();
		$offTbodyFilm.empty();
		
		console.log("offcanvas", v_data);

		$offTrmCd.val(v_data.trmCd);
		$offTrmDt.val(v_data.trmDt);
		$offRcpNo.val(v_data.rcpNo);
		$offEmpNm.val(v_data.empNm);
		
		$offMediRecord.html(v_data.mediRecord);

		let trTags = [];
		$.each(v_data.symptomVOList, function(index, value){
			let tr = $("<tr>").append(
				$("<td>").html(value.symCd)
				, $("<td>").html(value.symDetail)
			);
			trTags.push(tr);
		});
		$offTbodySym.append(trTags);

		trTags = [];
		$.each(v_data.diagHistroyVOList, function(index, value){
			let tr = $("<tr>").append(
				$("<td>").html(value.diseaseCd)
				, $("<td>").html(value.icdName)
				, $("<td>").html(value.operTf)
				, $("<td>").html(value.physiotherapyTf)
			);
			trTags.push(tr);
		});
		$offTbodyDiag.append(trTags);

		trTags = [];
		$.each(v_data.prescriptionVOList, function(index, value){
			let tr = $("<tr>").append(
				$("<td>").html(value.preCd)
				, $("<td>").html(value.preDetail)
			);
			trTags.push(tr);
		});
		$offTbodyPre.append(trTags);

		trTags = [];
		$.each(v_data.filmOrderVOList, function(index, value){
			let tr = $("<tr>").append(
				$("<td>").html(value.filmCd)
				, $("<td>").html(value.filmDate)
			);
			trTags.push(tr);
		});
		$offTbodyFilm.append(trTags);
	};

	/* 환자의 이전 진료 차트 리스트 클릭 오프캔버스 */
	let $chartListTable = $('#chartListTable').on('click', 'tr', function(event){
		let data = $(this).data("chart");
		f_getChart(data.rcpNo, f_chartDetail);
	});

	
	// 접수번호로 작성중인 차트 불러오기
	let f_makeRecentChart = (v_data) => {
		
		// console.log(v_data);
		
		tbody_diag.empty();
		tbody_pre.empty();
		tbody_sym.empty();
		tbody_film.empty();
		$inputDetail.val("");
		
		if(!v_data){ return; }
		
		chartObject.trmCd = v_data.trmCd;
		trmCd = v_data.trmCd;
				
		$(v_data.diagHistoryVOList).each(function(i,v){
			// console.log(i,v);
			if(!v.diseaseCd){ return; }
			tbody_diag.append(
				$("<tr>").append(
					$("<td>").html(v.diseaseCd)
					, $("<td>").html(v.icdName)
					//, $("<td>").html(v.operTf)
					//, $("<td>").html(v.physiotherapyTf)
					, v.operTf == "Y" ? $("<td>").html("<input type='checkbox' name='operTf' checked/>") : $("<td>").html("<input type='checkbox' name='operTf'/>")
					, v.physiotherapyTf == "Y" ? $("<td>").html("<input type='checkbox' name='physiotherapyTf' checked/>") : $("<td>").html("<input type='checkbox' name='physiotherapyTf' />")
			));	
		});
		
		$(v_data.symptomVOList).each(function(i,v){
			if(!v.symCd){ return; }
			tbody_sym.append(
				$("<tr>").append(
					$("<td>").html(v.symCd)
					, $("<td>").html(v.symDetail)
			));
		});
		
		$(v_data.prescriptionVOList).each(function(i,v){
			//console.log(i,v);
			if(!v.preCd){ return; }
			tbody_pre.append(
				$("<tr>").append(
					$("<td>").html(v.preCd)
					, $("<td>").html(v.preDetail)
					//, $("<td>").html(v.preNt)
					//, $("<td>").html(v.preTotal)
					, $("<td>").html($("<input>").attr("type", "number").attr("min","1").css("text-align","right").val(v.preNt))
					, $("<td>").html($("<input>").attr("type", "number").attr("min","1").css("text-align","right").val(v.preTotal))
					, $("<td>").html(v.injcPthNm)
					, $("<td>").html(v.unit)
					, $("<td>").html(v.payTpNm)
			));	
		});
		
		$(v_data.filmOrderVOList).each(function(i,v){
			if(!v.filmCd){ return; }
			tbody_film.append(
				$("<tr>").append(
					$("<td>").html(v.filmCd)
					, $("<td>").html(v.filmDate)
			));
		});
		
		$inputDetail.val(v_data.mediRecord);
	};

	// chart list 가져오기
	let f_readChartList = (v_paNo) => {
		let url = "${pageContext.request.contextPath}/doctor/main/chartlist/"+v_paNo;
		$.ajax({
			url : url,
			method : "get",
			contentType : "application/json;charset=UTF-8",
			dataType : "json",
			success : function(resp) {
				//console.log(resp);
				$chartListTable.empty();
				let trTags = [];
				$.each(resp, function(index, value){
					let tr = $("<tr>").append($("<td>").html(value.trmCd), $("<td>").html(value.trmDt));
					tr.data("chart",value);
// 					data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight"
					tr.attr("data-bs-toggle", "offcanvas")
						.attr("data-bs-target", "#offcanvasRight")
						.attr("aria-controls", "offcanvasRight");
					trTags.push(tr);
				});
				$chartListTable.append(trTags);
				
				// 차트리스트가 하나 이상이면 현재 차트가 잇을수도
				if(resp.length > 0){
					f_getChart(rcpNo, f_makeRecentChart);
				} 
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}	
	
	// rcp, chartObject 초기화
	let rcpNo = -1;
	
	// 대기 리스트에서 더블클릭
	// 환자 이전 진료 기록 리스트 가져옴
	// rcp로 작성중인 진료차트 있으면 가져옴
	$waitTable.on('dblclick','tr',function(event){
		// console.log(event.target);

		let $tr = $(this);
		$tr.siblings('tr').removeClass("dblclick-on");
		rcpNo = $tr.data("rcpNo");
		//console.log(rcpNo);
		
// 		$tr.toggleClass("dblclick-on");
		$tr.addClass("dblclick-on");
		
		tbody_diag.empty();
		tbody_pre.empty();
		tbody_sym.empty();
		tbody_film.empty();
		$inputDetail.val("");
		
		chartObject = {
				rcpNo : rcpNo
		};
		
		f_readChartList($tr.find("a").html());
	});
	
	// 대기 상태 selectbox 바꾸기
	let $divSelect = $(".divSelect").on('change',function(){
		$(this).parents().filter("tr").trigger("dblclick");
	});
	let $WaitSelect = $(".statusSelect").on('change',function(){
// 		//console.log($divSelect.find("option:selected").val(), $divSelect.find("option:selected").text());
// // 		let dvCd = $divSelect.find("option:selected").val();
// 		let dvCd = $(this).parents("tr").find(".divSelect").val();
// 		let stCd = $(this).find("option:selected").val();
// // 		console.log(dvCd, stCd);
// 		// console.log($(this).parents().filter("tr").trigger("dblclick"));
		$(this).parents().filter("tr").trigger("dblclick");
// 		console.log("rcpNo : ", rcpNo);
// 		if(rcpNo != -1){
// 			let url = "${pageContext.request.contextPath}/doctor/main/wait";
// 			let data = {
// 					"rcpNo" : rcpNo
// 					, "waitstCd" : stCd
// 					, "divCd" : dvCd
// 			}
// 			//console.log("wait data",data);
// 			$.ajax({
// 				url : url,
// 				method : "post",
// 				data : JSON.stringify(data),
// 				dataType : "text",	// 받는거
// 				contentType : "application/json;charset=UTF-8",	//보내는거
// 				beforeSend: function(xhr) {
// 			           xhr.setRequestHeader(header, token);
// 			    },
// 				success : function(resp) {
// 					//console.log("wait resp",resp);
// 				},
// 				error : function(jqXHR, status, error) {
// 					console.log(jqXHR);
// 					console.log(status);
// 					console.log(error);
// 				}
// 			});
// 		}		
	});
	
	let f_changeWaitStatus = () => {
 		//console.log($waitTable.find(".dblclick-on"));
 		let tr = $waitTable.find(".dblclick-on");
 		let dvCd = tr.find(".divSelect option:selected").val();
 		let stCd = tr.find(".statusSelect option:selected").val();
		//console.log(dvCd, stCd, rcpNo);
		
		if(rcpNo != -1){
			let url = "${pageContext.request.contextPath}/doctor/main/wait";
			let data = {
					"rcpNo" : rcpNo
					, "waitstCd" : stCd
					, "divCd" : dvCd
			}
			//console.log("wait data",data);
			$.ajax({
				url : url,
				method : "post",
				data : JSON.stringify(data),
				dataType : "text",	// 받는거
				contentType : "application/json;charset=UTF-8",	//보내는거
				beforeSend: function(xhr) {
			           xhr.setRequestHeader(header, token);
			    },
				success : function(resp) {
					//console.log("wait resp",resp);
					swal({title:resp, icon:"success"});
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
		}		
	}
	
	let $btn_change = $("#btn_change").on('click', f_changeWaitStatus);

	// 기초자료 그룹오더 리스트 리셋
	let $groupBody = $("#group").find("tbody");
	function f_reGOList(){
		$.ajax({
			url : "${pageContext.request.contextPath}/group/goList"
			, dataType : "json"
			, success : function(resp){
				// console.log(resp);
				$groupBody.empty();
				let trTags = [];
				$.each(resp, function(i, data){
					let tr = $("<tr>").append(
						$("<td>").html(data["goCd"])
						, $("<td>").html(data["goKo"])
					);
					tr.data("object", data);
					trTags.push(tr);
				});
				$groupBody.append(trTags);
			}, error : function(jqxhr, status, error){
				console.log(jqxhr);
				console.log(status);
				console.log(error);
			}
		});
	};
	f_reGOList();

	let f_applyGO = (v_data) => {		
		if(!v_data){ return; }
						
		if(v_data["goDiseaseVOList"][0].icd != null){
			$.each(v_data.goDiseaseVOList, function(i,v){
				// console.log(i,v);
				tbody_diag.append(
					$("<tr>").append(
						$("<td>").html(v.icd)
						, $("<td>").html(v.icdName)
						, $("<td>").html("<input type='checkbox' name='operTf' />")
						, $("<td>").html("<input type='checkbox' name='physiotherapyTf' />")
				));	
			});
		}
		
		if(v_data["goPrescriptionVOList"][0].preCd != null){
			$.each(v_data.goPrescriptionVOList, function(i,v){
				//console.log(i,v);
				tbody_pre.append(
					$("<tr>").append(
						$("<td>").html(v.preCd)
						, $("<td>").html(v.preDetail)
						, $("<td>").html($("<input>").attr("type", "number").attr("min","1").css("text-align","right"))
						, $("<td>").html($("<input>").attr("type", "number").attr("min","1").css("text-align","right"))
						, $("<td>").html(v.injcPthNm)
						, $("<td>").html(v.unit)
						, $("<td>").html(v.payTpNm)
				));	
			});
		}

		if(v_data["goSymptomVOList"][0].symCd != null){
			$.each(v_data.goSymptomVOList, function(i,v){
				tbody_sym.append(
					$("<tr>").append(
						$("<td>").html(v.symCd)
						, $("<td>").html(v.symDetail)
				));
			});
		}
	};
	
	
</script>