<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath }/resources/css/radiList.css" rel="stylesheet"/>
<style type="text/css">
.raditable{ 
 height : 100px; 
 background-color : white; 
 } 
</style>

<div class="wrapper">
<div class="raditable">
<div class="grid-stack raditable">
	<div class="grid-stack-item" gs-w="4" gs-h="5" gs-x="0" gs-y="0">
		<div class="grid-stack-item-content card" >
			<h4>환자정보조회</h4>
			<table class="radi-table w-100" >
				<thead>
					<tr>
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
			<table class="radi-table w-100" >
				<thead>
					<tr>
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
			<table class="radi-table w-100" >
				<thead>
					<tr>
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
			<table class="radi-table w-100" >
				<thead>
					<tr>
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
			<table class="radi-table w-100" >
				<thead>
					<tr>
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
			<table class="radi-table w-100" >
				<thead>
					<tr>
						<th><a>순번</a></th>
						<th><a>환자명</a></th>
						<th><a>촬영실</a></th>
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
					  <input type="radio" name="divCd" value="DV004" />
					  <span>X-RAY</span>
					</label><br>
					
					<label>
					  <input type="radio" name="divCd" value="DV007" />
					  <span>MRI</span>
					</label><br>
					
					<label>
					  <input type="radio" name="divCd" value="DV006" />
					  <span>CT</span>
					</label><br>
					
					<label>
					  <input type="radio" name="divCd" value="DV005" />
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
									, $("<td>").html(v.divNm)		
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
									, $("<td>").html(v.divNm)		
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
									, $("<td>").html(v.divNm)		
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
									, $("<td>").html(v.divNm)		
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
				let aTag = $("<a>").html(v.waitstNm).attr({
					"data-bs-toggle":"modal"
					,"href":"#layerpop"
					,"class":"waitClass"
				});
// 					aTag.on("click",()=>{
// 						let curA = event.currentTarget;
// 						console.log("check:", curA.parentElement.parentElement);
// 						window.myTR = curA.parentElement.parentElement; // 전역변수에 임시 저장
// 					});
				console.log("v : " + JSON.stringify(v));
				
				let trTag = $("<tr>")
								.append(
									$("<td>").html(v.waitNum)		
									, $("<td>").html(v.paName)		
									, $("<td>").html(v.divNm)		
									, $("<td>").html(aTag)		
								).data("waitVO",v);
				trTags.push(trTag)
				
			});
			
			$("#radiWaitBody").html(trTags);
			
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
		
	});	
	
	$("#layerpop").on("shown.bs.modal", function(event){
		let aTag = $(event.relatedTarget);
		let waitVO = aTag.parents("tr:first").data("waitVO");
// 		alert("떳다");
		sessionStorage.setItem("rcpNo",waitVO.rcpNo);
		sessionStorage.setItem("waitstCd",waitVO.waitstCd);
		sessionStorage.setItem("divCd",waitVO.divCd);
		console.log("waitVO : " + JSON.stringify(waitVO));
		console.log($(this).find(`[name="divCd"][value="\${waitVO.divCd}"]`));
		$(this).find(`[name="divCd"][value="\${waitVO.divCd}"]`).prop("checked", true);
	});

}

/////////////////////모달//////////////////

// jQuery만 쓰면 약간 그래용.. 미래를 위해 javascript도 때때로 같이 섞어서 쓰도록 해용
const radiWaitListForm =  document.querySelector("#waitForm");
console.log(radiWaitListForm);
//submit 버튼을 누르면 자동으로 form 객체에 onsubmit 이벤트가 발생해용
radiWaitListForm.addEventListener("submit",()=>{
	event.preventDefault();
// 	console.log(this);
	var radioVal = $('input[name="divCd"]:checked').val();
	
	let data = {
			rcpNo : sessionStorage.getItem("rcpNo"),
			waitstCd : sessionStorage.getItem("waitstCd"),
			divCd : radioVal
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

</script>      

</body>
