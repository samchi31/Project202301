<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>수술/검사</title>
<style>
html, body {height: 100%; overflow: hidden;}
.oper-card{margin: 0.5rem;}
.oper-wrapper { height: 51.5rem; display: flex;}
.content-left {width: 31rem; height: 51.3rem;}
.content-center {width: 31rem; height: 51.3rem;}
.content-right1 {width: 57.5rem; height: 51.3rem;}
.oper-pa-list {width: 30rem; height: 14rem;}
.oper-pa-detail {width: 30rem; height: 36rem;}
.cex-list {width: 30rem; height: 14rem;}
.cex-barcode {width: 30rem; height: 14rem;}
.cex-input {width: 30rem; height: 21.5rem;}
.tabcontentWrap{overflow: auto;}
.a_btn_oper{background-color: white; color: #ff3333; padding: 5px 20px; text-align: center; text-decoration: none; border: none;}
.a_btn_oper:hover{background-color: #ff3333; color: white;}
#barcodeImg{width: 24rem; padding-left: 1.5rem; margin: 1.3rem;}
.cex-input-table{width: 25rem; height: 17rem; margin-left: 2rem;}
.td-center{text-align:center;}
#cex-input-cexNo{color: #4E73DF; font-weight:bold;}
.cex_input{position: absolute; z-index: -1; width: 29rem; height: 14rem;}
.oper_input{position: absolute; z-index: -1; width: 28.5rem; height: 34.5rem;}
#cex-detail-table{width:20rem;}
#serarchButton{padding-bottom: 15px; padding-top: 15px; padding-right: 19px;}
#searchButton{padding-bottom: 15px; padding-top: 15px; padding-right: 19px;}
.operCalendarCard{width:56.5rem; height: 50.4rem;}
.operCalendar{width: 54.5rem ; height: 46rem;}
.cexHistoryScroller {height: 91px;}
.operScheduleScroller{width: 28rem; height: 9.4rem;}
.operCompleteScroller{width: 28rem; height: 9.4rem;}
.operWaitScroller{width: 28rem; height: 9.4rem;}
.cexScroller{width:28rem; height: 9.4rem;}
#barcode-print-btn{display:none; margin-right: 1rem;}

/* popover */
.popoverTitleCalendar {width: 100%; height: 100%; padding: 15px 15px; font-size: 13px; border-radius: 5px 5px 0 0; color:white;}
.popoverInfoCalendar i {font-size: 14px; margin-right: 10px; line-height: inherit; color: #d3d4da;}
.popoverInfoCalendar p {margin-bottom: 1px;}
.popoverDescCalendar {margin-top: 12px; padding-top: 12px; border-top: 1px solid #E3E3E3; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical;}
.popover-header{padding: 0;}
.popover-title {background: transparent; font-weight: 600; padding: 0 !important; border: none;}
.popover-content {padding: 15px 15px; font-size: 13px;}
.popover {background: #fff !important; color: #2E2F34; border: none;margin-bottom: 10px;}

/*popover header*/
.popover-title {background: #F7F7FC; font-weight: 600; padding: 15px 15px 11px; border: none;}

/*popover arrows*/
.popover.top .arrow:after {border-top-color: #fff;}
.popover.right .arrow:after {border-right-color: #fff;}
.popover.bottom .arrow:after {border-bottom-color: #fff;}
.popover.left .arrow:after {border-left-color: #fff;}
.popover.bottom .arrow:after {border-bottom-color: #fff;}

i {box-sizing: border-box ; padding : 5px; font-size : 1rem; float:right;}

#operTolltip{position: fixed; top: 90px; left: 449px;}
#barcodePrintTolltip{position: fixed; top: 319px; left: 678px;}
#calendarTolltip{position: fixed; top: 90px; left: 1863px;}

/* 부트스트랩 폰트사이즈 일괄수정 */
.form-control {
	font-size: 12px;
}
</style>

<div class="oper-wrapper">
	<!-- 왼쪽구역시작 -->
	<div class="content-left">
		<div class="oper-pa-list oper-card card-grid">
			<i class="bi bi-info-circle" id="operTolltip" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="(1)수술대기: 수술오더를 받은 환자리스트 (2)수술예정: 수술이 예약되어 있는 환자리스트 (3)수술완료: 수술이 종료된 환자 리스트" ></i>
			<div class="tab patient-tab">
			    <ul class="tabnav">
			      <li><a href="#operWait">수술대기</a></li>
			      <li><a href="#operSchedule">수술예정</a></li>
			      <li><a href="#operComplete">수술완료</a></li>
			      <li><a href="#operHistory">수술기록조회</a></li>
			    </ul>
			    <div class="tabcontentWrap tab-bigger">
				    <div class="tabcontent">
				      <div id="operWait">
				      	<div class="scroller operWaitScroller">
					      	<table class="table-blue scrollshover">
								<thead class="fixedHeader">
									<tr>
										<th>차트코드</th>
										<th>상병코드</th>
										<th>환자번호</th>
										<th>환자명</th>
										<th>검사여부</th>
								</thead>
								<tbody id='operWaitTbody'></tbody>
							</table>
						</div>
				      </div>
				      <div id="operSchedule">
				      	<div class="scroller operScheduleScroller">
					      	<table class="table-blue scrollshover">
								<thead class="fixedHeader">
									<tr>
										<th>수술번호</th>
										<th>환자명</th>
										<th>생년월일</th>
										<th>수술예정일</th>
								</thead>
								<tbody id='operScheduleTbody'></tbody>
							</table>
						</div>
				      </div>
				      <div id="operComplete">
					      <div class="scroller operCompleteScroller">
						      	<table class="table-blue scrollshover">
									<thead class="fixedHeader">
										<tr>
											<th>수술번호</th>
											<th>환자명</th>
											<th>생년월일</th>
											<th>수술완료일</th>
									</thead>
									<tbody id='operCompleteTbody'></tbody>
								</table>
							</div>
				      </div>
				      <div id="operHistory">
					  	<form id="searchButton" class="search-form" name="searchForm">
			               <select id="operSearchOption" class="oper-select">
			                  <option value="no">환자 번호</option>
			                  <option value="name">환자 이름</option>
			               </select> 
			               <input name="searchBtn" class="cex-input" id="opserSearchWord" type="text" value="">
			               <input class="btn-submit" id="SearchOperation" type="button" value="검색">
			            </form>
			            <div class="scroller cexHistoryScroller"> 
				            <table class="table-blue scrollshover">
					      		<thead class="fixedHeadr">
					      			<tr>
					      				<th>수술번호</th>
										<th>환자명</th>
										<th>생년월일</th>
										<th>수술완료일</th>
					      			</tr>
					      		</thead>
					      		<tbody id="operHistoryTbody"></tbody>
					      	</table>
					    </div>
				      </div>
				    </div>
				</div>
			</div>	
		</div>
		<div class="oper-pa-detail oper-card card-grid">
			<div class="oper_input" id='tab-oper-paDetail'>
				<h4 class="h4-title1">진단상세</h4>
				 <div class="mb-3 row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">차트코드</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-pa-detail-trmCd" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">상병코드</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-pa-detail-diseaseCd" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">상병명</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-pa-detail-icdName" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">진단의</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-pa-detail-empNm" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">환자번호</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-pa-detail-paNo" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">환자명</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-pa-detail-paName" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">의무기록</label>
				    <div class="col-sm-10">
				      <textarea class="form-control" id="oper-pa-detail-mediRecord" readonly="readonly" disabled style="height: 90px;"></textarea>  
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputPassword" class="col-sm-2 col-form-label">증상내역</label>
				    <div class="col-sm-10">
				      <table class= "table-blue">
				      	<thead class="fixedHeader">
				      		<tr>
				      			<th>차트코드</th>
				      			<th>증상코드</th>
				      			<th>증상내용</th>
				      		</tr>
				      	</thead>
				      	<tbody id = "symTbody"></tbody>
				      </table>
				    </div>
				 </div>
			</div>
			<div class="oper_input" id='tab-oper-datail'>
				<h4 class="h4-title1">수술상세</h4>	
				<div class="mb-3 row">
				    <label for="inputOperationDetail" class="col-sm-2 col-form-label">환자명</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-detail-paName" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputOperationDetail" class="col-sm-2 col-form-label">생년월일</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-detail-paReg" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputOperationDetail" class="col-sm-2 col-form-label">수술명</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-detail-operNm" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputOperationDetail" class="col-sm-2 col-form-label">담당의</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-detail-empNm" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputOperationDetail" class="col-sm-2 col-form-label">시작일시</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-detail-startTime" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputOperationDetail" class="col-sm-2 col-form-label">경과시간</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-detail-elapseTime" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputOperationDetail" class="col-sm-2 col-form-label">종료일시</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="oper-detail-endTime" readonly="readonly" disabled>
				    </div>
				 </div>
				 <div class="mb-3 row">
				    <label for="inputOperationDetail" class="col-sm-2 col-form-label">수술기록</label>
				    <div class="col-sm-10">
				      <textarea class="form-control" id="oper-detail-operationRecord" style="height: 107px;"></textarea>  
				    </div>
				 </div>
				 <button style="float:right;" type="button" id="operationEnd" class="btn_blue">수술종료</button>	
				 <button style="float:right;" type="button" id="operationStart" class="btn_red">수술시작</button>	
			</div>
		</div>
	</div>
	<!-- 왼쪽구역끝-->
	
	<!-- 가운데 구역 시작 -->
	<div class="content-center">
		<div class="cex-list oper-card card-grid">
			<div class="tab cex-tab">
			    <ul class="tabnav">
			      <li><a href="#cexWait">검사대기</a></li>
			      <li><a href="#cexComplete">검사완료</a></li>
			      <li><a href="#cexHistory">검사기록조회</a></li>
			    </ul>
			    <div class="tabcontentWrap">
				    <div class="tabcontent">
				      <div id="cexWait">
				      	<div class="scroller cexScroller">
					      	<table class="table-blue scrollshover">
								<thead class="fixedHeader">
									<tr>
										<th>검사코드</th>
										<th>차트코드</th>
										<th>상병코드</th>
										<th>환자번호</th>
										<th>환자명</th>
										<th>성별</th>
										<th>생년월일</th>
									</tr>
								</thead>
								<tbody id='cexWaitTbody'></tbody>
							</table>
				      	</div>
				      </div>
				      <div id="cexComplete">
				      	<div class="scroller cexScroller">
					      	<table class="table-blue scrollshover">
					      		<thead class="fixedHeadr">
					      			<tr>
					      				<th>검사코드</th>
										<th>차트코드</th>
										<th>상병코드</th>
										<th>환자번호</th>
										<th>환자명</th>
										<th>성별</th>
										<th>생년월일</th>
					      			</tr>
					      		</thead>
					      		<tbody id="cexCompleteTbody"></tbody>
					      	</table>
				      	</div>
				      </div>
				      <div id="cexHistory">
				      	<form id="serarchButton" class="search-form" name="searchForm">
			               <select id="searchOption" class="cex-select">
			                  <option value="no">환자 번호</option>
			                  <option value="name">환자 이름</option>
			               </select> 
			               <input name="searchBtn" class="cex-input" id="searchWord" type="text" value="">
			               <input class="btn-submit" id="Search" type="button" value="검색">
						   <input style="display:none;" type="hidden" id="paNoHidden" value=""/>
			            </form>
			            <div class="scroller cexScroller"> 
				            <table class="table-blue scrollshover">
					      		<thead class="fixedHeadr">
					      			<tr>
					      				<th>검사코드</th>
										<th>차트코드</th>
										<th>상병코드</th>
										<th>환자번호</th>
										<th>환자명</th>
										<th>성별</th>
										<th>생년월일</th>
					      			</tr>
					      		</thead>
					      		<tbody id="cexHistoryTbody"></tbody>
					      	</table>
					    </div>
				      </div>
				    </div>
				</div>
			</div>	
		</div>
		<div class="cex-barcode oper-card card-grid">
			<div class="cex_input" id="tab-cex-barcode">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="cexBarcode" id="cexBarcode1" value="cexCbc" checked>
				  <label class="form-check-label" for="inlineRadio1">혈액검사</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="cexBarcode" id="cexBarcode2" value="cecUa">
				  <label class="form-check-label" for="inlineRadio2">소변검사</label>
				</div>
				<input id="barcode-print-btn"class="btn_blue" type="button" value="바코드출력" onclick="return printBarcode();">
				<i class="bi bi-info-circle" id="barcodePrintTolltip" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="상단의 검사대기 테이블에서 대상 환자를 클릭하면 해당 환자의 검사용 바코드가 표시된다. 바코드가 변경되지 않을시 해당 환자를 다시 클릭한다." ></i>	
				<div id="barcode-print"></div>
			</div>
			<div class="cex_input" id="tab-cex-detail">
				<h4 class="h4-title1">검사결과상세</h4>
				<table id="cex-detail-table">
					<tr>
						<th>검사코드</th>
						<td><input type="text" class="form-control-plaintext" id="cex-detail-cexNo" readonly="readonly" disabled></td>
					</tr>
					<tr>
						<th>환자번호</th>
						<td><input type="text" class="form-control-plaintext" id="cex-detail-paNo" readonly="readonly" disabled></td>
					</tr>
					<tr>
						<th>환자명</th>
						<td><input type="text" class="form-control-plaintext" id="cex-detail-paName" readonly="readonly" disabled></td>
					</tr>
				</table>
				<table style="width:28.2rem;" class="table-blue">
					<colgroup>
						<col width="30%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="30%">
					</colgroup>
					<thead class="fixedHeadr">
						<tr>
							<th>검사날짜</th>
							<th>혈액</th>
							<th>심전도</th>
							<th>소변</th>
							<th>폐기능</th>
							<th>비고</th>
						</tr>
					</thead>
					<tbody id="cexDetailTbody"></tbody>
				</table>
			</div>
		</div>
		<div class="cex-input oper-card card-grid">
			<h4 class="h4-title1">검사등록</h4>
			<table class="cex-input-table">
				<tr>
					<td>검사코드</td>
					<td colspan="2"><input type="text" class="form-control" id="cex-input-cexNo" readonly="readonly" disabled></td>
				</tr>
				<tr>
					<td>혈액검사</td>
					<td class="td-center">
						<div class="form-check form-check-inline">
						    <input class="form-check-input" type="radio" name="cexCbcRadio" id="cexCbcRadio1" value="T" checked>
						    <label class="form-check-label" for="inlineRadio1">수술 적합</label>
						</div>
					</td>
					<td class="td-center">
						<div class="form-check form-check-inline">
					        <input class="form-check-input" type="radio" name="cexCbcRadio" id="cexCbcRadio2" value="F">
					        <label class="form-check-label" for="inlineRadio2">수술 부적합</label>
					    </div>
					</td>
				</tr>
				<tr>
					<td>심전도검사</td>
					<td class="td-center">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="cexEcgRadio" id="cexEcgRadio1" value="T" checked>
							<label class="form-check-label" for="inlineRadio1">수술 적합</label>
						</div>
			    	</td>
			    	<td class="td-center">
			    		<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="cexEcgRadio" id="cexEcgRadio2" value="F">
							<label class="form-check-label" for="inlineRadio2">수술 부적합</label>
						</div>
			    	</td>
				</tr>
				<tr>
					<td >소변검사</td>
					<td class="td-center">
						<div class="form-check form-check-inline">
						    <input class="form-check-input" type="radio" name="cexUaRadio" id="cexUaRadio1" value="T" checked>
						    <label class="form-check-label" for="inlineRadio1">수술 적합</label>
						</div>
					</td>
					<td class="td-center">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="cexUaRadio" id="cexUaRadio2" value="F">
							<label class="form-check-label" for="inlineRadio2">수술 부적합</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>폐기능검사</td>
					<td class="td-center">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="cexPftsRadio" id="cexPftsRadio1" value="T" checked>
							<label class="form-check-label" for="inlineRadio1">수술 적합</label>
						</div>
					<td class="td-center">
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="cexPftsRadio" id="cexPftsRadio2" value="F">
							<label class="form-check-label" for="inlineRadio2">수술 부적합</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>비고</td>
					<td colspan="2"><textarea class="form-control" id="cexNetextarea"></textarea></td>
				</tr>
				<tr>
					<td colspan="3"><input style="float:right;" id="cex-input-btn" class="btn_blue" type="button" value="검사등록"></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 가운데 구역 끝 -->
	
	<!-- 오른쪽 구역1 시작 -->
	<div class="content-right1">
		<div class="operCalendarCard oper-card card-grid">
			<h4 class="h4-title1">수술일정</h4>
			<div class="operCalendar" id='calendar' data-source="${pageContext.request.contextPath}/nurse/operationMain/events">
				<i class="bi bi-info-circle" id="calendarTolltip" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="수술예약방법 (1)왼쪽의 수술대기 테이블에서 대상 환자를 클릭한다. (2)해당 날짜를 클릭한 뒤 원하는 시간에서 마우스를 드래그한다." ></i>	
			</div>		
		</div>
	</div>
	<!-- 오른쪽 구역1 끝 -->
</div>

<!-- **************************모달 시작********************************* -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- header title -->
        <h4 class="modal-title h4-title1">수술정보</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      	<div class="mb-3 row">
			    <label for="operNo" class="col-sm-2 col-form-label">수술번호</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="oper_modal_opNo" readonly="readonly" disabled>
			    </div>
			 </div>
			 <div class="mb-3 row">
			    <label for="operPaName" class="col-sm-2 col-form-label">환자명</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="oper_modal_paName" readonly="readonly" disabled>
			    </div>
			 </div>
			 <div class="mb-3 row">
			    <label for="operPaReg" class="col-sm-2 col-form-label">생년월일</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="oper-modal-paReg" readonly="readonly" disabled>
			    </div>
			 </div>
			 <div class="mb-3 row">
			 	<label for="operName" class="col-sm-2 col-form-label">수술명</label>
			 	<div class="col-sm-10">
					<select class="form-select" id="operationNameSelect">
						<option value="choice">선택</option>
						<c:forEach items="${operationOption}" var="operation">
							<option value="${operation.opCd}">${operation.opCd} - ${operation.opKrNm} (${operation.opEnNm})</option>
						</c:forEach>
				    </select>
			 	</div>
			 </div>
			 <div class="mb-3 row">
			 	<label for="operDoctor" class="col-sm-2 col-form-label">담당의</label>
				<div class="col-sm-10">
					<select class="form-select" id="doctorSelect">
						<option value="choice">선택</option>
						<c:forEach items="${docOption}" var="doctor">
							<option value="${doctor.empNo}">${doctor.empNm} (${doctor.empNo})</option>
						</c:forEach>
				    </select>
			 	</div>
			 </div>
			 <div class="mb-3 row">
			 	<label for="color" class="col-sm-2 col-form-label">색상</label>
				<div class="col-sm-10">
					<select class="form-select" id="operationColorSelect" onchange="fontColorChange()">
						<option value="choice">선택</option>
                        <option value="9775fa" style="color:#9775fa; font-weight:bold;">보라색</option>
                        <option value="ffa94d" style="color:#ffa94d; font-weight:bold;">주황색</option>
                        <option value="74c0fc" style="color:#74c0fc; font-weight:bold;">파란색</option>
                        <option value="f06595" style="color:#f06595; font-weight:bold;">핑크색</option>
                        <option value="63e6be" style="color:#63e6be; font-weight:bold;">연두색</option>
                        <option value="a9e34b" style="color:#a9e34b; font-weight:bold;">초록색</option>
                        <option value="4d638c" style="color:#4d638c; font-weight:bold;">남색</option>
                        <option value="495057" style="color:#495057; font-weight:bold;">검정색</option>
				    </select>
			 	</div>
			 </div>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" id="operUpdateBtn" class="btn_blue">저장</button>
        <button type="button" class="btn_blue" data-bs-dismiss="modal">닫기</button>
        <button type="button" id="operCancleBtn" class="btn_red" data-bs-dismiss="modal">삭제</button>
      </div>
    </div>
  </div>
</div>
<!-- *******************모달 끝************************* -->

<script>
const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

/* 경과시간 계산 */
function elapseTimer(){
	let startTime = $('#oper-detail-startTime').val();
	let endTime = $('#oper-detail-endTime').val();
	
	if(startTime && !endTime){
		
		const KR_TIME_DIFF = (9 * 60 * 60 * 1000) - (7*60+39); // 한국시간 계산용
		let start = new Date(startTime);
		let nowTime = new Date();
		
		let diff = (nowTime.getTime()-KR_TIME_DIFF) - start.getTime();
		let elapseTime = convertTime(diff);
		
		$('#oper-detail-elapseTime').val(elapseTime);
	} else if(startTime && endTime){
		return;
	} else{
		$('#oper-detail-elapseTime').val('');
	}
}

/* 경과시간 타이머 가동 */
function elapseTimerinit(){
    setInterval(elapseTimer, 1000);
}
/* 경과시간 타이머 중지 */
function elapseTimerStop(){
	clearInterval(elapseTimer);
}

/* 밀리세컨드를 날짜[연도/월/일(요일)]로 변환해주는 함수 */
function convertDate(milliSecond) {
	  const days = ['일', '월', '화', '수', '목', '금', '토'];
	  const data = new Date(milliSecond);  //Date객체 생성

	  const year = data.getFullYear();    //0000년 가져오기
	  const month = data.getMonth() + 1;  //월은 0부터 시작하니 +1하기
	  const date = data.getDate();        //일자 가져오기
	  const day = days[data.getDay()];    //요일 가져오기

	  return `\${year}/\${month}/\${date} (\${day})`;
}

/* 밀리세컨드를 날짜(시간포함)로 변환해주는 함수 */
function convertDateTime(milliSecond) {
	  const data = new Date(milliSecond);  //Date객체 생성

	  const year = data.getFullYear();    //0000년 가져오기
	  const month = String(data.getMonth() + 1).padStart(2,"0");  //월은 0부터 시작하니 +1하기
	  const date = String(data.getDate()).padStart(2,"0");        //일자 가져오기
	  const hour = String(data.getHours()).padStart(2,"0");       //시간 가져오기
	  const minute = String(data.getMinutes()).padStart(2,"0");   //분 가져오기
	  const second = String(data.getSeconds()).padStart(2,"0");  //초 가져오기
	  return `\${year}/\${month}/\${date} \${hour}:\${minute}:\${second}`;
}

/* 밀리세컨드를 시간(시:분:초)로 변환해주는 함수 */
function convertTime(milliSecond){
	const data = new Date(milliSecond);  //Date객체 생성
	const hour = String(data.getHours()).padStart(2,"0");       //시간 가져오기
	const minute = String(data.getMinutes()).padStart(2,"0");   //분 가져오기
	const second = String(data.getSeconds()).padStart(2,"0");  //초 가져오기
	
	return `\${hour}:\${minute}:\${second}`;
}

/* 풀캘린더 */
document.addEventListener('DOMContentLoaded', function calendarLoad() {
   			var today = new Date();
			var calendarEl = document.getElementById('calendar');
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		    	initialView: 'dayGridMonth',
		    	slotMinTime: "07:00:00", // timegrid 시작시간
// 		    	slotMaxTime: "22:00:00", // timegrid 종료시간
		    	navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 이동함
		    	nowIndicator: true, // 현재시간마크
// 		    	dayMaxEvent: true, // 이벤트가 오버되면 높이 제한(+ 몇 개 식으로 표현)
		    	selectable: true, // 달력 일자 드래그 설정가능
		    	allDaySlot: false,
		    	slotEventOverlap: false, // 시간 중복 방지
		    	locale: 'ko',
		    	businessHours: {
		    		  daysOfWeek: [ 1, 2, 3, 4, 5, 6 ], // Monday - Saturday
		    		  startTime: '09:00', 
		    		  endTime: '22:00', 
		    	},
		    	selectConstraint:"businessHours",
		    	headerToolbar: {
		            left: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',
		            center: 'title',
		            right: 'prev,next today'
		        },
		        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
		        	        	
		        	v_selected_trmCd = $('#oper-pa-detail-trmCd').val();
		        	v_paName = $('#oper-pa-detail-paName').val();
		        	if(!v_selected_trmCd){
		        		swal("등록실패" ,"대상 환자를 클릭해주세요", "error")
		        	} else{
		        		swal({
		        			  title: "수술예약",
		        			  text: "수술을 예약하시겠습니까?",
		        			  icon: "info",
		        			  buttons: true
		        			})
		        			.then((willCreate) => {
		        				if (willCreate) {
		        					var title = v_paName;
		    			            	    						
		    						let v_trmCd = $('#oper-pa-detail-trmCd').val();
		    						let v_diseaseCd = $('#oper-pa-detail-diseaseCd').val();						
		    						let v_opReservStarttime = convertDateTime(arg.start.getTime());
		    						let v_opReservEndtime = convertDateTime(arg.end.getTime());
		    						let v_empNm = $('#oper-pa-detail-empNm').val();
		    								    						
		    						let data = {
		    							"trmCd" : v_trmCd,
		    							"diseaseCd" : v_diseaseCd,
		    							"opReservStarttime" : v_opReservStarttime,
		    							"opReservEndtime" : v_opReservEndtime,
		    							"empNm" : v_empNm
		    						}
		    						
		    						$.ajax({
		    							url : "operationInsert",
		    							method : "post",
		    							data : JSON.stringify(data),
		    							contentType : "application/json;charset=utf-8",
		    							beforeSend: function(xhr) {
		    					            xhr.setRequestHeader(header, token);
		    					    	},
		    							dataType : "json",
		    							success : function(result) {
		    								if(result==1){
		    									swal("입력성공", "수술예약이 성공되었습니다.", "success");
		    									operationList();
		    									operReservList();
		    									calendarLoad();
		    								}
		    							},
		    							error : function(jqXHR, status, error) {
		    								console.log(jqXHR);
		    								console.log(status);
		    								console.log(error);
		    							}
		    						});
			        			}else{
			        				swal("취소되었습니다!");  
			        			}
		        			});
			            calendar.unselect()
		        	}
		        },
		        eventSources : [
		    		{
		    			url:calendarEl.dataset.source,
		    			dataType:"json",
		    		}
		    	],
		    	initialDate : today,
		    	eventClick:function(event){
		    		let opNo = event.event._def.publicId;
		    		let data = {
		    				"opNo" : opNo
		    		}
		    		
		    		$.ajax({
						url : "operationDetailSelect",
						method : "post",
						data : JSON.stringify(data),
						contentType : "application/json;charset=utf-8",
						beforeSend: function(xhr) {
				            xhr.setRequestHeader(header, token);
				    	},
						dataType : "json",
						success : function(result) {
							/* 모달창에 값 입력 */
							$('#oper_modal_opNo').val(result.receptionList[0].trmChart.diagHistoryVOList[0].operation.opNo);
							$('#oper_modal_paName').val(result.paName);
							$('#oper-modal-paReg').val(result.paReg);
							
							let opCd = result.receptionList[0].trmChart.diagHistoryVOList[0].operation.opCd;
							let empNo = result.receptionList[0].trmChart.diagHistoryVOList[0].operation.operationJoinList[0].empNo;
							let opColor = result.receptionList[0].trmChart.diagHistoryVOList[0].operation.opColorCd;
							
							/* DB에 입력된 값이 있을 경우 반영함 */
							if(!opCd){
								$('#operationNameSelect').val("choice").prop("selected",true);
							}else{
								$('#operationNameSelect').val(opCd).prop("selected",true);
							}
							if(!empNo){
								$('#doctorSelect').val("choice").prop("selected",true);			
							}else{
								$('#doctorSelect').val(empNo).prop("selected",true);			
							}
							if(!opColor){
								$('#operationColorSelect').val("choice").prop("selected",true);
							}else{
								$('#operationColorSelect').val(opColor).prop("selected",true);
							}
							/* 글자색변경 */
							fontColorChange();
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
		    		
		    		$('div.modal').modal("show");
		    	},
		    	eventDidMount: function (info) {
		            	let backColor = info.event.backgroundColor;
		            	let v_source = info.el.fcSeg.eventRange.def.extendedProps.source;
		            	let v_startTime = convertDateTime(v_source.opReservStarttime);
		            	let v_endTime = convertDateTime(v_source.opReservEndtime);
		            	let v_empNm = '';
		            	let v_opKrNm = '';
		            	let v_opEnNm = '';
		            	
		            	if(!v_source.operationJoinList[0].empNm){
		            		v_empNm = "담당의 미배정";
		            	}else{
		            		v_empNm = v_source.operationJoinList[0].empNm;
		            	}
		            	
		            	if(!v_source.opKrNm){
		            		v_opKrNm = "수술 미선택";
		            	}else{
		            		v_opKrNm = v_source.opKrNm;
		            	}
		            	
		            	if(!v_source.opEnNm){
		            		v_opEnNm = " ";
		            	}else{
		            		v_opEnNm = v_source.opEnNm;
		            	}
		            	
		            $(info.el).popover({
 						title: $('<div/>', {
							"class": 'popoverTitleCalendar',
					        text: info.event.title
						}).css({
							'background' : backColor
						}),
		                content: $('<div/>' ,{
		                	"class": 'popoverInfoCalendar'
		                }).append('<p><strong>환자명: </strong>'+ v_source.paName +'</p>')
		                .append('<p><strong>담당의: </strong>'+ v_empNm+'</p>')
		                .append('<p><strong>수술명: </strong>'+ v_opKrNm+' ('+v_opEnNm+')</p>')
		                .append('<p><strong>예약시작일시: </strong>'+v_startTime+'</p>')
		                .append('<p><strong>예약종료일시: </strong>'+v_endTime+'</p>')
		                .append('<div class="popoverDescCalendar"><strong>설명:</strong></div>'),
		                placement: 'top',
		                trigger: 'hover',
		                container: 'body',
		                html:true,
		                delay: { "show": 500, "hide": 100 },
		            })
		        }	
		    });
		    calendar.render();
		    
		    /* 수술정보 변경(업데이트) */
		    $('#operUpdateBtn').on('click', function(event){
		    	let v_opNo = document.getElementById('oper_modal_opNo').value;
		    	let v_opCd = $("#operationNameSelect option:selected").val();
		    	let v_doctor = $("#doctorSelect option:selected").val();
		    	let v_color = $("#operationColorSelect option:selected").val();
		    	
		    	if(v_opCd=='choice'){
		    		swal("변경실패", "수술명을 선택해주세요", "error");
		    	} else if(v_doctor=='choice'){
		    		swal("변경실패", "담당의을 선택해주세요", "error");
		    	} else if(v_color=='choice'){
		    		swal("변경실패", "색상을 선택해주세요", "error");
		    	} else{
		    		swal({
			    		  title: "예약변경",
			    		  text: "수술 예약 정보를 변경하시겠습니까?",
			    		  icon: "info",
			    		  buttons: true
			    		})
			    		.then((willCreate) => {
			    		  if (willCreate) {
			    			  let data = {
			    					  opNo : v_opNo,
			    					  opCd : v_opCd,
			    					  empNo : v_doctor,
			    					  opColorCd : v_color
			    			  }
			    			  
			    			  $.ajax({
			    					url : "operationUpdate",
			    					method : "post",
			    					data : JSON.stringify(data),
			    					contentType : "application/json;charset=utf-8",
			    					beforeSend: function(xhr) {
	    					            xhr.setRequestHeader(header, token);
	    					    	},
			    					dataType : "json",
			    					success : function(result) {
			    						if(result == 1){
			    							swal("변경성공", "예약정보 변경에 성공했습니다", "success");
			    							/* 캘린더 재출력 */
			    							calendarLoad();
			    							$('div.modal').modal("hide");
			    						}else{
			    							swal("변경실패","예약정보 변경에 실패했습니다","error");			
			    						}
			    					},
			    					error : function(jqXHR, status, error) {
			    						console.log(jqXHR);
			    						console.log(status);
			    						console.log(error);
			    					}
			    				});
			    		  } else {
			    		    swal("취소되었습니다!");
			    		  }
			    		});
		    	}
		    });

		    /* 수술예약정보 삭제 */
		    $('#operCancleBtn').on('click', function(event){
		    	let v_opNo = document.getElementById('oper_modal_opNo').value;
		    	
		    	swal({
		    		  title: "예약취소",
		    		  text: "수술 예약을 취소하시겠습니까?",
		    		  icon: "warning",
		    		  dangerMode: true,
		    		  buttons: true
		    		})
		    		.then((willCreate) => {
		    		  if (willCreate) {
		    			  
		    			  let data = {
		    						opNo : v_opNo
		    			  }
		    			  
		    			  $.ajax({
		    					url : "operationDelete",
		    					method : "post",
		    					data : JSON.stringify(data),
		    					contentType : "application/json;charset=utf-8",
		    					beforeSend: function(xhr) {
    					            xhr.setRequestHeader(header, token);
    					    	},
		    					dataType : "json",
		    					success : function(result) {
		    						if(result == 1){
		    							swal("삭제성공", "예약 삭제에 성공했습니다", "success");
		    							/* 캘린더 재출력 */
		    							calendarLoad();	
		    							operReservList();
		    						}else{
		    							swal("삭제실패","예약 삭제에 실패했습니다","error");			
		    						}
		    					},
		    					error : function(jqXHR, status, error) {
		    						console.log(jqXHR);
		    						console.log(status);
		    						console.log(error);
		    					}
		    				});
		    		  } else {
		    		    swal("취소되었습니다!");
		    		  }
		    		});
		    });		
		    
});


/* tab 메뉴 */
$(function(){
	let paTab = $(".patient-tab");
	let paTabContents = $(".patient-tab .tabcontent > div");
	let cexTab = $(".cex-tab");
	let cexTabContents = $(".cex-tab .tabcontent > div");

	$('.tabcontent > div').hide();
	
	let paTabNavs = $('.patient-tab li a').click(function () {
		paTabContents.hide().filter(this.hash).fadeIn();
		paTabNavs.removeClass('active');
		$(this).addClass('active');
		
		let hash = this.hash;
		operTapChange(hash);
		
		return false;
	});
	paTabNavs.eq(0).click();
	
	let cexTabNavs = $('.cex-tab li a').click(function () {
		cexTabContents.hide().filter(this.hash).fadeIn();
		cexTabNavs.removeClass('active');
		$(this).addClass('active');
		
		let hash = this.hash;
		cexTapChange(hash);
		
		return false;
	});
	cexTabNavs.eq(0).click();
	
});

/* tab 누르면 입력란이 바뀜(검사)*/
function cexTapChange(hash){
	let cex_barcode = $('#tab-cex-barcode');
	let cex_detail = $('#tab-cex-detail');
	
	const z_index_style_1 = {
			style : "z-index: -1"
	}
	const z_index_style_100 = {
			style : "z-index: 100"
	}
	
	cex_barcode.attr(z_index_style_1);
	cex_detail.attr(z_index_style_1);
	
	switch (hash) {
	case '#cexWait':
		cex_barcode.attr(z_index_style_100);
		break;
	case '#cexComplete':
		cex_detail.attr(z_index_style_100);
		break;
	case '#cexHistory':
		cex_detail.attr(z_index_style_100);
	default:
		break;
	}
}

/* tab 누르면 입력란이 바뀜(수술) */
function operTapChange(hash){
	let pa_detail = $('#tab-oper-paDetail');
	let oper_detail = $('#tab-oper-datail');
	
	const z_index_style_1 = {
			style : "z-index: -1"
	}
	const z_index_style_100 = {
			style : "z-index: 100"
	}
	
	pa_detail.attr(z_index_style_1);
	oper_detail.attr(z_index_style_1);
	
	switch (hash) {
	case '#operWait':
		pa_detail.attr(z_index_style_100);
		break;
	case '#operSchedule':
		oper_detail.attr(z_index_style_100);
		break;
	case '#operComplete':
		oper_detail.attr(z_index_style_100);
		break;
	case '#operHistory':
		oper_detail.attr(z_index_style_100);
		break;
	default:
		break;
	}
}

/* 수술대기 환자 리스트 출력  */
let operationList = function(){
	$.ajax({
		url : "operationList",
		method : "get",
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			let trTags = [];
			let cexStatus = '';
			let trTag = '';
			$.each(result, function(i,v){
				if(!v.diagHistory.cex.cexStatus || v.diagHistory.cex.cexStatus == 'F'){
					cexStatus = '미검사';
					var v_trmCd = v.trmCd;
					var v_diseaseCd = v.diseaseCd;
					
					aTag = $('<a>').attr({"class" : "a_btn_oper"
										 , "title" : "클릭시 검사 생성"
										 , "href" : "javascript:void(0);"
										 , "onclick" : "cexCreate(\""+v_trmCd+"\",\""+v_diseaseCd+"\");"
										}).html(cexStatus);
					trTag = $("<tr>").append(
						$("<td>").html(v.trmCd)		
						, $("<td>").html(v.diseaseCd)
						, $("<td>").html(v.paNo)
						, $("<td>").html(v.paName)
						, $("<td>").append(aTag)
					)
				} else if(v.diagHistory.cex.cexStatus == 'T'){
					cexStatus = '검사완료';				
					trTag = $("<tr>").append(
						$("<td>").html(v.trmCd)		
						, $("<td>").html(v.diseaseCd)
						, $("<td>").html(v.paNo)
						, $("<td>").html(v.paName)
						, $("<td>").html(cexStatus)
					)
				}
				trTags.push(trTag);
			})
			$("#operWaitTbody").html(trTags);
			
			/* 리스트출력 */
			cexWaitList();
			cexCompleteList();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
operationList();

/* 수술대기 테이블 클릭이벤트 */
$('#operWaitTbody').on('click', 'tr', function(event){
	
	/* 누른 tr 색변경 */
	let $tr = $(this);
	$tr.siblings('tr').removeClass("dblclick-on");
	rcpNo = $tr.data("rcpNo");
	$tr.addClass("dblclick-on");
	
	let v_tr = $(this);
	let v_trmCd = v_tr.children().eq(0).text();
	let v_diseaseCd = v_tr.children().eq(1).text();
	
	let data = {
			trmCd : v_trmCd,
			diseaseCd : v_diseaseCd
	}
	
	$.ajax({
		url : "diagnosisDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			$('#oper-pa-detail-trmCd').val(result.trmCd);
			$('#oper-pa-detail-diseaseCd').val(result.diagHistoryVOList[0].diseaseCd);
			$('#oper-pa-detail-icdName').val(result.diagHistoryVOList[0].icdName);
			$('#oper-pa-detail-empNm').val(result.empNm);
			$('#oper-pa-detail-paNo').val(result.paNo);
			$('#oper-pa-detail-paName').val(result.paName);
			$('#oper-pa-detail-mediRecord').val(result.mediRecord);
			symptomList(v_trmCd);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

/* 수술예정 테이블 클릭이벤트 */
$('#operScheduleTbody').on('click', 'tr', function(event){
	
	/* 누른 tr 색변경 */
	let $tr = $(this);
	$tr.siblings('tr').removeClass("dblclick-on");
	rcpNo = $tr.data("rcpNo");
	$tr.addClass("dblclick-on");
	
	let v_tr = $(this);
	let v_opNo = v_tr.children().eq(0).text();
	
	let data = {
			opNo : v_opNo
	}
	
	$.ajax({
		url : "operationReservDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			console.log(result);
			let v_startTime = '';
			let v_endTime = '';
			
			if(result.opStartTime){
				v_startTime = convertDateTime(result.opStartTime);				
			}
			if(result.opEndTime){
				v_endTime = convertDateTime(result.opEndTime);				
			}
			
			if(result.opStartTime && result.opEndTime){
				let elapseTime = result.opStartTime - result.opEndTime;
				$('#oper-detail-elapseTime').val(convertTime(elapseTime));
			}
			
			$('#oper-detail-paName').data("opNo", v_opNo);
			$('#oper-detail-paName').val(result.paName);
			$('#oper-detail-paReg').val(result.paReg);
			
			if(result.opKrNm){
				let opNm = `\${result.opKrNm}(\${result.opEnNm})`;
				$('#oper-detail-operNm').val(opNm).attr("style","color:black;");
			}else{
				$('#oper-detail-operNm').val("수술 선택 필요").attr("style","color:red;");
			}
			
			if(result.operationJoinList[0]){
				$('#oper-detail-empNm').val(result.operationJoinList[0].empNm).attr("style","color:black;");				
			} else{
				$('#oper-detail-empNm').val("담당의 배정 필요").attr("style","color:red;");
			}
			$('#oper-detail-startTime').val(v_startTime);
			$('#oper-detail-endTime').val(v_endTime);
			$('#oper-detail-operationRecord').val(result.opRecord);
			
			/* 경과시간 출력하기 */
			elapseTimerinit();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

/* 수술완료 테이블 클릭이벤트 */
$('#operCompleteTbody').on('click', 'tr', function(event){
	
	/* 누른 tr 색변경 */
	let $tr = $(this);
	$tr.siblings('tr').removeClass("dblclick-on");
	rcpNo = $tr.data("rcpNo");
	$tr.addClass("dblclick-on");
	
	let v_tr = $(this);
	let v_opNo = v_tr.children().eq(0).text();
	
	let data = {
			opNo : v_opNo
	}
	
	$.ajax({
		url : "operationReservDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			console.log(result);
			let v_startTime = '';
			let v_endTime = '';
			
			if(result.opStartTime){
				v_startTime = convertDateTime(result.opStartTime);				
			}
			if(result.opEndTime){
				v_endTime = convertDateTime(result.opEndTime);				
			}
			
			// 한국시간 계산용
			const KR_TIME_DIFF = (9 * 60 * 60 * 1000);
			if(result.opStartTime && result.opEndTime){
				let elapseTime = result.opEndTime - result.opStartTime - KR_TIME_DIFF;
				$('#oper-detail-elapseTime').val(convertTime(elapseTime));
			}
			
			let opNm = `\${result.opKrNm}(\${result.opEnNm})`;
			
			$('#oper-detail-paName').data("opNo", v_opNo);
			$('#oper-detail-paName').val(result.paName);
			$('#oper-detail-paReg').val(result.paReg);
			$('#oper-detail-operNm').val(opNm).attr("style","color:black;");
			$('#oper-detail-empNm').val(result.operationJoinList[0].empNm).attr("style","color:black;");
			$('#oper-detail-startTime').val(v_startTime);
			$('#oper-detail-endTime').val(v_endTime);
			$('#oper-detail-operationRecord').val(result.opRecord);
			
			/* 경과시간 출력하기 */
			elapseTimerinit();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

/* 수술기록조회 테이블 클릭이벤트 */
$('#operHistoryTbody').on('click', 'tr', function(event){
	
	/* 누른 tr 색변경 */
	let $tr = $(this);
	$tr.siblings('tr').removeClass("dblclick-on");
	rcpNo = $tr.data("rcpNo");
	$tr.addClass("dblclick-on");
	
	let v_tr = $(this);
	let v_opNo = v_tr.children().eq(0).text();
	
	let data = {
			opNo : v_opNo
	}
	
	$.ajax({
		url : "operationReservDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			console.log(result);

			let v_startTime = '';
			let v_endTime = '';
			
			if(result.opStartTime){
				v_startTime = convertDateTime(result.opStartTime);				
			}
			if(result.opEndTime){
				v_endTime = convertDateTime(result.opEndTime);				
			}
			
			if(result.opStartTime && result.opEndTime){
				let elapseTime = result.opStartTime - result.opEndTime;
				$('#oper-detail-elapseTime').val(convertTime(elapseTime));
			}
			
			$('#oper-detail-paName').data("opNo", v_opNo);
			$('#oper-detail-paName').val(result.paName);
			$('#oper-detail-paReg').val(result.paReg);
// 			$('#oper-detail-icdName').val(result.diagHistory.icdName);
			$('#oper-detail-operNm').val(result.opKrNm);
			$('#oper-detail-empNm').val(result.operationJoinList[0].empNm);
			$('#oper-detail-startTime').val(v_startTime);
			$('#oper-detail-endTime').val(v_endTime);
			$('#oper-detail-operationRecord').val(result.opRecord);
			
			/* 경과시간 출력하기 */
			elapseTimerinit();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

/* 수술예정 리스트(테이블) 출력 */
let operReservList = function(){
	$.ajax({
		url : "operReservList",
		method : "get",
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			let trTags = [];
			let trTag = '';
			
			$.each(result, function(i, v){
				let operReservDate = convertDate(v.opReservStarttime);
				trTag = $('<tr>').append(
									$('<td>').html(v.opNo)
									, $('<td>').html(v.paName)
									, $('<td>').html(v.paReg)									
									, $('<td>').html(operReservDate)									
								);
				trTags.push(trTag);
			});
			$('#operScheduleTbody').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
operReservList();

/* 수술완료 리스트(테이블) 출력 */
let operCompleteList = function(){
	$.ajax({
		url : "operCompleteList",
		method : "get",
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			let trTags = [];
			let trTag = '';
			
			$.each(result, function(i, v){
				let operCompleteDate = convertDate(v.opEndTime);
				trTag = $('<tr>').append(
									$('<td>').html(v.opNo)
									, $('<td>').html(v.paName)
									, $('<td>').html(v.paReg)									
									, $('<td>').html(operCompleteDate)									
								);
				trTags.push(trTag);
			});
			$('#operCompleteTbody').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
operCompleteList();

/* 검사대기 테이블 클릭이벤트 */
$('#cexWaitTbody').on('click', 'tr', function(event){
	
	/* 누른 tr 색변경 */
	let $tr = $(this);
	$tr.siblings('tr').removeClass("dblclick-on");
	rcpNo = $tr.data("rcpNo");
	$tr.addClass("dblclick-on");
	
	let v_tr = $(this);
	let v_cexNo = v_tr.children().eq(0).text();
	let v_barcodeRadio = $('[name=cexBarcode]:checked').val();
	
	let barcode = `https://bwipjs-api.metafloor.com/?bcid=code128&text=No:\${v_cexNo}(\${v_barcodeRadio})&scale=2&includetext&backgroundcolor=ffffff&padding=5`;
	let imgTag = $('<img>').attr({"src" : barcode, "id" : "barcodeImg" });
	$("#barcode-print").html(imgTag);
	
	// 바코드출력버튼 활성화
	$("#barcode-print-btn").attr("style", "float:right; display:block;");
	
	// 검사입력에 검사코드 넣어줌
	$('#cex-input-cexNo').val(v_cexNo);
});

/* 검사완료 테이블 클릭이벤트 */
$('#cexCompleteTbody').on('click','tr',function(event){
	
	/* 누른 tr 색변경 */
	let $tr = $(this);
	$tr.siblings('tr').removeClass("dblclick-on");
	rcpNo = $tr.data("rcpNo");
	$tr.addClass("dblclick-on");
	
	let v_tr = $(this);
	let v_cexNo = v_tr.children().eq(0).text();
	let v_paNo = v_tr.children().eq(3).text();
	let v_paName = v_tr.children().eq(4).text();
	
	// 검사결과상세에 검사코드 넣어줌
	$('#cex-detail-cexNo').val(v_cexNo);
	$('#cex-detail-paNo').val(v_paNo);
	$('#cex-detail-paName').val(v_paName);
	
	let data = { "cexNo" : v_cexNo }
	$.ajax({
		url : "cexResultDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let cexCbc, cexEcg, cexPfts, cexUa;
			if(result.cexCbc == "F"){
				cexCbc = '부적합';
			} else {
				cexCbc = '적합';
			}
			
			if(result.cexEcg == "F"){
				cexEcg = '부적합';
			} else {
				cexEcg = '적합';
			}
			
			if(result.cexPfts == "F"){
				cexPfts = '부적합';
			} else {
				cexPfts = '적합';
			}
			
			if(result.cexUa == "F"){
				cexUa = '부적합';
			} else {
				cexUa = '적합';
			}
			
			let trTag = $('<tr>').append(
								$('<td>').html(result.cexDate)
								, $('<td>').html(cexCbc)
								, $('<td>').html(cexEcg)
								, $('<td>').html(cexUa)
								, $('<td>').html(cexPfts)
								, $('<td>').attr("title", result.cexNe).html(result.cexNe)
								);
			
			$('#cexDetailTbody').html(trTag);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

/* 검사기록 테이블 클릭 이벤트 */
$('#cexHistoryTbody').on('click','tr',function(event){
	
	/* 누른 tr 색변경 */
	let $tr = $(this);
	$tr.siblings('tr').removeClass("dblclick-on");
	rcpNo = $tr.data("rcpNo");
	$tr.addClass("dblclick-on");
	
	let v_tr = $(this);
	let v_cexNo = v_tr.children().eq(0).text();
	let v_paNo = v_tr.children().eq(3).text();
	let v_paName = v_tr.children().eq(4).text();
	
	// 검사결과상세에 검사코드 넣어줌
	$('#cex-detail-cexNo').val(v_cexNo);
	$('#cex-detail-paNo').val(v_paNo);
	$('#cex-detail-paName').val(v_paName);
	
	let data = { "cexNo" : v_cexNo }
	$.ajax({
		url : "cexResultDetail",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let cexCbc, cexEcg, cexPfts, cexUa;
			if(result.cexCbc == "F"){
				cexCbc = '부적합';
			} else {
				cexCbc = '적합';
			}
			
			if(result.cexEcg == "F"){
				cexEcg = '부적합';
			} else {
				cexEcg = '적합';
			}
			
			if(result.cexPfts == "F"){
				cexPfts = '부적합';
			} else {
				cexPfts = '적합';
			}
			
			if(result.cexUa == "F"){
				cexUa = '부적합';
			} else {
				cexUa = '적합';
			}
			
			let trTag = $('<tr>').append(
								$('<td>').html(cexCbc)
								, $('<td>').html(cexEcg)
								, $('<td>').html(cexUa)
								, $('<td>').html(cexPfts)
								, $('<td>').html(result.empNm)
								, $('<td>').html(result.cexDate)
								, $('<td>').attr("title", result.cexNe).html(result.cexNe)
								);
			
			$('#cexDetailTbody').html(trTag);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});

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
	// 새로고침(안하면 다른 기능들이 먹통됨)
	history.go(0);
}

window.onbeforeprint = beforePrint;
window.onafterprint = afterPrint;
/* 바코드 출력 끝 */

/* 수술시작 */
$('#operationStart').on('click',function(){
	let v_opNo = $('#oper-detail-paName').data("opNo");
	let v_elapseTime = $('#oper-detail-elapseTime').val();
	
	if(v_elapseTime){
		swal("시작실패","이미 진행중인 수술입니다.", "error");
	}else if(v_opNo){
		swal({
			  title: "수술시작",
			  text: "수술을 시작하시겠습니까?",
			  icon: "warning",
			  dangerMode: true,
			  buttons: true
			})
			.then((willCreate) => {
			  if (willCreate) {
				  let startTime = new Date().getTime();
				  let data = {
							opNo : v_opNo
							, "opStartTime" : startTime
					}
				  $.ajax({
						url : "operationStart",
						method : "post",
						data : JSON.stringify(data),
						contentType : "application/json;charset=utf-8",
						beforeSend: function(xhr) {
				            xhr.setRequestHeader(header, token);
				    	},
						dataType : "json",
						success : function(result) {
							let v_startTime = convertDateTime(result.opStartTime);
							$('#oper-detail-startTime').val(v_startTime);
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
			  } else {
			    swal("취소되었습니다!");
			  }
			});
	}else{
		swal("시작실패","시작할 수술을 선택해주세요","error");
	}
});

$('#operationEnd').on('click',function(){
	let v_opNo = $('#oper-detail-paName').data("opNo");
	let v_startTime = $('#oper-detail-startTime').val();
	let v_elapseTime = $('#oper-detail-elapseTime').val();
	let v_endTime = $('#oper-detail-endTime').val();
	let v_operRecord = $('#oper-detail-operationRecord').val();
	
	if(!v_opNo){
		swal("종료실패","수술을 선택해주세요.","warning");
	} else if(!v_startTime){
		swal("종료실패","아직 시작되지 않은 수술입니다.","warning");
	} else if(v_endTime){
		swal("종료실패","이미 종료된 수술입니다.","warning");
	} else if(!v_operRecord){
		swal("종료실패","수술 기록을 입력해주세요.","warning");
	} else{
		swal({
			  title: "수술종료",
			  text: "수술을 종료하시겠습니까?",
			  icon: "warning",
			  dangerMode: true,
			  buttons: true
			})
			.then((willCreate) => {
			  if (willCreate) {
				  let endTime = new Date().getTime();
				  let data = {
							opNo : v_opNo
							, "opEndTime" : endTime
							, "opRecord" : v_operRecord
				  }
				  $.ajax({
						url : "operationEnd",
						method : "post",
						data : JSON.stringify(data),
						contentType : "application/json;charset=utf-8",
						beforeSend: function(xhr) {
				            xhr.setRequestHeader(header, token);
				    	},
						dataType : "json",
						success : function(result) {
							/* 경과시간 타이머 종료  */
							elapseTimerStop();
							let v_endTime = convertDateTime(result.opEndTime);
							$('#oper-detail-endTime').val(v_endTime);
							/* 수술예정 리스트 반영 */
							operReservList();
							operCompleteList();
							swal("수술종료","수술이 종료되었습니다. 수고하셨습니다.", "success");
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
			  } else {
			    swal("취소되었습니다!");
			  }
			});
	}
	
	
});

// 임상검사결과등록
$('#cex-input-btn').on('click', function(){
	let cexNo = document.getElementById('cex-input-cexNo');
	let cexNe = document.getElementById('cexNetextarea');
	
	let v_cexCbc = $('input[name=cexCbcRadio]:checked').val();
	let v_cexEcg = $('input[name=cexEcgRadio]:checked').val();
	let v_cexUa = $('input[name=cexUaRadio]:checked').val();
	let v_cexPfts = $('input[name=cexPftsRadio]:checked').val();
	
	let data = {
			"cexNo" : cexNo.value
			, "cexCbc" : v_cexCbc
			, "cexEcg" : v_cexEcg
			, "cexUa" : v_cexUa
			, "cexPfts" : v_cexPfts
			, "cexNe" : cexNe.value
	}
	
	if(!cexNo.value){
		swal("검사등록실패", "상단의 검사대기 목록에서 검사대상을 클릭해주세요!", "warning");
	}else{
		$.ajax({
			url : "cexRegistration",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			dataType : "json",
			success : function(result) {
				swal("등록성공","검사등록이 완료되었습니다","success");

				// 입력란 초기화
				cexNo.value = '';
				cexNe.value = '';
				
				// 리스트 재출력
				operationList();
				cexWaitList();
				cexCompleteList();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
})

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
							$('<td>').html(v.trmCd)
							, $('<td>').html(v.symCd)							
							, $('<td>').html(v.symDetail)							
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
/* 임상결과 생성 */
function cexCreate(trmCd, diseaseCd){
	let flag;
	let v_trmCd = trmCd;
	let v_diseaseCd = diseaseCd;
	let data = {
			"trmCd" : v_trmCd, 
			"diseaseCd" : v_diseaseCd
	}
	
	swal({
		  title: "검사생성",
		  text: "검사를 생성하시겠습니까?",
		  icon: "info",
		  buttons: true
		})
		.then((willCreate) => {
		  if (willCreate) {
			  
			  $.ajax({
					url : "cexCreate",
					method : "post",
					data : JSON.stringify(data),
					contentType : "application/json;charset=utf-8",
					beforeSend: function(xhr) {
			            xhr.setRequestHeader(header, token);
			    	},
					dataType : "json",
					success : function(result) {
						if(result == 1){
							swal("생성성공", "검사생성에 성공했습니다", "success");
							
							//검사대기 리스트 재출력
							cexWaitList();
						}else{
							swal("생성실패","검사생성에 실패했습니다","error");			
						}
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
		  } else {
		    swal("취소되었습니다!");
		  }
		});
}
/* 검사대기환자리스트출력 */
function cexWaitList(){
	$.ajax({
		url : "cexWaitList",
		method : "post",
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			
			let trTags = [];
			let trTag = '';
			$.each(result, function(i,v){
				let diagList = v.receptionList[0].trmChart.diagHistoryVOList[0];
 				trTag = $('<tr>').attr("title","클릭시 바코드 생성")
 							.append(
							$('<td>').html(diagList.cex.cexNo)
							, $('<td>').html(diagList.trmCd)
							, $('<td>').html(diagList.diseaseCd)							
							, $('<td>').html(v.paNo)							
							, $('<td>').html(v.paName)							
							, $('<td>').html(v.paSex)							
							, $('<td>').html(v.paReg)							
						)
				trTags.push(trTag);
			})
			$('#cexWaitTbody').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 검사완료 리스트 출력 */
function cexCompleteList(){
	$.ajax({
		url : "cexCompleteList",
		method : "post",
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let trTags = [];
			let trTag = '';
			$.each(result, function(i,v){
				let diagList = v.receptionList[0].trmChart.diagHistoryVOList[0];
 				trTag = $('<tr>').append(
							$('<td>').html(diagList.cex.cexNo)
							, $('<td>').html(diagList.trmCd)
							, $('<td>').html(diagList.diseaseCd)							
							, $('<td>').html(v.paNo)							
							, $('<td>').html(v.paName)							
							, $('<td>').html(v.paSex)							
							, $('<td>').html(v.paReg)							
						)
				trTags.push(trTag);
			})
			$('#cexCompleteTbody').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

//검사기록조회 검색
$("#Search").on("click", function(){
	let searchOption = $("#searchOption option:selected").val();
	let searchWord = $("#searchWord").val();

	if(!searchWord){
		swal('검색 실패!', "검색어를 입력해주세요", 'warning');
		return false;
	}
	
	let data = {
			searchOption:searchOption,
			searchWord:searchWord
	}

	$.ajax({
		url : "cexHistorySearch",
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
				$.each(result[0].receptionList,function(i,v){
					trTag = $('<tr>').append(
								$('<td>').html(v.trmChart.diagHistoryVOList[0].cex.cexNo)
								, $('<td>').html(v.trmChart.diagHistoryVOList[0].trmCd)
								, $('<td>').html(v.trmChart.diagHistoryVOList[0].diseaseCd)
								, $('<td>').html(result[0].paNo)
								, $('<td>').html(result[0].paName)
								, $('<td>').html(result[0].paSex)
								, $('<td>').html(result[0].paReg)
								)
					trTags.push(trTag);
				})
				$('#cexHistoryTbody').html(trTags);
			}
		}
	});
	
	$("#searchWord").val("");
	
});

//환자 검색
$("#SearchOperation").on("click", function(){
	let searchOption = $("#operSearchOption option:selected").val();
	let searchWord = $("#opserSearchWord").val();

	if(!searchWord){
		swal('검색 실패!', "검색어를 입력해주세요", 'warning');
		return false;
	}
	
	let data = {
			searchOption:searchOption,
			searchWord:searchWord
	}
	
	$.ajax({
		url : "operHistorySearch",
		method : "post",
		data : JSON.stringify(data),
		contentType: "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType:"json",
		success : function(result) {
			
			let trTags=[];
			let trTag = '';
			$.each(result,function(i,v){
				let endDate = convertDate(v.opEndTime);
				trTag = $('<tr>').append(
							$('<td>').html(v.opNo)
							, $('<td>').html(v.paName)
							, $('<td>').html(v.paReg)
							, $('<td>').html(endDate)
							)
				trTags.push(trTag);
			})
			$('#operHistoryTbody').html(trTags);
			
		}
	});
	
	$("#searchWord").val("");
	
});

function fontColorChange(){
	let v_selectedColor = $('#operationColorSelect option:selected').val();
	$('#operationColorSelect').attr("style", "color: #"+v_selectedColor + "; font-weight: bold;");
}

</script>