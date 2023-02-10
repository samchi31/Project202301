<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link
	href="<%=request.getContextPath()%>/resources/css/gridstack.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/css/ptStyle.css"
	rel="stylesheet" />
<div class="grid-stack">
	<div class="grid-stack-item" gs-w="4" gs-h="5">
		<div class="grid-stack-item-content">
			<div>
				<h3>환자 조회</h3>
				<form id="pt-search-from" style="text-align: right;">
					<select id="searchOption" class="pt-select">
						<option value='no'>환자 번호</option>
						<option value='name'>환자 이름</option>
					</select> 
					<input class="pt-input" id="searchWord" type="text" onkeyup="if(window.event.keyCode==13){patientSearch()}" value="" />
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
								<button id="${ptBedList[cnt].ptBedCd }" type="button"
									class="bedbutton" data-rcp-no="${ptBedList[cnt].rcpNo }"
									onclick="f_clk(this)">
									<c:if test="${empty ptBedList[cnt].rcpNo}">
										<c:url value='/resources/images/ptbedemty.png' var="imgUrl" />
									</c:if>
									<c:if test="${not empty ptBedList[cnt].rcpNo}">
										<c:url value='/resources/images/ptbedfull.png' var="imgUrl" />
									</c:if>
									<img src="${imgUrl}" alt="물리치료bed" class="pic pthis" />
									<div class="patient">${ptBedList[cnt].rcpNo } ${ptBedList[cnt].paName}</div>
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
				<c:set var="cnt" value="0" />
				<c:forEach items="${ptAssinmentList}" var="ptAssinment">
					<tr id="tr_${ptAssinment.rcpNo }">
						<td>${ptAssinment.paNo}</td>
						<td>${ptAssinment.paName}</td>
						<td>${ptAssinment.paReg}</td>
						<td>
							<button class="assignmentbutton" data-pa-no="${ptAssinment.paNo}"
								data-rcp-no="${ptAssinment.rcpNo }"
								data-name="${ptAssinment.paName}"
								data-reg="${ptAssinment.paReg}">배정</button>
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
<form action="<c:url value='/pt/ptBedFull'/>" id="bedfullform" method="post">
	<input type="text" name="ptBedCd" value="">
	<input type="text" name="rcpNo" value="">
</form>

<script type="text/javascript">
//침대에 배정하는 함수
$(function(){
	
let bedfullform = $("#bedfullform").on("submit",function(event){
	event.preventDefault();
	let url = this.action;
	let method = this.method;
	let data = $(this).serialize();
	console.log("url : " + url + ", method : " + method + ", data : " + data);
	$.ajax({
			url : url,
			method : method,
			data : data,
			dataType : "json",
			success : function(resultMap) {
				if(resultMap.result>0) {
					Swal.fire('배정이 완료 되었습니다.', '  ', 'success');
// 					location.href=location.href
// 					var change = "${ptBedList[cnt].rcpNo } ${ptBedList[cnt].paName}";
// 					$("#dispParent").append(
// 					$("div").html(change)	
// 					);	
// 					bedfullform.get(0).ptBedCd.value
					
					let rcpNo = resultMap.receptionVO.rcpNo;
					let paName = resultMap.receptionVO.patient.paName;
					let bedNo = resultMap.ptAssinmentVO.ptBedCd;
					let pthis = $("#" + bedNo);
					pthis.data("rcpNo",rcpNo);				
					$(pthis).find(".patient").html(`\${rcpNo} \${paName}`)
					
// 					밑에 데이타 있는 걸 빼주는 작업//템플릿연산자
					$(`#tr_\${rcpNo }`).remove(); //이거는 보여지는 효과만 준 것임 DB에서 바꿔주는 걸 해야함

					
					
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
// 		$(pthis).find(".pic").attr("src","../resources/images/ptbedfull.png"); //pthis안에서 pic를 찾아서 거기에 src=""를 붙인다
		let rcpNo = $(pthis).data("rcpNo");
		let v_bedNo = $(pthis).attr("id");
		$("[name=ptBedCd]").val(v_bedNo);
		console.log(rcpNo + "------------------------");
		if(rcpNo) { //rcpNo가 있으면 빈배드 설정해준다
			
		Swal.fire({
				title : '치료를 완료하시겠습니까?', 
				icon : 'warning',
				showCancelButton: true,
				confirmButtonText: '승인',
                cancelButtonText: '취소'
                }).then((result1) => {
//                 	console.log("rcpNo : " + rcpNo + ", v_bedNo : " + v_bedNo);
                	if(result1.isConfirmed) {
                		console.log("v_bedNo" + v_bedNo);
                		$.ajax({
                				url : "/HurryUp/pt/ptBedEmpty",
                				method : "post",
                				data : {ptBedCd : v_bedNo},
                				dataType : "text",
                				success : function(result) {
                					if(!parseInt(result)) {
                						Swal.fire('치료가 완료 되었습니다.', '', 'success');
                						$(pthis).removeData("rcpNo");
                						$(pthis).removeAttr("data-rcp-no");
                						$(pthis).find(".patient").empty();
                						$(pthis).find(".pthis").attr("src", "<c:url value='/resources/images/ptbedemty.png'/>");
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
		
		} else { //클릭했을 때, 이게 클릭되었다는 걸 알려 줄 수 있는 이미지..ㅎ
			
		}
	};


//그리드 스택 시작	
	GridStack.init();
	
</script>