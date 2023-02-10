<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
*, ::after, ::before{
	box-sizing: content-box;
}

/* *{	border: 1px solid black;} */

html, body {
	height: 100%;
	overflow: hidden;
}

td{
	valign : middle;
}

.errMsg{
	color: red;
	float: right;
	margin: 0;
}

.ward-div{
	float:left;
	margin: 10px;
}
.ward-wrapper{
	height: 53.25rem;
}

.patient-info{
	width: 20rem;
	height: 50.5rem;
	display: flex;
}
.patient-manage {
	float:left;
	width: 50.5rem;
	height: 50.5rem;
	overflow: auto;
}
.ward-order-container {
	width: 41rem;
    height: 52rem;
}
.ward-order-item1{
	width: 41rem;
	height: 25rem;
	margin-top: 0;
	margin-left: 0;
}
.ward-order-item2{
	width: 41rem;
	height: 23rem;
	margin-top: 5px;
	margin-left: 0;
}

.ward_input{
	width: 19.5rem;
	height: 2rem;
	flex-direction: column; 
}

.ward_title{
	flex-direction: column; 
}

#prMemo{
	height: 15rem;
}

.tap_input{
	position: absolute;
    z-index: -1;
    width: 41rem;
    height: 23rem;
}

#nursingRecord_textarea{
	width: 35.5rem;
	height: 12rem;
}
#vital_textarea{
	width: 11.2rem;
}

#patient-manage-in{
	width: 49.5rem;
	height: 50rem;
	background-color: white;
	margin: 0.5rem;
}


#ward-order-top{
	display: flex;
	width: 41rem;
}

#ward-order-title{
	width: 34rem;
	height: 2rem;
}

#io-register{
	margin: 0;
	height: 2.5rem;
}

/*tab css*/
	.tab{ margin:10px; overflow:hidden;}
	.tabnav{font-size:0;}
	.tabnav li{display: inline-block; text-align:center; border-right:1px solid #ddd;}
	.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
	.tabnav li a.active:before{background:#4E73DF;}
	.tabnav li a.active{border-bottom:1px solid #fff;}
	.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 15px; line-height:46px; text-decoration:none; font-size:16px;}
	.tabnav li a:hover, .tabnav li a.active{background:#fff; color:#4E73DF; }
	.tabcontent{ width:800px; border-top:none; background:#fff;}
	.tabcontentWrap{padding: 0px;  height:265px; overflow-y:auto; overflow-x:auto;  border-top:none; background:#fff;}

</style>

<script>

/* 현재 입원중인 환자목록을 띄워줌 */
let wardPatientList = function(){
	$.ajax({
		url : "wardPatientList",
		method : "get",
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			let trTags = [];
            $.each(result, function(i, v){
               let aTag = $("<a>").html(v.hsptNo).attr({
            	   "href":'#',
            	   "class": "a_btn",
            	   "onclick": "wardPatientDetail("+v.hsptNo+")"
               });
               console.log(v);
               let trTag = $("<tr>")
                           .append(
                              $("<td>").html(aTag)      
                              , $("<td>").html(v.wrRno)      
                              , $("<td>").html(v.bedNo)      
                              , $("<td>").html(v.paName)      
                              , $("<td>").html(v.icdName)      
                           ).data("patient",v);
               trTags.push(trTag)
            });
            $("#wardPatientListBody").html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
wardPatientList();

/* 현재 입원중인 환자의 상세정보 출력  */
function wardPatientDetail(hsptNo){
	
	
	let data = {
			hsptNo : hsptNo
	}
	let today = new Date();
	let inDate = '';
	let input_paNo = $('.input_paNo');
	let input_paName = $('.input_paName');
	let input_hsptNo = $('.input_hsptNo');
	
	let v_paName = input_paName.val();
	
	nrec_list(hsptNo);
	vital_list(hsptNo);
	io_list(hsptNo, v_paName);
	
	$.ajax({
		url : "wardPatientDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			$('#hsptNo').val(result.hsptNo);
			$('#paNo').val(result.paNo);
			$('#paName').val(result.paName);
			$('#paReg').val(result.paReg);
			$('#empNm').val(result.empNm);
			$('#hsptInDt').val(result.hsptInDt);
			$('#paHp').val(result.paHp);
			$('#mediRecord').val(result.mediRecord);
			
			/* ***재원일수 계산*** */
			inDate = new Date(result.hsptInDt);
			const diff = today - inDate;
			const diffDay = Math.floor(diff/(1000*60*60*24));
			
			$('#pwDays').val(diffDay);
			
			input_paNo.val(result.paNo);
			input_paName.val(result.paName);
			input_hsptNo.val(result.hsptNo);
			
			// 에러메시지 초기화
			$(".errMsg").html("");
			
			// io 생성 모달창에 환자정보 넣어줌
			io_modal_click(result.hsptNo, result.paNo, result.paName);

		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 간호기록 입력  */
function nrec_insert(){
	let nrec_hsptNo = document.querySelector('#nursingRecord_hsptNo');
	let nrec_paNo = document.querySelector('#nursingRecord_paNo');
	let nrec_paName = document.querySelector('#nursingRecord_paName');
	let nrec_textarea = document.querySelector('#nursingRecord_textarea');
	
	let data = {
			hsptNo : nrec_hsptNo.value,
			paNo : nrec_paNo.value,
			nrecCont : nrec_textarea.value
	}
	if(!nrec_hsptNo.value || !nrec_paNo.value){
		swal("입력실패", "해당 환자의 입퇴원 번호를 클릭해주세요", 'warning')
	}else if(!nrec_textarea.value){
		swal("입력실패", "내용을 입력해주세요", 'warning')
	}else{
		$.ajax({
			url : "nrecInsert",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {
		        // 해당 환자의 간호기록 리스트 띄우기
		        nrec_list(nrec_hsptNo.value);
		        
				swal("입력성공", "간호기록이 등록되었습니다.", 'success')
				
				// 입력태그 값 초기화
// 				$("#nursingRecord_hsptNo").val("");
// 				$("#nursingRecord_paNo").val("");
// 		        $("#nursingRecord_paName").val("");
		        $("#nursingRecord_textarea").val("");
		        
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});	
	}
}
/* 바이탈 입력  */
function vital_insert(){
	let vital_hsptNo = document.querySelector('#vital_hsptNo');
	let vital_paNo = document.querySelector('#vital_paNo');
	let vital_paName = document.querySelector('#vital_paName');
	let vital_tmp = document.querySelector('#vital_tmp');
	let vital_pls = document.querySelector('#vital_pls');
	let vital_bp = document.querySelector('#vital_bp');
	let vital_rp = document.querySelector('#vital_rp');
	let vital_textarea = document.querySelector('#vital_textarea');
	
	let data = {
			hsptNo : vital_hsptNo.value,
			vtTmp : vital_tmp.value,
			vtPls : vital_pls.value,
			vtBp : vital_bp.value,
			vtRp : vital_rp.value,
			vtNe : vital_textarea.value
	}
	let check = true;
	let errorText = '';
	
	if(!vital_tmp.value){
		errorText = '체온을 입력해주세요.';
		check = false;
		$('#tmpError').html(errorText);
	}else if(isNaN(vital_tmp.value)){
		errorText = '숫자를 입력해주세요.';
		check = false;
		$('#tmpError').html(errorText);
	}else if(vital_tmp.value && !isNaN(vital_tmp.value)){
		$('#tmpError').html('');
	}
	
	if(!vital_pls.value){
		errorText = '맥박을 입력해주세요.';
		check = false;
		$('#plsError').html(errorText);
	}else if(isNaN(vital_pls.value)){
		errorText = '숫자를 입력해주세요.';
		check = false;
		$('#plsError').html(errorText);
	}else if(vital_pls.value && !isNaN(vital_pls.value)){
		$('#plsError').html('');
	}
	
	if(!vital_bp.value){
		errorText = '혈압을 입력해주세요.';
		check = false;
		$('#bpError').html(errorText);
	}else if(isNaN(vital_bp.value)){
		errorText = '숫자를 입력해주세요.';
		check = false;
		$('#bpError').html(errorText);
	}else if(vital_bp.value && !isNaN(vital_bp.value)){
		$('#bpError').html('');
	}
	
	if(!vital_rp.value){
		errorText = '호흡수 입력해주세요.';
		check = false;
		$('#rpError').html(errorText);
	}else if(isNaN(vital_rp.value)){
		errorText = '숫자를 입력해주세요.';
		check = false;
		$('#rpError').html(errorText);
	}else if(vital_rp.value && !isNaN(vital_rp.value)){
		$('#rpError').html('');
	}
	
	if(!vital_hsptNo.value){
	swal("입력실패", "해당 환자의 입퇴원 번호를 클릭해주세요", 'warning')		
	} else if(check){
		$.ajax({
			url : "vitalInsert",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {
				swal("입력성공","바이탈 입력이 성공했습니다.", "success");
				vital_list(hsptNo);
				
				$("#vital_tmp").val("");
				$("#vital_pls").val("");
				$("#vital_bp").val("");
				$("#vital_rp").val("");
				$("#vital_ne").val("");
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	
}

/* 간호기록 리스트 출력  */
function nrec_list(hsptNo){
	let data = {
			hsptNo : hsptNo
	}
	
	$.ajax({
		url : "nrecList",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			let trTags = [];
            $.each(result, function(i, v){
               let trTag = $("<tr>")
                           .append(
                              $("<td>").html(v.nrecNo)    
                              , $("<td>").html(v.empNm)        
                              , $("<td>").html(v.paName)     
                              , $("<td>").html(v.nrecCont)
                              , $("<td>").html(v.nrecDate)
                           );
               trTags.push(trTag)
            });
            $("#nrecTbody").html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 바이탈 리스트 출력 */
function vital_list(hsptNo){
	let data = {
			hsptNo : hsptNo
	}
	
	$.ajax({
		url : "vitalList",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			let trTags = [];
			let result_leng = result.length;
			let vitalList = result;
			if(result_leng==1){
				vitalList = result[0].vitalList;
			}
            $.each(vitalList, function(i, v){
               	let trTag = $("<tr>")
                           .append(
                              $("<td>").html(v.vtNo)    
                              , $("<td>").html(result[0].empNm)        
                              , $("<td>").html(result[0].paName)     
                              , $("<td>").html(v.vtTmp)
                              , $("<td>").html(v.vtPls)
                              , $("<td>").html(v.vtBp)
                              , $("<td>").html(v.vtRp)
                              , $("<td>").html(v.vtDate)
                              , $("<td>").html(v.vtNe)
                           );
               trTags.push(trTag)
            });
            $("#vitalTbody").html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
}

function io_list(hsptNo, paName){
	let data = {
			hsptNo : hsptNo
	}
	
	$.ajax({
		url : "ioList",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			console.log(result);
			let trTags = [];
            $.each(result, function(i, v){
               let trTag = $("<tr>")
                           .append(
                              $("<td>").html(v.hsptNo)    
                              , $("<td>").html(v.ioDate)        
                              , $("<td>").html(paName)     
                              , $("<td>").html()
                              , $("<td>").html()
                              , $("<td>").html()
                              , $("<td>").html()
                           );
               trTags.push(trTag)
            });
            $("#ioTbody").html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

</script>
<body>
	<div class="ward-wrapper">
		<div class="patient-info card ward-div">
			<h4>환자 정보</h4>
		    	<div class="form-group">
				    <label class="ward_title" for="hsptNo">입퇴원 번호</label>
				    <input type="text" name="hsptNo" id="hsptNo" class="ward_input" readonly="readonly" />
				</div>
		    	<div class="form-group">
				    <label class="ward_title" for="paNo">환자번호</label>
				    <input type="text" name="paNo" id="paNo" class="ward_input" readonly="readonly" />
				</div>
                <div class="form-group">
				    <label class="ward_title" for="paName">환자명</label>
				    <input type="text" name="paName" id="paName" class="ward_input" readonly="readonly" />
				</div>
				<div class="form-group">
				    <label class="ward_title" for="paReg">생년월일</label>
				    <input type="text" name="paReg" id="paReg" class="ward_input" readonly="readonly">
				</div>
                <div class="form-group">
				   	<label class="ward_title" for="empNm">담당의사</label>
				    <input type="text" name="empNm" id="empNm" class="ward_input" readonly="readonly" />
				</div>
				<div class="form-group">
				    <label class="ward_title" for="hsptInDt">입원일자</label>
				    <input type="text" name="hsptInDt" id="hsptInDt" class="ward_input" readonly="readonly" />
				</div>
                <div class="form-group">
				    <label class="ward_title" for="pwDays">재원일수</label>
				    <input type="text" class="ward_input" name="pwDays" id="pwDays" readonly="readonly" />
				</div>
                <div class="form-group">
				    <label class="ward_title" for="paHp">연락처</label>
				    <input type="text" name="paHp" id="paHp" class="ward_input" readonly="readonly" />
				</div>
                <div class="form-group">
				    <label class="ward_title" for="mediRecord">입원 메모</label>
				    <textarea class="ward_input" id="mediRecord" readonly="readonly"></textarea>
				</div>
		</div>
		<div class="patient-manage card ward-div">
			<h4>환자관리</h4>
			<div id="patient-manage-in">
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="table-primary">
							<th>입퇴원번호</th>
							<th>병실</th>
							<th>병상</th>
							<th>환자명</th>
							<th>상병</th>
						</tr>
					</thead>
					<tbody id='wardPatientListBody'>
					</tbody>
				</table>
			</div>
		</div>
		<div class="ward-order-container ward-div">
			<div class="ward-order-item1 card ward-div">
				<div id="ward-order-top">
					<h4 id='ward-order-title'>병동order</h4>
					<input style="display:none;" class="btn_blue" id="io-register" data-bs-target="#layerpop" type="button" value="IO생성">		
				</div>
				<div class="tab">
				    <ul class="tabnav">
				      <li><a href="#diet">식이</a></li>
				      <li><a href="#io">IO</a></li>
				      <li><a href="#vital">vital</a></li>
				      <li><a href="#nursingrecord">간호기록</a></li>			      
				    </ul>
				    <div class="tabcontentWrap">
					    <div class="tabcontent">
					      <div id="diet"></div>
					      <div id="io">
					      	<table class="table table-bordered table-hover">
					      		<thead>
					      			<tr class="table-primary">
					      				<th>입퇴원번호</th>
					      				<th>날짜</th>
					      				<th>환자명</th>
					      				<th>IO</th>
					      				<th>intake</th>
					      				<th>output</th>
					      				<th>상세</th>
					      		</thead>
					      		<tbody id='ioTbody'></tbody>
					      	</table>
					      </div>
					      <div id="vital">
					      	<table class="table table-bordered table-hover">
					      		<thead>
					      			<tr class="table-primary">
					      				<th>번호</th>
					      				<th>작성자</th>
					      				<th>환자명</th>
					      				<th>체온</th>
					      				<th>맥박</th>
					      				<th>혈압</th>
					      				<th>호흡수</th>
					      				<th>날짜</th>
					      				<th>비고</th>
					      			</tr>
					      		</thead>
					      		<tbody id='vitalTbody'></tbody>
					      	</table>
					      </div>
					      <div id="nursingrecord">
					      	<table class="table table-bordered table-hover">
					      		<thead>
					      			<tr class="table-primary">
					      				<th>번호</th>
					      				<th>작성자</th>
					      				<th>환자명</th>
					      				<th>내용</th>
					      				<th>날짜</th>
					      			</tr>
					      		</thead>
					      		<tbody id='nrecTbody'></tbody>
					      	</table>
					      </div>
					    </div>
					</div>
				  </div>	
			</div>
			<div class="ward-order-item2 card ward-div">
				<div class="tap_input" id="diet-in">
					<h4>식이</h4>
				</div>
				<div class="tap_input" id="io-in">
					<h4>IO 입력</h4>
					<table>
						<tr>
							<td>입퇴원번호</td>
							<td>
								<input style="float:left" class="input_hsptNo" id="io_hsptNo" type="text" value="" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>환자번호</td>
							<td><input style="float:left" class="input_paNo" id="io_paNo" type="text" value="" readonly="readonly"></td>
						</tr>
						<tr>
							<td>환자명</td>
							<td>
								<input style="float:left" class="input_paName" id="io_paName" type="text" value="" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>날짜</td>
						</tr>
						<tr>
							<td>항목</td>
						</tr>
						<tr>
							<td>항목상세</td>
						</tr>
						<tr>
							<td>용량</td>
							<td>
								<input style="float:left" id="io_capa" type="text" value="" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>비고</td>
							<td><textarea id="io_textarea"></textarea></td>
						</tr>
						<tr>
							<td><input class="btn_blue" id="vital-register" type="button" value="등록" onclick="vital_insert()"></td>
						</tr>
					</table>
				</div>
				<div class="tap_input" id="vital-in">
					<h4>vital 입력</h4>
					<table>
						<tr>
							<td>입퇴원번호</td>
							<td>
								<input style="float:left" class="input_hsptNo" id="vital_hsptNo" type="text" value="" readonly="readonly">
							</td>
						</tr>
						<tr>
							<td>환자번호</td>
							<td><input style="float:left" class="input_paNo" id="vital_paNo" type="text" value="" readonly="readonly"></td>
						</tr>
						<tr>
							<td>환자명</td>
							<td><input style="float:left" class="input_paName" id="vital_paName" type="text" value="" readonly="readonly"></td>
						</tr>
						<tr>
							<td>체온</td>
							<td>
								<input style="float:left" id="vital_tmp" class="check" type="text" value="">
								<p class='errMsg' id='tmpError'></p>
							</td>
						</tr>
						<tr>
							<td>맥박</td>
							<td>
								<input style="float:left" id="vital_pls" class="check" type="text" value="">
								<p class='errMsg' id='plsError'></p>
							</td>
						</tr>
						<tr>
							<td>혈압</td>
							<td>
								<input style="float:left" id="vital_bp" class="check" type="text" value="">
								<p class='errMsg' id='bpError'></p>
							</td>
						</tr>
						<tr>
							<td>호흡수</td>
							<td>
								<input style="float:left" id="vital_rp" class="check" type="text" value="">
								<p class='errMsg' id='rpError'></p>
							</td>
						</tr>
						<tr>
							<td>비고</td>
							<td><textarea id="vital_textarea"></textarea></td>
						</tr>
					</table>
					<input class="btn_blue" id="vital-register" type="button" value="등록" onclick="vital_insert()">
				</div>
				<div class="tap_input" id="nursingRecord-in">
					<div id="nursingRecord-in-top">
						<h4>간호기록입력</h4>
					</div>
					<table>
						<tr>
							<td>입퇴원번호</td>
							<td><input style="float:left" class="input_hsptNo" id="nursingRecord_hsptNo" type="text" value="" readonly="readonly"></td>
						</tr>
						<tr>
							<td>환자번호</td>
							<td><input style="float:left" class="input_paNo" id="nursingRecord_paNo" type="text" value="" readonly="readonly"></td>
						</tr>
						<tr>
							<td>환자명</td>
							<td><input style="float:left" class="input_paName" id="nursingRecord_paName" type="text" value="" readonly="readonly"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea id="nursingRecord_textarea"></textarea></td>
						</tr>
					</table>
					<input class="btn_blue" id="nursingRecord-register" type="button" value="등록" onclick="nrec_insert()">
				</div>
			</div>			
		</div>
	</div>
	
<!-- **************************모달 시작********************************* -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- header title -->
        <h4 class="modal-title">IO생성</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
			<div class="form-group">
			    <label class="ward_title" for="hsptNo">입퇴원번호</label>
			    <input type="text" name="hsptNo" id="hsptNo_modal" readonly="readonly">
			</div>
			<div class="form-group">
			    <label class="ward_title" for="paNo">환자번호</label>
			    <input type="text" name="paNo" id="paNo_modal"  readonly="readonly" />
			</div>
			<div class="form-group">
			    <label class="ward_title" for="paName">환자명</label>
			    <input type="text" name="paName" id="paName_modal"  readonly="readonly" />
			</div>
			<div class="form-group">
			    <label class="ward_title" for="ioDate">날짜</label>
			    <input type="date" name="ioDate" id="ioDate_modal" onchange="ioDateChange()"/>
			    <p class='errMsg' id='ioDateError'></p>
			</div>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" id="ioModalBtn" class="btn_blue" onclick="insertIo()">생성</button>
        <button type="button" class="btn_blue" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- *******************모달 끝************************* -->	
	
</body>

<script>
/* 모달 */
$("#io-register").click(function(){
	let hsptNo_modal = $('#hsptNo_modal');
	if(!hsptNo_modal.val()){
		swal("생성실패","먼저 입퇴원번호를 클릭해 주세요!", "warning");
	} else{
		$("#io-register").attr("data-bs-toggle","modal");
	}
})

/* 입퇴원 번호 클릭시 해당 정보를 모달창에 입력해 줌 */
function io_modal_click(hsptNo, paNo, paName){
	let hsptNo_modal = $('#hsptNo_modal');
	
	hsptNo_modal.val(hsptNo);
	$('#paNo_modal').val(paNo);
	$('#paName_modal').val(paName);
		
}

/* 날짜 입력하면 에러메시지 제거 */
function ioDateChange(){
	let ioDate = $('#ioDate_modal');
	if(ioDate.val()){
		$('#ioDateError').html('');
	}
}

function insertIo(){
	let ioModalBtn = document.querySelector('#ioModalBtn');
	let hsptNo_modal = document.querySelector('#hsptNo_modal');
	let ioDate_modal = document.querySelector('#ioDate_modal');
	
	/* 날짜를 입력 안하면 모달이 안 닫히게 */
	if(!ioDate_modal.value){
		$('#ioDateError').html('날짜를 선택해 주세요');
	}else{
		let data = {
			ioDate : ioDate_modal.value,
			hsptNo : hsptNo_modal.value
		}
		/* 이게 적용되야 모달이 닫힘 */
		ioModalBtn.setAttribute("data-bs-dismiss", "modal");
		/*  io중복검사   */
		$.ajax({
			url : "ioDuplicateCheck",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) {
				if(result == 1){
					swal("생성실패","해당 날짜에 이미 등록된 IO가 있습니다.","error");
				} else{
					/* io생성하기  */
					$.ajax({
						url : "ioCreate",
						method : "post",
						data : JSON.stringify(data),
						contentType: "application/json;charset=utf-8",
						dataType : "json",
						success : function(result) {
							if(result==1){
								swal("생성완료","io생성이 완료되었습니다.", "success")
							}else{
								swal("생성실패","io생성이 실패했습니다.", "error")
							}
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
					
					
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
}


	/* tab 메뉴 */
$(function(){
	$('.tabcontent > div').hide();
	$('.tabnav a').click(function () {
	  $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	  $('.tabnav a').removeClass('active');
	  $(this).addClass('active');
	  
	  let hash = this.hash;
	  inputTapChange(hash);
	  
	  return false;
	}).filter(':eq(0)').click();
});
	/* tab 누르면 입력란이 바뀜 */
function inputTapChange(hash){
	let diet_in = $('#diet-in');
	let io_in = $('#io-in');
	let vital_in = $('#vital-in');
	let nursingRecord_in = $('#nursingRecord-in');
	let io_register = $('#io-register');
	
	const z_index_style_1 = {
			style : "z-index: -1"
	}
	const z_index_style_100 = {
			style : "z-index: 100"
	}
	
	diet_in.attr(z_index_style_1);
	io_in.attr(z_index_style_1);
	vital_in.attr(z_index_style_1);
	nursingRecord_in.attr(z_index_style_1);
	
	switch (hash) {
	case '#diet':
		diet_in.attr(z_index_style_100);
		io_register.attr("style","display:none")
		break;
	case '#io':
		io_in.attr(z_index_style_100);
		io_register.attr("style","display:block")
		break;
	case '#vital':
		vital_in.attr(z_index_style_100);
		io_register.attr("style","display:none")
		break;
	case '#nursingrecord':
		nursingRecord_in.attr(z_index_style_100);
		io_register.attr("style","display:none")
		break;

	default:
		break;
	}
}

</script>















