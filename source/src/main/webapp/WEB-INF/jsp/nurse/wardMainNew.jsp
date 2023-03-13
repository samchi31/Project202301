<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<title>병동관리</title>

<style>
#diet,#io,#vital,#nursingrecord{
	width: 26rem;
	height: 37rem;
}

.errMsg{
	color: red;
	float: right;
	margin: 0;
}

#searchWord{
	width:8rem;
}

/* 부트스트랩 폰트사이즈 일괄수정 */
.form-control:disabled {
    font-size: 12px;}
.form-select {
	font-size: 12px;
}
.col-sm-9 {
	font-size: 12px;
}
.form-control {
	font-size: 12px;
}
.writeFormCss {
	position: absolute;
    left: 6%;
    width: 96%;
}

.leftBtn{
	position:absolute; 
	left:71.8%;
}
/* 스크롤러 */
.patientScroller{width: 27.1rem;height: 36.6rem;}
.symScroller{width: 14.4rem;height: 5.8rem;}
.dietScroller{width: 26.9rem;height: 11.2rem;}
.ioScroller{width: 26.9rem;height: 13rem;}
.vitalScroller{width: 26.9rem;height: 7.6rem;}
.nrecScroller{width: 26.9rem;height: 20.3rem;}
</style>

<!-- 그리드 스택  -->
<div class="grid-stack">
   
  <div class="grid-stack-item " gs-w="3" gs-h="5" gs-x="0" gs-y="0">
	<div class="grid-stack-item-content ">
		<div>
			<h4 class="h4-title1">환자관리</h4>
			<p class="pTag">현재 본원에 입원중인 환자목록<br>클릭시 환자상세정보를 볼 수 있습니다.</p>
			<hr/>
			<form id="serarchButton" class="search-form" name="searchForm">
               <select id="searchOption" class="cex-select">
                  <option value="">선택</option>
                  <option value="paName">환자명</option>
                  <option value="paReg">생년월일</option>
               </select> 
               <input name="searchBtn" class="cex-input" id="searchWord" type="text" value="">
               <input class="btn-submit" id="Search" type="button" value="검색">
               <input class="btn-submit" id="SearchInit" type="button" value="초기화">
			   <input style="display:none;" type="hidden" id="paNoHidden" value=""/>
            </form>
			<div id="patient-manage-in" class="scroller patientScroller">
				<table class="table-blue scrollshover">
					<thead class="fixedHeader">
						<tr>
							<th>환자명</th>
							<th>생년월일</th>
							<th>병실</th>
							<th>병상</th>
						</tr>
					</thead>
					<tbody id='wardPatientListBody'>
					</tbody>
				</table>
			</div>	
		</div>
	</div>
  </div> 
  <div class="grid-stack-item " gs-w="2" gs-h="5" gs-x="3" gs-y="0">
	<div class="grid-stack-item-content ">
	<h4 class="h4-title1">환자 정보</h4>
	<p class="pTag">환자관리 테이블에서 대상 환자를 클릭하면 <br>해당환자의 상세정보를 확인할 수 있습니다.</p>
	<hr>
	<div>
		<form id="writeForm" name="writeForm">
			<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">환자명</label>
				<div class="col-sm-9">
					<input type="text" class="form-control writeChartCd " name="info_paName" id="info_paName" readonly="readonly" disabled>
					<input type="hidden" class="form-control writeChartCd " name="info_hsptNo" id="info_hsptNo" readonly="readonly"  >
				</div>
			</div>
			<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">생년월일</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"  id="info_paReg" readonly="readonly" disabled>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">연락처</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="info_paHp" readonly="readonly" disabled>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">담당의</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"  id="info_empNm" readonly="readonly" disabled>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">입원일자</label>
				<div class="col-sm-9"> 
					<input type="text" class="form-control"  id="info_inDt" readonly="readonly" disabled>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">재원일수</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="info_pwDays" readonly="readonly" disabled>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">비고</label>
				<div class="col-sm-9">
					<textarea class="form-control" id="info-mediRecord" style="height: 81px;" readonly="readonly" disabled></textarea>  
				</div>
			</div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">증상</label>
			    <div class="col-sm-10 scroller symScroller">
			      <table class= "table-blue scrollshover" >
			      	<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
			      	<thead class="fixedHeader">
			      		<tr>
			      			<th>증상코드</th>
			      			<th>증상내용</th>
			      		</tr>
			      	</thead>
			      	<tbody id="symTbody"></tbody>
			      </table>
			    </div>
		    </div>
			<div class="mb-3 row">
				<label for="inputPassword" class="col-sm-2 col-form-label">진단</label>
			    <div class="col-sm-10 scroller symScroller">
			      <table class= "table-blue scrollshover">
			      	<colgroup>
						<col width="30%">
						<col width="70%">
					</colgroup>
			      	<thead class="fixedHeader">
			      		<tr>
			      			<th>상병코드</th>
			      			<th>상병명</th>
			      		</tr>
			      	</thead>
			      	<tbody id="diagnosisTbody"></tbody>
			      </table>
			    </div>
		    </div>
		</form>
	</div>	
	</div>
  </div> 
  <div class="grid-stack-item " gs-w="3" gs-h="5" gs-x="5" gs-y="0">
	<div class="grid-stack-item-content ">
	<h4 class="h4-title1">병동ORDER</h4>
	<input style="display:none;" class="btn_blue btn_blue2" id="io-creater"  data-bs-target="#layerpop" type="button" value="IO생성">
	<p class="pTag">환자관리에서 선택한 환자에 해당하는 기록들이 조회됩니다.</p>
	<hr>
	<div class="tab">
	    <ul class="tabnav">
	      <li><a href="#diet">식이</a></li>
	      <li><a href="#io">IO</a></li>
	      <li><a href="#vital">vital</a></li>
	      <li><a href="#nursingrecord">간호기록</a></li>			      
	    </ul>
	    <div class="tabcontentWrap">
		    <div class="tabcontent">
		      <div id="diet">
		      	<div class="scroller dietScroller">
					<table class="table-blue scrollshover">
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="40%">
						</colgroup>
						<thead class="fixedHeader">
							<tr>
								<th>날짜</th>
								<th>시간</th>
								<th>항목명</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody id='dietTbody'></tbody>
					</table>
		      	</div>
				<hr>
				<h4 class="h4-title1">식이입력</h4>
				<p class="pTag">환자관리에서 대상 환자를 선택할 수 있습니다.</p>
				<hr>
				<form id="writeForm" name="writeForm" class="writeFormCss">
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">환자명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control writeChartCd input_paName" name="diet_paName" id="diet_paName" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">항목</label>
						<div class="col-sm-9">
							<select id="diet_cate" class="form-select" aria-label="Default select example">
							  <option value="choice">선택</option>
								<c:forEach items="${dietCateList}" var="dietCate">
									<option value="${dietCate.dietCateCd}">${dietCate.dietCateNm}</option>
								</c:forEach>
							</select>
							<p class='errMsg' id='dietCateError'></p>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">날짜</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="diet_date">
							<p class='errMsg' id='dietDateError'></p>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">시간</label>
						<div class="col-sm-9">
							<select id="diet_time" class="form-select" aria-label="Default select example"></select>
							<p class='errMsg' id='dietTimeError'></p>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">비고</label>
						<div class="col-sm-9">
							<textarea class="form-control" id="diet_ne"></textarea>
						</div>
					</div>
					<input class="btn_blue leftBtn" id="diet-register" type="button" value="등록" onclick="diet_insert()">
				</form>
		      </div>
		      <div id="io">
		      	<div class="scroller ioScroller">
			      	<table class="table-blue scrollshover">
			      		<thead class="fixedHeader">
			      			<tr>
			      				<th>날짜</th>
			      				<th>IO</th>
			      				<th>intake</th>
			      				<th>output</th>
			      		</thead>
			      		<tbody id='ioTbody'></tbody>
			      	</table>
		      	</div>
		      	<hr>
				<h4 class="h4-title1">IO입력</h4>
				<p class="pTag">우측 상단의 IO생성 버튼을 클릭해 입력 날짜를 생성할 수 있습니다.</p>
				<hr>
				<form id="writeForm" name="writeForm" class="writeFormCss">
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">환자명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control writeChartCd input_paName" name="io_paNo" id="io_paNo" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">날짜</label>
						<div class="col-sm-9">
							<select id="ioDateSelect" class="form-select" aria-label="Default select example">
								  <option value="choice">선택</option>
							</select>
							<p class='errMsg' id='ioDateSelectError'></p>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">항목</label>
						<div class="col-sm-9">
							<select id="ioCateSelect" class="form-select" onchange="f_ioselectDetail(this.value)">
							  <option value="choice">선택</option>
							  <option value="intake">Intake</option>
							  <option value="output">Output</option>
							</select>
							<p class='errMsg' id='ioCateError'></p>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">항목상세</label>
						<div class="col-sm-9">
							<select id="ioSelectDetail" class="form-select">
							  <option value="choice">선택</option>
							</select>
							<p class='errMsg' id='ioDetailError'></p>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">용량</label>
						<div class="col-sm-9">
							<input type="number" class="form-control" id="io_capa">
						</div>
					</div>
					
<!-- 					<div class="mb-2 row"> -->
<!-- 						<label for="wardDocument-input" class="col-sm-2 col-form-label">비고</label> -->
<!-- 						<div class="col-sm-9"> -->
<!-- 							<textarea class="form-control" id="io_textarea"></textarea> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<input class="btn_blue leftBtn" id="io-register" type="button" value="등록" onclick="io_detail_insert()">
				</form>
		      </div>
		      <div id="vital">
		      	<div class="scroller vitalScroller">
			      	<table class="table-blue scrollshover">
			      		<colgroup>
							<col width="30%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="30%">
						</colgroup>
						
			      		<thead class="fixedHeader">
			      			<tr>
			      				<th>날짜</th>
			      				<th>체온</th>
			      				<th>맥박</th>
			      				<th>혈압</th>
			      				<th>호흡수</th>
			      				<th>비고</th>
			      			</tr>
			      		</thead>
			      		<tbody id='vitalTbody'></tbody>
			      	</table>
		      	</div>
		      	<hr>
				<h4 class="h4-title1">VITAL입력</h4>
				<p class="pTag">환자관리에서 대상 환자를 선택할 수 있습니다.</p>
				<hr>
				<form id="writeForm" name="writeForm" class="writeFormCss">
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">환자명</label>
						<div style="width: 349px;" class="col-sm-9">
							<input type="text" class="form-control writeChartCd input_paName" name="vital_paName" id="vital_paName" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">체온</label>
						<div style="width: 349px;" class="input-group col-sm-4">
							<input type="number" class="form-control" id="vital_tmp">
							<p class='errMsg' id='tmpError'></p>
							<span class="input-group-text" id="basic-addon2">℃</span>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">맥박</label>
						<div style="width: 349px;" class="input-group col-sm-9">
							<input type="number" class="form-control" id="vital_pls">
							<p class='errMsg' id='plsError'></p>
							<span class="input-group-text" id="basic-addon2">회(분)</span>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">혈압</label>
						<div style="width: 349px;" class="input-group col-sm-9">
							<input type="number" class="form-control" id="vital_bp">
							<p class='errMsg' id='bpError'></p>
							<span class="input-group-text" id="basic-addon2">mmHg</span>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">호흡수</label>
						<div style="width: 349px;" class="input-group col-sm-9">
							<input type="number" class="form-control" id="vital_rp">
							<p class='errMsg' id='rpError'></p>
							<span class="input-group-text" id="basic-addon2">회(분)</span>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">비고</label>
						<div style="width: 349px;" class="col-sm-9">
							<textarea class="form-control" id="vital_textarea"></textarea>
						</div>
					</div>
				<input class="btn_blue leftBtn" id="vital-register" type="button" value="등록" onclick="vital_insert()">
				</form>
		      </div>
		      <div id="nursingrecord">
		      	<div class="scroller nrecScroller">
			      	<table class="table-blue scrollshover">
			      		<colgroup>
							<col width="80%">
							<col width="20%">
						</colgroup>
			      		<thead class="fixedHeader">
			      			<tr>
			      				<th>내용</th>
			      				<th>날짜</th>
			      			</tr>
			      		</thead>
			      		<tbody id='nrecTbody'></tbody>
			      	</table>
		      	</div>
		      	<hr>
				<h4 class="h4-title1">간호기록입력</h4>
				<p class="pTag">환자관리에서 대상 환자를 선택할 수 있습니다.</p>
				<hr>
		      	<form id="writeForm" name="writeForm" class="writeFormCss">
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">환자명</label>
						<div class="col-sm-9">
							<input type="text" class="form-control writeChartCd input_paName" name="nursingRecord_paName" id="nursingRecord_paName" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-2 row">
						<label for="wardDocument-input" class="col-sm-2 col-form-label">내용</label>
						<div class="col-sm-9">
							<textarea class="form-control" id="nursingRecord_textarea"></textarea>
						</div>
					</div>
					<input class="btn_blue leftBtn" id="nursingRecord-register" type="button" value="등록" onclick="nrec_insert()">
				</form>
		      </div>
		    </div>
		</div>
	  </div>
	</div>
  </div> 
  <div class="grid-stack-item " gs-w="4" gs-h="5" gs-x="8" gs-y="0">
	<div class="grid-stack-item-content ">
	<h4 class="h4-title1">병동관리</h4>
	<p class="pTag">입원환자들의 위치를 확인할 수 있다.<br>환자명 클릭시 환자 세부정보 및 order기능을 사용할 수 있다.</p>
	<hr>
	
	<h6>101호 (2인실)</h6>
	<table class="table-blue">
		<thead>
			<tr>
				<th>1번병상</th>
				<th>2번병상</th>
			</tr>
		</thead>
		<tbody class="wardTBody">
			<tr>
				<td class="ward_td" id="w101_1"></td>
				<td class="ward_td" id="w101_2"></td>
			</tr>
		</tbody>
	</table>
	<h6>102호 (2인실)</h6>
	<table class="table-blue">
		<thead>
			<tr>
				<th>1번병상</th>
				<th>2번병상</th>
			</tr>
		</thead>
		<tbody class="wardTBody">
			<tr>
				<td class="ward_td" id="w102_1"></td>
				<td class="ward_td" id="w102_2"></td>
			</tr>
		</tbody>
	</table>
	<h6>103호 (4인실)</h6>
	<table class="table-blue">
		<thead >
			<tr>
				<th>1번병상</th>
				<th>2번병상</th>
				<th>3번병상</th>
				<th>4번병상</th>
			</tr>
		</thead>
		<tbody class="wardTBody">
			<tr>
				<td class="ward_td" id="w103_1"></td>
				<td class="ward_td" id="w103_2"></td>
				<td class="ward_td" id="w103_3"></td>
				<td class="ward_td" id="w103_4"></td>
			</tr>
		</tbody>
	</table>
	<h6>104호 (4인실)</h6>
	<table class="table-blue">
		<thead>
			<tr>
				<th>1번병상</th>
				<th>2번병상</th>
				<th>3번병상</th>
				<th>4번병상</th>
			</tr>
		</thead>
		<tbody class="wardTBody">
			<tr>
				<td class="ward_td" id="w104_1"></td>
				<td class="ward_td" id="w104_2"></td>
				<td class="ward_td" id="w104_3"></td>
				<td class="ward_td" id="w104_4"></td>
			</tr>
		</tbody>
	</table>
	<h6>105호 (6인실)</h6>
	<table class="table-blue">
		<thead>
			<tr>
				<th>1번병상</th>
				<th>2번병상</th>
				<th>3번병상</th>
				<th>4번병상</th>
				<th>5번병상</th>
				<th>6번병상</th>
			</tr>
		</thead>
		<tbody class="wardTBody">
			<tr>
				<td class="ward_td" id="w105_1"></td>
				<td class="ward_td" id="w105_2"></td>
				<td class="ward_td" id="w105_3"></td>
				<td class="ward_td" id="w105_4"></td>
				<td class="ward_td" id="w105_5"></td>
				<td class="ward_td" id="w105_6"></td>
			</tr>
		</tbody>
	</table>
	<h6>106호 (6인실)</h6>
	<table class="table-blue">
		<thead>
			<tr>
				<th>1번병상</th>
				<th>2번병상</th>
				<th>3번병상</th>
				<th>4번병상</th>
				<th>5번병상</th>
				<th>6번병상</th>
			</tr>
		</thead>
		<tbody class="wardTBody">
			<tr>
				<td class="ward_td" id="w106_1"></td>
				<td class="ward_td" id="w106_2"></td>
				<td class="ward_td" id="w106_3"></td>
				<td class="ward_td" id="w106_4"></td>
				<td class="ward_td" id="w106_5"></td>
				<td class="ward_td" id="w106_6"></td>
			</tr>
		</tbody>
	</table>
	
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
        <h4 class="modal-title h4-title1" >IO생성</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      		<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">환자명</label>
				<div class="col-sm-9">
					<input type="text" class="form-control writeChartCd " name="paName_modal" id="paName_modal" readonly="readonly" disabled>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">생년월일</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"  id="paReg_modal" readonly="readonly" disabled>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="wardDocument-input" class="col-sm-3 col-form-label">대상일자</label>
				<div class="col-sm-9">
					<input type="date" class="form-control" id="ioDate_modal" onchange="ioDateChange()"/>
					<p class='errMsg' id='ioDateError'></p>
				</div>
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

<script>
GridStack.init();

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

/* io버튼 보였다 안보였다 */
function inputTapChange(hash){
	
	let io_creater = $('#io-creater');
	
	switch (hash) {
	case '#diet':
		io_creater.attr("style","display:none")
		break;
	case '#io':
		io_creater.attr("style","display:block; float:right;")
		break;
	case '#vital':
		io_creater.attr("style","display:none")
		break;
	case '#nursingrecord':
		io_creater.attr("style","display:none")
		break;

	default:
		break;
	}
}

/* 현재 입원중인 환자목록을 띄워줌 */
let wardPatientList = function(){
	$.ajax({
		url : "wardPaList",
		method : "get",
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			let trTags = [];
            $.each(result, function(i, v){
               let trTag = $("<tr>").attr({"class":"ward_tr", "id":v.hsptNo})
                           .append(
                               $("<td>").html(v.paName).data({
							                            	   "hsptNo":v.hsptNo
							                            	   , "trmCd":v.trmCd
							                            	   , "wrRno":v.wrRno
							                            	   , "bedNo":v.bedNo
                               								})      
							  ,	$("<td>").html(v.paReg)      
                              , $("<td>").html(v.wrRno)      
                              , $("<td>").html(v.bedNo)      
                           );
               trTags.push(trTag);
               let str = `w\${v.wrRno}_\${v.bedNo}`;
               $('#'+str).html(v.paName).data({"hsptNo":v.hsptNo, "trmCd":v.trmCd});
               
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

/* 환자관리 테이블 클릭이벤트 */
$('#wardPatientListBody').on('click','tr',function(event){
	let v_tr = $(this);
	let v_hsptNo = v_tr.children().eq(0).data("hsptNo");
	let v_trmCd = v_tr.children().eq(0).data("trmCd");
	let v_wrRno = v_tr.children().eq(0).data("wrRno");
	let v_bedNo = v_tr.children().eq(0).data("bedNo");
	
	$('#info_hsptNo').val(v_hsptNo);
	
	/* 누른 tr 색변경 */
	let $tr = $(this);
	$tr.siblings('tr').removeClass("dblclick-on");
	rcpNo = $tr.data("rcpNo");
	$tr.addClass("dblclick-on");
	
	/* 병동관리 색 변경*/
	$('.ward_td').removeClass("dblclick-on");
	let wardStr = `w\${v_wrRno}_\${v_bedNo}`;
	$('#'+wardStr).addClass("dblclick-on");

	/* 환자정보 입력 */
	let today = new Date();
	let inDate = '';
	
	let data = {
		hsptNo: v_hsptNo
	}
	$.ajax({
		url : "wardPatientDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			$('#info_paName').val(result.paName);
			$('#info_paReg').val(result.paReg);
			$('#info_paHp').val(result.paHp);
			$('#info_empNm').val(result.empNm);
			$('#info_inDt').val(result.hsptInDt);
			$('#info-mediRecord').val(result.mediRecord);
			
			/* ***재원일수 계산*** */
			inDate = new Date(result.hsptInDt);
			const diff = today - inDate;
			const diffDay = Math.floor(diff/(1000*60*60*24));
			
			$('#info_pwDays').val(diffDay+1);
			
			/* 환자명 입력 */
			$('.input_paName').val(result.paName);
			
			/* 증상테이블 출력 */
			symptomList(v_trmCd);
			/* 진단테이블 출력 */
			diagnosisList(v_trmCd);
			/* 식이리스트 출력 */
			diet_list(v_hsptNo);
			/* io리스트 출력 */
			io_list(v_hsptNo);
			/* io생성 모달창에 정보 전송 */
			$('#paName_modal').val(result.paName).data("hsptNo",v_hsptNo);
			$('#paReg_modal').val(result.paReg);
			/* vital리스트 출력 */
			vital_list(v_hsptNo);
			/* 간호기록 리스트 출력 */
			nrec_list(v_hsptNo);
			
							
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
});

/* 병동관리 테이블 클릭 이벤트 */
$('.wardTBody').on('click','td',function(event){
	let v_td = $(this);
	let v_hsptNo = v_td.data("hsptNo");
	let v_trmCd = v_td.data("trmCd");

	/* 누른 td 색변경 */
	let $td = $(this);
	$('.ward_td').removeClass("dblclick-on");
	rcpNo = $td.data("rcpNo");
	$td.addClass("dblclick-on");
	
	/* 환자관리 tr 색변경 */
	$('.ward_tr').removeClass("dblclick-on");
	$('#'+v_hsptNo).addClass("dblclick-on");
	
	/* 환자정보 입력 */
	let today = new Date();
	let inDate = '';
	
	let data = {
		hsptNo: v_hsptNo
	}
	$.ajax({
		url : "wardPatientDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			$('#info_paName').val(result.paName);
			$('#info_paReg').val(result.paReg);
			$('#info_paHp').val(result.paHp);
			$('#info_empNm').val(result.empNm);
			$('#info_inDt').val(result.hsptInDt);
			$('#info-mediRecord').val(result.mediRecord);
			
			/* ***재원일수 계산*** */
			inDate = new Date(result.hsptInDt);
			const diff = today - inDate;
			const diffDay = Math.floor(diff/(1000*60*60*24));
			
			$('#info_pwDays').val(diffDay);
			
			/* 환자명 입력 */
			$('.input_paName').val(result.paName);
			
			/* 증상테이블 출력 */
			symptomList(v_trmCd);
			/* 진단테이블 출력 */
			diagnosisList(v_trmCd);
			/* 식이리스트 출력 */
			diet_list(v_hsptNo);
			/* io리스트 출력 */
			io_list(v_hsptNo);
			/* io생성 모달창에 정보 전송 */
			$('#paName_modal').val(result.paName).data("hsptNo",v_hsptNo);
			$('#paReg_modal').val(result.paReg);
			/* vital리스트 출력 */
			vital_list(v_hsptNo);
			/* 간호기록 리스트 출력 */
			nrec_list(v_hsptNo);
								
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
});

/* 증상 리스트 출력 */
function symptomList(trmCd){
	let data = { trmCd : trmCd };
	
	$.ajax({
		url : "symptomList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let trTags = [];
			let trTag = '';
			$.each(result, function(i,v){
				trTag = $('<tr>').append(
							$('<td>').html(v.symCd)							
							, $('<td>').html(v.symDetail).attr("title",v.symDetail)							
						)
				trTags.push(trTag);
			})
			$('#symTbody').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 진단 리스트 출력 */
function diagnosisList(trmCd){
	let data = { trmCd : trmCd };
	
	$.ajax({
		url : "diagnosisList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let trTags = [];
			let trTag = '';
			$.each(result, function(i,v){
				console.log(v)
				trTag = $('<tr>').append(
							$('<td>').html(v.diseaseCd)							
							, $('<td>').html(v.icdName).attr("title",v.icdName)					
						)
				trTags.push(trTag);
			})
			$('#diagnosisTbody').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 환자검색 */
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
		url : "wardPatientSearch",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType:"json",
		success : function(result) {
			if(result == null || result.length == 0){
				//환자가 없을 때 
				swal('검색 실패!',"검색하신 환자 정보가 없습니다.",'error');
			}else{
				let trTags=[];
				let trTag = '';
				$.each(result,function(i,v){
					console.log(v)
					trTag = $('<tr>').append(
								$("<td>").html(v.paName).data({
						                         	   "hsptNo":v.hsptNo
						                         	   , "trmCd":v.trmCd
						                         	   , "wrRno":v.wrRno
						                         	   , "bedNo":v.bedNo
														})      
								, $('<td>').html(v.paReg)
								, $('<td>').html(v.wrRno)
								, $('<td>').html(v.bedNo)
								)
					trTags.push(trTag);
				})
				$('#wardPatientListBody').html(trTags);
			}
		}
	});
	
	$("#searchWord").val("");
	
});

/* 초기화버튼클릭이벤트 */
$('#SearchInit').on('click',function(){
	wardPatientList();
});

/* 식이 입력 */
function diet_insert(){
	let diet_hsptNo = document.querySelector('#info_hsptNo');
	let diet_paName = document.querySelector('#diet_paName');
	let diet_date = document.getElementById('diet_date');
	let diet_time = document.getElementById('diet_time');
	let diet_cate = document.getElementById('diet_cate');
	let diet_ne = document.getElementById('diet_ne');
	
	let v_diet_hsptNo = diet_hsptNo.value;
	let v_diet_paName = diet_paName.value;
	let v_diet_date = diet_date.value;
	let v_diet_time = diet_time.options[diet_time.selectedIndex].value;
	let v_diet_cate = diet_cate.options[diet_cate.selectedIndex].value;
	let v_diet_ne = diet_ne.value;
	
	let data = {
		hsptNo : v_diet_hsptNo,
		dietCateCd : v_diet_cate,
		dietDate : v_diet_date,
		dietTime : v_diet_time,
		dietNe : v_diet_ne
	}
	
	let check = true;
	let errorText = '';
	
	if(!v_diet_date){
		errorText = '날짜를 선택해주세요.';
		check = false;
		$('#dietDateError').html(errorText);
	} else if(v_diet_date){
		$('#dietDateError').html('');
	}
	
	if(v_diet_cate=="choice"){
		errorText = '항목을 선택해주세요.';
		check = false;
		$('#dietCateError').html(errorText);
	} else if(v_diet_cate!="choice"){
		$('#dietCateError').html('');
	}
	
	if(!v_diet_hsptNo){
		swal("입력실패", "대상 환자를 선택해주세요", 'warning')		
		} else if(check){
			$.ajax({
				url : "dietInsert",
				method : "post",
				data : JSON.stringify(data),
				contentType: "application/json;charset=utf-8",
				beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
		    	},
				dataType : "json",
				success : function(result) {
					if(result == 1){
						swal("입력성공","식이 입력이 성공했습니다.", "success");
						/* input창 초기화 */
						$("#diet_date").val('');
						$("#diet_cate").val('');
						$("#diet_time").val("09").prop("selected",true);
						$("#diet_ne").val('');
						/* 식이리스트 출력 */
						diet_list(v_diet_hsptNo);
						
					}else{
						swal("입력실패","식이 입력이 실패했습니다.", "error");
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

/* 식이입력 시간 셀렉트 추가 */
$(function(){
	var strHours = '';
	var time = '';
	 
	for(var i = 0 ; i < 24; i++){
	    if(i == 9){
	        time = '0'+i;
	        strHours += '<option value="'+time+'" selected>'+time+'시</option>';
	    }else if( i < 10){
	        time = '0'+ i;
	        strHours += '<option value="'+time+'">'+time+'시</option>';
	    }else{
	        time = i;
	        strHours += '<option value="'+time+'">'+time+'시</option>';
	    }
	}
	 
	 $("#diet_time").html(strHours);
})

/* 식이리스트 출력 */
function diet_list(hsptNo){
	let data = {
			hsptNo : hsptNo
	}
	
	$.ajax({
		url : "dietList",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let trtags = [];
			let ret = result[0];
			if(result.length<1){
				$("#dietTbody").html('');
			}else{
				$.each(ret.dietList, function(i,v){
					let trtag = $("<tr>").append(
									$("<td>").html(v.dietDate)
									, $("<td>").html(v.dietTime + "시")
									, $("<td>").html(v.dietCateNm)
									, $("<td>").html(v.dietNe).attr("title",v.dietNe)
								);
					trtags.push(trtag);	
				});
				$("#dietTbody").html(trtags);				
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* io 리스트 출력 */
function io_list(hsptNo){
	let data = {
			hsptNo : hsptNo
	}
	
	$.ajax({
		url : "ioList",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let trTags = [];
			let optionTags = [];
			let optionTag = $("<option>").attr("value","choice").append('선택');
			optionTags.push(optionTag);
			
			let intakeCapa;
			let outputCapa;
			let io;
            
			$.each(result, function(i, v){
				intakeCapa = 0;
				outputCapa = 0;
				$.each(v.intakeList, function(j, intake){
            		if(intake.intakeCapa){
            			intakeCapa += parseInt(intake.intakeCapa);
            		}					
				});
				$.each(v.outputList, function(k, output){
            		if(output.outputCapa){
            			outputCapa += parseInt(output.outputCapa);
            		}					
				});
				io = intakeCapa-outputCapa;
				if(io<0){
					io=`<span style="color:red; font-weight:bold;">\${intakeCapa-outputCapa}</span>`;
				}
				let trTag = $("<tr>")
                           .append(
                              $("<td>").html(v.ioDate)        
                              , $("<td>").html(io)
                              , $("<td>").html(intakeCapa)
                              , $("<td>").html(outputCapa)
                           );
				
               trTags.push(trTag);
               
               optionTag = $("<option>").append(v.ioDate);
               optionTags.push(optionTag);
            });
            $("#ioTbody").html(trTags);
            $("#ioDateSelect").html(optionTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 모달 */
$("#io-creater").click(function(){
	let paName_modal = $('#paName_modal');
	if(!paName_modal.val()){
		swal("생성실패","대상 환자를 선택해주세요!", "warning");
	} else{
		$("#io-creater").attr("data-bs-toggle","modal");
	}
})

/* 입퇴원 번호 클릭시 해당 정보를 모달창에 입력해 줌 */
function io_modal_click(hsptNo, paNo, paName){
	let hsptNo_modal = $('#hsptNo_modal');
	
	hsptNo_modal.val(hsptNo);
	$('#paNo_modal').val(paNo);
	$('#paName_modal').val(paName);	
}

/* 대상일자 입력하면 모달창 에러메시지 제거 */
function ioDateChange(){
	let ioDate = $('#ioDate_modal');
	if(ioDate.val()){
		/* 대상일자를 입력해야 모달이 닫힘 */
		document.querySelector('#ioModalBtn').setAttribute("data-bs-dismiss", "modal");
		$('#ioDateError').html('');
	}
}

/* 항목선택하면 그에 맞는 항목상세 옵션을 만들어줌 */
function f_ioselectDetail(val){
	let optionTag = '';
	let ioSelectDetail = $('#ioSelectDetail');
	if(val=='intake'){
		<c:forEach items="${intakeList}" var="intake">
			optionTag += "<option value=\"${intake.intakeCateCd}\">${intake.intakeCateNm}</option>";
		</c:forEach>
		
	}else if(val=='output'){
		<c:forEach items="${outputList}" var="output">
			optionTag += "<option value=\"${output.outputCateCd}\">${output.outputCateNm}</option>";
		</c:forEach>
	}
	
	ioSelectDetail.html(optionTag);
}
/* io입력 */
function io_detail_insert(){
	let io_Date = document.getElementById('ioDateSelect');
	let io_CateSelect = document.getElementById('ioCateSelect');
	let io_select_detail = document.getElementById('ioSelectDetail');
	let io_capa = document.getElementById('io_capa');
	
	let v_io_hsptNo = $('#paName_modal').data("hsptNo");
	let v_io_Date = io_Date.options[io_Date.selectedIndex].value;
	let v_io_CateSelect = io_CateSelect.options[io_CateSelect.selectedIndex].value;
	let v_io_select_detail = io_select_detail.options[io_select_detail.selectedIndex].value;
	let v_io_capa = io_capa.value;
	
	let data = {};
	
	let check = true;
	let errorText = '';
	
	/* IO입력값 유효성 검사 */
	if(v_io_Date=='choice'){
		errorText = '날짜를 선택해주세요.';
		check = false;
		$('#ioDateSelectError').html(errorText);
	}else if(v_io_Date!=='choice'){
		$('#ioDateSelectError').html('');
	}
	
	if(v_io_CateSelect=='choice'){
		errorText = '항목을 선택해주세요.';
		check = false;
		$('#ioCateError').html(errorText);
	}else if(v_io_CateSelect!=='choice'){
		$('#ioCateError').html('');
	}
	
	if(!v_io_capa){
		errorText = '용량을 입력해주세요.';
		check = false;
		$('#ioCapaError').html(errorText);
	}else if(isNaN(v_io_capa)){
		errorText = '숫자를 입력해주세요.';
		check = false;
		$('#ioCapaError').html(errorText);
	}else if(v_io_capa && !isNaN(v_io_capa)){
		$('#ioCapaError').html('');
	}
	
	
	if(!v_io_hsptNo){
		swal("입력실패", "해당 환자의 입퇴원 번호를 클릭해주세요", 'warning')
	} else if(check && v_io_CateSelect == 'intake'){
		data = {
				hsptNo : v_io_hsptNo,
				ioDate : v_io_Date,
				intakeCateCd : v_io_select_detail,
				intakeCapa : v_io_capa,
		}
		
		$.ajax({
			url : "intakeCreate",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			dataType : "json",
			success : function(result) {
				if(result == 1){
					swal("입력성공","Intake 입력이 성공했습니다.", "success");
					/* io리스트 다시 띄우기  */
					io_list(v_io_hsptNo);
					/* input창 초기화 */
					$("#ioCateSelect").val("choice").prop("selected", true);
					$('#ioSelectDetail').html('');
					$('#ioSelectDetail').append($('<option>').attr("value","choice").html('선택'));
					io_capa.value = '';
					io_textarea.value =''; 
				}else{
					swal("입력실패","Intake 입력이 실패했습니다.", "error");
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	} else if(check && v_io_CateSelect == 'output'){
		data = {
				hsptNo : v_io_hsptNo,
				ioDate : v_io_Date,
				outputCateCd : v_io_select_detail,
				outputCapa : v_io_capa,
		}
		
		$.ajax({
			url : "outputCreate",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			dataType : "json",
			success : function(result) {
				if(result == 1){
					swal("입력성공","output 입력이 성공했습니다.", "success");
					/* io리스트 다시 띄우기  */
					io_list(v_io_hsptNo);
					/* input창 초기화 */
					$("#ioCateSelect").val("choice").prop("selected", true);
					$('#ioSelectDetail').html('');
					io_capa.value = '';
					io_textarea.value =''; 
				}else{
					swal("입력실패","output 입력이 실패했습니다.", "error");
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

/* io생성버튼클릭 */
function insertIo(){
	let ioModalBtn = document.querySelector('#ioModalBtn');
	let paName_modal = document.querySelector('#paName_modal');
	let ioDate_modal = document.querySelector('#ioDate_modal');
	
	let v_hsptNo_modal = $('#paName_modal').data("hsptNo");
	let v_paName_modal = paName_modal.value;
	let v_ioDate_modal = ioDate_modal.value;
		
	if(!ioDate_modal.value){
		$('#ioDateError').html('날짜를 선택해 주세요');
	}else{
		let data = {
			ioDate : v_ioDate_modal,
			hsptNo : v_hsptNo_modal
		}
		/*  io중복검사   */
		$.ajax({
			url : "ioDuplicateCheck",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
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
						beforeSend: function(xhr) {
				            xhr.setRequestHeader(header, token);
				    	},
						dataType : "json",
						success : function(result) {
							if(result==1){
								swal("생성완료","io생성이 완료되었습니다.", "success")
								/* 생성된 io를 반영하기 위해 리스트 다시 띄우기 */
								io_list(v_hsptNo_modal, v_paName_modal)
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
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let trTags = [];
			let result_leng = result.length;
			let vitalList = result;
			if(result_leng==1){
				vitalList = result[0].vitalList;
			}
            $.each(vitalList, function(i, v){
            	let v_tmp = v.vtTmp;
            	let v_pls = v.vtPls;
            	let v_bp = v.vtBp;
            	let v_rp = v.vtRp;
            	
            	/* 체온경고 */
            	if(v_tmp>38 ){
            		v_tmp = `<span style="color:red; font-weight:bold;">\${v.vtTmp}</span>`
            	} else if(v_tmp<35){
            		v_tmp = `<span style="color:blue; font-weight:bold;">\${v.vtTmp}</span>`
            	}
            	
            	/* 맥박경고 */
            	if(v_pls>100){
            		v_pls = `<span style="color:red; font-weight:bold;">\${v.vtPls}</span>`
            	}else if(v_pls<60){
            		v_pls = `<span style="color:blue; font-weight:bold;">\${v.vtPls}</span>`
            	}
            	
            	/* 혈압경고 */
            	if(v_bp>120){
            		v_bp = `<span style="color:red; font-weight:bold;">\${v.vtBp}</span>`
            	}else if(v_bp<80){
            		v_bp = `<span style="color:blue; font-weight:bold;">\${v.vtBp}</span>`
            	}
            	/* 호흡수 경고*/
            	if(v_rp>20){
            		v_rp = `<span style="color:red; font-weight:bold;">\${v.vtRp}</span>`
            	} else if(v_rp<12){
            		v_rp = `<span style="color:blue; font-weight:bold;">\${v.vtRp}</span>`
            	}
            	
               	let trTag = $("<tr>")
                           .append(
                              $("<td>").html(v.vtDate)
                              , $("<td>").html(v_tmp)
                              , $("<td>").html(v_pls)
                              , $("<td>").html(v_bp)
                              , $("<td>").html(v_rp)
                              , $("<td>").html(v.vtNe).attr("title",v.vtNe)
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

/* 바이탈 입력  */
function vital_insert(){
	let vital_hsptNo = $('#paName_modal').data("hsptNo");
	let vital_tmp = document.querySelector('#vital_tmp');
	let vital_pls = document.querySelector('#vital_pls');
	let vital_bp = document.querySelector('#vital_bp');
	let vital_rp = document.querySelector('#vital_rp');
	let vital_textarea = document.querySelector('#vital_textarea');
	
	let data = {
			hsptNo : vital_hsptNo,
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
	
	if(!vital_hsptNo){ 
	swal("입력실패", "해당 환자의 입퇴원 번호를 클릭해주세요", 'warning')		
	} else if(check){
		$.ajax({
			url : "vitalInsert",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			dataType : "json",
			success : function(result) {
				swal("입력성공","바이탈 입력이 성공했습니다.", "success");
				/* 바이탈 리스트 재출력 */
				vital_list(vital_hsptNo);
				
				$("#vital_tmp").val("");
				$("#vital_pls").val("");
				$("#vital_bp").val("");
				$("#vital_rp").val("");
				$("#vital_textarea").val("");
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
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let trTags = [];
            $.each(result, function(i, v){
               let trTag = $("<tr>")
                           .append(
                              $("<td>").html(v.nrecCont)
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

/* 간호기록 입력  */
function nrec_insert(){
	let nrec_hsptNo = $('#paName_modal').data("hsptNo");
	let nrec_paName = document.querySelector('#nursingRecord_paName');
	let nrec_textarea = document.querySelector('#nursingRecord_textarea');
	
	let data = {
			hsptNo : nrec_hsptNo,
			nrecCont : nrec_textarea.value
	}
	if(!nrec_hsptNo){
		swal("입력실패", "해당 환자의 입퇴원 번호를 클릭해주세요", 'warning')
	}else if(!nrec_textarea.value){
		swal("입력실패", "내용을 입력해주세요", 'warning')
	}else{
		$.ajax({
			url : "nrecInsert",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			dataType : "json",
			success : function(result) {
		        // 해당 환자의 간호기록 리스트 띄우기
		        nrec_list(nrec_hsptNo);
		        
				swal("입력성공", "간호기록이 등록되었습니다.", 'success')
				
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
</script>