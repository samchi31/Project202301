<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link href="<%=request.getContextPath()%>/resources/css/gridstack.min.css" rel="stylesheet" />
<style type="text/css">

body {
	font-family: 'NanumSquareRound';
}

.grid-stack {
	background: #FFFFFF;
	border-radius: 10px;
}

.grid-stack-item-content {
	background-color: #FCFFFE;
	border-radius: 10px;
	border-top: 10px solid #4E73DF;
	box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

#patient {
	background-color: #ffffff;
	border: 1px solid #FF0000;
	width: 80%;
	/* 		height: 82%;  */
	margin: auto;
	text-align: center;
	"
}

#serarchButton {
	background-color: #00334E;
	font-size: 20px;
	text-align: right;
	color : #ffffff;
	border-radius : 5px
}

button {
	border: none;
}

.table1 {
	margin: 0 0 40px 0;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
	margin: 0 0 40px 0;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
	text-align: center;
}

.table2 {
	margin: 0 0 40px 0;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
	margin: 0 0 40px 0;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
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
			<h1>환자관리</h1>
			<select name='카테고리'>
				<option value='환자이름'>환자 이름</option>
				<option value='환자 코드'>환자 코드</option>
				<option value='환자'>환자</option>
			</select>
			<div style="text-align: right;">
				<button type="button" id="serarchButton">꾸ㅜ?</button>
			</div>
<%-- 			<jsp:include page="top.jsp" flush="false"/> --%>
			
			<table class="table1">
				<thead>
					<th>No</th>
					<th>환자명</th>
					<th>환자코드</th>
					<th>연락처</th>
					<th>생년월일</th>
					<th>내원일자</th>
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
			<h1>물리치료실 대기 현황</h1>
			<c:forEach var="d" items="/resources/images/ptbedemty.png">
				
			</c:forEach>
			<table class="table2">
				<tr>
					<td>
						<button type="button" id="button1">
							<img src="<c:url value='/resources/images/ptbedemty.png'/>"
								alt="물리치료bed" id="pic">
						</button>
					</td>
					<td>
						<button type="button"> </button>
							<img src="<c:url value='/resources/images/ptbedemty.png'/>"
								alt="물리치료bed" />
					</td>
					<td>
						<button type="button"> </button>
							<img src="<c:url value='/resources/images/ptbedemty.png'/>"
								alt="물리치료bed" />
					</td>
				</tr>
				<tr>
					<td>
						<button type="button"></button>
							<img src="<c:url value='/resources/images/ptbedemty.png'/>"
								alt="물리치료bed" />
					</td>
					<td>
						<button type="button"></button>
							<img src="<c:url value='/resources/images/ptbedemty.png'/>"
								alt="물리치료bed" />
					</td>
					<td>
						<button type="button"></button>
							<img src="<c:url value='/resources/images/ptbedemty.png'/>"
								alt="물리치료bed" />
					</td>

				</tr>
				<tr>
					<td>
						<button type="button"></button>
							<img src="<c:url value='/resources/images/ptbedemty.png'/>"
								alt="물리치료bed" />
					</td>
					<td>
						<button type="button"></button>
							<img src="<c:url value='/resources/images/ptbedemty.png'/>"
								alt="물리치료bed" />
					</td>
					<td>
						<button type="button"></button>
							<img src="<c:url value='/resources/images/ptbedemty.png'/>"
								alt="물리치료bed" />
					</td>
				</tr>

			</table>
			<table style="border: 1px solid #FF0000">
				<tr>
					<th>환자번호</th>
					<th>환자이름</th>
					<th>환자생년월일</th>
				</tr>
				<tr>
					<td>${ptAssinmentList[0].paNo}</td>
					<td>${ptAssinmentList[0].paName}</td>
					<td>${ptAssinmentList[0].paReg1}</td>
				</tr>

			</table>

		</div>
	</div>
	<div class="grid-stack-item" gs-w="4">
		<div class="grid-stack-item-content">
			공지사항
			<p>컨텐츠 or 버튼 들어갈꺼임~</p>
		</div>
	</div>
	<div class="grid-stack-item" gs-w="4">
		<div class="grid-stack-item-content">
			데이터 통계
			<p>컨텐츠 or 버튼 들어갈꺼임~</p>
		</div>
	</div>

	<div class="grid-stack-item" gs-w="4" gs-h="3">
		<div class="grid-stack-item-content">
			스케쥴 관리
			<p>컨텐츠 or 버튼 들어갈꺼임~</p>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		let num = 0;
		$("#pic").click(function() {
			if (num == 3)
				num = 0;
			else
				num++;
			$(this).attr("src", "../resources/images/ptbedfull.png");
		});
	});

	GridStack.init();
</script>