<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<link href="<%=request.getContextPath()%>/resources/css/gridstack.min.css" rel="stylesheet" />
<style type="text/css">
body {
	font-family: 'spo';
	font-size: 12px
}

.grid-stack {
	background: #FFFFFF;
	border-radius: 10px;
}

.grid-stack-item-content {
	background-color: #FCFFFE;
	border-radius: 10px;
	border-top: 10px solid #4E73DF;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

#serarchButton {
	background-color: #00334E;
	font-size: 15px;
	text-align: right;
	color: #ffffff;
	border-radius: 5px
}

button {
	border: none;
}

.table1 {
	margin: 20px 0 40px 0;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
	text-align: center;
}

.table2 {
	/* 	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2); */
	margin: 0 0 40px 0;
	width: 100%;
	display: table;
	text-align: center;
}

thead tr {
	background-color: #3161A3;
	color: #ffffff
}
</style>

<div class="grid-stack">
	<div class="grid-stack-item" gs-w="4" gs-h="5">
		<div class="grid-stack-item-content">
			<div>
				<h3>환자 조회</h3>
				<form id="pt-search-from" style="text-align: right;">
					<select id = "searchOption" class = "pt-select">
						<option value='no'>환자 번호</option>
						<option value='name'>환자 이름</option>
					</select>
						<input style="display:none;" type="hidden" id="paNoHidden" value=""/>
						<input class="pt-input" id="searchWord" type="text" onkeyup="if(window.event.keyCode==13){patientSearch()}" value=""/>
						<input id="serarchButton" class="btn-submit" type="button" value="검색">
				</form>
			</div>
			
			<table class="table1">
				<thead>
					<tr>
						<td>환자번호</td>
						<td>이름</td>
						<td>생년월일</td>
						<td>성별</td>
						<td>비고</td>
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
	<div class="grid-stack-item" gs-w="4" gs-h="5">
		<div class="grid-stack-item-content">
			<h3>물리치료실 현황</h3>
			<table class="table2">
				<c:set var="cnt" value="0" />
				<c:forEach begin="0" end="2">
					<tr>
						<c:forEach begin="0" end="2">
						<td>
							<button id="${ptBedList[cnt].ptBedCd }" type="button" class="bedbutton" 
								data-rcp-no="${ptBedList[cnt].rcpNo }" onclick="f_clk(this)">
								<c:if test="${empty ptBedList[cnt].rcpNo}">
									<c:url value='/resources/images/ptbedemty.png' var="imgUrl"/>
								</c:if>
								<c:if test="${not empty ptBedList[cnt].rcpNo}">
									<c:url value='/resources/images/ptbedfull.png' var="imgUrl"/>
								</c:if>
									<img src="${imgUrl}" alt="물리치료bed" class="pic pthis" />
									<div id="disp">${ptBedList[cnt].rcpNo } ${ptBedList[cnt].paName }</div>
							</button>
						</td>
							<c:set var="cnt" value="${cnt+1 }" />
						</c:forEach>
					</tr>
				
				</c:forEach>
			</table>

			<h3>물리치료실 대기 현황</h3>
			<table class="table1">
				<thead>
					<tr>
					<td>환자 번호</td>
					<td>환자 이름</td>
					<td>생년월일</td>
					<td>배정</td>
					</tr>
				</thead>
				<c:set var="cnt" value="0"/>
				<c:forEach items="${ptAssinmentList}" var="ptAssinment">
					<tr id="aaa${cnt}" >
						<td>${ptAssinment.paNo}</td>
						<td>${ptAssinment.paName}</td>
						<td>${ptAssinment.paReg}</td>
						<td>
							<button class="assignmentbutton" data-pa-no="${ptAssinment.paNo}" data-rcp-no= "${ptAssinment.rcpNo }"
									data-name="${ptAssinment.paName}" data-reg="${ptAssinment.paReg}" >배정</button>
						<td>
					</tr>
					<c:set var="cnt" value="${cnt+1}"></c:set>
				</c:forEach>
			</table>
		</div>
		
	
	</div>
	<div class="grid-stack-item" gs-w="4">
		<div class="grid-stack-item-content">
			<h3>공지사항</h3>
			<p>컨텐츠 or 버튼 들어갈꺼임~</p>
		</div>
	</div>
	<div class="grid-stack-item" gs-w="4">
		<div class="grid-stack-item-content">
			<h3>데이터 통계</h3>
			<p>컨텐츠 or 버튼 들어갈꺼임~</p>
		</div>
	</div>

	<div class="grid-stack-item" gs-w="4" gs-h="3">
		<div class="grid-stack-item-content">
			<h3>스케쥴 관리</h3>
			<p>컨텐츠 or 버튼 들어갈꺼임~</p>
		</div>
	</div>
</div>

<form action="<c:url value='/pt/ptBedFull'/>" id="bedfullform" method = "post" >
			<input  type="text" name="ptBedCd" value="">
<!-- 			<input style="display:none;" type="hidden" name="ptBedState" value=""> -->
			<input type="text" name="rcpNo" value="">
</form>
<script type="text/javascript">
// 	1. 배정 버튼을 누르고, 물리치료실안에 있는 bed를 클릭
// 	2. alert 창 나옴 ) 배정 할꺼니? yes/no
// 	3. yes를 누르면 클릭했던 bed에 환자번호 이름 생년월일이 뜸
// 	4. 이미지 full로 바뀜
// 	5. 물리치료실 대기현황에 리스트 빠짐
	
// 	=사용되고있는 침대에 이미지 변경되어야함
// 	=RCP_NO가 비어있지 않으면의 조건이 필요함 단순) empty not empty 차이
// 	=클릭을 변경이 되어야 하기때문에 클릭이벤트 핸들러가 필요

$(function(){
	
let bedfullform = $("#bedfullform").on("submit",function(event){
	event.preventDefault();
	let url = this.action;
	let method = this.method;
	let data = $(this).serialize();
	//url : http://127.0.0.1/HurryUp/pt/ptBedFull, method : post, data : ptBedCd=BED09&rcpNo=202302021
	console.log("url : " + url + ", method : " + method + ", data : " + data);
	 
	
	$.ajax({
			url : url,
			method : method,
			data : data,
			dataType : "text",
			success : function(result) {
				console.log("result : " , result);
				
				if(result == "1") {
					Swal.fire('배정이 완료 되었습니다.', '  ', 'success');
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
	return false;
	
	})
	
	$(".assignmentbutton").on("click",function(){
// 		let ptBedState = $("#ptBedState").val;
		let rcpNo1 = $(this).data("rcpNo")
		$("[name=rcpNo]").val(rcpNo1);
		console.log(rcpNo1);

		bedfullform.submit();
		
	});
});


//배정하는 것
	const f_clk=(pthis)=>{
		$(pthis).find(".pic").attr("src","../resources/images/ptbedfull.png");
		let rcpNo = $(pthis).data("rcpNo");
		let v_bedNo = $(pthis).attr("id");
		$("[name=ptBedCd]").val(v_bedNo);
		

		if(rcpNo) {
			$(pthis).find(".pthis").attr("src", "<c:url value='/resources/images/ptbedemty.png'/>");
		} else {
			$(pthis).find(".pthis").attr("src", "<c:url value='/resources/images/ptbedfull.png'/>");
			
		}

	};
// 		let getContent  = document.querySelector("#"+selTrId);
// 		console.log(getContent); // 이전 선택한 TR
		
// 		alert( "배정하시겠습니까?")
// 		let disps = document.querySelectorAll("#disp");
// 		disps[3].innerHTML = getContent.children[1].innerHTML +getContent.children[2].innerHTML; 
// 		let selTrId;

// 	const f_sel = (pthis)=> {
// 		console.log(pthis);
// 		selTrId = pthis.id;
// 		console.log(selTrId);
// 		let no = $("aaa0").children('tr').innerHTML();	
// // 		let no = document.getElementById("#aaa0");
// 		let noValue = no.innerHTML
// 		console.log(noValue);
// 	};


//환자 검색
	$("#serarchButton").on("click", function patientSearch(){
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
			url : "ptPatientSearch",
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
						paNo = `<a href='javascript:void(0);' onclick='patientpaHistory(\${v.paNo})';>\${v.paNo}</a>`
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
		
	});
	
//그리드 스택 시작	
	GridStack.init();
	
</script>