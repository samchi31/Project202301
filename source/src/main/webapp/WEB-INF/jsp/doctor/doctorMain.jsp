<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.2/dist/bootstrap-table.min.css">
<script src="https://unpkg.com/bootstrap-table@1.21.2/dist/bootstrap-table.min.js"></script>

<style type="text/css">
  	/* table */
  	table {table-layout: fixed;}
  	
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
	
	.tab-big{height:280px;}
	.tab-mid{height:190px;}
	.tab-bigger{height:320px;} 
	
	input {width:100%;}
</style>

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
				<h4>진료기록</h4>
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
							<tbody>
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
				<div class="tabcontentWrap tab-bigger">
					<div class="tabcontent">
						<input type="text" />
						<input type="button" value="등록"/>
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
						<table class="table table-bordered">
							<colgroup>
					      		<col style="width: 30%;" />
					      		<col style="width: 30%;" />
					      		<col style="width: 30%;" />
					      	</colgroup>
							<thead>
								<tr class="fixedHeader table-light">
									<th>환자코드</th>
									<th>환자명</th>
									<th>대기상태</th>
								</tr>
							</thead>
							<tbody>
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


<!--  xml을 json으로 바꿔주는 라이브러리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>
<script type="text/javascript">
		
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
				
				f_makeTable($medi, data);
// 				console.log($medi.find("tr").eq(1).data("object"));
			}
		};
		xhr.send();
	}
	
	f_medicineList();
	
  GridStack.init();
  
  
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
	  $tbody_medi.append(trTags);
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
	
	$('.doc-basic tbody').on('click',function(event){
// 		console.log($td.parent("tr"));
// 		console.log($(this).parent().parent().attr('id'));
		let $tr = $(event.target).parent("tr");
		let v_id = $(this).parent().parent().attr('id');
		if(v_id == "dise"){
			let newTr = $tr.clone();
			newTr.children().eq(1).remove();
			newTr.append($("<td>").html("<input type='checkbox' name='operTf' />"));
			newTr.append($("<td>").html("<input type='checkbox' name='physiotherapyTf' />"));
			$diagContents.filter("#diag").find("tbody").append(newTr);
		} else if (v_id == "medi"){
// 			console.log($tr.data("object"));
			let v_data = $tr.data("object");
			let newTr = $("<tr>").append(
				$("<td>").html(v_data["mdsCd"])	  
				, $("<td>").html(v_data["itmNm"])
				, $("<td>").html($("<input>").attr("type", "number"))
				, $("<td>").html($("<input>").attr("type", "number"))
				, $("<td>").html(v_data["injcPthNm"])
				, $("<td>").html(v_data["unit"])
				, $("<td>").html(v_data["payTpNm"])
			);
			$preContents.filter("#pre").find("tbody").append(newTr);
		} else if (v_id == "sym"){
			$diagContents.filter("#sym").find("tbody").append($tr.clone());			
		} else if (v_id == "radi"){
			let newTr = $tr.clone();
			newTr.children().eq(2).remove();
			$preContents.filter("#film").find("tbody").append(newTr);
		} else if (v_id == "group"){
			
		}
	})
</script>