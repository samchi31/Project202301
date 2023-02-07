<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
			<h3>환자관리</h3>
			<select name='카테고리'>
				<option value='환자이름'>환자 이름</option>
				<option value='환자 코드'>환자 코드</option>
				<option value='환자'>환자</option>
			</select>
			<div style="text-align: right;">
				<button type="button" id="serarchButton">검색할거에유?</button>
			</div>
			<%-- 			<jsp:include page="top.jsp" flush="false"/> --%>

			<table class="table1">
				<thead>
					<tr>
						<td>No</td>
						<td>환자코드</td>
						<td>연락처</td>
						<td>생년월일</td>
						<td>내원일자</td>
						<td>내원일자</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>여기는</td>
						<td>여기는 콘</td>
						<td>여기는 콘</td>
						<td>여기는 콘</td>
						<td>여기는 콘</td>
						<td>여기는 콘</td>
					</tr>
					<tr>
						<td>여기는 콘</td>
						<td>여기는 콘2</td>
						<td>여기는 콘2</td>
						<td>여기는 콘텐츠2</td>
						<td>여기는 콘텐츠2</td>
						<td>여기는 콘텐츠2</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="grid-stack-item" gs-w="4" gs-h="5">
		<div class="grid-stack-item-content">
			<h3>물리치료실 현황</h3>
			<%-- 	<P>ptBedList : ${ptBedList }</P> --%>
			<%-- 	<P>ptAssinmentList : ${ptAssinmentList }</P> --%>
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
				
<%-- 					<td>/${ptBedList[0].paNo}${ptBedList[0].paName}${ptBedList[0].paReg}</td> --%>
				</c:forEach>
			</table>

			<h3>물리치료실 대기 현황</h3>
			<table class="table1">
				<thead>
					<tr><td>환자 번호</td>
					<td>환자 이름</td>
					<td>생년월일</td>
					<td>생년월일</td>
					</tr>
				</thead>
				<c:set var="cnt" value="0"/>
				<c:forEach items="${ptAssinmentList}" var="ptAssinment">
					<tr id="aaa${cnt}" >
						<td>${ptAssinment.paNo}</td>
						<td>${ptAssinment.paName}</td>
						<td>${ptAssinment.paReg}</td>
						<td><button class="assignmentbutton" data-no="${ptAssinment.paNo}"
							data-name="${ptAssinment.paName}" data-reg="${ptAssinment.paReg}" 
						 >배정</button><td>
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

<script type="text/javascript">
$(function(){
	const ccc=[];
	
	$(".assignmentbutton").on("click",function(){
		let no = $(this).data("no");
		let name = $(this).data("name");
		let reg = $(this).data("reg");
		
		console.log("no : " + no + ", name : " + name + ", reg : " + reg);
		
		ccc.push(no);
		ccc.push(name);
		ccc.push(reg);
		
		console.log("ccc : " + ccc);
		
		let data = {"paNo":no,"paName":name,"paReg":reg}
		
	 	
	});
	
//	 $( document ).ready( function(){
//		$('button#assignmentbutton').click(function(){
//			let bbb= $('#aaa${cnt}').children();
//				ccc.push(bbb);
//		});
//	});
});
// 	$.ajax({
// 		url : "ptBedFull",
// 		method : "post",
// 		data : JSON.stringfy(data),
// 		dataType : "json",
// 		success : function(result) {
// 			console.log(result);
// 			console.log(result.length);
// 			if(result > 0) {
// 				alert("뀨?")
// 			} 
// 		}
// 	});
	
// 	1. 배정 버튼을 누르고, 물리치료실안에 있는 bed를 클릭
// 	2. alert 창 나옴 ) 배정 할꺼니? yes/no
// 	3. yes를 누르면 클릭했던 bed에 환자번호 이름 생년월일이 뜸
// 	4. 이미지 full로 바뀜
// 	5. 물리치료실 대기현황에 리스트 빠짐
	
// 	=사용되고있는 침대에 이미지 변경되어야함
// 	=RCP_NO가 비어있지 않으면의 조건이 필요함 단순) empty not empty 차이
// 	=클릭을 변경이 되어야 하기때문에 클릭이벤트 핸들러가 필요
	
	


//1. 배정 버튼을 누르면 알러트 창이 뜬다
//2. 배정을 원하는 정보를 담아서
//3. bed에 뿌린다
	const ccc=[];
// 		 $( document ).ready( function(){
// 			$('button#assignmentbutton').click(function(){
// 				let bbb= $('#aaa${cnt}').children();
// 					ccc.push(bbb);
// 			});
// 		});
		 console.log(ccc);

// 	let selTrId;
// 	const f_sel = (pthis)=> {
// 		console.log(pthis);
// 		selTrId = pthis.id;
// // 		console.log(selTrId);
// // 		let no = $("aaa0").children('tr').innerHTML();	
// // 		let no = document.getElementById("#aaa0");
// // 		let noValue = no.innerHTML
// // 		console.log(noValue);
// 	};

	const f_clk=(pthis)=>{
// 		let getContent  = document.querySelector("#"+selTrId);
// 		console.log(getContent); // 이전 선택한 TR
		
// 		alert( "배정하시겠습니까?")
// 		let disps = document.querySelectorAll("#disp");
// 		disps[3].innerHTML = getContent.children[1].innerHTML +getContent.children[2].innerHTML; 
		$(pthis).find(".pic").attr("src","../resources/images/ptbedfull.png");
		let rcpNo = $(pthis).data("rcpNo");
		if(rcpNo) {
			$(pthis).find(".pthis").attr("src", "<c:url value='/resources/images/ptbedemty.png'/>");
		} else {
			$(pthis).find(".pthis").attr("src", "<c:url value='/resources/images/ptbedfull.png'/>");
			
		}

	};

	GridStack.init();
	
</script>