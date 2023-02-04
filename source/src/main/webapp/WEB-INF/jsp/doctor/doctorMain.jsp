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
	.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 15px; line-height:46px; text-decoration:none; font-size:16px;}
	.tabnav li a:hover, .tabnav li a.active{background:#fff; color:#7ea21e; }
	.tabcontent{ border-top:none; background:#fff;}
	.tabcontentWrap{ height:265px; overflow-y:auto; overflow-x:auto;  border-top:none; background:#fff;}

</style>

<div class="wrapper">
기초자료, 증상코드 기입, 처방 코드 기입, 수술 여부 기입, 환자 대기 리스트, 캘린더, 물리치료 여부 작성, 환자 상세 정보, 환자 진료차트 내역

	<div class="grid-stack">
		<!-- ui-draggable-disabled ui-resizable-disable 가 있으나 없으나 차이가 없다 -->
		<div class="grid-stack-item "
			gs-x="0" gs-y="0" gs-w="5" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<div class="tab">
				    <ul class="tabnav">
				      <li><a href="#sym">증상</a></li>
				      <li><a href="#diag">진단</a></li>		      
				    </ul>
			    	<div class="tabcontentWrap">
					    <div class="tabcontent">
					    	<div id="sym">
					    		<table>
									<colgroup>
							      		<col style="width: 15%;" />
							      		<col style="width: 25%;" />
							      		<col style="width: 50%;" />
							      	</colgroup>
									<thead>
									</thead>
									<tbody>
									</tbody>
								</table>
					    	</div>
					    	<div id="diag">
					    	</div>
					    </div>
					</div>
			  	</div>
			</div>
		</div>
		<div class="grid-stack-item" 
			gs-x="0" gs-y="2" gs-w="5" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<h4>처방</h4>
				<div>
					<table>
						<colgroup>
				      		<col style="width: 15%;" />
				      		<col style="width: 25%;" />
				      		<col style="width: 50%;" />
				      	</colgroup>
						<thead>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>	
		</div>
		<div class="grid-stack-item" 
			gs-x="0" gs-y="6" gs-w="5" gs-h="1" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<h4>기록</h4>
				<div>
					<input type="text"/>
					<button class="btn">저장</button>
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
			gs-x="5" gs-y="0" gs-w="2" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<h4>오더</h4>
				<div>
					<div class="tab">
					    <ul class="tabnav">
					      <li><a href="#film">영상</a></li>
					      <li><a href="#phy">물리</a></li>		      
					    </ul>
				    	<div class="tabcontentWrap">
						    <div class="tabcontent">
						    	<div id="film">
						    		<table>
										<colgroup>
								      		<col style="width: 50%;" />
								      		<col style="width: 50%;" />
								      	</colgroup>
										<thead>
											<tr>
												<th>촬영구분</th>
												<th>촬영명</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
						    	</div>
						    	<div id="phy">
						    	</div>
						    </div>
						</div>
				  	</div>
				</div>
			</div>	
		</div>	
		<div class="grid-stack-item" 
			gs-x="7" gs-y="0" gs-w="3" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<h4>환자대기</h4>
				<div>
					<table class="table table-bordered">
						<colgroup>
				      		<col style="width: 30%;" />
				      		<col style="width: 30%;" />
				      		<col style="width: 30%;" />
				      	</colgroup>
						<thead>
							<tr>
								<td>환자코드</td>
								<td>환자명</td>
								<td>대기상태</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>	
		</div>
		<div class="grid-stack-item" 
			gs-x="5" gs-y="2" gs-w="2" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >환자정보</div>	
		</div>	
		<div class="grid-stack-item" 
			gs-x="7" gs-y="2" gs-w="5" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				<h4>기초자료</h4>
				 <div class="tab">
				    <ul class="tabnav">
				      <li><a href="#dise">상병</a></li>
				      <li><a href="#medi">처방</a></li>
				      <li><a href="#sym">증상</a></li>
				      <li><a href="#radi">방사선</a></li>				      
				      <li><a href="#group">그룹오더</a></li>				      
				    </ul>
				    <div class="tabcontentWrap">
					    <div class="tabcontent">
					      <div id="dise">
					      	<table class="table table-bordered table-hover">
					      	<colgroup>
					      		<col style="width: 15%;" />
					      		<col style="width: 25%;" />
					      		<col style="width: 50%;" />
					      	</colgroup>
					      		<thead>
					      			<tr class="fixedHeader table-light">
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
					      		<thead>
					      			<colgroup>
							      		<col style="width: 15%;" />
							      		<col style="width: 40%;" />
							      		<col style="width: 10%;" />
							      		<col style="width: 15%;" />
							      		<col style="width: 20%;" />
							      	</colgroup>
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
					      		<thead>
					      			<colgroup>
							      		<col style="width: 15%;" />
							      		<col style="width: 40%;" />
							      	</colgroup>
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
					      </div>
					      <div id="group">
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
			}
		};
		xhr.send();
	}
	
	f_medicineList();
	
  /* gridstack setting */
//   let f_gridstackSetting = function(){
// 	  var items = [
// 	    {w: 5, h: 2, noResize: true, noMove: true, content: '진단'}, 
// 	    {w: 3, h: 3, noResize: true, noMove: true, content: '캘린더'},
// 	    {w: 4, h: 2, noResize: true, noMove: true, content: '환자대기'},
	    
// 	    {w: 5, h: 2, noResize:true, noMove: true, content: '처방'},
// // 	    {w: 4, h: 4, noResize:true, noMove: true, content: '기초자료'}, 
// 	    {w: 4, h: 4, noResize:true, noMove: true, content: f_makeTable()}, 
// 	    {w: 5, h: 2, noResize:true, noMove: true, content: '기록'},
// // 	    {w: 3, h: 3, noResize:true, noMove: true, content: '환자정보'}
// 	  ];
// 	  var grid = GridStack.init();
// 	  grid.load(items);
//   }
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
		  )
		  trTags.push($tr);
	  }
	  $tbody_medi.append(trTags);
  }
  
  /* tab 메뉴 */
  $(function(){
  $('.tabcontent > div').hide();
  $('.tabnav a').click(function () {
    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
    $('.tabnav a').removeClass('active');
    $(this).addClass('active');
    return false;
  }).filter(':eq(0)').click();
  });
</script>