<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/ptStyle.css" rel="stylesheet" />
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/x2js/1.2.0/xml2json.min.js"></script>
<!-- 차트js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>공통기능</title>
<style> 
.button-input {
	width: 5.25rem;
	height: 1.7rem;
	background-color: #004262;
	color: white;
	border: none;
	font-size: 13px;
	float: right;
}
#goodsShowDiv , #updateDiv {
	display: none;
}
  .ck-editor__editable { height: 200px; }
  .ck-content { font-size: 12px; }
/* 풀캘린더 */
.scheduleCalendar{width: 46.7rem; height: 40.7rem;}
</style>

<!-- 그리드 스택  -->
<div class="grid-stack">
	<!-- 그리드스택 아이템 공지사항 -->
	<div class="grid-stack-item" gs-w="4" gs-h="3">
		<div class="grid-stack-item-content">
			<div>
				<h4 class="h4-title1">공지사항</h4>
				<hr>
				<form class="search-form" name="searchForm">
					<select id="searchOption" class="radi-select ">
						<option value>검색</option>
						<option value='title'>제목</option>
						<option value='content'>내용</option>
					</select> 
					<input name="searchBtn" class="radi-input" id="searchWord" type="text" value=""> 
					<input class="btn-submit" id="Search" type="button" value="검색"> 
					<input class="btn-submit" id="Write" type="button" value="글 쓰기" onclick="newWrite()">
				</form>
			</div>

			<div class="scroller">
				<table class="table2 table-blue scrollshover">
					<thead class="fixedHeader">
						<tr>
							<td>순번</td>
							<td>제목</td>
							<td>내용</td>
							<td>등록일자</td>
							<td>등록자</td>
						</tr>
					</thead>
					<tbody id="noticeBody">
						<c:forEach items="${selectNoticeList}" var="noticeList">
							<tr>
								<td>${noticeList.ntcCd}</td>
								<td><button class="detailButtonClass" type="button" id="detailButton" onclick="updateBox()"
									data-ntc-cd = "${noticeList.ntcCd}"
    								data-ntc-title = "${noticeList.ntcTitle}"
    								data-ntc-cont = "${noticeList.ntcCont}"
    								data-ntc-endt = "${noticeList.ntcEndt.substring(0,10)}"
    								data-ntc-hit = "${noticeList.ntcHit}"
    								data-emp-no = "${noticeList.empNo}">${noticeList.ntcTitle}</button></td>
								<td>${noticeList.ntcCont}</td>
								<td>${noticeList.ntcEndt.substring(0,10)}</td>
								<td>${noticeList.empNo}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div id="goodsShowDiv">
				<div>
					<h4 class="h4-title1">공지사항 작성하기</h4>
					<hr>
				</div>
				<form id="writeForm" name="writeForm">
					<div class="mb-3 row">
						<label for="ptDocument-input" class="col-sm-3 col-form-label">제목</label>
						<div class="col-sm-9">
							<input type="text" class="form-control writeChartCd " name="ntcTitle" id="writeChartCd"> 
							<input type="hidden" class="form-control writeChartCd " name="ntcTitle" id="writeChartCdA">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">내용</label>
						<div class="col-sm-9">
							<textarea class="form-control" name="pdCont" id="ntcCont"></textarea>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="ptDocument-input" class="col-sm-3 col-form-label">등록자</label>
						<div class="col-sm-9">
						<input type="text" class="form-control writeChartCd " name="empNo" id="writeChartCdB"> 
					</div>
					</div>
					<input class="form-input" id="writeInsert" type="button" value="등록" onclick="writeInsertClick();" />
				</form>
			</div>
			
			
			<div id="updateDiv">
				<div>
					<h4 class="h4-title1">공지사항 수정하기</h4>
					<hr>
				</div>
				<form id="writeForm" name="writeForm">
					<div class="mb-3 row">
						<label for="ptDocument-input" class="col-sm-3 col-form-label">제목</label>
						<div class="col-sm-9">
							<input type="text" class="form-control writeChartCd " name="ntcTitle" id="writeChartCd"> 
							<input type="hidden" class="form-control writeChartCd " name="ntcTitle" id="writeChartCdA">
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">내용</label>
						<div class="col-sm-9">
							<textarea class="form-control" name="pdCont" id="ntcCont"></textarea>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="ptDocument-input" class="col-sm-3 col-form-label">등록자</label>
						<div class="col-sm-9">
						<input type="text" class="form-control writeChartCd " name="empNo" id="writeChartCdB"> 
					</div>
					</div>
					<input class="form-input" id="writeInsert" type="button" value="수정" onclick="writeUpdateClick();" />
				</form>
			</div>
		</div>
	</div>
	
	<!-- 그리드스택 스케줄러 -->
	<div class="grid-stack-item" gs-w="5" gs-h="5" gs-no-resize="true" gs-no-move="true">
		<div class="grid-stack-item-content">
			<h4 class="h4-title1">스케줄러</h4>
			<p class="pTag">원하는 일자를 클릭하거나 드래그하면 일정을 등록하실 수 있습니다.</p>
			<hr>
			<div class="scheduleCalendar" id='calendar' data-source="${pageContext.request.contextPath}/notice/noticeView/events"></div>
		</div>
	</div>
	
	<!-- 그리드스택 통계 -->
	<div class="grid-stack-item" gs-w="3" gs-h="5">
		<div class="grid-stack-item-content">
			<h4 class="h4-title1">통계</h4>
			<p class="pTag">카테고리를 클릭해 항목별 반영여부를 설정할 수 있습니다.</p>
			<hr>
			<h6>일별 접수환자수</h6>
			<div>
				날짜 범위:
				<input id="statisticsStart" type="date">
				~
				<input id="statisticsEnd" type="date">
				<input id="statisticsBtn" class="btn_blue" type="button" value="조회"/>
			</div>
			<div>
				<canvas id="myChart"></canvas>
			</div>
			<hr>
			<h6>연령별 환자비율</h6>
			<div class="chart-div">
				<canvas id="patientAgeChart" style="margin-left: 70px;"></canvas>
			</div>
		</div>
	</div>
	
	<div class="grid-stack-item" gs-w="4" gs-h="2" gs-no-resize="true" gs-no-move="true">
		<div class="grid-stack-item-content">
			<h4 class="h4-title1">정형외과 소식</h4>
			<p class="pTag">다른 뉴스를 원하시면 검색 버튼을 클릭해주세요.</p>
			<hr style="margin-bottom: 4px;">
			<form class="search-form" name="searchForm">
				<input name="searchBtn" type="hidden" value="정형외과" id="schTxt">
				<input class="btn-submit" type="button" value="검색" onclick="f_sch()">
			</form>
			<table class="table-blue">
			
				<colgroup>
					<col width="80%">
					<col width="20%">
				</colgroup>
				
				<thead>
					<tr>
						<th>제목</th>
						<th>일자</th>
					</tr>
				</thead>
				<tbody id="newsTbody"></tbody>	
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
        <h4 class="modal-title h4-title2">스케줄정보</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
		 <div class="mb-3 row">
		    <label for="empNm" class="col-sm-2 col-form-label">직원명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="modal_empNm" readonly="readonly" disabled>
		    </div>
		 </div>
		 <div class="mb-3 row">
		    <label for="empNo" class="col-sm-2 col-form-label">직원번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="modal_empNo" readonly="readonly" disabled>
		    </div>
		 </div>
		 <div class="mb-3 row">
			    <label for="wsNo" class="col-sm-2 col-form-label">근무번호</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="modal_wsNo" readonly="readonly" disabled>
			    </div>
		 </div>
		 <div class="mb-3 row">
		 	<label for="wsOption" class="col-sm-2 col-form-label">근무항목</label>
			<div class="col-sm-10">
				<select class="form-select" id="wsDetailSelect">
					<option value="choice">선택</option>
					<c:forEach items="${wsOptionList}" var="work">
						<option value="${work.wsdCd}">${work.wsdName}</option>
					</c:forEach>
			    </select>
		 	</div>
		 </div>
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" id="wsUpdateBtn" class="btn_blue">저장</button>
        <button type="button" class="btn_blue" data-bs-dismiss="modal">닫기</button>
        <button type="button" id="wsCancleBtn" class="btn_red" data-bs-dismiss="modal">삭제</button>
      </div>
    </div>
  </div>
</div>
<!-- *******************모달 끝************************* -->
<script type="text/javascript">
//공지사항 수정 Update
function writeUpdateClick() {
	alert("뀨");
}
$(".detailButtonClass").on("click", function(){
	let ntcCd = $(this).data("ntcCd");
	let ntcTitle = $(this).data("ntcTitle");
	let ntcCont = $(this).data("ntcCont");
	let empNo = $(this).data("empNo");
	
	console.log("ntcCd : " , ntcCd , "ntcTitle : ",ntcTitle, "ntcCont : ",ntcCont, "empNo : ",empNo);
	$.ajax({
		url : "/HurryUp/notice/noticeWriteInsert",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		success : function(resp) {

		},
		erro : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
});


//공지사항 작성 Insert
function writeInsertClick(){
	let ntcTitle = $("input[name=ntcTitle]").val();
	let ntcCont = $("#ntcCont").val();
	let data = {
			"ntcTitle" : ntcTitle,
			"ntcCont" : ntcCont
	}
	
	$.ajax({
		url : "/HurryUp/notice/noticeWriteInsert",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		success : function(resp) {
			Swal.fire('공지사항 등록이 완료되었습니다', '  ', 'success');
			$(".form-control").val(''); //등록 완료 후 input태그 안에 텍스트 제거
			console.log("======resp : " + resp);
		},
		erro : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);

		}
	});
}



console.log("${selectNoticeList}"); //이엘테그 하려면 이렇게 써야함 

//글쓰기 part hide / show 반복 start
function newWrite() {
	$("#goodsShowDiv").show();
	$("#Write").click(function(event) {
		$("#goodsShowDiv").toggle();
	});
}

function updateBox() {
	$("#updateDiv").show();
	$("#detailButton").click(function(event) {
		$("#updateDiv").toggle();
	});
}
//글씨기 part hide/ show 반복 끝

//그리드 스택 시작	
GridStack.init();

//ckeditor
ClassicEditor.create( document.querySelector( '#ntcCont' ),{
	language: "ko"
} );

/* 밀리세컨드를 날짜로 변환해주는 함수 */
function convertDate(milliSecond) {
	  const data = new Date(milliSecond);  //Date객체 생성

	  const year = data.getFullYear();    //0000년 가져오기
	  const month = String(data.getMonth() + 1).padStart(2,"0");  //월은 0부터 시작하니 +1하기
	  const date = data.getDate();        //일자 가져오기
	  return `\${year}/\${month}/\${date}`;
}

/* 풀캘린더 */
document.addEventListener('DOMContentLoaded', function calendarLoad() {
	var v_emp = empOption();
	var options = {};
	$.map(v_emp, function(o){
		options[o.empNo] = o.empNm;
	});
	var today = new Date();
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	initialView: 'dayGridMonth',
    	selectable: true, // 달력 일자 드래그 설정가능
    	allDaySlot: true,
    	slotEventOverlap: false, // 시간 중복 방지
    	locale: 'ko',
    	businessHours: {
    		  daysOfWeek: [ 1, 2, 3, 4, 5, 6 ], // Monday - Saturday
    	},
//     	selectConstraint:"businessHours",
    	headerToolbar: {
            left: 'dayGridMonth,listWeek', 
            center: 'title',	
            right: 'prev,next today'
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
        	const {value:emp} = Swal.fire({
  			  title: "스케줄등록",
  			  icon: "info",
  			  input: 'select',
  			  inputOptions: options,
  			  inputPlaceholder: "등록 대상자를 선택해주세요",
  			  showCancelButton: true,
  			  inputValidator: (value)=>{
  				  return new Promise((resolve)=>{
  					 if(value){
  						let v_wsStartDt = convertDate(arg.start.getTime());
						let v_wsEndDt = convertDate(arg.end.getTime());
						console.log(value)
						let data = {
							"empNo" : value,
							"wsStartDt" : v_wsStartDt,
							"wsEndDt" : v_wsEndDt
						}
						
						$.ajax({
							url : "scheduleInsert",
							method : "post",
							data : JSON.stringify(data),
							contentType : "application/json;charset=utf-8",
							beforeSend: function(xhr) {
					            xhr.setRequestHeader(header, token);
					    	},
							dataType : "json",
							success : function(result) {
								if(result==1){
									Swal.fire("등록성공", "스케줄등록이 성공되었습니다.", "success");
									calendarLoad();
								}
							},
							error : function(jqXHR, status, error) {
								console.log(jqXHR);
								console.log(status);
								console.log(error);
							}
						});	 
  					 } else{
  						 
  					 }
  				  });
  			  }
  			})

          calendar.unselect()    	
        },
        eventSources : [
    		{
    			url:calendarEl.dataset.source,
    			dataType:"json",
    		}
    	],
    	initialDate : today,
    	eventClick:function(event){
    		let wsNo = event.event._def.publicId;
    		let data = {
    				"wsNo" : wsNo
    		}
    		
    		$.ajax({
				url : "scheduleDetailSelect",
				method : "post",
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
				beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
		    	},
				dataType : "json",
				success : function(result) {
					console.log(result);
					/* 모달창에 값 입력 */
					$('#modal_wsNo').val(result.wsNo);
					$('#modal_empNm').val(result.empNm);
					$('#modal_empNo').val(result.empNo);
					
					let wsdCd = result.wsdCd;
					let wsDetailSelect = $('#wsDetailSelect');
					
					wsDetailSelect.val(wsdCd).prop("selected",true);
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
	            	
        }
    });	
	
    calendar.render();
	
    $('#wsUpdateBtn').on('click', function(event){
    	let v_wsNo= $('#modal_wsNo').val();
    	let v_wsdCd = $('#wsDetailSelect option:selected').val();
    	
    	console.log(v_wsNo)
    	console.log(v_wsdCd)
    	
    	let data = {
    			wsNo : v_wsNo,
    			wsdCd : v_wsdCd
    	}
    	
    	$.ajax({
    		url : "wsUpdate",
    		method : "post",
    		data : JSON.stringify(data),
    		contentType : "application/json;charset=utf-8",
    		beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
        	},
    		dataType : "json",
    		success : function(result) {
    			if(result == 1){
    				Swal.fire("변경성공", "근무정보 변경에 성공했습니다", "success");
    				/* 캘린더 재출력 */
    				calendarLoad();
    				$('div.modal').modal("hide");
    			}else{
    				Swal.fire("변경실패","근무정보 변경에 실패했습니다","error");			
    			}
    		},
    		error : function(jqXHR, status, error) {
    			console.log(jqXHR);
    			console.log(status);
    			console.log(error);
    		}
    	});
    	
    });
    
    /* 근무정보삭제 */
    $('#wsCancleBtn').on('click',function(event){
    	let v_wsNo = document.getElementById('modal_wsNo').value;
    	
    	Swal.fire({
    		title: '근무일정삭제',
    		text: '정말 삭제하시겠습니까?',
    		icon: 'warning',
    		showCancelButton: true,
    		confirmButtonColor: '#004262',
    		cancelButtonColor: '#ff3333',
    		confirmButtonText: "확인",
    		cancelButtonText: "취소"
    	}).then((result) => {
    		if(result.isConfirmed){
    			let data = {
    	    			wsNo : v_wsNo
    	    		}
    	    		$.ajax({
    					url : "wsDelete",
    					method : "post",
    					data : JSON.stringify(data),
    					contentType : "application/json;charset=utf-8",
    					beforeSend: function(xhr) {
    			            xhr.setRequestHeader(header, token);
    			    	},
    					dataType : "json",
    					success : function(result) {
    						if(result == 1){
	    						Swal.fire(
	    		    				      '삭제성공!',
	    		    				      '근무일정이 삭제 되었습니다.',
	    		    				      'success'
	    		    			)
	    		    			/* 캘린더 재출력 */
    							calendarLoad();		
    						}else{
    							Swal.fire(
	    		    				      '삭제실패!',
	    		    				      '근무일정 삭제에 실패했습니다.',
	    		    				      'error'
	    		    			)
    						}
    					},
    					error : function(jqXHR, status, error) {
    						console.log(jqXHR);
    						console.log(status);
    						console.log(error);
    					}
    				});
    		} else{
    			Swal.fire('취소되었습니다')
    		}

    	});
    });
});

function empOption(){
	let v_emp = '';
	$.ajax({
		url : "selectEmp",
		method : "get",
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		async: false,
		success : function(result) {
			v_emp = result;
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	return v_emp;
}

/* 일자별 환자수 차트 */
const ctx = document.getElementById('myChart');

let receptionChart = new Chart(ctx, {
	  type: 'line',
	  data: {
	    labels: [],
	    datasets: [{
	      label: '# of Votes',
	      data: [],
	      borderWidth: 1
	    }]
	  },
	  options: {
	    scales: {
	      y: {
	        beginAtZero: true
	      }
	    }
	  }
});

/* 조회버튼 클릭시 차트반영해서 다시 출력 */
$('#statisticsBtn').on('click', function getLabels(){
	receptionChart.destroy();
	let startVal = $('#statisticsStart').val();
	let endVal = $('#statisticsEnd').val();
	
	let startDate = new Date(startVal);
	let endDate = new Date(endVal);

	const diff = endDate - startDate;
	const diffDay = Math.floor(diff/(1000*60*60*24));
	
	if(diffDay>0){
		startDate = startDate.getTime();
		let labels = [];
		let datas = [];
		labels.push(convertDate(startDate));
		for(let i=0; i<diffDay; i++){
			startDate = startDate + (1000*60*60*24);
			labels.push(convertDate(startDate));
		}
		
		for(let i=0; i<labels.length; i++){
			rcpDate = labels[i];
			let data = {
					rcpDate : rcpDate
			}
			$.ajax({
				url : "countReception",
				method : "post",
	    		data : JSON.stringify(data),
	    		contentType : "application/json;charset=utf-8",
	    		beforeSend: function(xhr) {
	                xhr.setRequestHeader(header, token);
	        	},
	    		dataType : "json",
				success : function(result) {
					datas.push(result);
					receptionChart.update();
				},
				error : function(jqXHR, status, error) {
					console.log(jqXHR);
					console.log(status);
					console.log(error);
				}
			});
		}
		
		const ctx = document.getElementById('myChart');
	
			receptionChart = new Chart(ctx, {
			  type: 'line',
			  data: {
			    labels: labels,
			    datasets: [{
			      label: '# 환자 수(단위:명)',
			      data: datas,
			      borderWidth: 1
			    }]
			  },
			  options: {
			    scales: {
			      y: {
			        beginAtZero: true
			      }
			    }
			  }
		});
		
	}else{
		Swal.fire("조회실패","종료날짜가 시작날짜보다 늦어야합니다.", "error");
	}
});

/* 연령별 환자비율 차트  */
window.onload = function () {
    pieChartDraw();
}

let pieChartData = {
    labels: ['10대', '20대', '30대', '40대', '50대', '60이상'],
    datasets: [{
        data: [10, 20, 35, 30, 10, 40],
        backgroundColor: ['rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)']
    }] 
};

let pieChartDraw = function () {
    let ctx = document.getElementById('patientAgeChart').getContext('2d');
    
    window.pieChart = new Chart(ctx, {
        type: 'pie',
        data: pieChartData,
        options: {
            responsive: false,
            legend: {
                display: false
            },
            legendCallback: customLegend
        }
    });
};

let customLegend = function (chart) {
    let ul = document.createElement('ul');
    let color = chart.data.datasets[0].backgroundColor;

    chart.data.labels.forEach(function (label, index) {
        ul.innerHTML += `<li data-index="\${index}"><span style="background-color: \${color[index]}"></span>\${label}</li>`;
    });

    return ul.outerHTML;
};

/* 랜덤숫자생성 */
function ranNum() {
	let random = [];
	let i = 0;
	while (i < 4) {
	  let n = Math.floor(Math.random() * 100);
	  if (notSame(n)) {
	  	random.push(n);
	    i++;
	  }
	}
	function notSame (n) {
	  return random.every((e) => n !== e);
	}
	return random;
}

/* 밀리세컨드를 날짜로 변환해주는 함수 */
function convertDate(milliSecond) {
	  const data = new Date(milliSecond);  //Date객체 생성

	  const year = data.getFullYear();    //0000년 가져오기
	  const month = String(data.getMonth() + 1).padStart(2,"0");  //월은 0부터 시작하니 +1하기
	  const date = String(data.getDate()).padStart(2,"0");        //일자 가져오기

	  return `\${year}/\${month}/\${date}`;
}

/* 뉴스띄우기 */
var x2js = new X2JS();

function f_sch(){

    let schVal = document.querySelector("#schTxt").value;
    let xhr = new XMLHttpRequest();
    xhr.open("get","/HurryUp/commons/sch/" + schVal,true);
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4 && xhr.status == 200){
            var jsonObj = x2js.xml_str2json( xhr.responseText );
	    	console.log(jsonObj)
	    	
            let item = jsonObj.rss.channel.item;
            let trTags=[];
            let trTag='';
            let ranArr = ranNum();
            
            for(let i=0; i<4; i++){
            	let ranNum = ranArr[i];
            	let newsDate = convertDate(item[ranNum].pubDate);
            	
            	trTag = $('<tr>').append(
            				$('<td>').append(
            					$('<a>').attr({"href":item[ranNum].link,"target":"_blank"}).html(item[ranNum].title)
            				),
            				$('<td>').html(newsDate)
            			);
            	trTags.push(trTag);
            }
            $('#newsTbody').html(trTags);
        }
    }
    xhr.send();
}
/* 창 열자마자 검색 한 번 */
f_sch();
</script>