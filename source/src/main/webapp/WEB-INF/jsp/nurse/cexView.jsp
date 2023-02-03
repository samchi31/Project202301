<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath }/resources/css/cexStyle.css" rel="stylesheet"/>

<style>
*, ::after, ::before{
	box-sizing: content-box;
}

</style>
<script>
$(function(){
	//환자 검색
	$("#Search").on("click", function(){
		let searchOption = $("#searchOption option:selected").val();
		let searchWord = $("#searchWord").val();

		if(searchWord == ''){
			alert("검색어를 입력해주세요");
			return false;
		}
		
		let data = {
				searchOption:searchOption,
				searchWord:searchWord
		}

		$.ajax({
			url : "cexPatientSearch",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			dataType:"json",
			success : function(result) {
				console.log(result);
				console.log(result.length);
				if(result == null || result.length == 0){
					//환자가 없을 때 
					alert("검색하신 환자 정보가 없습니다.");
				}else if(result.length == 1){
					//환자가 한명일 때 
					$.each(result, function(i, v){
						$("#p_No").html(v.paNo);
						$("#p_Nm").html(v.paName);
						$("#p_reg1").html(v.paReg1);
						$("#p_reg2").html(v.paReg2);	
					});
				}else{
 					//환자가 여러명일 때 팝업창 띄워서 선택
// 					window.open("/patient/patientSearchList?radio="+radio+"&keyword="+keyword, "window", "width=500, height=500");
// 					$("#pno").attr("readonly",true); 
// 					$("#pname").attr("readonly",true);
// 					$("#reg").attr("readonly",true);
// 					$("#phone").attr("readonly",true); 
// 					$("#postcode").attr("readonly",true); 
// 					$("#address").attr("readonly",true);
// 					$("#addressdetail").attr("readonly",true); 
// 					$("#memo").attr("readonly",true);
				}
			},
			error : function(jqXHR, status, error) {
				alert(jqXHR);
				alert(status);
				alert(error);
			}
		});
		
		$("#searchWord").val("");
		
	})
});
</script>
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
							<select id="searchOption" class="cex-select">
								<option value="no">환자번호</option>
								<option value="name">이름</option>
							</select> 
							<input class="cex-input" id="searchWord" type="text" value="">
							<input id="Search" class="btn-submit" type="button" value="검색">
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
								<td id='p_No'></td>
								<td id='p_Nm'></td>
								<td id='p_reg1'></td>
								<td id='p_reg2'></td>
								<td id='p_record'></td>
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

