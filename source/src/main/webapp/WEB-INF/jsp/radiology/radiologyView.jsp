<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<link href="${pageContext.request.contextPath }/resources/css/radiList.css" rel="stylesheet"/>
<title>영상의학과/대기실</title>

<style>
.oper-wrapper {height: 51.5rem;}
.oper-pa-list {width: 30rem; height: 20rem;}
.scroller {
    height: 311px;
  	visibility: hidden;
   }

#symptomTable2{
	margin-left: 50px;
}


.scrollshover,
.scroller:hover,
.scroller:focus {
	visibility: visible;
}
 
.radiChartTable{
	margin-top: 53px;
} 

p {
    margin-top: 0;
    margin-bottom: 0rem;
}

.btn-submit {
    width: 2.25rem;
    height: 1.5rem;
    background-color: #16308D;
    color: white;
    border: none;
    margin: 0.188rem;
    box-shadow: 1px 1px 2px grey;
    font-size: 14px;
}

.film-select{
	width: 72px
}

.film-input{
	width: 131px;
}

.tabnav {
    font-size: 0;
    width: 105%;
}

.film-search-form{
	margin-top: 5px;
    margin-bottom: 5px;

}

</style>

<div class="raditable">
<div class="grid-stack raditable">
	<div class="grid-stack-item" gs-w="2" gs-h="3" gs-x="0" gs-y="0">
		<div class="grid-stack-item-content card-grid" >
			<h4>환자조회</h4>
				<form id="radi-search-form" class="search-form" name="searchForm"
					onkeydown="f_block()">
					<select id="searchOption" class="radi-select">
						<option value>검색</option>
						<option value="name">이름</option>
						<option value="no">환자번호</option>
					</select> 
					<input name="searchBtn" class="radi-input" id="searchWord" type="text" value=""> 
					<input class="btn-submit" id="Search" type="button" value="검색">
				</form>
				 <div class="scroller">
					<table class="table1 table-blue scrollshover" >
					<thead class="fixedHeader">
						<tr>
							<th><a>환자번호</a></th>
							<th><a>환자명</a></th>
							<th><a>생년월일</a></th>
							<th><a>성별</a></th>
						</tr>
					</thead>
					<tbody id="radiTBody">
					
					</tbody>
				</table>
			</div>
		</div>	
	</div>
	<div class="grid-stack-item" gs-w="2" gs-h="3" gs-x="2" gs-y="0">
		<div class="grid-stack-item-content card-grid" >
			<h4>진료차트</h4>
			<table class="table-blue" >
				<thead class="fixedHeader">
					<tr>
						<th><a>차트코드</a></th>
						<th><a>환자명</a></th>
						<th><a>접수번호</a></th>
						<th><a>진료일자</a></th>
					</tr>
				</thead>
				<tbody id="chart-tbody">
						
				</tbody>
			</table>
		</div>	
	</div>
	<div class="grid-stack-item" gs-w="4" gs-h="2" gs-x="0" gs-y="3">
		<div class="grid-stack-item-content card-grid" >
			<h4>촬영실</h4>
			<table class="table-blue" >
				<thead class="fixedHeader">
					<tr>
						<th><a>접수번호</a></th>
						<th><a>환자명</a></th>
						<th><a>촬영실구분</a></th>
						<th><a>상태</a></th>
					</tr>
				</thead>
				<tbody id="radiWaitBody">
						
				</tbody>
			</table>
		</div>	
	</div>	
	<div class="grid-stack-item" gs-w="2" gs-h="3" gs-x="4" gs-y="0">
		<div class="grid-stack-item-content card-grid" >
			<h4>촬영기록</h4>
			<div class="tab filmList-tab">
			    <ul class="tabnav">
			      <li><a href="#xray">X-ray</a></li>
			      <li><a href="#mri">MRI</a></li>
			      <li><a href="#ct">CT</a></li>
			      <li><a href="#ultra">초음파</a></li>
			    </ul>
			    <div class="tabcontentWrap">
				    <div class="tabcontent">
				      <div id="xray">
				      	<form id="serarchButton" class="film-search-form" name="xraySearchForm">
			               <select id="searchOption" class="film-select">
			                  <option value="no">환자번호</option>
			                  <option value="name">환자이름</option>
			               </select> 
			               <input name="searchBtn" class="film-input" id="searchWord" type="text" value="">
			               <input class="btn-submit" id="xraySearch" type="button" value="검색">
						   <input style="display:none;" type="hidden" id="paNoHidden" value=""/>
			            </form>
			            <div class="scroller filmListScroller"> 
				            <table class="table-blue scrollshover">
					      		<thead class="fixedHeadr">
					      			<tr>
										<th style="font-size:11px">환자명</th>
										<th style="font-size:11px">생년월일</th>
										<th style="font-size:11px">성별</th>
										<th style="font-size:11px">촬영구분</th>
										<th style="font-size:11px">촬영일</th>
					      			</tr>
					      		</thead>
					      		<tbody id="xrayListTbody">
					      		
					      		</tbody>
					      	</table>
					    </div>
				      </div>
				      <div id="mri">
				      	<form id="serarchButton" class="film-search-form" name="mriSearchForm">
			               <select id="searchOption" class="film-select">
			                  <option value="no">환자번호</option>
			                  <option value="name">환자이름</option>
			               </select> 
			               <input name="searchBtn" class="film-input" id="searchWord" type="text" value="">
			               <input class="btn-submit" id="mriSearch" type="button" value="검색">
						   <input style="display:none;" type="hidden" id="paNoHidden" value=""/>
			            </form>
			            <div class="scroller filmListScroller"> 
				            <table class="table-blue scrollshover">
					      		<thead class="fixedHeadr">
					      			<tr>
										<th style="font-size:11px">환자명</th>
										<th style="font-size:11px">생년월일</th>
										<th style="font-size:11px">성별</th>
										<th style="font-size:11px">촬영구분</th>
										<th style="font-size:11px">촬영일</th>
					      			</tr>
					      		</thead>
					      		<tbody id="mriListTbody">
					      		
					      		</tbody>
					      	</table>
					    </div>
				      </div>
				      <div id="ct">
				      	<form id="serarchButton" class="film-search-form" name="ctSearchForm">
			               <select id="searchOption" class="film-select">
			                  <option value="no">환자번호</option>
			                  <option value="name">환자이름</option>
			               </select> 
			               <input name="searchBtn" class="film-input" id="searchWord" type="text" value="">
			               <input class="btn-submit" id="ctSearch" type="button" value="검색">
						   <input style="display:none;" type="hidden" id="paNoHidden" value=""/>
			            </form>
			            <div class="scroller filmListScroller"> 
				            <table class="table-blue scrollshover">
					      		<thead class="fixedHeadr">
					      			<tr>
										<th style="font-size:11px">환자명</th>
										<th style="font-size:11px">생년월일</th>
										<th style="font-size:11px">성별</th>
										<th style="font-size:11px">촬영구분</th>
										<th style="font-size:11px">촬영일</th>
					      			</tr>
					      		</thead>
					      		<tbody id="ctListTbody">
					      		
					      		</tbody>
					      	</table>
					    </div>
				      </div>
				      <div id="ultra">
				      	<form id="serarchButton" class="film-search-form" name="ultraSearchForm">
			               <select id="searchOption" class="film-select">
			                  <option value="no">환자번호</option>
			                  <option value="name">환자이름</option>
			               </select> 
			               <input name="searchBtn" class="film-input" id="searchWord" type="text" value="">
			               <input class="btn-submit" id="ultraSearch" type="button" value="검색">
						   <input style="display:none;" type="hidden" id="paNoHidden" value=""/>
			            </form>
			            <div class="scroller filmListScroller"> 
				            <table class="table-blue scrollshover">
					      		<thead class="fixedHeadr">
					      			<tr>
										<th style="font-size:11px">환자명</th>
										<th style="font-size:11px">생년월일</th>
										<th style="font-size:11px">성별</th>
										<th style="font-size:11px">촬영구분</th>
										<th style="font-size:11px">촬영일</th>
					      			</tr>
					      		</thead>
					      		<tbody id="ultraListTbody">
					      			
					      		</tbody>
					      	</table>
					    </div>
				      </div>
				    </div>
				</div>
			</div>	
		</div>	
	</div>	
	<div class="grid-stack-item" gs-w="2" gs-h="2" gs-x="4" gs-y="3">
		<div class="grid-stack-item-content card-grid" >
			<h4>일정</h4>
		</div>	
	</div>	
	<div class="grid-stack-item" gs-w="6" gs-h="5" gs-x="6" gs-y="0">
		<div class="grid-stack-item-content card-grid" >
			<h4>사진</h4>
			<div id="grid-container">
				<div class="grid-item" id="1">
					<img alt="HTML" src="${pageContext.request.contextPath}/resources/imagesRadi/일자목Xray.png" width="220" height="140">
					<p class="p_list_con"><span class="p_name" style="padding-right:20px">위고굼</span>ㅇㅇ</p>
				</div>
				<div class="grid-item" id="item2">
					<img alt="HTML" src="${pageContext.request.contextPath}/resources/imagesRadi/발목ct.jfif" width="220" height="140">
					<p class="p_list_con"><span class="p_name" style="padding-right:20px">홍감자</span>ㅇㅇ</p>
				</div>
				<div class="grid-item" id="item3">
					<img alt="HTML" src="${pageContext.request.contextPath}/resources/imagesRadi/척추CT.jfif" width="220" height="140">
					<p class="p_list_con"><span class="p_name" style="padding-right:20px">박춘식</span>ㅇㅇ</p>
				</div>
				<div class="grid-item" id="item4">4</div>
				<div class="grid-item" id="item5">5</div>
				<div class="grid-item" id="item6">6</div>
				<div class="grid-item" id="item7">7</div>
				<div class="grid-item" id="item8">8</div>
				<div class="grid-item" id="item9">9</div>
			</div><!-- grid-contents -->
	</div>
</div>
</div>
  <!-- Modal -->
 <div class="modal fade" id="layerpop" >
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- header title -->
			<h4 class="modal-title">촬영실 배정</h4>
			<button type="button" class="close" data-bs-dismiss="modal" style="background-color: white;">&times;</button>
      </div>
      <form id="waitForm">
	      <!-- body -->
			<div class="modal-body">
			<input type="text" name="rcpNo" id="strRcpNo" hidden/>
      		<input type="text" name="divCd" id="strDivCd" hidden/>
      		<input type="text" name="trmCd" id="strTrmCd" hidden/>
      		<input type="text" name="filmCd" id="strFilmCd" hidden/>
      		<input type="text" name="waitstCd" id="strWaitstCd" hidden />
				<fieldset>
					<label>
					  <input type="radio" name="filmCd" value="X-RAY" readonly />
					  <span>X-RAY</span>
					</label><br>
					
					<label>
					  <input type="radio" name="filmCd" value="MRI" readonly />
					  <span>MRI</span>
					</label><br>
					
					<label>
					  <input type="radio" name="filmCd" value="CT" readonly />
					  <span>CT</span>
					</label><br>
					
					<label>
					  <input type="radio" name="filmCd" value="URSONIC" readonly />
					  <span>초음파</span>
					</label>
				</fieldset>
	     	</div>
	      <!-- Footer -->
	      <div class="modal-footer ">
	        <button type="button" id="waitFormPost" class="w-btn w-btn-blue" >저장</button>
	      </div>
      </form>
    </div>
  </div>
</div>
<!-- 오프 캔버스(진료차트 확인용)-->
<form class="row g-3">
	<div class="offcanvas offcanvas-end trm" data-bs-scroll="true" 
		data-bs-backdrop="false" tabindex="-1" id="offcanvasscrolling"
			aria-labelledby="offcanvasscrollinglabel">
		<div class="offcanvas-header">
			<h4 class="offcanvas-title" id="offcanvasscrollinglabel">진료차트</h4>
			<hr>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="close"></button>
		</div>
		<!-- body -->
		<div class="offcanvas-body row g-3">
			<div class="col-md-6">
			    <label class="form-label" for="trmCd">차트코드</label>
			    <input type="text" name="trmCd" id="trmCd_offcanvas" class="form-control form-control-sm" readonly="readonly" />
			</div>
			<div class="col-md-6">
				<label class="form-label" for="rcpNo">접수번호</label> 
				<input type="text" name="rcpNo" class="form-control form-control-sm" id="rcpNo_offcanvas" readonly="readonly">
			</div>
	        <div class="col-md-6">
			    <label class="form-label" for="paNo">환자번호</label>
			    <input type="text" name="paNo" id="paNo_offcanvas" class="form-control form-control-sm" readonly="readonly" />
			</div>
	        <div class="col-md-6">
			    <label class="form-label" for="paName">환자명</label>
			    <input type="text" name="paName" id="paName_offcanvas" class="form-control form-control-sm" readonly="readonly" />
			</div>
			<div class="col-12 radiChartTable" style="margin-top: 16px;">
				<label class="form-label" >증상</label> <br>
				<div class="col-sm-10">
			      <table class= "table-blue" id="symptomTable">
			      	<thead class="fixedHeader">
			      		<tr>
			      			<td style="width: 18%; background-color:#73B6E5;">증상코드</td>
			      			<td style="background-color:#73B6E5;">증상내용</td>
			      		</tr>
			      	</thead>
								      	
			      	<tbody id = "symTbody"></tbody>
			      </table>
			    </div>
			</div>
			<div class="col-12 radiChartTable">
				<label class="form-label">상병</label>
				<div class="col-sm-10">
			      <table class= "table-blue" id="symptomTable">
			      	<thead class="fixedHeader">
			      		<tr>
			      			<td style="width: 18%; background-color:#73B6E5;">상병코드</td>
			      			<td style="background-color:#73B6E5;">상병이름</td>
			      		</tr>
			      	</thead>
								      	
			      	<tbody id = "diagTbody"></tbody>
			      </table>
			    </div> 
			</div>
			<div class="col-12 radiChartTable">
				<label class="form-label">촬영구분</label> 
				<input type="text" name="filmCd" class="form-control form-control-sm" id="filmCd_offcanvas" readonly="readonly">
			</div>
			<div class="col-12">
				<label class="form-label">기록</label> 
				<input type="text" name="mediRecord" class="form-control form-control-sm" id="mediRecord_offcanvas" readonly="readonly">
			</div>
			<div class="col-12">
				<label class="form-label" for="prMemo">비고</label>
				<textarea class="content" id="film_ne" style="height: 140px; width: 531px"></textarea>
			</div>
			<div class="form-group">
<!-- 			    <label class="film_title" for="trmCd">진료차트</label> -->
<!-- 			    <input type="ㅇ" name="trmCd" id="trmCd_offcanvas" readonly="readonly"> -->
			</div>
			<div class="form-group">
<!-- 			    <label class="film_title" for="filmCd">촬영구분코드</label> -->
<!-- 			    <input type="text" name="filmCd" id="filmCd_offcanvas" readonly="readonly"> -->
			</div>

			</div>
	</div>
</form>

<!-- 오프 캔버스2(촬영사진업로드) -->
<form class="row g-3" action="" enctype="multipart/form-data">
	<div class="offcanvas offcanvas-end film" data-bs-scroll="true"
			data-bs-backdrop="false" tabindex="-1" id="offcanvasscrolling2"
			aria-labelledby="offcanvasscrollinglabel">
		<div class="offcanvas-header">
			<h4 class="offcanvas-title" id="offcanvasscrollinglabel">촬영결과전송</h4>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="close"></button>
		</div>
		<!-- body -->
				<div class="offcanvas-body row g-3">
			<div class="col-md-6">
			    <label class="form-label" for="trmCd">차트코드</label>
			    <input type="text" name="trmCd" id="trmCd_offcanvas2" class="form-control form-control-sm" readonly="readonly" />
			</div>
			<div class="col-md-6">
				<label class="form-label" for="rcpNo">접수번호</label> 
				<input type="text" name="rcpNo" class="form-control form-control-sm" id="rcpNo_offcanvas2" readonly="readonly">
			</div>
	        <div class="col-md-6">
			    <label class="form-label" for="paNo">환자번호</label>
			    <input type="text" name="paNo" id="paNo_offcanvas2" class="form-control form-control-sm" readonly="readonly" />
			</div>
	        <div class="col-md-6">
			    <label class="form-label" for="paName">환자명</label>
			    <input type="text" name="paName" id="paName_offcanvas2" class="form-control form-control-sm" readonly="readonly" />
			</div>
			<div class="col-12">
				<label class="form-label" style="margin-top: 31px;">증상</label> <br>
				<div class="col-sm-10">
			      <table class= "table-blue" id="symptomTable2">
			      	<thead class="fixedHeader">
			      		<tr>
			      			<td style="width: 18%; background-color:#73B6E5;">증상코드</td>
			      			<td style="background-color:#73B6E5;">증상내용</td>
			      		</tr>
			      	</thead>
								      	
			      	<tbody id = "symTbody2"></tbody>
			      </table>
			    </div>
			</div>
			<div class="col-12 radiChartTable">
				<label class="form-label">상병</label>
				<div class="col-sm-10">
			      <table class= "table-blue" id="symptomTable">
			      	<thead class="fixedHeader">
			      		<tr>
			      			<td style="width: 18%; background-color:#73B6E5;">상병코드</td>
			      			<td style="background-color:#73B6E5;">상병이름</td>
			      		</tr>
			      	</thead>
								      	
			      	<tbody id = "diagTbody2"></tbody>
			      </table>
			    </div> 
			</div>
			<div class="col-12 radiChartTable">
				<label class="form-label">촬영구분/첨부파일</label> 
				<input type="text" name="filmCd" class="form-control form-control-sm" id="filmCd_offcanvas2" readonly="readonly">
			</div>
			<div class="col-12 filebox">
				<input type="file" name="prodImage" accept="image/*" multiple />
				<form:errors path="prodImage" element="span" cssClass="text-danger"/>
			</div>
			<div class="col-12">
				<label class="form-label">기록</label> 
				<input type="text" name="mediRecord" class="form-control form-control-sm" id="mediRecord_offcanvas" readonly="readonly">
			</div>
			<div class="col-12">
				<label class="form-label" for="prMemo">비고</label>
				<textarea class="content" id="film_ne" style="height: 140px; width: 531px"></textarea>
			</div>
			<div class="form-group">
<!-- 			    <input type="date" name="filmDate" id="filmDate_offcanvas" hidden> -->
			</div>
			<div class="form-group">
<!-- 			    <label class="film_title" for="filmCd">촬영구분코드</label> -->
<!-- 			    <input type="text" name="filmCd" id="filmCd_offcanvas" readonly="readonly"> -->
			</div>
			</div>
		
		    <!-- Footer -->
		    <div class="offcanvas-footer">
		       <button type="button" id="filmInsertBtn" class="btn_blue" data-dismiss="modal">저장</button>
		    </div>
	</div>
	<security:csrfInput/>
</form>

<!-- JQUERY-UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript">
GridStack.init();
radiWait_list();
xrayWait_list();
mriWait_list();
ctWait_list();
ultraWait_list();

function f_block(){
	if(event.keyCode==13){
		event.preventDefault();
	}
}

/* 검색 */
//엔터키 누르면 검색실행되게 하는 코드
$(document).ready(function(){
	//촬영결과전송 처리
	$("#filmInsertBtn").on("click",function(){
		console.log("tt");
		
		let trmCd_offcanvas2 = $("#trmCd_offcanvas2").val();
		let filmCd_offcanvas2 = $("#filmCd_offcanvas2").val();
		
		console.log("trmCd_offcanvas2 : " + trmCd_offcanvas2 + ", filmCd_offcanvas2 : " + filmCd_offcanvas2);
		
		let data = {"trmCd":trmCd_offcanvas2,"filmCd":filmCd_offcanvas2};
		
		console.log("data : " + JSON.stringify(data));
		
		
		//촬영기록 > 촬영일 업데이트 처리
		$.ajax({
			url : "updateFilmDate",
			type : "POST",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend: function(xhr) {
		    	xhr.setRequestHeader(header, token);
		    },
			success : function(resp) {
				//파일업로드 수행
				fileUpload();
				
				radiWait_list();
				xrayWait_list();
				mriWait_list();
				ctWait_list();
				ultraWait_list();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	});
	
	function fileUpload(){
		//가상의 form 태그 생성<form></form>
		let formData = new FormData();
		
// 		let filmDate = $("#filmDate_offcanvas").val(new Date().toISOString().substring(0, 10).replace("-","/"));
// 		console.log("filmDate : ",filmDate);
		let inputFile = $("input[name='prodImage']");
		let files = inputFile[0].files;
		
		console.log("files : " + files);
		
		//formdata에다 filedata를 추가
		for(let i=0;i<files.length;i++){
			formData.append("attachFiles",files[i]);
		}
		
		let strCsrf = $("input[name='_csrf']").val();
		
		console.log("strCsrf : " + strCsrf);
		
		let trmCd = $("#trmCd_offcanvas2").val();
		let rcpNo = $("input[name='rcpNo']").val();
		let paNo = $("input[name='paNo']").val();
		let paName = $("input[name='paName']").val();
		let filmCd = $("input[name='filmCd']").val();
		formData.append("trmCd",trmCd);
// 		formData.append("rcpNo",rcpNo);
// 		formData.append("paNo",paNo);
// 		formData.append("paName",paName);
// 		formData.append("filmCd",filmCd);
		
		console.log("trmCd : " + trmCd);
// 		console.log("rcpNo : " + rcpNo);
// 		console.log("paNo : " + paNo);
// 		console.log("paName : " + paName);
// 		console.log("filmCd : " + filmCd);
		
		//아작났어유ㅠㅠ 피씨다타써
		$.ajax({
			url:"${pageContext.request.contextPath}/radiology/processAttachList",
			processData:false,
			contentType:false,
			data:formData,
			type:"post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(result){
				//result : FC037
				console.log("result : " + result);
				console.log("uploaded");
				
				//업로드 된 사진 경로 가져오기
				getAttSavename(result);
			}
		});
	}
	
	//업로드 된 사진 경로 가져오기
	function getAttSavename(fiatCd){
		console.log("fiatCd : " + fiatCd);
		
		
		
	}
	
	$("#filmInsertBtn2").on("click",function(){
		//가상의 form 태그 생성<form></form>
		let formData = new FormData();
		
// 		let filmDate = $("#filmDate_offcanvas").val(new Date().toISOString().substring(0, 10).replace("-","/"));
// 		console.log("filmDate : ",filmDate);
		let inputFile = $("input[name='prodImage']");
		let files = inputFile[0].files;
		
		console.log("files : " + files);
		
		//formdata에다 filedata를 추가
		for(let i=0;i<files.length;i++){
			formData.append("attachFiles",files[i]);
		}
		
		let strCsrf = $("input[name='_csrf']").val();
		
		console.log("strCsrf : " + strCsrf);
		
		let trmCd = $("#trmCd_offcanvas2").val();
		let rcpNo = $("input[name='rcpNo']").val();
		let paNo = $("input[name='paNo']").val();
		let paName = $("input[name='paName']").val();
		let filmCd = $("input[name='filmCd']").val();
		formData.append("trmCd",trmCd);
// 		formData.append("rcpNo",rcpNo);
// 		formData.append("paNo",paNo);
// 		formData.append("paName",paName);
// 		formData.append("filmCd",filmCd);
		
		console.log("trmCd : " + trmCd);
// 		console.log("rcpNo : " + rcpNo);
// 		console.log("paNo : " + paNo);
// 		console.log("paName : " + paName);
// 		console.log("filmCd : " + filmCd);
		
		//아작났어유ㅠㅠ 피씨다타써
		$.ajax({
			url:"${pageContext.request.contextPath}/radiology/processAttachList",
			processData:false,
			contentType:false,
			data:formData,
			type:"post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(result){
				console.log("result : " + result);
				console.log("uploaded");
				
			}
		});
		
		// 하예 사진촬영 날짜 update 하는 곳
		let data = {
				trmCd : trmCd,
				filmCd : filmCd,
				filmSelected : 'Y'
		};
		console.log("data : ", data);
		
		$.ajax({
			url : "updateFilmDate",
			method : "POST",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			beforeSend: function(xhr) {
		    	xhr.setRequestHeader(header, token);
		    },
			success : function(resp) {
				radiWait_list();
				xrayWait_list();
				mriWait_list();
				ctWait_list();
				ultraWait_list();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		$("#offcanvasscrolling2").offcanvas("hide");
	});
	
	//촬영실 영억 > 촬영실구분의 특정 촬영실 클릭 시 실행
	$(document).on("click",".filmClass2",function(){
		//this : 선택한 바로 그 요소
		//<p class="filmClass2" data-trm-cd="TC0182" data-film-cd="MRI">MRI</p>
		let strTrmCd = $(this).data("trmCd");
		let strFilmCd = $(this).data("filmCd");
		let strRcpNo = $(this).data("rcpNo");
		let strDivCd = $(this).data("divCd");
		let strWaitstCd = $(this).data("waitstCd");
		
		console.log("strTrmCd : " + strTrmCd);
		console.log("filmCd : " + strFilmCd);
		console.log("strRcpNo : " + strRcpNo);
		console.log("strDivCd : " + strDivCd);
		console.log("strWaitstCd : " + strWaitstCd);
		
		$("#strTrmCd").val(strTrmCd);
		$("#strFilmCd").val(strFilmCd);
		$("#strRcpNo").val(strRcpNo);
		$("#strDivCd").val(strDivCd);
		$("#strWaitstCd").val(strWaitstCd);
		
		$("#layerpop").modal("show");
		
		$("input:radio[name='filmCd']:radio[value='"+strFilmCd+"']").prop('checked', true);
	});
	
    $("input[name=searchBtn]").keydown(function () {
		//event.stopPropagation();
        if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	console.log("체크");
            searchList();
        }
    });
    $("#Search").on("click", function(){
    	searchList();
    });
    
    searchList = function (){
        //검색 찾는 로직 구현
        let searchOption = $("#searchOption option:selected").val();
		let searchWord = $("#searchWord").val();
		
		console.log(searchOption);
		console.log(searchWord);
		
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
			beforeSend: function(xhr) {
	        	xhr.setRequestHeader(header, token);
	   		},
			dataType : "json",
			success : function(result) { 
				console.log(result);
				console.log(result.length);
				
				if(result == null || result.length == 0){
					// 기록이 없을 때
					swal('검색실패', "환자 정보가 없습니다.", "error");
				}else if(result.length == 1){
					// 기록이 하나일 때
					let trTags = [];
					$.each(result, function(i, v){
						console.log(v);
						let trTag = $("<tr>").attr("class","filmClass")
						.append(
							$("<td>").html(v.paNo)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.paReg)
							, $("<td>").html(v.paSex)
							, $("<input>").attr({
								"type":"hidden",
								"value": `\${v.paNo}`
								})
						).data("waitVO",v);
						trTags.push(trTag);
					})
					$("#radiTBody").html(trTags);
					$(".filmClass").on("click",function(){
						console.log(this);
						let value = $(this).children('input').val();
						patientChartList(value);
					})	
				}else{
					// 기록이 여러개일 때
					let trTags = [];
					$.each(result, function(i, v){
						console.log(v);
						let trTag = $("<tr>")
						.append(
							$("<td>").html(v.paNo)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.paReg)
							, $("<td>").html(v.paSex)
						).data("waitVO",v);
						trTags.push(trTag);
					})
					$("#radiTBody").html(trTags);
					
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
    
    //Mri촬영환자 검색
    searchMriList = function (){
        //검색 찾는 로직 구현
        let searchOption = $("#searchOption option:selected").val();
		let searchWord = $("#searchWord").val();
		
		console.log(searchOption);
		console.log(searchWord);
		
		if(searchWord == ''){
			swal('검색 실패!', "검색어를 입력해주세요", 'error');
			return false;
		}
		
		let data = {
			searchOption:searchOption,
			searchWord:searchWord
		}
		
		$.ajax({
			url : "mriSearch",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			beforeSend: function(xhr) {
	        	xhr.setRequestHeader(header, token);
	   		},
			dataType : "json",
			success : function(result) { 
				console.log(result);
				console.log(result.length);
				
				if(result == null || result.length == 0){
					// 기록이 없을 때
					swal('검색실패', "환자 정보가 없습니다.", "error");
				}else if(result.length == 1){
					// 기록이 하나일 때
					let trTags = [];
					$.each(result, function(i, v){
						console.log(v);
						let trTag = $("<tr>").attr("class","filmClass")
						.append(
							$("<td>").html(v.paNo)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.paReg)
							, $("<td>").html(v.paSex)
							, $("<input>").attr({
								"type":"hidden",
								"value": `\${v.paNo}`
								})
						).data("waitVO",v);
						trTags.push(trTag);
					})
					$("#radiTBody").html(trTags);
					$(".filmClass").on("click",function(){
						console.log(this);
						let value = $(this).children('input').val();
						patientChartList(value);
					})	
				}else{
					let trTags = [];
					$.each(result, function(i, v){
						console.log(v);
						let trTag = $("<tr>")
						.append(
							$("<td>").html(v.paNo)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.paReg)
							, $("<td>").html(v.paSex)
						).data("waitVO",v);
						trTags.push(trTag);
					})
					$("#radiTBody").html(trTags);
					
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
    
    
    
});


$.ajax({
	url : "patientList",
	method : "get",
	contentType : "application/json;charset=utf-8",
	dataType : "json",
	success : function(result) { 
		console.log(result);
		console.log(result.length);

		let trTags = [];
		$.each(result, function(i, v){
			console.log(v);
			let trTag = $("<tr>").attr("class","filmClass")
			.append(
				$("<td>").html(v.paNo)
				, $("<td>").html(v.paName)
				, $("<td>").html(v.paReg)
				, $("<td>").html(v.paSex)
				, $("<input>").attr({
					"type":"hidden",
					"value": `\${v.paNo}`
					})
			).data("waitVO",v);
			trTags.push(trTag);
		})
		$("#radiTBody").html(trTags);
		$(".filmClass").on("click",function(){
			console.log(this);
			let value = $(this).children('input').val();
			patientChartList(value);
		})	
	},
	error : function(jqXHR, status, error) {
		console.log(jqXHR);
		console.log(status);
		console.log(error);
	}
	
});

/* 검색 끝 */
 
/* 기록일지 입력하는 오프캔버스 출력 */ 
function filmregisterList(value){
	console.log(value);
	let data = {
		paNo : value	
	}	
}

/* 진료차트 출력 */ 
function patientChartList(value){
	console.log(value);
	let data = {
		paNo : value	
	}
	console.log(data);
	$.ajax({
		url : "chartList",
		method : "post",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(result){
			console.log("result" + result);
			console.log("왔음");
			console.log(result.length);
			if(result == null || result.length == 0){
				// 촬영완료 환자가 없을 때
				swal('진료차트 없음', "환자의 진료차트가 없습니다.", "error");
			}else{
				let trTags = [];
				$.each(result, function(i,v){
					let trTag = $("<tr>").attr({
							"class":"chartClass"
					}).append(
								$("<td>").html(v.trmCd)				
								, $("<td>").html(v.paName)			
								, $("<td>").html(v.rcpNo)
								, $("<td>").html(v.trmDt)
							)
					trTags.push(trTag);
				})
					console.log("trTags : ", trTags);
				$("#chart-tbody").html(trTags);
				$(".chartClass").on("click",function(){
					$('div.trm').offcanvas('show');
					let rcpNo = $(this).children('td').eq(2).text();
					console.log("rcpNo : ",rcpNo);
					$.ajax({
						url : "chart/"+rcpNo,
						method : "get",
						dataType : "json",
						success : function(resp) { 
							console.log("resp : ",resp);
							f_radi_register(resp);
							symptomList(resp.chartVO.trmCd);
							diseaseList(resp.chartVO.trmCd);
						},
						error : function(jqXHR, status, error) {
							console.log(jqXHR);
							console.log(status);
							console.log(error);
						}
					});
					
// 					f_radi_register(result[0].paNo, result[0].paName, result[0].trmCd, result[0].divNm);
// 					f_radi_register(resp);
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



function radiWait_list(){	
	$.ajax({
		url : "radiwaitinglist",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log("result : ",result);
			console.log(result.length);

			let trTags = [];
			$.each(result, function(i, v){

				console.log("v : " + JSON.stringify(v));
				
				let filmCdArr = v.filmCd.split(",");
				
				let filmResult = "";
				
				for(let i=0;i<filmCdArr.length;i++){
					filmResult = filmResult + "<p class='filmClass2' data-trm-cd='" + v.trmCd + "' data-film-cd='" + filmCdArr[i] + "' data-rcp-no='" + v.rcpNo + "' data-div-cd='" + v.divCd + "' data-waitst-cd='" + v.waitstCd + "'>" + filmCdArr[i] + "</p>";
				}
				
				let trTag = $("<tr>").attr({
							"data-bs-toggle":"modal999"
		 					,"href":"#layerpop"
		 					,"class":"waitClass"
					}).append(
							$("<td>").html(v.rcpNo)		
							, $("<td>").html(v.paName)		
							, $("<td>").html(filmResult)		
							, $("<td>").html("대기중")		
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
// 		let trTag = $(event.relatedTarget);
// 		console.log("trTag : ", trTag);
// 		let waitVO = trTag.data("waitVO");
// 		alert("떳다");
// 		sessionStorage.setItem("rcpNo",waitVO.rcpNo);
// 		sessionStorage.setItem("waitstCd",waitVO.waitstCd);
// 		sessionStorage.setItem("divCd",waitVO.divCd);
// 		console.log("waitVO : " + JSON.stringify(waitVO));
// 		console.log($(this).find(`[name="filmCd"][value="\${waitVO.filmCd}"]`));
// 		$(this).find(`[name="filmCd"][value="\${waitVO.filmCd}"]`).prop("checked", true);
	});

}


function filmInput(rcpNo,paName,filmCd,waitstNm){
	
	let data = {
		rcpNo : rcpNo,
		paName : paName,
		filmCd : filmCd,
		waitstNm : waitstNm
	}
	console.log("data : ",data);
}

/* tab 메뉴 */
$(function(){
	
	let filmTab = $(".filmList-tab");
	let filmTabContents = $(".filmList-tab .tabcontent > div");
	
	$('.tabcontent > div').hide();
	
	let filmTabNavs = $('.filmList-tab li a').click(function() {
		filmTabContents.hide().filter(this.hash).fadeIn();
		filmTabNavs.removeClass('active');
		$(this).addClass('active');
		return false;
	});
	filmTabNavs.eq(0).click();
});

// 진료차트 오프캔버스
function f_radi_register(resp){
	let data = resp.chartVO
	console.log("data : ",data);
	console.log("들어감");
	$("#trmCd_offcanvas").attr("value",data.trmCd);
	$("#rcpNo_offcanvas").attr("value",data.rcpNo);
	$("#paNo_offcanvas").attr("value",data.paNo);
	$("#paName_offcanvas").attr("value",data.paName);
	$("#filmCd_offcanvas").attr("value",data.filmOrderVOList[0].filmCd);
	$("#mediRecord_offcanvas").attr("value",data.mediRecord);
	
// 	let optionTags = [];
// 	$.each(data.diagHistoryVOList, function(i,v){
// 		let optionTag = $("<option>").append(v.icdName);
// 		optionTags.push(optionTag);
// 	});
// 	$("#icdNameSelect").html(optionTags);				
	
// 	$("#filmCd_offcanvas").val(data.diagHistoryVOList.icdName);
// 	$("#rcpNo_offcanvas").attr("value",data.rcpNo);
// 	$("#filmCd_offcanvas").val(data.symptomVOList.symCd);
}

// 파일업로드 오프캔버스
function f_film_register(result, gubun){
	console.log("result : " + result + ", gubun : " + gubun);

	$("#trmCd_offcanvas2").attr("value",result.chartVO.trmCd);
	$("#rcpNo_offcanvas2").attr("value",result.chartVO.rcpNo);
	$("#paNo_offcanvas2").attr("value",result.chartVO.paNo);
	$("#paName_offcanvas2").attr("value",result.chartVO.paName);
	$("#filmCd_offcanvas2").attr("value",gubun);

	let optionTags = [];
	$.each(result.chartVO.diagHistoryVOList, function(i,v){
// 		console.log("v : ",v);
// 		console.log("v : ",v.icdName);
		let optionTag = $("<option>").append(v.icdName);
		optionTags.push(optionTag);
	});
	console.log("optionTags : ",optionTags);
	$("#icdNameSelect").html(optionTags);		
}


/*오프캔버스1 증상 리스트 출력 */
function symptomList(trmCd){
	let data = {
		trmCd : trmCd
	};
	$.ajax({
		url : "symptomList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(resp) {
			console.log("증상1 들왔다 : ",resp);
			let trTags = [];
			let trTag = '';
			$.each(resp, function(i,v){
				console.log("v : ",v);
				trTag = $('<tr>').append(
							$('<td>').html(v.symCd)
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
/*오프캔버스2 증상 리스트 출력 */
function symptomList2(trmCd){
	let data = {
		trmCd : trmCd
	};
	$.ajax({
		url : "symptomList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(resp) {
			console.log("증상2 들왔다 : ",resp);
			let trTags = [];
			let trTag = '';
			$.each(resp, function(i,v){
				console.log("v : ",v);
				trTag = $('<tr>').append(
							$('<td>').html(v.symCd)
							, $('<td>').html(v.symDetail)							
						)
				trTags.push(trTag);
			})
			$('#symTbody2').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 오프캔버스1 상병 리스트 출력 */
function diseaseList(trmCd){
	let data = {
		trmCd : trmCd
	};
	$.ajax({
		url : "diagList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(resp) {
			console.log("상병1 들어옴 : ",resp);
			let trTags = [];
			let trTag = '';
			$.each(resp, function(i,v){
				trTag = $('<tr>').append(
							$('<td>').html(v.diseaseCd)
							, $('<td>').html(v.icdName)							
						)
				trTags.push(trTag);
			})
			$('#diagTbody').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/* 오프캔버스2 상병 리스트 출력 */
function diseaseList2(trmCd){
	let data = {
		trmCd : trmCd
	};
	$.ajax({
		url : "diagList",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
        	xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(resp) {
			console.log("상병2 들어옴 : ",resp);
			let trTags = [];
			let trTag = '';
			$.each(resp, function(i,v){
				trTag = $('<tr>').append(
							$('<td>').html(v.diseaseCd)
							, $('<td>').html(v.icdName)							
						)
				trTags.push(trTag);
			})
			$('#diagTbody2').html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}



/* xray 촬영 환자 리스트 출력 */
function xrayWait_list(){	
	$.ajax({
		url : "xrayList",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			let trTags = [];
			$.each(result, function(i, v){
				console.log("v : " + v);
				let trTag = $("<tr>").attr({
								"class":"xraysubmitClass"
							}).append(
									$("<td>").html(v.paName)		
									, $("<td>").html(v.paReg)		
									, $("<td>").html(v.paSex)		
									, $("<td>").html(v.filmCd)		
									, $("<td>").html(v.filmDate)		
									, $("<td>").html(v.rcpNo).hide()		
								).data("waitVO",v);
				trTags.push(trTag)
			});
			$("#xrayListTbody").html(trTags);
			$(".xraysubmitClass").on("click", function(){
				console.log(this);
				console.log("this : ",$(this).children('td').eq(5).text());
				let rcpNo = $(this).children('td').eq(5).text();
				$('div.film').offcanvas('show');
				$.ajax({
					url : "filmChart/"+rcpNo,
					method : "get",
					dataType : "json",
					success : function(resp) { 
						console.log("resp : ",resp);
						f_film_register(resp,"X-RAY");
						symptomList2(resp.chartVO.trmCd);
						diseaseList2(resp.chartVO.trmCd);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}

				});
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
/* mri 촬영 환자 리스트 출력 */
function mriWait_list(){	
	$.ajax({
		url : "mriList",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			let trTags = [];
			$.each(result, function(i, v){
				console.log(v);
				let trTag = $("<tr>").attr({
								"class":"mrisubmitClass"
							}).append(
									$("<td>").html(v.paName)		
									, $("<td>").html(v.paReg)		
									, $("<td>").html(v.paSex)		
									, $("<td>").html(v.filmCd)		
									, $("<td>").html(v.filmDate)
									, $("<td>").html(v.rcpNo).hide()
								).data("waitVO",v);
				trTags.push(trTag)
			});
			$("#mriListTbody").html(trTags);
			$(".mrisubmitClass").on("click", function(){
				console.log(this);
				console.log("this : ",$(this).children('td').eq(5).text());
				let rcpNo = $(this).children('td').eq(5).text();
				$('div.film').offcanvas('show');
				$.ajax({
					url : "filmChart/"+rcpNo,
					method : "get",
					dataType : "json",
					success : function(resp) { 
						console.log("resp : ",resp);
						f_film_register(resp,"MRI");
						symptomList2(resp.chartVO.trmCd);
						diseaseList2(resp.chartVO.trmCd);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
/* ct 촬영 환자 리스트 출력 */
function ctWait_list(){	
	$.ajax({
		url : "ctList",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			let trTags = [];
			$.each(result, function(i, v){
				console.log(v);
				let trTag = $("<tr>").attr({
								"class":"ctsubmitClass"
							}).append(
									$("<td>").html(v.paName)		
									, $("<td>").html(v.paReg)		
									, $("<td>").html(v.paSex)		
									, $("<td>").html(v.filmCd)		
									, $("<td>").html(v.filmDate)	
									, $("<td>").html(v.rcpNo).hide()
								).data("waitVO",v);
				trTags.push(trTag)
			});
			$("#ctListTbody").html(trTags);
			$(".ctsubmitClass").on("click", function(){
				console.log(this);
				console.log("this : ",$(this).children('td').eq(5).text());
				let rcpNo = $(this).children('td').eq(5).text();
				$('div.film').offcanvas('show');
				$.ajax({
					url : "filmChart/"+rcpNo,
					method : "get",
					dataType : "json",
					success : function(resp) { 
						console.log("resp : ",resp);
						f_film_register(resp,"CT");
						symptomList2(resp.chartVO.trmCd);
						diseaseList2(resp.chartVO.trmCd);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
/* 초음파 촬영 완료 환자 리스트 출력 */
function ultraWait_list(){	
	$.ajax({
		url : "ultraList",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result){
			console.log(result);
			console.log(result.length);
			let trTags = [];
			$.each(result, function(i, v){
				console.log("여기다 : ",v);
				let trTag = $("<tr>").attr({
								"class":"ultrasubmitClass"
							}).append(
									$("<td>").html(v.paName)		
									, $("<td>").html(v.paReg)		
									, $("<td>").html(v.paSex)		
									, $("<td>").html(v.filmCd)		
									, $("<td>").html(v.filmDate)
									, $("<td>").html(v.rcpNo).hide()
								).data("waitVO",v);
				trTags.push(trTag)
			});
			$("#ultraListTbody").html(trTags);
			$(".ultrasubmitClass").on("click", function(){
				console.log(this);
				console.log("this : ",$(this).children('td').eq(5).text());
				let rcpNo = $(this).children('td').eq(5).text();
				$('div.film').offcanvas('show');
				$.ajax({
					url : "filmChart/"+rcpNo,
					method : "get",
					dataType : "json",
					success : function(resp) { 
						console.log("resp : ",resp);
						f_film_register(resp,"URSONIC");
						symptomList2(resp.chartVO.trmCd);
						diseaseList2(resp.chartVO.trmCd);
					},
					error : function(jqXHR, status, error) {
						console.log(jqXHR);
						console.log(status);
						console.log(error);
					}
				});
			});
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

/////////////////////모달//////////////////
 
$("#waitFormPost").on("click",function(){
	console.log(this);
	let trmCd = $("#strTrmCd").val();
	let rcpNo = $("#strRcpNo").val();
	let waitstCd = $("#strWaitstCd").val();
	let divCd = $("#strDivCd").val();
	let filmCd = $("#strFilmCd").val();

	let data = {
			trmCd : trmCd,
			rcpNo : rcpNo,
			waitstCd : waitstCd,
			divCd : divCd,
			filmCd : filmCd
	};
	console.log("data : ", data);
	
	$.ajax({
		url : "changeWaitList",
		method : "POST",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		beforeSend: function(xhr) {
	    	xhr.setRequestHeader(header, token);
	    },
		success : function(resp) {
			radiWait_list();
			xrayWait_list();
			mriWait_list();
			ctWait_list();
			ultraWait_list();
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
// 	$("#radiUBody").append($(myTR));
	$("#layerpop").modal("hide");
});


// 모달 움직이게
let $modal = $("#layerpop");
$modal.draggable({
  handle: ".modal-header",
});
$modal.resizable();

</script>      

</body>
