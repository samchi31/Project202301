<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${pageContext.request.contextPath }/resources/css/cexStyle.css" rel="stylesheet"/>

<style>
*, ::after, ::before{
	box-sizing: content-box;
}

</style>
<script>
$(function(){
	$.ajax({
		url : "cexWaitLsit",
		method : "get",
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			console.log(result);
			let str = '';
			$.each(result, function(i, v){
				str += `<tr>
							<td>
								\${v.trmCd}
							</td>
							<td>
								<a class='a_btn' href='javascript:void(0);' onclick='f_cex_register(\"\${v.trmCd}\",\"\${v.diseaseCd}\", \"\${v.paNo}\", \"\${v.paName}\");'>\${v.diseaseCd}</a>
							</td>
							<td>
								<a href='javascript:void(0)'; onclick='patientCexHistory(\${v.paNo})';'>\${v.paNo}</a>
							</td>
							<td>
								\${v.paName}
							</td>
							<td>
								\${v.icdName}
							</td>
						</tr>`
				
			})
			$("#cex-wait-tbody").html(str);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
})


$(function(){
	
	//환자 검색
	$("#Search").on("click", function(){
		let searchOption = $("#searchOption option:selected").val();
		let searchWord = $("#searchWord").val();

		if(searchWord == ''){
			swal('검색 실패!', "검색어를 입력해주세요", 'warning');
			return false;
		}
		
		let data = {
				searchOption:searchOption,
				searchWord:searchWord
		}

		$.ajax({
			url : "cexPatientSearch",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			dataType:"json",
			success : function(result) {
				let paNo = ''
				if(result == null || result.length == 0){
					//환자가 없을 때 
					swal('검색 실패!',"검색하신 환자 정보가 없습니다.",'error');
				}else if(result.length == 1){
					//환자가 한명일 때 
					$.each(result, function(i, v){
						paNo = `<a href='javascript:void(0);' onclick='patientCexHistory(\${v.paNo})';>\${v.paNo}</a>`
						$("#p_No").html(paNo);
						$("#p_Nm").html(v.paName);
						$("#p_reg1").html(v.paReg);
						$("#p_sex").html(v.paSex);	
					});
				}else{
//  					환자가 여러명일 때 해결해야 함

				}
			}
		});
		
		$("#searchWord").val("");
		
	})
});

// 해당 환자의 임상 결과 기록을 불러옴
function patientCexHistory(paNo){
	let data = {
			"paNo" : paNo
	}

	$.ajax({
		url : "patientCexHistory",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			console.log(result);
			let str = '';
			$.each(result, function(i, v){
				if(v.cexDate==null){
					v.cexDate = '';
				}
				str += '<tr>'
				str += '<td>'
				str += "<a href='javascript:void(0);' onclick='cexHistoryDetail(&#39"
				str += v.cexNo
				str += "&#39);'>"
				str += v.cexNo
				str += '</td>'
				str += '<td>'
				str += v.trmCd
				str += '</td>'
				str += '<td>'
				str += v.diseaseCd
				str += '</td>'
				str += '<td>'
				str += v.cexDate
				str += '</td>'
				str += '<td>'
				str += v.paName
				str += '</td>'
				str += '</tr>'
			})
			
			$("#cex-history-tbody").html(str);
			

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
}

function cexHistoryDetail(cexNo){
	let data = {
			"cexNo" : cexNo
	}
	
	$.ajax({
		url : "cexHistoryDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			console.log(result);
			
			$("#cex_no").html(result.cexNo);
			$("#p_name").html(result.paName);
			$("#cex_date").html(result.cexDate);
			$("#cex_cbc").html(result.cexCbc);
			$("#cex_ecg").html(result.cexEcg);
			$("#cex_pfts").html(result.cexPfts);
			$("#cex_ua").html(result.cexUa);
			$("#cex_ne").html(result.cexNe);
			
			let barcode = '';
			barcode += '<img src="'
			barcode += 'https://bwipjs-api.metafloor.com/?bcid=code128&text='
			barcode += 'paNo:'
			barcode += result.paNo
			barcode += '/cexNo:'
			barcode += result.cexNo
			barcode += '&scale=2&includetext&backgroundcolor=ffffff&padding=5'
			barcode += '" />'

			$("#barcode-print").html(barcode);
			
			// 바코드출력버튼 활성화
			$("#barcode-print-btn").attr("disabled", false); 
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

	/* 바코드 출력 시작*/
	var initBodyHtml;
	
	function printBarcode(){
		window.print();
	}
	
	function beforePrint(){
		initBodyHtml = document.body.innerHTML;
		document.body.innerHTML = document.getElementById('barcode-print').innerHTML;
	}
	
	function afterPrint(){
		document.body.innerHTML = initBodyHtml;
	}
	
	window.onbeforeprint = beforePrint;
	window.onafterprint = afterPrint;
	/* 바코드 출력 끝 */
	
</script>
<body>
	<div class="wrapper">
		<div class="left">
			<div class="wait-list">
				<div class="wait-list-in">
					<h4>대기자 목록</h4>
					<table class="cex-wait-table">
						<thead>
							<tr>
								<th>차트번호</th>
								<th>상병코드</th>
								<th>환자번호</th>
								<th>이름</th>
								<th>상병명</th>
							</tr>
						</thead>
						<tbody id="cex-wait-tbody">
						</tbody>
					</table>
				</div>
			</div>
			<div class="cex-history">
				<div class="cex-history-in">
					<h4>검사기록</h4>

					<table class="cex-history-table">
						<thead>
							<tr>
								<th>임상검사번호</th>
								<th>차트번호</th>
								<th>상병코드</th>
								<th>검사날짜</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody id="cex-history-tbody"></tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="patient-info">
				<div class="patient-info-in">
					<div class="patient-info-in-top">
						<h4 id="cex-title">환자 조회</h4>
						<form id="cex-search-form">
							<select id="searchOption" class="cex-select">
								<option value="no">환자번호</option>
								<option value="name">이름</option>
							</select> 
								<input style="display:none;" type="hidden" id="paNoHidden" value=""/>
							<input class="cex-input" id="searchWord" type="text" onkeyup="if(window.event.keyCode==13){patientSearch()}" value=""/>
							<input id="Search" class="btn-submit" type="button" value="검색">
						</form>
					</div>
					<table class="cex-table">
						<thead>
							<tr>
								<th>환자번호</th>
								<th>이름</th>
								<th>생년월일</th>
								<th>성별</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td id='p_No'></td>
								<td id='p_Nm'></td>
								<td id='p_reg1'></td>
								<td id='p_sex'></td>
								<td id='p_record'></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="cex-detail">
				<div class="cex-detail-in">
					<div class="cex-detail-top">
						<h4 id="cex-title">검사내역상세</h4>			
						<input style= "display : none;" class="btn-submit" id="cex-register" data-target="#layerpop" data-toggle="modal" type="button" value="검사등록">	
					</div>
						<table class="cex-table">
							<thead>
								<tr>
									<th>임상검사번호</th>
									<th>이름</th>
									<th>검사일시</th>
									<th>혈액</th>
									<th>심전도</th>
									<th>폐기능</th>
									<th>소변</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td id='cex_no'></td>
									<td id='p_name'></td>
									<td id='cex_date'></td>
									<td id='cex_cbc'></td>
									<td id='cex_ecg'></td>
									<td id='cex_pfts'></td>
									<td id='cex_ua'></td>
									<td id='cex_ne'></td>
								</tr>
							</tbody>
						</table>
				</div>
				
			</div>
			<div class="cex-barcode">
				<div class="cex-barcode-in">
					<div class="cex-barcode-top">
						<h4 id="cex-title"> 바코드 </h4>
						<input style= "float:right;" id="barcode-print-btn"class="btn-submit" type="button" value="바코드출력" onclick="return printBarcode();">	
					</div>
					<div id="barcode-print"></div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 모달 시작 -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- header title -->
        <h4 class="modal-title">검사등록</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      	<div class="form-group">
				    <label class="ward_title" for="paNo">환자번호</label>
				    <input type="text" name="paNo" id="paNo_modal" class="ward_input" readonly="readonly" />
				</div>
                <div class="form-group">
				    <label class="ward_title" for="paName">환자명</label>
				    <input type="text" name="paName" id="paName_modal" class="ward_input" readonly="readonly" />
				</div>
				<div class="form-group">
				    <label class="ward_title" for="trmCd">차트번호</label>
				    <input type="text" name="trmCd" id="trmCd_modal" readonly="readonly">
				</div>
				<div class="form-group">
				    <label class="ward_title" for="disCd">상병코드</label>
				    <input type="text" name="disCd" id="disCd_modal" readonly="readonly">
				</div>
                <div class="form-group">
				   	<label class="ward_title" for="empName">혈액</label>
				    <select id="cex_cbc_tf">
				    	<option value="T">적합</option>
				    	<option value="F">부적합</option>
				    </select>
				</div>
				<div class="form-group">
				    <label class="ward_title" for="pwIndt">심전도</label>
				    <select id="cex_ecg_tf">
				    	<option value="T">적합</option>
				    	<option value="F">부적합</option>
				    </select>
				</div>
                <div class="form-group">
				    <label class="ward_title" for="pwDays">폐기능</label>
				    <select id="cex_cbc_pfts">
				    	<option value="T">적합</option>
				    	<option value="F">부적합</option>
				    </select>
				</div>
                <div class="form-group">
				    <label class="ward_title" for="paTel">소변</label>
				   <select id="cex_cbc_ua">
				    	<option value="T">적합</option>
				    	<option value="F">부적합</option>
				    </select>
				</div>
                <div class="form-group">
				    <label class="ward_title" for="prMemo">비고</label>
				    <textarea class="ward_input" id="cex_ne"></textarea>
				</div>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" id="cexInsertBtn" class="btn-submit" data-dismiss="modal">저장</button>
        <button type="button" class="btn-submit" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
var btn_cex_register = $("#cex-register");

btn_cex_register.click(function(){ 
   	$('div.modal').modal();
})

function f_cex_register(trm_cd, dis_cd, pa_no, pa_name){
	// 검사등록 버튼 보이게
	btn_cex_register.attr("style", "display:block");
	btn_cex_register.attr("style", "float:right");
	
	$(".modal-body #trmCd_modal").val(trm_cd);
	$(".modal-body #disCd_modal").val(dis_cd);
	$(".modal-body #paNo_modal").val(pa_no);
	$(".modal-body #paName_modal").val(pa_name);
}

$(function(){
	
	//임상검사결과등록
	$("#cexInsertBtn").on("click", function(){
		let v_paNo = $("#paNo_modal").val();
		let v_paName = $("#paName_modal").val();
		let v_trmCd = $("#trmCd_modal").val();
		let v_disCd = $("#disCd_modal").val();
		let v_cex_cbc_tf = $("#cex_cbc_tf option:selected").val();
		let v_cex_ecg_tf = $("#cex_ecg_tf option:selected").val();
		let v_cex_cbc_pfts = $("#cex_cbc_pfts option:selected").val();
		let v_cex_cbc_ua = $("#cex_cbc_ua option:selected").val();
		let v_cex_ne = $("#cex_ne").text();
		
		let cexData = {
				paNo : v_paNo,
				paName : v_paName,
				trmCd : v_trmCd,
				diseaseCd : v_disCd,
				cexCbc : v_cex_cbc_tf,
				cexEcg : v_cex_ecg_tf,
				cexPfts : v_cex_cbc_pfts,
				cexUa : v_cex_cbc_ua,
				cexNe : v_cex_ne
		}
		
		$.ajax({
			url : "cexInsert",
			method : "post",
			data : JSON.stringify(cexData),
			contentType: "application/json;charset=utf-8",
			success : function(resp) {
				swal("등록완료","검사 등록이 완료되었습니다.", "success");
				/* 대기 리스트 다시 */
				$.ajax({
					url : "cexWaitLsit",
					method : "get",
					contentType: "application/json;charset=utf-8",
					dataType : "json",
					success : function(result) {
						console.log(result);
						let str = '';
						$.each(result, function(i, v){
							str += `<tr>
										<td>
											\${v.trmCd}
										</td>
										<td>
											<a id='a_disCd' href='javascript:void(0);' onclick='f_cex_register(\"\${v.trmCd}\",\"\${v.diseaseCd}\", \"\${v.paNo}\", \"\${v.paName}\");'>\${v.diseaseCd}</a>
										</td>
										<td>
											<a href='javascript:void(0)'; onclick='patientCexHistory(\${v.paNo})';'>\${v.paNo}</a>
										</td>
										<td>
											\${v.paName}
										</td>
										<td>
											\${v.icdName}
										</td>
									</tr>`
							
						})
						$("#cex-wait-tbody").html(str);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	})
})
</script>
<!-- 모달 끝 -->
</body>

