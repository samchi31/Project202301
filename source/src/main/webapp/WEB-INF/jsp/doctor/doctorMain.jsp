<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
  	
    /*tab css*/
	.tab{ margin:10px; overflow:hidden;}
	.tabnav{font-size:0;}
	.tabnav li{display: inline-block; text-align:center; border-right:1px solid #ddd;}
	.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
	.tabnav li a.active:before{background:#7ea21e;}
	.tabnav li a.active{border-bottom:1px solid #fff;}
	.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 15px; line-height:46px; text-decoration:none; font-size:16px;}
	.tabnav li a:hover, .tabnav li a.active{background:#fff; color:#7ea21e; }
	.tabcontent{ width:700px; border-top:none; background:#fff;}
	.tabcontentWrap{padding: 20px;  height:265px; overflow-y:auto; overflow-x:auto;  border-top:none; background:#fff;}
	
	ul{margin-bottom:0;}
</style>

<div class="wrapper">
	<div class="grid-stack">
		<!-- ui-draggable-disabled ui-resizable-disable 가 있으나 없으나 차이가 없다 -->
		<div class="grid-stack-item "
			gs-x="0" gs-y="0" gs-w="5" gs-h="1" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >진단</div>
		</div>
		<div class="grid-stack-item" 
			gs-x="0" gs-y="2" gs-w="5" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >처방</div>	
		</div>
		<div class="grid-stack-item" 
			gs-x="0" gs-y="4" gs-w="5" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >기록</div>	
		</div>
		<div class="grid-stack-item" 
			gs-x="5" gs-y="0" gs-w="2" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >캘린더</div>	
		</div>	
		<div class="grid-stack-item" 
			gs-x="5" gs-y="2" gs-w="2" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >환자정보</div>	
		</div>	
		<div class="grid-stack-item" 
			gs-x="7" gs-y="0" gs-w="5" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >환자대기</div>	
		</div>	
		<div class="grid-stack-item" 
			gs-x="7" gs-y="2" gs-w="5" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				 <div class="tab">
				    <ul class="tabnav">
				      <li><a href="#dise">상병</a></li>
				      <li><a href="#medi">처방</a></li>
				      <li><a href="#sym">증상</a></li>
				      <li><a href="#exam">검사</a></li>
				      <li><a href="#radi">방사선</a></li>				      
				      <li><a href="#group">그룹오더</a></li>				      
				    </ul>
				    <div class="tabcontentWrap">
					    <div class="tabcontent">
					      <div id="dise"></div>
					      <div id="medi">
					      	<table class="table table-bordered table-hover table-head-fixed">
					      		<thead>
					      			<tr>
					      				<th>약품코드</th>
										<th>약품명</th>
										<th>투여</th>
										<th>단위</th>
										<th>급여구분</th>
									</tr>
					      		</thead>
					      		<tbody>
					      		</tbody>
					      	</table>
					      </div>
					      <div id="sym"></div>
					      <div id="exam"></div>
					      <div id="radi"></div>
					      <div id="group"></div>
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
  let $tbody =$("tbody");
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
	  $tbody.append(trTags);
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