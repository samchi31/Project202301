<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.proofDiv{width: 48rem; height: 48rem; padding: 3rem; margin: 3rem;}
#dancingBone{width: 25rem; height: 25rem; margin-top: 3rem;}
</style>

<title>제증명</title>
<div class="proofDiv oper-card card-grid">
	<form id="radi-search-form" class="search-form" name="searchForm" onkeydown="f_block()">
			<div>
				<select id="searchOption" class="radi-select" style="width:75px;">
					<option value ="search">검색</option>
					<option value="paName">이름</option>
					<option value="paHp">전화번호</option>
					<option value="paReg">생년월일</option>
				</select> 
				
				<input name="searchBtn" class="radi-input" id="searchWord" type="text" value="" style="width:100px; display:inline-block;"> 
				<input class="btn-submit" id="Search" type="button" value="검색">
			    <input class="btn-submit" id="proofPrint" type="button" data-bs-toggle="modal" data-bs-target="#layerpop" value="제증명출력">
			</div>
		</form>
	<table class="table-blue scrollhover" >
		<thead>
			<tr>
				<th>환자번호</th>
				<th>환자명</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody id="radiTBody">
		
		</tbody>
	</table>
	<img id="dancingBone" src="../resources/images/dancingBone.gif">
</div>

<!-- **************************모달 시작********************************* -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- header title -->
        <h4 class="modal-title h4-title2">제증명 출력</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      	<div class="mb-3 row">
		    <label class="col-sm-2 col-form-label">환자명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="proof_paName" readonly="readonly" disabled>
		    </div>
		 </div>
		 <div class="mb-3 row">
		    <label class="col-sm-2 col-form-label">환자번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="proof_paNo" readonly="readonly" disabled>
		    </div>
		 </div>
		 <div class="mb-3 row">
		    <label class="col-sm-2 col-form-label">진료차트</label>
		    <div class="col-sm-10">
			    <select class="form-select" id="proofTrmCd">
					<option selected>선택</option>
			    </select>
		    </div>
		 </div>
		 <div class="mb-3 row">
		    <label class="col-sm-2 col-form-label">항목</label>
		    <div class="col-sm-10">
			    <select class="form-select" id="proofCate" onchange="">
					<option selected>선택</option>
					<option value="prescription">처방전</option>
					<option value="certificate">진단서</option>
			    </select>
		    </div>
		 </div>
		 <div id="printArea"></div>
		 
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" id="proofCreateBtn" class="btn_blue" >생성</button>
        <button type="button" class="btn_blue" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- *******************모달 끝************************* -->

<script>
$("#proofCreateBtn").on("click", function(){
	let trmCd = $('#proofTrmCd option:selected').val();
	let proofCate = $('#proofCate option:selected').val();
	
	let aTag = $('<a>').attr(
			{
				"type" : "button",
				"href": "${pageContext.request.contextPath}/commons/documentSelect?trmCd="+ trmCd +"&proofCate="+ proofCate,
				"download" : ''
			}).html("출력");
	
	$('#printArea').html(aTag);
	
});

/* 검색버튼클릭이벤트 */
$("#Search").on("click", function(){
	searchList();
});

searchList = function (){
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
		url : "patientSearch",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    },
		success : function(result) { 
				console.log(result);
			if(result == null || result.length == 0){
				// 기록이 없을 때
				swal('검색실패', "환자 정보가 없습니다.", "error");
			}else if(result.length == 1){
				// 기록이 하나일 때
				let trTags = [];
				$.each(result, function(i, v){
					let trTag = $("<tr class='trClass'>")
					.append(
						$("<td>").html(v.paNo)
						, $("<td>").html(v.paName)
						, $("<td>").html(v.paReg)
						, $("<td>").html(v.paHp)
						, $("<td>").html(v.paSex)
					).data("waitVO",v);
					trTags.push(trTag);
				})
				$("#radiTBody").html(trTags);
				
				$(".trClass").on("click",function(){
					let paNo = $(this).find('td').eq(0).html()
					let paName = $(this).find('td').eq(1).html()
					let paReg = $(this).find('td').eq(2).html()
					let paHp = $(this).find('td').eq(3).html()
					let paSex = $(this).find('td').eq(4).html()
					
					/* 모달창으로 환자정보 전송 */
					$('#proof_paName').val(paName);
					$('#proof_paNo').val(paNo);
					
					/* 진료차트조회 */
					loadTrmChart(paNo);
					
				})
			}else{
				// 기록이 여러개일 때
				let trTags = [];
				$.each(result, function(i, v){
//						console.log(v)
					let trTag = $("<tr class='trClass'>")
					.append(
						$("<td>").html(v.paNo)
						, $("<td>").html(v.paName)
						, $("<td>").html(v.paReg)
						, $("<td>").html(v.paHp)
						, $("<td>").html(v.paSex)
					).data("waitVO",v);
					trTags.push(trTag);
				})
				$("#radiTBody").html(trTags);
				
				$(".trClass").on("click",function(){
					let paNo = $(this).find('td').eq(0).html()
					let paName = $(this).find('td').eq(1).html()
					let paReg = $(this).find('td').eq(2).html()
					let paHp = $(this).find('td').eq(3).html()
					let paSex = $(this).find('td').eq(4).html()
					
					/* 모달창으로 환자정보 전송 */
					$('#proof_paName').val(paName);
					$('#proof_paNo').val(paNo);
					
					/* 진료차트조회 */
					loadTrmChart(paNo);
				})
				
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

/* 진료차트조회 */
function loadTrmChart(paNo){
	let data = {
			"paNo" : paNo
	}
	
	$.ajax({
		url : "loadTrmChart",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let optionTags = [];
			let optionTag = '';
			$.each(result, function(i,v){
				optionTag = $('<option>').attr("value",v.trmCd).html(v.trmCd +' (' + v.trmDt + ')');
				optionTags.push(optionTag);
			});
			$('#proofTrmCd').html(optionTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}


</script>