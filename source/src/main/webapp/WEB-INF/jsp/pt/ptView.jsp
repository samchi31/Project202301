<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/ptStyle.css" rel="stylesheet" />
<title>물리치료사</title>

<!-- 그리드 스택  -->
<div class="grid-stack">
	<!-- 그리드스택 아이템 1 (물리치료실 현황/물리치료 대기실) -->
	<div class="grid-stack-item" gs-w="4" gs-h="5">
		<div class="grid-stack-item-content">
			<h4 class="h4-title1">물리치료실 현황</h4>
			<hr>
			<table class="table2">
				<c:set var="cnt" value="0" />
				<c:forEach begin="0" end="2">
					<tr>
						<c:forEach begin="0" end="2">
							<td>
								<button id="${ptBedList[cnt].ptBedCd }" type="button" class="bedbutton" data-rcp-no="${ptBedList[cnt].rcpNo }" onclick="f_clk(this)">
									<c:if test="${empty ptBedList[cnt].rcpNo}">
										<c:url value='/resources/images/ptbedemty.png' var="imgUrl" />
									</c:if>
									<c:if test="${not empty ptBedList[cnt].rcpNo}">
										<c:url value='/resources/images/ptbedfull.png' var="imgUrl" />
									</c:if>
									<img src="${imgUrl}" alt="물리치료bed" class="pic pthis" />
									<div class="patient">${ptBedList[cnt].rcpNo }${ptBedList[cnt].paName}</div>
								</button>
							</td>
							<c:set var="cnt" value="${cnt+1 }" />
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
			
			<h4 class="h4-title1">물리치료실 대기 현황</h4>
			<hr>
			<table class="table1 table-blue scrollshover">
				<thead>
					<tr >
						<td>환자 번호</td>
						<td>환자 이름</td>
						<td>생년월일</td>
						<td>배정</td>
					</tr>
				</thead>
				<c:set var="cnt" value="0" />
				<c:forEach items="${ptAssinmentList}" var="ptAssinment">
					<tr id="tr_${ptAssinment.rcpNo }">
						<td>
							<button id="ptNoDt" type="button" data-rcp-no="${ptAssinment.rcpNo}" onclick="ptNoDtClick(this)">${ptAssinment.paNo}</button>
						</td>
						<td>${ptAssinment.paName}</td>
						<td>${ptAssinment.paReg}</td>
						<td>
							<button class="assignmentbutton" type="button"
								data-pa-no="${ptAssinment.paNo}"
								data-rcp-no="${ptAssinment.rcpNo }"
								data-name="${ptAssinment.paName}"
								data-reg="${ptAssinment.paReg}">배정</button>
						</td>
					</tr>
					<c:set var="cnt" value="${cnt+1}"></c:set>
				</c:forEach>
			</table>
		</div>
	</div>

	<!-- 그리드스택 아이템 2 치료일지작성 (대기 환자 중인 번호를 누르면 치료 받을 환자의 진료차트가 뜬다/고정값 빼고 치료 내용만 인서트가 가능함 -->
	<div class="grid-stack-item" gs-w="2" gs-h="5">
		<div class="grid-stack-item-content">
			<div>
				<h4 class="h4-title1">치료 일지</h4>
				<hr>
				<form id="writeForm" name="writeForm">
					<div class="mb-3 row">
						<label for="ptDocument-input" class="col-sm-3 col-form-label">진료차트</label>
						<div class="col-sm-9">
							<input type="text" class="form-control writeChartCd " name="trmCd" id="writeChartCd" readonly="readonly" disabled>
							<input type="hidden" class="form-control writeChartCd " name="trmCd" id="writeChartCd" readonly="readonly"  >
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">진료일자</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"  id="writeChartDate" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">접수번호</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"  id="writeChartPaNo" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">이름</label>
						<div class="col-sm-9"> 
							<input type="text" class="form-control"  id="writeChartPaNm" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">생년월일</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="writeChartPaReg" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">상병코드</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="writeChartRc" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">증상
						</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"  id="writeChartRl" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">진료실</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"  id="writeChartRoom" readonly="readonly" disabled>
						</div>
					</div>
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">치료부위</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"  id="pdPart" readonly="readonly" disabled>
						</div>
					</div>
					
					<div class="mb-3 row">
						<label for="inputPassword" class="col-sm-3 col-form-label">치료내용</label>
						<div class="col-sm-9">
							<textarea class="form-control" name="pdCont" id="writeChartText"></textarea>
						</div>
					</div>
					<input class="form-input" id="writeInsert" type="button" value="등록" onclick="writeInsertClick();"/>
				</form>
			</div>
		</div>
	</div>
	<!-- 그리드 스택3 치료부위 -->
	<div class="grid-stack-item" gs-w="2" gs-h="5">
		<div class="grid-stack-item-content">
			<h4 class="h4-title1">치료 부위</h4>
			<hr>
			<h6>근육계</h6>
			<div style="padding-bottom: 10px;" class="curePartSelect">
				목<input type="radio"  name="hh" onclick="f_move(this.id,1)" id = "muscleNeck" data-pa-part="muscle_neck" >
				어깨<input type="radio" name="hh"  onclick="f_move(this.id,2)" id = "muscleShoulder" data-pa-part="muscle_shoulder">
				허리<input type="radio" name="hh"  onclick="f_move(this.id,3)" id = "muscleWaist" data-pa-part=" muscle_waist">
				팔<input type="radio" name="hh"  onclick="f_move(this.id,4)" id = "muscleArm" data-pa-part="muscle_arm">
				무릎<input type="radio" name="hh"  onclick="f_move(this.id,5)" id = "muscleKnee" data-pa-part="muscle_knee">
				종아리<input type="radio" name="hh"  onclick="f_move(this.id,6)" id = "muscleCalf" data-pa-part="muscle_calf">
			</div>
			<div id="curePart">
			 	<div class="circle" id="ball"></div>
				<img alt="HTML" id="human" src="${pageContext.request.contextPath}/resources/images/human.png" />
			</div>
			<h6>골절</h6>
			<div style="padding-bottom: 10px;" class="curePartSelect">
				목<input type="radio"  name="hh1" onclick="f_bonemove(this.id,1)" id = "boneNeck" data-pa-part="bone_neck">
				갈비뼈<input type="radio" name="hh1"  onclick="f_bonemove(this.id,2)" id = "boneRip" data-pa-part=" bone_rip">
				척추<input type="radio" name="hh1"  onclick="f_bonemove(this.id,3)" id = "boneSpaine" data-pa-part="bone_spaine">
				손목<input type="radio" name="hh1"  onclick="f_bonemove(this.id,4)" id = "boneWrist" data-pa-part="bone_wrist">
				종아리<input type="radio" name="hh1"  onclick="f_bonemove(this.id,5)" id = "boneCalf" data-pa-part="bone_calf">
				발목<input type="radio" name="hh1"  onclick="f_bonemove(this.id,6)" id = "boneAncle" data-pa-part="bone_ancle">
			</div>
			<div id="curePart2">
			 	<div id="ball2"></div>
				<img alt="HTML" id="bone" src="${pageContext.request.contextPath}/resources/images/bone.png" />
			</div>
		</div>
	</div>

	<!-- 그리드스택 아이템4 (환자 검색)/엔터키 누르면 검색 실행됨 -->
	<div class="grid-stack-item" gs-w="4" gs-h="2">
		<div class="grid-stack-item-content">
			<div>
				<h4 class="h4-title1">환자 조회</h4>
				<hr style="margin-bottom: 0px; margin-top: 13px;">
				<form  class="search-form" name="searchForm">
					<select id="searchOption" class="radi-select ">
						<option value>검색</option>
						<option value='name'>이름</option>
						<option value='no'>환자번호</option>
					</select> 
					<input name="searchBtn" class="radi-input" id="searchWord" type="text" value="">
					<input class="btn-submit" id="Search" type="button" value="검색"> 
				</form>
			</div>
			<div class="scroller">
				<table class="table1 table-blue scrollshover" style="margin-top: 0px;margin-bottom: 0px;">
					<thead class="fixedHeader">
						<tr>
							<td>환자번호</td>
							<td>이름</td>
							<td>생년월일</td>
							<td>성별</td>
							<td>내원일자</td>
						</tr>
					</thead>
					<tbody id="ptViewBody">
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- 그리드스택 아이템 5 (이전 물리치료 기록서 /read/search) -->
	<div class="grid-stack-item" gs-w="4" gs-h="3">
		<div class="grid-stack-item-content">
			<div>
				<h4 class="h4-title1">이전 치료 일지</h4>
				<hr style="margin-bottom: 0px; margin-top: 13px;">
				<form class="search-form" name="searchBtnFormA">
					<select id="searchDocuOptionA" class="radi-select ">
						<option value>검색</option>
						<option value='name'>이름</option>
						<option value='no'>환자번호</option>
					</select> 
					<input name="searchBtnA" class="radi-input" id="searchWordA" type="text" value="">
					<input class="btn-submit" id="agoSearch" type="button" value="검색"> 
				</form>
			</div>
			<div class="scroller" style="height: 311px;">
				<table class="table1 table-blue scrollshover" style="margin-top: 0px;">
					<thead class="fixedHeader">
						<tr>
							<td>환자 번호</td>
							<td>이름</td>
							<td>생년월일</td>
							<td>차트번호</td>
							<td>내용</td>
						</tr>
					</thead>
					<tbody id="ptDocumentBody">
					
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<!-- Script Start -->
<script type="text/javascript">

//근육계 치료부위 위치 조절
const partBall = document.querySelector("#ball");
function f_move(ID, p_num){
// 	alert("실행됨?")
    if(p_num == 1){
        //목
        partBall.style.left = "20%";
        partBall.style.top = "10%";
        partBall.style.zIndex = 10;
		let muscleNeck = $("#muscleNeck").data();
		$("#pdPart").val(ID);
        return; //if문에서 return문을 쓰게 되면, 다음실행문을 실행하지 않고 딱 그 부분만 실행 할 수 있다
    }
    if(p_num == 2){
        // 어깨
        partBall.style.left = "28%";
        partBall.style.top = "13%";
        partBall.style.zIndex = 10;
        let muscleShoulder = $("#muscleShoulder").data();
        $("#pdPart").val(ID);
        return;
    }
    if(p_num == 3){
        // 허리
        partBall.style.left = "21%";
        partBall.style.top = "30%";
        partBall.style.zIndex = 10;
        let muscleWaist = $("#muscleWaist").data();
        $("#pdPart").val(ID);
        return;
    }
    if(p_num == 4){
        // 팔
        partBall.style.left = "56%";
        partBall.style.top = "37%";
        partBall.style.zIndex = 10;
        let muscleArm = $("#muscleArm").data();
        $("#pdPart").val(ID);
        return;
    }
    if(p_num == 5){
        // 무릎
        partBall.style.left = "67%";
        partBall.style.top = "67%";
        partBall.style.zIndex = 10;
        let muscleKnee = $("#muscleKnee").data();
        $("#pdPart").val(ID);
        return;
    }
    if(p_num == 6){
        // 종아리
        partBall.style.left = "25%";
        partBall.style.top = "77%";
        partBall.style.zIndex = 10;
        let muscleCalf = $("#muscleCalf").data();
        $("#pdPart").val(ID);
        return;
    }
}

//뼈 치료부위 위치 조절
const partBall2 = document.querySelector("#ball2");
    function f_bonemove(ID, p_num){
        if(p_num == 1){
            //목
            partBall2.style.left = "70%";
            partBall2.style.top = "13%";
            partBall2.style.zIndex = 10;
            let boneNeck = $("#boneNeck").data();
            $("#pdPart").val(ID);
            return;
        }
        if(p_num == 2){
            // 갈비뼈
            partBall2.style.left = "19%";
            partBall2.style.top = "23%";
            partBall2.style.zIndex = 10;
            let boneRip = $("#boneRip").data();
            $("#pdPart").val(ID);
            return;
        }
        if(p_num == 3){
            //척추
            partBall2.style.left = "71%";
            partBall2.style.top = "31%";
            partBall2.style.zIndex = 10;
            let boneSpaine = $("#boneSpaine").data();
            return;
        }
        if(p_num == 4){
            //손목
            partBall2.style.left = "53%";
            partBall2.style.top = "41%";
            partBall2.style.zIndex = 10;
            let boneWrist = $("#boneWrist").data();
            return;
        }
        if(p_num == 5){
            //종아리
            partBall2.style.left = "9%";
            partBall2.style.top = "73%";
            partBall2.style.zIndex = 10;
            let boneCalf = $("#boneCalf").data();
            return;
        }
        if(p_num == 6){
            //발목
            partBall2.style.left = "21%";
            partBall2.style.top = "80%";
            partBall2.style.zIndex = 10;
            let boneAncle = $("#boneAncle").data();
            return;
        }
    }
    
//대기환자 중에서 환자 진료차트 조회하기
function writeInsertClick() {
	let trmCd = $("input[name=trmCd]").val();
	let pdCont = $("#writeChartText").val();
	let pdPart = $("#pdPart").val()
	let data = {
			"trmCd" : trmCd,
			"pdCont" : pdCont,
			"pdPart" : pdPart
	}
	$.ajax({
		url : "/HurryUp/pt/ptCureWrite",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    },
		success : function(resp) {
			Swal.fire('진료일지 작성 완료되었습니다', '  ', 'success');
			$(".form-control").val(''); //input태그에 있던 val값 제거
			$('#writeChartText').val(''); //textBox태그에 있던 val값 제거
			$('#pdPart').val(''); //pdPart태그에 있던 val값 제거
			$(".curePartSelect").find($("input[type='radio']:checked")).remove();
			//curePartSelect안에 있는 input 태그를 찾아서 언체크드를 해라.....ball2")
			$("#ball").remove();
			$("#ball2").remove();
			
// 			console.log("resp : " + JSON.stringify(resp));
			let str = "";
			$.each(resp,function(index,vo){
				str = str + "<tr class='ptDocumentClass'><td>"
						  + vo.paNo
						  + "</td><td>"
						  + vo.paName
						  + "</td><td>"
						  + vo.paReg
						  + "</td><td>"
						  + vo.trmCd
						  + "</td><td><button onclick='ptNoDtClick(this)'>"
						  + vo.pdCont
						  + "</button></td></tr>";
			});
			$("#ptDocumentBody").html("");
			$("#ptDocumentBody").html(str);
		},
		erro : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}

let $writeChartCd = $('.writeChartCd');
//물리치료실 대기현황에서 환자번호를 클릭하면 진료일지 차트에 환자 차트를 뿌려주기
	const ptNoDtClick=(pthis)=>{
		console.log("pthis : ",pthis);
		let rcpNo = $(pthis).data("rcpNo");
		console.log("rcpNo : " ,rcpNo);
		console.log("?????????????????????? : " ,rcpNo)
		$.ajax({
			url : "/HurryUp/pt/ptPatientChart",
			method : "post",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify({'rcpNo': rcpNo}),
			dataType : "json",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			success : function(list) {
				console.log("list", list)
				//작성 할 치료일지에 동일한 데이터 뿌려주기
				$writeChartCd.val(list[0].trmCd); //진료차트
				$('#writeChartDate').val(list[0].receptionVO.rcpDate.substring(0,10)); //진료일자출력/ substring으로 시간자르기
				$('#writeChartPaNo').val(list[0].patientVO.paNo); //환자접수번호
				$('#writeChartPaNm').val(list[0].patientVO.paName); //환자이름
				$('#writeChartPaReg').val(list[0].patientVO.paReg); //생년월일
				$('#writeChartRc').val(list[0].symptomVOList[0].symCd); //상병코드
				$('#writeChartRl').val(list[0].symptomVOList[0].symDetail); //증상
				
				$('#writeChartRoom').val(list[0].receptionVO.officeCd); //진료실
// 				만약에 치료부위/치료내용에 데이터가 있다면 데이터를 뿌려주면서 작성버튼이 사라지게하고 치료내용도 disapear로 변경해라
				//console.log(list[0].ptDocumentList[0].pdPart);
				let pdPartValue = list[0].ptDocumentList[0].pdPart;
				let pdPart= $('#pdPart').val(pdPartValue); //치료부위
				console.log("=========규가가가가가가 pdPartValue : ",pdPartValue);
				
				if(pdPartValue!=null) {//pdPart에 데이터가 있으면 writeChartText에 데이터를 추가하고 비활성화 시켜라
					//console.log("pdPart : ",pdPart);
					$("#writeChartText").val(list[0].ptDocumentList[0].pdCont).attr("disabled",true);
					$("#writeInsert").hide();
					f_move(this.id);//헤헤 작업중
					
				} else {
					$("#writeChartText").val(list[0].ptDocumentList[0].pdCont).attr("disabled",false);
					$("#writeInsert").show();
				}
			},
			erro : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}

//물리치료실 침대에 배정하는 함수 // 침대 배정버튼
$(".assignmentbutton").on("click",function(){
	let rcpNo = $(this).data("rcpNo")
	let paName = $(this).data("name")
	let ptBedCd = $('.table2').find('.active').attr('id')
	console.log(`\${rcpNo} \${paName} \${ptBedCd}`)
	$.ajax({
			url : "/HurryUp/pt/ptBedFull",
			method : "post",
			dataType : "json",
			data : JSON.stringify({'rcpNo': rcpNo, 'paName':paName, 'ptBedCd': ptBedCd}),
			contentType :  "application/json; charset=utf-8",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			success : function(resultMap) {
				console.log("resultMap : " , resultMap);
				if(resultMap.result>0) {
					Swal.fire('배정이 완료 되었습니다.', '  ', 'success');
					let pthis = $("#" + resultMap.ptBedCd);
					pthis.data("rcpNo",resultMap.rcpNo);				
					$(pthis).find(".patient").html(`\${resultMap.rcpNo} \${resultMap.paName}`);
					$(".bedbutton").removeClass('active');
					
					//밑에 데이타 있는 걸 빼주는 작업 //템플릿연산자
					$(`#tr_\${resultMap.rcpNo }`).remove(); //이거는 보여지는 효과만 준 것임 DB에서 바꿔주는 걸 해야함
					pthis.find(".pthis").attr("src", "<c:url value='/resources/images/ptbedfull.png'/>");
				} else {
					Swal.fire('배정에 실패했습니다.', '  ', 'error');
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
	});

});

//bedbutton 클릭했을 때 효과 이벤트
$(".bedbutton").on("click",function(){
	$('.table2').find('button').removeClass('active')
	$(this).addClass('active'); //toggleClass : 클래스를 넣었다가 붙였다가 하는 것
});

//치료를 완료하는 것
	const f_clk=(pthis)=>{
// 		$(pthis).find(".pic").attr("src","../resources/images/ptbedfull.png"); //pthis안에서 pic를 찾아서 거기에 src=""를 붙인다
		let rcpNo = $(pthis).data("rcpNo");
		let v_bedNo = $(pthis).attr("id");
		$("[name=ptBedCd]").val(v_bedNo);
		
		if(rcpNo) { 
		Swal.fire({
				title : '치료를 완료하시겠습니까?', 
				icon : 'warning',
				showCancelButton: true,
				confirmButtonText: '승인',
                cancelButtonText: '취소'
                }).then((result1) => {
                	console.log("result : " + result1); //object
                	if(result1.isConfirmed) {
                		console.log("Hi Yeji rcpNo : " + rcpNo +  " v_bedNo : " + v_bedNo);
                		$.ajax({
                				url : "/HurryUp/pt/ptBedEmpty",
                				method : "post",
                				data :  JSON.stringify({ptBedCd : v_bedNo, rcpNo : rcpNo}),
                				dataType : "json",
                				contentType :  "application/json; charset=utf-8",
                				beforeSend: function(xhr) {
                		            xhr.setRequestHeader(header, token);
                		    },
                				success : function(result) {
                					console.log("Hi result pless : " + rcpNo +  " v_bedNo : " + v_bedNo);
                					if(!parseInt(result)) {
                						Swal.fire('치료가 완료 되었습니다.', '', 'success');
                						$(pthis).removeData("rcpNo");
                						$(pthis).removeAttr("data-rcp-no");
                						$(pthis).find(".patient").empty();
                						$(pthis).find(".pthis").attr("src", "<c:url value='/resources/images/ptbedemty.png'/>");
                						$(".bedbutton").removeClass('active');
                					} else {
                						Swal.fire('베드를 비우는데 실패했습니다.', '  ', 'error');
                					}
                				},
                				error : function(jqXHR, status, error) {
                					console.log(jqXHR);
                					console.log(status);
                					console.log(error);
                				}
                			});               	
                		}
               		 });
		} 
	};

/* 환자치료일지 검색*/
 $(document).ready(function(){
    $("input[name=searchBtn]").keydown(function () {
		event.stopPropagation();
        if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	console.log("환자 조회");
        	searchList(); //환자조회
        }
    });
    
    $("input[name=searchBtnA]").keydown(function () {
		event.stopPropagation();
        if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	console.log("환자치료일지 조회");
            searchAgoDocu(); //이전치료일지 조회
        }
    });
    
    //searchAgoDocu : 이전 치료일지 검색
	$("#agoSearch").on("click",function(){
		searchAgoDocu();
	});
    
    searchAgoDocu = function(){
    	console.log("진짜로ㅡㅡ?"); //ok
		//검색 찾는 로직 구현
		let searchOptionA = $("#searchOptionA option:selected").val();
		let searchWordA = $("#searchWordA").val();
		
		console.log(searchOptionA);
		console.log(searchWordA);
		
		if(searchWordA == ''){
			swal.fire('검색 실패!', "검색어를 입력해주세요", 'error');
			return false;
		}
		
		let data = {
			searchOptionA:searchOptionA,
			searchWordA:searchWordA
		}
		$.ajax({
			url : "/HurryUp/pt/searchAgoDocu",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    },
			success : function(result) { 
				console.log(result);
				console.log(result.length);
				if(result == null || result.length == 0){
					// 기록이 없을 때
					swal.fire('검색실패', "환자 정보가 없습니다.", "error");
					
				}else if(result.length == 1){
					// 기록이 하나일 때
					let trTags = [];
					$.each(result, function(i, v){
						console.log(v);
						let trTag = $("<tr>").attr("class","ptDocuClass")
						.append(
								$("<td>").html(v.paNo)
								, $("<td>").html(v.paName)
								, $("<td>").html(v.paReg)
								, $("<td>").html(v.trmCd)
								, $("<td>").html(v.pdCont)	
						).data("ptAssinmentVO",v);
						trTags.push(trTag);
					})
					$("#ptDocumentBody").html(trTags);
				}else{
					// 기록이 여러개일 때
					let trTags = [];
					$.each(result, function(i, v){
						console.log(v);
						let trTag = $("<tr>").attr("class","ptDocuClass").append(
							$("<td>").html(v.paNo)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.paReg)
							, $("<td>").html(v.paSex)
						).data("ptAssinmentVO",v);
						trTags.push(trTag);
					})
					$("#ptDocumentBody").html(trTags);
					
				}
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
		
		$("#searchWordA").val("");
    };
});

    //환자 검색
    $("#Search").on("click", function(){
    	searchList();
    });
    
    searchList = function (){
        let searchOption = $("#searchOption option:selected").val();
		let searchWord = $("#searchWord").val();
		let data = {
				searchOption:searchOption,
				searchWord:searchWord
		}
		console.log(searchOption);
		console.log(searchWord);
		
		if(searchWord == ''){
			Swal.fire('검색 실패!', "검색어를 입력해주세요", 'error'); // sweet alert2에 enter key 문제가 있음
			return;
		}
		
		$.ajax({
			url : "/HurryUp/pt/ptPatientSearch",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			success : function(result) { 
				console.log(result);
				console.log(result.length);
				
				if(result == null || result.length == 0){
					// 기록이 없을 때
					Swal.fire('환자 정보가 존재하지 않습니다', "환자 정보가 없습니다.", "info");
					console.log("aa?????????엥????여기는 진짜 정보가 없는거")
				} else if(result.length == 1) {
					// 기록이 하나일 때
					let trTags = [];
					$.each(result, function(i, v){
						console.log(v);
						let trTag = $("<tr>")
						.append(
							$("<td>").html(v.paNo)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.paReg)
							, $("<td>").html(v.paSex)
							, $("<td>").html(v.rcpDate.substring(0,10))
						).data("waitVO",v);
						trTags.push(trTag);
					})
					$("#ptViewBody").html(trTags);
				}else{
					// 기록이 여러개일 때
					let trTags = [];
					$.each(result, function(i, v){
						console.log("여기인가?",v);
						let trTag = $("<tr>")
						.append(
							$("<td>").html(v.paNo)
							, $("<td>").html(v.paName)
							, $("<td>").html(v.paReg)
							, $("<td>").html(v.paSex)
							, $("<td>").html(v.rcpDate.substring(0,10))
						).data("waitVO",v);
						trTags.push(trTag);
					})
					$("#ptViewBody").html(trTags);
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

/* 검색 끝 */

/**
 * patient List get 방식 출력
 */
 $.ajax({
		url : "patientList",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    },
		success : function(result) { 

			let trTags = [];
			$.each(result, function(i, v){
				let trTag = $("<tr>").attr("class","ptClass")
				.append(
					$("<td>").html(v.paNo)
					, $("<td>").html(v.paName)
					, $("<td>").html(v.paReg)
					, $("<td>").html(v.paSex)
					, $("<td>").html(v.rcpDate.substring(0,10))
					, $("<input>").attr({
						"type":"hidden",
						"value": `\${v.paNo}`
						})
				).data("waitVO",v);
				trTags.push(trTag);
			})
			$("#ptViewBody").html(trTags);
			$(".ptClass").on("click",function(){
				console.log(this);
				let value = $(this).children('input').val();
				console.log(value);
			})	
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
	
	//ptDocument 기록서 get방식으로 단순 출력
	let $ptDocumentBody= $("#ptDocumentBody");
	let f_getPtDocu =()=> {
		$.ajax({
			url : "ptDocumentList",
			method : "get",
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    },
			success : function(result) {
					console.log("================" , result);
					
					let trTags = [];
					$.each(result, function(i,v) {
						console.log(v);
						let trTag = $("<tr>").attr("class","ptDocumentClass").append(
									$("<td>").html(v.paNo)
									, $("<td>").html(v.paName)
									, $("<td>").html(v.paReg)
									, $("<td>").html(v.trmCd)
									, $("<td>").html(
											$("<button>")
												.attr("class","ptDocumentBtn")
												.prop("id",v.trmCd)
												.data('rcpNo',v.rcpNo)
												.html(v.pdCont))
												
						).data("ptDocumentVO", v);
						trTags.push(trTag);
						console.log(trTags);
					})
					$ptDocumentBody.append(trTags);
					
					$(".ptDocumentBtn").on("click",function(){
						console.log($(this).data());
						console.log("this : ",this);
						ptNoDtClick(this);
						
					})
			},
			erro : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});
	}
	f_getPtDocu();
	
/* 그리드 스택  */	
	GridStack.init();


//시윤//끊어서 호출해라
// 	let rcpNo= -1;
// 	let f_getChart = function(){
// 		$.ajax()
// 		rcpNo = resp.rcpNo;
// 	};
// 	let f_getRcp = function(p_rcpNo){
		
// 	};
// 	f_getRcp(rcpNo)

</script>