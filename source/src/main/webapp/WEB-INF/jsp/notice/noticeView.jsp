<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/ptStyle.css" rel="stylesheet" />
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
</style>

<!-- 그리드 스택  -->
<div class="grid-stack">
	<!-- 그리드스택 아이템 공지사항 -->
	<div class="grid-stack-item" gs-w="5" gs-h="5">
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
	<div class="grid-stack-item" gs-w="3" gs-h="5">
		<div class="grid-stack-item-content">
			<h4 class="h4-title1">스케줄러</h4>
			<hr>
			<table class="table2">
				<thead>
				</thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
	
	<!-- 그리드스택 통계 -->
	<div class="grid-stack-item" gs-w="4" gs-h="5">
		<div class="grid-stack-item-content">
			<h4 class="h4-title1">통계</h4>
			<hr>
			<table class="table2">
				<thead></thead>
				<tbody></tbody>
			</table>
		</div>
	</div>
</div>

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
</script>