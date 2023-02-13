<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath }/resources/css/radiList.css" rel="stylesheet"/>
<title>영상의학과/대기실</title>
<style type="text/css">
.raditable{ 
 height : 100px; 
 background-color : white; 
} 

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
<!-- 오프 캔버스 -->
<div class="offcanvas offcanvas-end" data-bs-scroll="true"
		data-bs-backdrop="false" tabindex="-1" id="offcanvasscrolling"
		aria-labelledby="offcanvasscrollinglabel">
	<div class="offcanvas-header">
		<h3 class="offcanvas-title" id="offcanvasscrollinglabel">진료차트</h3>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
			aria-label="close"></button>
	</div>
	<!-- body -->
	<div class="offcanvas-body">
	  	<div class="form-group">
		    <label class="film_title" for="paNo">접수번호</label>
		    <input type="text" name="paNo" id="paNo_offcanvas" class="film_input" readonly="readonly" />
		</div>
              <div class="form-group">
		    <label class="film_title" for="paName">환자명</label>
		    <input type="text" name="paName" id="paName_offcanvas" class="film_input" readonly="readonly" />
		</div>
		<div class="form-group">
		    <label class="film_title" for="trmCd">진료차트</label>
		    <input type="text" name="trmCd" id="trmCd_offcanvas" readonly="readonly">
		</div>
		<div class="form-group">
		    <label class="film_title" for="divNm">촬영구분코드</label>
		    <input type="text" name="divNm" id="divNm_offcanvas" readonly="readonly">
		</div>
        <div class="form-group">
		    <label class="ward_title" for="prMemo">비고</label>
		    <textarea class="ward_input" id="film_ne"></textarea>
		</div>
		</div>
	    <!-- Footer -->
	    <div class="offcanvas-footer">
	       <button type="button" id="filmInsertBtn" class="btn_blue" data-bs-dismiss="offcanvas">저장</button>
	    </div>
</div>
<div class="wrapper">
<div class="raditable">
<div class="grid-stack raditable">
	<div class="grid-stack-item" gs-w="4" gs-h="5" gs-x="0" gs-y="0">
		<div class="grid-stack-item-content card" >
			<h4>환자정보조회</h4>
			<table class="radi-table w-100 table-bordered table-hover" >
				<thead>
					<tr class="table-primary">
						<th><a>촬영실구분</a></th>
						<th><a>환자명</a></th>
						<th><a>진료일자</a></th>
					</tr>
				</thead>
				<tbody id="radiTBody">
				
				</tbody>
			</table>
		</div>	
	</div>
	
	<div class="grid-stack-item" gs-w="2" gs-h="3" gs-x="4" gs-y="0">
		<div class="grid-stack-item-content card" >
			<h4>X-RAY촬영실</h4>
			<table class="radi-table w-100 table-bordered table-hover" >
				<thead>
					<tr class="table-primary">
						<th><a>순번</a></th>
						<th><a>환자명</a></th>
						<th><a>촬영실</a></th>
						<th><a>대기상태</a></th>
					</tr>
				</thead>
				<tbody id="radiXBody">
				
				</tbody>
			</table>
		</div>	
	</div>
	<div class="grid-stack-item" gs-w="2" gs-h="3" gs-x="6" gs-y="0">
		<div class="grid-stack-item-content card" >
			<h4>MRI촬영실</h4>
			<table class="radi-table w-100 table-bordered table-hover" >
				<thead>
					<tr class="table-primary">
						<th><a>순번</a></th>
						<th><a>환자명</a></th>
						<th><a>촬영실</a></th>
						<th><a>대기상태</a></th>
					</tr>
				</thead>
				<tbody id="radiMBody">
				
				</tbody>
			</table>
		</div>	
	</div>
	<div class="grid-stack-item" gs-w="2" gs-h="3" gs-x="8" gs-y="0">
		<div class="grid-stack-item-content card" >
			<h4>CT촬영실</h4>
			<table class="radi-table w-100 table-bordered table-hover" >
				<thead>
					<tr class="table-primary">
						<th><a>순번</a></th>
						<th><a>환자명</a></th>
						<th><a>촬영실</a></th>
						<th><a>대기상태</a></th>
					</tr>
				</thead>
				<tbody id="radiCBody">
				
				</tbody>
			</table>
		</div>	
	</div>
	<div class="grid-stack-item" gs-w="2" gs-h="3" gs-x="10" gs-y="0">
		<div class="grid-stack-item-content card" >
			<h4>초음파촬영실</h4>
			<table class="radi-table w-100 table-bordered table-hover" >
				<thead>
					<tr class="table-primary">
						<th><a>순번</a></th>
						<th><a>환자명</a></th>
						<th><a>촬영실</a></th>
						<th><a>대기상태</a></th>
					</tr>
				</thead>
				<tbody id="radiUBody">
				
				</tbody>
			</table>
		</div>	
	</div>
	<div class="grid-stack-item" gs-w="4" gs-h="2" gs-x="4" gs-y="3">
		<div class="grid-stack-item-content card" >
			<h4>대기실</h4>
			<table class="radi-table w-100 table-bordered table-hover" >
				<thead>
					<tr class="table-primary">
						<th><a>접수번호</a></th>
						<th><a>환자명</a></th>
						<th><a>진료차트</a></th>
						<th><a>대기상태</a></th>
					</tr>
				</thead>
				<tbody id="radiWaitBody">
				
				</tbody>
			</table>
		</div>	
	</div>	
	<div class="grid-stack-item" gs-w="4" gs-h="2" gs-x="8" gs-y="3">
		<div class="grid-stack-item-content card" >
			<h4>일정</h4>
		</div>	
	</div>	
</div>
</div>
</div>
  <!-- Modal -->
 <div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content card">
      <!-- header -->
      <div class="modal-header">
        <!-- header title -->
			<h4 class="modal-title">촬영실 배정</h4>
			<button type="button" class="btn-closs" data-bs-dismiss="modal">X</button>
      </div>
      <form id="waitForm" >
      	<input type="hidden" name="rcpNo">
	      <!-- body -->
			<div class="modal-body">
				<fieldset>
					<label>
					  <input type="radio" name="filmCd" value="X-RAY" />
					  <span>X-RAY</span>
					</label><br>
					
					<label>
					  <input type="radio" name="filmCd" value="MRI" />
					  <span>MRI</span>
					</label><br>
					
					<label>
					  <input type="radio" name="filmCd" value="CT" />
					  <span>CT</span>
					</label><br>
					
					<label>
					  <input type="radio" name="filmCd" value="URSONIC" />
					  <span>초음파</span>
					</label>
				</fieldset>
	     	</div>
	      <!-- Footer -->
	      <div class="modal-footer">
	        <button type="submit" class="w-btn w-btn-blue" >저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">
GridStack.init();
radiWait_list();
xrayWait_list();
mriWait_list();
ctWait_list();
ultraWait_list();

function xrayWait_list(){	
	$.ajax({
		url : "xraywait",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			let trTags = [];
			$.each(result, function(i, v){
				console.log(v);
				let trTag = $("<tr>")
								.append(
									$("<td>").html(v.waitNum)		
									, $("<td>").html(v.paName)		
									, $("<td>").html(v.filmCd)		
									, $("<td>").html(v.waitstNm)		
								).data("waitVO",v);
				trTags.push(trTag)
			});
			$("#radiXBody").html(trTags);
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
function mriWait_list(){	
	$.ajax({
		url : "mriwait",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			
			let trTags = [];
			$.each(result, function(i, v){
				let trTag = $("<tr>")
								.append(
									$("<td>").html(v.waitNum)		
									, $("<td>").html(v.paName)		
									, $("<td>").html(v.filmCd)		
									, $("<td>").html("촬영중")		
								).data("waitVO",v);
				trTags.push(trTag)
			});
			$("#radiMBody").html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});	
}
function ctWait_list(){	
	$.ajax({
		url : "ctwait",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log("result",result);
			console.log(result.length);
			let trTags = [];
			$.each(result, function(i, v){
				let trTag = $("<tr>")
								.append(
									$("<td>").html(v.waitNum)		
									, $("<td>").html(v.paName)		
									, $("<td>").html(v.filmCd)		
									, $("<td>").html("촬영중")		
								).data("waitVO",v);
					trTags.push(trTag)
				});
				$("#radiCBody").html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});	
}
	
function ultraWait_list(){
	$.ajax({
		url : "ultrawait",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			
			let trTags = [];
			$.each(result, function(i, v){
				let trTag = $("<tr>")
								.append(
									$("<td>").html(v.waitNum)		
									, $("<td>").html(v.paName)		
									, $("<td>").html(v.filmCd)		
									, $("<td>").html(v.waitstNm)		
								).data("waitVO",v);
				trTags.push(trTag)
			});
			$("#radiUBody").html(trTags);
		
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
			console.log(result);
			console.log(result.length);

			let trTags = [];
			$.each(result, function(i, v){
// 				let aTag = $("<a>").html(v.divCd).attr({
// 					"data-bs-toggle":"modal"
// 					,"href":"#layerpop"
// 					,"class":"waitClass"
// 				});
// 					aTag.on("click",()=>{
// 						let curA = event.currentTarget;
// 						console.log("check:", curA.parentElement.parentElement);
// 						window.myTR = curA.parentElement.parentElement; // 전역변수에 임시 저장
// 					});
				console.log("v : " + JSON.stringify(v));
				
				let trTag = $("<tr>").attr({
								"class":"filmsubmitClass",
								"data-bs-toggle" : "offcanvas",
								"data-bs-target" : "#offcanvasScrolling",
								"aria-controls" : "offcanvasScrolling"
								
						}).append(
									$("<td>").html(v.rcpNo)		
									, $("<td>").html(v.paName)		
									, $("<td>").html(v.divCd)		
									, $("<td>").html(v.waitstNm)		
								).data("waitVO",v);
				trTags.push(trTag)
				
			});
			
			$("#radiWaitBody").html(trTags);
			$(".filmsubmitClass").on("click",function(){
				console.log(this);
				$('div.offcanvas').offcanvas('show');
				f_radi_register(result[0].paNo, result[0].paName, result[0].trmCd, result[0].divNm);
			});
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
		
	});	

	/*
	$("#layerpop").on("shown.bs.modal", function(event){
		let aTag = $(event.relatedTarget);
		let waitVO = aTag.parents("tr:first").data("waitVO");
// 		alert("떳다");
		sessionStorage.setItem("rcpNo",waitVO.rcpNo);
		sessionStorage.setItem("waitstCd",waitVO.waitstCd);
		sessionStorage.setItem("divCd",waitVO.divCd);
		console.log("waitVO : " + JSON.stringify(waitVO));
		console.log($(this).find(`[name="filmCd"][value="\${waitVO.filmCd}"]`));
		$(this).find(`[name="filmCd"][value="\${waitVO.filmCd}"]`).prop("checked", true);
	});
	*/

}

function f_radi_register(pa_no, pa_name, trm_cd, div_nm){
	$(".offcanvas-body #paNo_offcanvas").val(rcp_no);
	$(".offcanvas-body #paName_offcanvas").val(pa_name);
	$(".offcanvas-body #trmCd_offcanvas").val(trm_cd);
	$(".offcanvas-body #filmCd_offcanvas").val(film_nm);
}

/////////////////////모달//////////////////
/*
// jQuery만 쓰면 약간 그래용.. 미래를 위해 javascript도 때때로 같이 섞어서 쓰도록 해용
const radiWaitListForm =  document.querySelector("#waitForm");
console.log(radiWaitListForm);
//submit 버튼을 누르면 자동으로 form 객체에 onsubmit 이벤트가 발생해용
radiWaitListForm.addEventListener("submit",()=>{
	event.preventDefault();
// 	console.log(this);
	var radioVal = $('input[name="filmCd"]:checked').val();
	
	let data = {
			rcpNo : sessionStorage.getItem("rcpNo"),
			waitstCd : sessionStorage.getItem("waitstCd"),
			divCd : sessionStorage.getItem("divCd"),
			filmCd : radioVal
	};
	console.log("data", data);
	$.ajax({
		url : "changeWaitList",
		method : "POST",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		success : function(resp) {
			xrayWait_list();
			radiWait_list();
			ultraWait_list();
			ctWait_list();
			mriWait_list();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
// 	$("#radiUBody").append($(myTR));
	$("#layerpop").modal("hide");
})
*/
</script>      

</body>
