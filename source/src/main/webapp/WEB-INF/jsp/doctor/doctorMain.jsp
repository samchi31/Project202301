<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>doctor-Main</title>
<style type="text/css">
  	/* table */
  	table {table-layout: fixed;}
  	
    /*tab css*/
/* 	.tab { overflow:hidden;} */
/* 	.tabnav{font-size:0;} */
/* 	.tabnav li{display: inline-block; text-align:center; border-right:1px solid #ddd;} */
/* 	.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; } */
/* 	.tabnav li a.active:before{background:#4E73DF;} */
/* 	.tabnav li a.active{border-bottom:1px solid #fff;} */
/* 	.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 15px; line-height:230%; text-decoration:none; font-size:16px;} */
/* 	.tabnav li a:hover, .tabnav li a.active{background:#fff; color:#4E73DF; } */
/* 	.tabcontent{ border-top:none; background:#fff;} */
/* 	.tabcontentWrap{ overflow-y:auto; overflow-x:auto;  border-top:none; background:#fff;}  */
	
	.tab-big{height:340px;}
	.tab-mid{height:215px;}
	.tab-bigger{height:320px;} 
	
	/* 처방 테이블 input tag width */
	input {width:100%;}
	
	/* 대기 테이블 select tag width */
	select {width:100%;}
	
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
	    width: 50%;
	    height: 50vh;
	    margin: 20px auto;
	    background-color: white;
	    border-radius : 5px;
	    padding : 10px;
	}
	.modal-content{
	}
	
	/* tr 더블클릭 */
	.dblclick-on{
		background-color : antiquewhite;
	}
	
	#detailText{
		min-height : 260px;
	}
</style>

<!-- modal -->
<div id="modal" onclick="f_modalClose()">
	<div class="modal-window modal-dialog" onclick="f_block()" >
		<div class="modal-content">
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
			<div class="grid-stack-item-content card" >
				<div class="tab doc-diag">
				    <ul class="tabnav">
				      <li><a href="#sym">증상</a></li>
				      <li><a href="#diag">진단</a></li>		      
				    </ul>
			    	<div class="tabcontentWrap tab-mid">
					    <div class="tabcontent">
					    	<div id="sym">
					    		<table class="table table-bordered table-hover">
									<colgroup>
							      		<col style="width: 15%;" />
							      		<col style="width: 40%;" />
							      	</colgroup>
						      		<thead>
						      			<tr class="fixedHeader table-light">
						      				<th>증상코드</th>
											<th>증상</th>
										</tr>
						      		</thead>
									<tbody>
									</tbody>
								</table>
					    	</div>
					    	<div id="diag">
					    		<table class="table table-bordered table-hover">
					      			<colgroup>
							      		<col style="width: 20%;" />
							      		<col style="width: 40%;" />
							      		<col style="width: 20%;" />
							      		<col style="width: 20%;" />
							      	</colgroup>
						      		<thead>
						      			<tr class="fixedHeader table-light">
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
			gs-x="0" gs-y="2" gs-w="5" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<div class="tab doc-pre">
				    <ul class="tabnav">
				      <li><a href="#pre">처방</a></li>
				      <li><a href="#film">촬영오더</a></li>		      
				    </ul>
			    	<div class="tabcontentWrap tab-bigger">
					    <div class="tabcontent">
					    	<div id="pre">
					    		<table class="table table-bordered table-hover">
									<colgroup>
								     	<col style="width: 20%;" />
							      		<col style="width: 40%;" />
							      		<col style="width: 10%;" />
							      		<col style="width: 10%;" />
							      		<col style="width: 10%;" />
							      		<col style="width: 10%;" />
							      		<col style="width: 20%;" />
								    </colgroup>
									<thead>
										<tr class="fixedHeader table-light">
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
					    		<table class="table table-bordered table-hover">
									<colgroup>
							      		<col style="width: 50%;" />
							      		<col style="width: 50%;" />
							      	</colgroup>
									<thead>
										<tr class="fixedHeader table-light">
											<th>촬영구분</th>
											<th>촬영명</th>
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
			gs-x="4" gs-y="0" gs-w="3" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card " >
				<h4>진료내역</h4>
				<div class="tabcontentWrap tab-mid">
			    	<div class="tabcontent">
			    		<table class="table table-bordered table-hover">
							<colgroup>
					      		<col style="width: 50%;" />
					      		<col style="width: 50%;" />
					      	</colgroup>
							<thead>
								<tr class="fixedHeader table-light">
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
			gs-x="5" gs-y="2" gs-w="2" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<h4>상세기록</h4>
				<div class="tabcontentWrap tab-big">
					<div class="tabcontent">
						<input type="text" id="detailText"/>
						<input type="button" value="등록" />
					</div>
				</div>
			</div>	
		</div>	
		<div class="grid-stack-item" 
			gs-x="7" gs-y="0" gs-w="3" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<h4>환자대기</h4>
				<div class="tabcontentWrap tab-mid">
			    	<div class="tabcontent">
						<table class="table table-bordered table-hover">
							<colgroup>
					      		<col style="width: 15%;" />
					      		<col style="width: 25%;" />
					      		<col style="width: 35%;" />
					      		<col style="width: 25%;" />
					      	</colgroup>
							<thead>
								<tr class="fixedHeader table-light">
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
				      						<select id="divSelect">
				      							<c:forEach items="${divTreat }" var="divTr">
				      								<option value="${divTr['divCd'] }" ${divTr['divCd'] eq wait['divCd'] ? "selected" : "" }>${divTr["divNm"] }</option>
				      							</c:forEach>
				      						</select>
				      					</td>
				      					<td>
				      						<select id="statusSelect">
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
			gs-x="10" gs-y="0" gs-w="2" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<h4>일정</h4>
			</div>	
		</div>	
		<div class="grid-stack-item" 
			gs-x="8" gs-y="2" gs-w="5" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<h4>기초자료</h4>
				 <div class="tab doc-basic">
				    <ul class="tabnav">
				      <li><a href="#dise">상병</a></li>
				      <li><a href="#medi">처방</a></li>
				      <li><a href="#sym">증상</a></li>
				      <li><a href="#radi">방사선</a></li>				      
				      <li><a href="#group">그룹오더</a></li>				      
				    </ul>
				    <div class="tabcontentWrap tab-big">
					    <div class="tabcontent">
					      <div id="dise">
					      	<table class="table table-bordered table-hover">
						      	<colgroup>
						      		<col style="width: 15%;" />
						      		<col style="width: 25%;" />
						      		<col style="width: 50%;" />
						      	</colgroup>
					      		<thead>
					      			<tr class="fixedHeader table-dark">
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
					      	<table class="table table-bordered table-hover">
				      			<colgroup>
						      		<col style="width: 18%;" />
						      		<col style="width: 42%;" />
						      		<col style="width: 9%;" />
						      		<col style="width: 16%;" />
						      		<col style="width: 16%;" />
						      	</colgroup>
					      		<thead>
					      			<tr class="fixedHeader table-dark">
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
					      	<table class="table table-bordered table-hover">
				      			<colgroup>
						      		<col style="width: 15%;" />
						      		<col style="width: 40%;" />
						      	</colgroup>
					      		<thead>
					      			<tr class="fixedHeader table-dark">
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
					      	<table class="table table-bordered table-hover">
				      			<colgroup>
						      		<col style="width: 40%;" />
						      		<col style="width: 40%;" />
						      		<col style="width: 20%;" />
						      	</colgroup>
					      		<thead>
					      			<tr class="fixedHeader table-dark">
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
					      					<td>${film["empNo"] }</td>
					      				</tr>
					      			</c:forEach>
					      		</tbody>
					      	</table>
					      </div>
					      <div id="group">
					      	<table class="table table-bordered table-hover">
				      			<colgroup>
						      		<col style="width: 40%;" />
						      		<col style="width: 40%;" />
						      	</colgroup>
					      		<thead>
					      			<tr class="fixedHeader table-dark">
					      				<th>그룹오더코드</th>
										<th>그룹오더명</th>
									</tr>
					      		</thead>
					      		<tbody >
					      			<c:forEach items="${goList }" var="go">
					      				<tr>
					      					<td>${go["goCd"] }</td>
					      					<td>${go["goKo"] }</td>
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

<form:form id="insertChartForm" modelAttribute="trmChart" method="post">
</form:form>

<%-- <form:form id="insertWaitForm" modelAttribute="waitHistory" method=""> --%>
	
<%-- </form:form> --%>



<!--  xml을 json으로 바꿔주는 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/custom.js"></script>
<script type="text/javascript">
	GridStack.init();
		
	let $medi = $("#medi");
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
	
    
	/* make table */
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
		return false;
	});
	$basicNavs.eq(0).click();
	
	let $diagNavs = $('.doc-diag li a').click(function () {
		$diagContents.hide().filter(this.hash).fadeIn();
		$diagNavs.removeClass('active');
		$(this).addClass('active');
		return false;
	});
	$diagNavs.eq(0).click();
	
	let $preNavs = $('.doc-pre li a').click(function () {
		$preContents.hide().filter(this.hash).fadeIn();
		$preNavs.removeClass('active');
		$(this).addClass('active');
		return false;
	});
	$preNavs.eq(0).click();
	
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
	
	// input result
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
		} else if (v_id == "medi"){
// 			console.log($tr.data("object"));
			let v_data = $tr.data("object");
			let newTr = $("<tr>").append(
				$("<td>").html(v_data["mdsCd"])	  
				, $("<td>").html(v_data["itmNm"])
				, $("<td>").html($("<input>").attr("type", "number").attr("min","1"))
				, $("<td>").html($("<input>").attr("type", "number").attr("min","1"))
				, $("<td>").html(v_data["injcPthNm"])
				, $("<td>").html(v_data["unit"])
				, $("<td>").html(v_data["payTpNm"])
			);
			tbody_pre.append(newTr);
		} else if (v_id == "sym"){
			tbody_sym.append($tr.clone());			
		} else if (v_id == "radi"){
			let newTr = $tr.clone();
			newTr.children().eq(2).remove();
			tbody_film.append(newTr);
		} else if (v_id == "group"){
			
		}
	});
	
	/* data submit */
	let $inputDetail = $("#detailText");
	let $trmForm = $("#insertChartForm").on('submit', function(){
		event.preventDefault();
		
		let data = $(this).serialize();
		let method = this.method;
		console.log(data, method);
			
		$.ajax({
// 			url : this.action,
			method : method,
			data : data,
// 			dataType : "application/json;charset=UTF=8",
// 			contentType : "json",
			success : function(resp) {
				console.log(resp);
				
				// alert 띄울?
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return false;
	}); 
	let $submitBtn = $("input[type=button]").on('click', function(){
		// diag
		$.each(tbody_diag.find("tr"), function(index, tr){
			// console.log(index, tr);
			let name = "diagHistoryVOList[" + index + "].";
			$trmForm.append($("<input>").attr({
				type:"hidden"
				, name: name+"diseaseCd"
				, value:$(tr).children().eq(0).html().trim()
			})).append($("<input>").attr({
				type:"hidden"
				, name: name+"icdName"
				, value:$(tr).children().eq(1).html().trim()
			}));
			let checkboxs = $(tr).find("input:checkbox");
			$.each(checkboxs, function(i, ck){
				// console.log(i, ck);
				// console.log(ck.name, $(ck).is(":checked"));
				let isTrue = $(ck).is(":checked");
				let newInput = $("<input>").attr("type","hidden")
					.attr("name", name+ck.name).val(isTrue ? "Y" : "N");
				$trmForm.append(newInput);
			});
		});
		
		// sym
		$.each(tbody_sym.find("tr"), function(index, tr){
			// console.log(index, tr);
			let name = "symptomVOList[" + index + "].";
			$trmForm.append($("<input>").attr({
				type:"hidden"
				, name: name+"symCd"
				, value:$(tr).children().eq(0).html().trim()
			})).append($("<input>").attr({
				type:"hidden"
				, name: name+"symDetail"
				, value:$(tr).children().eq(1).html().trim()
			}));
		});
		
		//pre
		$.each(tbody_pre.find("tr"), function(index, tr){
 			//console.log(index, tr, $(tr).data("object"));
			let name = "prescriptionVOList[" + index + "].";
			$trmForm.append($("<input>").attr({
				type:"hidden"
				, name: name+"preCd"
				, value:$(tr).children().eq(0).html().trim()
			})).append($("<input>").attr({
				type:"hidden"
				, name: name+"preDetail"
				, value:$(tr).children().eq(1).html().trim()
			})).append($("<input>").attr({
				type:"hidden"
				, name: name+"preNt"
				, value:$(tr).children().eq(2).children().val().trim()
			})).append($("<input>").attr({
				type:"hidden"
				, name: name+"preTotal"
				, value:$(tr).children().eq(3).children().val().trim()
			})).append($("<input>").attr({
				type:"hidden"
				, name: name+"injcPthNm"
				, value:$(tr).children().eq(4).html().trim()
			})).append($("<input>").attr({
				type:"hidden"
				, name: name+"unit"
				, value:$(tr).children().eq(5).html().trim()
			})).append($("<input>").attr({
				type:"hidden"
				, name: name+"payTpNm"
				, value:$(tr).children().eq(6).html().trim()
			}));
		});
		
		//film
		$.each(tbody_film.find("tr"), function(index, tr){
			// console.log(index, tr);
			let name = "filmOrderVOList[" + index + "].";
			$trmForm.append($("<input>").attr({
				type:"hidden"
				, name: name+"filmCd"
				, value:$(tr).children().eq(0).html().trim()
			}));
		});
		
		// detail
		$trmForm.append($("<input>").attr({
			type:"hidden"
			, name: "mediRecord"
			, value: $inputDetail.val()
		}));
		
		// 환자 접수 번호
// 		$trmForm.append($("<input>").attr({
// 			type:"hidden"
// 			, name: "rcpNo"
// 			, value: rcpNo
// 		}));
		
		console.log($trmForm);
		$trmForm.submit();
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
			contentType : "application/json;charset=UTF=8",
			success : function(resp) {
				// console.log(resp);
				f_modalOpen();
				f_modalBody(resp.patientInfo);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		return false;
	});
	
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
	
	let f_resetList = function(){
		
	}
	
	let f_list = (v_list, v_col) => {
		let result = "";
		let lastIndex = v_list.length - 1;
		$(v_list).each(function(index){
			result += v_list[index][v_col];
			if(index == lastIndex){
				return;
			}
			result += ", \n";
		});
		return result;
	}
	
	let f_chartDetail = (v_data) => {
		// console.log(v_data);
		modalBody.innerHTML="";
		$modalTitle.empty();
		$modalTitle.html("진료차트상세");		
		
		let table = $("<table>").append(
			$("<tr>").append($("<th>").html("진료차트코드"), $("<td>").html(v_data.trmCd))
			, $("<tr>").append($("<th>").html("날짜"), $("<td>").html(v_data.trmDt))
			, $("<tr>").append($("<th>").html("증상"), $("<td>").html(f_list(v_data.symptomVOList, "symCd")))
			, $("<tr>").append($("<th>").html("진단"), $("<td>").html(f_list(v_data.diagHistoryVOList,"icdName")))
			, $("<tr>").append($("<th>").html("처방"), $("<td>").html(f_list(v_data.prescriptionVOList,"preCd")))
			, $("<tr>").append($("<th>").html("촬영"), $("<td>").html(f_list(v_data.filmOrderVOList,"filmCd")))
			, $("<tr>").append($("<th>").html("기록"), $("<td>").html(v_data.mediRecord))
		);
		table.addClass("table table-bordered");
		$(modalBody).append(table);
	};
	
	// 진료차트 rcp 로 가져오기
	let f_getChart = (v_rcpNo, v_function) => {
		let url = "${pageContext.request.contextPath}/doctor/main/chart/"+v_rcpNo;
		$.ajax({
			url : url,
			method : "get",
			contentType : "application/json;charset=UTF=8",
			success : function(resp) {
 				// console.log(resp);
				let data = resp.chartVO;
				v_function(data);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
	/* 환자의 이전 진료 차트 */
	let $chartListTable = $('#chartListTable').on('click', 'tr', function(event){
		//console.log($(event.target).parent().data("chart"));
// 		let v_data = $(event.target).parent().data("chart");
		let data = $(this).data("chart");
		//console.log(data);
		f_modalOpen();
		f_getChart(data.rcpNo, f_chartDetail);
	});
	
	let f_makeRecentChart = (v_data) => {
		
		console.log(v_data);
		
		tbody_diag.empty();
		tbody_pre.empty();
		tbody_sym.empty();
		tbody_film.empty();
		$inputDetail.empty();
		
		if(!v_data){ return; }
		
		$trmForm.append($("<input>").attr({
			type: "hidden"
			, name: "trmCd"
			, value: v_data.trmCd
		}));
		
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
					, $("<td>").html($("<input>").attr("type", "number").attr("min","1").val(v.preNt))
					, $("<td>").html($("<input>").attr("type", "number").attr("min","1").val(v.preTotal))
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
					, $("<td>").html(v.filmCd)
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
			contentType : "application/json;charset=UTF=8",
			success : function(resp) {
				// console.log(resp);
				$chartListTable.empty();
				let trTags = [];
				$.each(resp.chartList, function(index, value){
					let tr = $("<tr>").append($("<td>").html(value.trmCd), $("<td>").html(value.trmDt));
					tr.data("chart",value);
					trTags.push(tr);
				});
				$chartListTable.append(trTags);
				
				// 차트리스트가 하나 이상이면 현재 차트가 잇을수도
				//console.log(resp.chartList.length);
				if(resp.chartList.length > 0){
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
	
	// 더블 클릭 햇을 시 진료기록엔 과거 진료 기록 리스트 
	// 1. 작성된 진료차트가 잇는 경우 -> 불러오기 -> 수정
	// 2. 진료차트가 없고 접수 번호만 잇다! -> 새로 입력
	let rcpNo = -1;
	let trmCd = -1;
	$waitTable.on('dblclick','tr',function(event){
		// console.log(event.target);
		$(this).siblings('tr').removeClass("dblclick-on");

		let $tr = $(this);
		rcpNo = $tr.data("rcpNo");
		
// 		$tr.toggleClass("dblclick-on");
		$tr.addClass("dblclick-on");
		$trmForm.empty();
		$trmForm.append($("<input>").attr({
				type: "hidden"
				, name: "rcpNo"
				, value: rcpNo
		}));
		
		f_readChartList($tr.find("a").html());
	});
	
	// 대기 상태 selectbox 바꾸기
	let $divSelect = $("#divSelect");
	let $changeWait = $("#statusSelect").on('change',function(){
		//console.log($divSelect.find("option:selected").val(), $divSelect.find("option:selected").text());
		let dvCd = $divSelect.find("option:selected").val();
		let stCd = $(this).find("option:selected").val();
		// console.log(dvCd, stCd);
		// console.log($(this).parents().filter("tr").trigger("dblclick"));
		$(this).parents().filter("tr").trigger("dblclick");
		
		if(rcpNo != -1){
			let url = "${pageContext.request.contextPath}/doctor/main/wait";
			let data = {
					"rcpNo" : rcpNo
					, "waitstCd" : stCd
					, "divCd" : dvCd
			}
			$.ajax({
				url : url,
				method : "post",
				data : data,
				dataType : "application/json;charset=UTF=8",
				success : function(resp) {
					console.log(resp);
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
		}		
	});
	
</script>