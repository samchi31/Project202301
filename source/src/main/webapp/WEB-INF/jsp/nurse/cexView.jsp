<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link href="${pageContext.request.contextPath }/resources/css/cexStyle.css" rel="stylesheet"/>
</head>
<body>
	<div class="wrapper">
		<div class="left">
			<div class="wait-list">
				<div class="wait-list-in">
					<h4>대기자 목록</h4>
					<table class="cex-wait-table">
						<thead>
							<tr>
								<th>진료차트번호</th>
								<th>환자번호</th>
								<th>이름</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>1</td>
								<td>김환자</td>
							</tr>
							<tr>
								<td>2</td>
								<td>2</td>
								<td>이환자</td>
							</tr>
							<tr>
								<td>3</td>
								<td>3</td>
								<td>삼환자</td>
							</tr>
							<tr>
								<td>4</td>
								<td>4</td>
								<td>사환자</td>
							</tr>
							<tr>
								<td>5</td>
								<td>5</td>
								<td>오환자</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="cex-history">
				<div class="cex-history-in">
					<h4>검사기록</h4>

					<table class="cex-history-table">
						<thead>
							<tr>
								<th>임상검사번호</th>
								<th>검사날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>2022/02/02</td>
							</tr>
							<tr>
								<td>2</td>
								<td>2022/02/03</td>
							</tr>
							<tr>
								<td>3</td>
								<td>2022/02/04</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="patient-info">
				<div class="patient-info-in">
					<div class="patient-info-in-top">
						<h4 id="cex-title">환자 조회</h4>
						<form id="cex-search-form">
							<select class="cex-select">
								<option>환자번호</option>
								<option>이름</option>
							</select> 
							<input class="cex-input" type="text" value="">
							<input class="btn-submit" type="submit" value="검색">
						</form>
					</div>
					<table class="cex-table">
						<thead>
							<tr>
								<th>환자번호</th>
								<th>이름</th>
								<th>생년월일</th>
								<th>성별</th>
								<th>비고</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1234</td>
								<td>김환자</td>
								<td>2023/02/02</td>
								<td>남</td>
								<td>수술예정</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="cex-detail">
				<div class="cex-detail-in">
					<div class="cex-detail-top">
						<h4 id="cex-title">검사내역상세</h4>
						<input style= "float:right;" class="btn-submit" type="button" value="검사생성">				
						<input style= "float:right;" class="btn-submit" type="button" value="검사등록">				
					</div>
						<table class="cex-table">
							<thead>
								<tr>
									<th>임상검사번호</th>
									<th>환자번호</th>
									<th>검사일시</th>
									<th>혈액</th>
									<th>심전도</th>
									<th>폐기능</th>
									<th>소변</th>
									<th>비고</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>1</td>
									<td>2023/02/02</td>
									<td>정상</td>
									<td>정상</td>
									<td>정상</td>
									<td>정상</td>
									<td>특이사항없음</td>
								</tr>
							</tbody>
						</table>
				</div>
				
			</div>
			<div class="cex-barcode">
				<div class="cex-barcode-in">
					<div class="cex-barcode-top">
						<h4 id="cex-title"> 바코드 </h4>
						<input style= "float:right;" class="btn-submit" type="button" value="바코드출력">	
					</div>
					<div id="barcode-print"></div>
				</div>
			</div>
		</div>
	</div>
</body>
