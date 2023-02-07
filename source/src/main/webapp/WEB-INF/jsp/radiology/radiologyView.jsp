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

<script>
$(function(){
	$.ajax({
		url : "xraywait",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			if(result == null || result.length == 0){
				// 대기목록이 없을 때
				swal('대기목록 없음', "대기 인원이 없습니다.", "error");
			}else{
				let str = "";
				$.each(result, function(i, v){
					console.log(v);
					str += `<tr>
						<td><a>\${v.waitNo}</a></td>
						<td><a>\${v.paName}</a></td>
						<td><a>\${v.divNm}</a></td>
						<td><a>\${v.waitstNm}</a></td>
						</tr>`;
				});
				$("#radiXBody").html(str);
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});	
	
	$.ajax({
		url : "mriwait",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			if(result == null || result.length == 0){
				// 대기목록이 없을 때
				swal('대기목록 없음', "대기 인원이 없습니다.", "error");
			}else{
				let str = "";
				$.each(result, function(i, v){
					console.log(v);
					str += `<tr>
						<td><a>\${v.waitNo}</a></td>
						<td><a>\${v.paName}</a></td>
						<td><a>\${v.divNm}</a></td>
						<td><a>\${v.waitstNm}</a></td>
						</tr>`;
				});
				$("#radiMBody").html(str);
			} 
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});	
	
	$.ajax({
		url : "ctwait",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			if(result == null || result.length == 0){
				// 대기목록이 없을 때
				swal('대기목록 없음', "대기 인원이 없습니다.", "error");
			}else{
				let str = "";
				$.each(result, function(i, v){
					console.log(v);
					str += `<tr>
						<td><a>\${v.waitNo}</a></td>
						<td><a>\${v.paName}</a></td>
						<td><a>\${v.divNm}</a></td>
						<td><a>\${v.waitstNm}</a></td>
						</tr>`;
				});
				$("#radiCBody").html(str);
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});	

	$.ajax({
		url : "ultrawait",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			if(result == null || result.length == 0){
				// 대기목록이 없을 때
				swal('대기목록 없음', "대기 인원이 없습니다.", "error");
			}else{
				let str = "";
				$.each(result, function(i, v){
					console.log(v);
					str += `<tr>
						<td><a>\${v.waitNo}</a></td>
						<td><a>\${v.paName}</a></td>
						<td><a>\${v.divNm}</a></td>
						<td><a>\${v.waitstNm}</a></td>
						</tr>`;
				});
				$("#radiUBody").html(str);
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});	

	$.ajax({
		url : "radiwaitinglist",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			if(result == null || result.length == 0){
				// 대기목록이 없을 때
				swal('대기목록 없음', "대기 인원이 없습니다.", "error");
			}else{
				let trTags = [];
				$.each(result, function(i, v){
					let aTag = $("<a>").html(v.waitstNm).attr({
						"data-toggle":"modal"
						, "href":"#layerpop"
					});
					console.log(v);
					let trTag = $("<tr>")
									.append(
										$("<td>").html(v.waitNo)		
										, $("<td>").html(v.paName)		
										, $("<td>").html(v.divNm)		
										, $("<td>").html(aTag)		
									).data("waitVO",v);
					trTags.push(trTag)
				});
				$("#radiWaitBody").html(trTags);
			}
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
		console.log(`waitVO : \${waitVO.divCd}`)
		console.log($(this).find(`[name="divCd"][value="\${waitVO.divCd}"]`));
		$(this).find(`[name="divCd"][value="\${waitVO.divCd}"]`).prop("checked", true);
	});

});

</script>
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
						<th><a>접수번호</a></th>
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
						<th><a>접수번호</a></th>
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
						<th><a>접수번호</a></th>
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
						<th><a>접수번호</a></th>
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
	<div class="grid-stack-item" gs-w="2" gs-h="2" gs-x="4" gs-y="3">
		<div class="grid-stack-item-content card" >
			<h4>대기실</h4>
			<table class="radi-table w-100" >
				<thead>
					<tr>
						<th><a>접수번호</a></th>
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
	<div class="grid-stack-item" gs-w="2" gs-h="2" gs-x="6" gs-y="3">
		<div class="grid-stack-item-content card" >
			<h4>기록전송</h4>
		</div>	
	</div>	
	<div class="grid-stack-item" gs-w="2" gs-h="2" gs-x="8" gs-y="3">
		<div class="grid-stack-item-content card" >
			<h4>공지사항</h4>
		</div>	
	</div>	
	<div class="grid-stack-item" gs-w="2" gs-h="2" gs-x="10" gs-y="3">
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
			<button type="button" class="btn-closs" data-dismiss="modal">X</button>
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
	        <button type="submit" class="w-btn w-btn-blue" data-dismiss="modal">저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript">

GridStack.init();
</script>      

</body>
