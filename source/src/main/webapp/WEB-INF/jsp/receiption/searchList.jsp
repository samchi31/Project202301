<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
$(function(){
	//환자 검색 후 선택된 환자 정보 가져가서 띄우기
	$(".tr").on("click", function(){
		var pno = $(this).find("td:eq(0)").text();
		var pname = $(this).find("td:eq(1)").text();
		var reg = $(this).find("td:eq(2)").text();
		var phone = $(this).find("td:eq(3)").text();
		var postcode = $(this).find("td:eq(4)").text();
		var address = $(this).find("td:eq(5)").text();
		var addressdetail = $(this).find("td:eq(6)").text();
// 		var memo = $(this).find("td:eq(7)").text();
		
		opener.document.getElementById("paNo").value = pno;		
		opener.document.getElementById("paName").value = pname;		
		opener.document.getElementById("paReg").value = reg;		
		opener.document.getElementById("paHp").value = phone;		
		opener.document.getElementById("paZip").value = postcode;		
		opener.document.getElementById("paAdd1").value = address;		
		opener.document.getElementById("paAdd2").value = addressdetail;		
// 		opener.document.getElementById("memo").value = memo;	
		
		window.close();
		
	});
	
	$("#cancel").on("click", function(){
		window.close();
	})
});
</script>
</head>
<body>
<section class="content">
	<div class="content-wrapper m-0">
		<div class="container-fluid">
			<div class="row">
				<div class="card card-custom-navy" style="margin: 10 auto;">
					<div class="card-header">
						<h2 class="card-title" style="font-size: 1.5em; color: white;">환자 검색 결과</h2>
					</div>
					
					<div class="card-body p-0">
						<!-- 테이블 위 상단 메뉴(?)들 -->
						<div class="table-responsive">
							<!-- Table -->
							<table class="table table-bordered table-hover" style="cursor:pointer;">
								<thead>
									<tr>
										<th>환자번호</th>
										<th>환자명</th>
										<th>생년월일</th>
										<th>전화번호</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="row" items="${list }" >
										<tr class="tr" data-widget="expandable-table">
											<td>${row.paNo }</td>
											<td><a href="#">${row.paName }</a></td>
											<td>${row.paReg }</td>
											<td>${row.paHp }</td>
											<td style="display: none;">${row.paZip }</td>
											<td style="display: none;">${row.paAdd1}</td>
											<td style="display: none;">${row.paAdd2 }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- ./card-body -->
					<div class="card-footer bg-white" style="border-bottom-left-radius: 1rem; border-bottom-right-radius: 1rem;">
                       <div class="float-right">
                          <button type="button" id="cancel" class="btn btn-danger" style="font-size: 0.9em;">닫기</button>
                       </div>
                    </div>
				</div>
			</div>
		</div>	
	</div>
</section>

</body>
</html>