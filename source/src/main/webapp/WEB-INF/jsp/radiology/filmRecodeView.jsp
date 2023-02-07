<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath }/resources/css/filmRecode.css" rel="stylesheet"/>
<%-- <%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %> --%>
<!DOCTYPE html>
<html>
<head>
<title>촬영기록</title>
<style>
.table1 {
	margin: 0 0 40px 0;
	width: 100%;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
	display: table;
	text-align: center;
}
.raditable{
	height : 100px;
	background-color : white;
}
</style>
<script>
function f_block(){
	if(event.keyCode==13){
		event.preventDefault();
	}
}

//엔터키 누르면 검색실행되게 하는 코드
$(document).ready(function(){
    $("input[name=searchBtn]").keydown(function () {
		//event.stopPropagation();
        if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
        	console.log("체크");
            searchList();
        }
    });
    $("#Search").on("click", function(){
    	searchList();
    });
    
    searchList = function (){
        //검색 찾는 로직 구현
        let searchOption = $("#searchOption option:selected").val();
		let searchWord = $("#searchWord").val();
		
		console.log(searchOption);
		console.log(searchWord);
		
		if(searchWord == ''){
			swal('검색 실패!', "검색어를 입력해주세요", 'error');
			return false;
		}
		
		let data = {
			searchOption:searchOption,
			searchWord:searchWord
		}
		
		$.ajax({
			url : "filmSearch",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) { 
				console.log(result);
				console.log(result.length);
				
				if(result == null || result.length == 0){
					// 기록이 없을 때
					swal('검색실패', "촬영 기록이 없습니다.", "error");
				}else if(result.length == 1){
					// 기록이 하나일 때
					let str = "";
					$.each(result, function(i, v){
// 						console.log(v);
						str += `<tr>
							<td><a>\${v.filmNm}</a></td>
							<td><a>\${v.paName}</a></td>
							<td><a>\${v.trmDt}</a></td>
						</tr>`;
					});
					$("#radiTBody").html(str);
				}else{
					// 기록이 여러개일 때
					let str = "";
					$.each(result, function(i, v){
// 						console.log(v);
						str += `<tr>
							<td style=\"padding-right:1px;\"><a>\${v.filmNm}</a></td>
							<td style=\"padding-right:1px;\"><a>\${v.paName}</a></td>
							<td style=\"padding-right:1px;\"><a>\${v.trmDt}</a></td>
						</tr>`;
					});
					$("#radiTBody").html(str);
					
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
});

$(function(){
	$.ajax({
		url : "filmList",
		method : "get",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) { 
			console.log(result);
			console.log(result.length);
			if(result == null || result.length == 0){
				// 기록이 없을 때
				swal('검색실패', "촬영 기록이 없습니다.", "error");
			}else if(result.length == 1){
				// 기록이 하나일 때
			}else{
				// 기록이 여러개일 때
				let str = "";
				$.each(result, function(i, v){
					console.log(v);
					str += `<tr>
						<td><a>\${v.filmNm}</a></td>
						<td><a>\${v.paName}</a></td>
						<td><a>\${v.trmDt}</a></td>
						</tr>`;
				});
				$("#radiTBody").html(str);
				
			}
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
		
	});
});

let $wait = $(event.target).parent("")
</script>
</head>
<body>
<div id="wrapper">
	<!-- 전체-->
	<div id="content"><!--         -->
		<div id="left" class="raditable">
			<div class="patient-info">
				<div class="patient-info-in">
					<div class="patient-info-in-top">
						<h4 id="radi-title">촬영기록</h4>
						<form id="radi-search-form" name="searchForm" onkeydown="f_block()">
							<select id="searchOption" class="radi-select">
								<option value>검색하기</option>
								<option value="filmName">촬영실</option>
								<option value="name">이름</option>
							</select> 
							<input name="searchBtn" class="radi-input" id="searchWord" type="text" value="">
							<input class="btn-submit" id="Search" type="button" value="검색">
						</form>
					</div>
					<table class="radi-table w-100" >
						<thead>
							<tr>
								<th style="padding-right:1px;"><a>촬영실구분</a></th>
								<th style="padding-right:1px;"><a>환자명</a></th>
								<th style="padding-right:1px;"><a>진료일자</a></th>
							</tr>
						</thead>
						<tbody id="radiTBody">
						
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="right">
			<div class="grid-title">
			</div>
			<div id="grid-container">
				<div class="grid-item" id="1">
					<img alt="HTML"
					src="${pageContext.request.contextPath}/resources/images/mainlog.png"
					width="220" height="140">
					<p class="p_list_con"><span class="p_name" style="padding-right:20px">이름</span>ddddddd어쩌구 저쩌구</p>
				</div>
				<div class="grid-item" id="item2">2</div>
				<div class="grid-item" id="item3">3</div>
				<div class="grid-item" id="item4">4</div>
				<div class="grid-item" id="item5">5</div>
				<div class="grid-item" id="item6">6</div>
				<div class="grid-item" id="item7">7</div>
				<div class="grid-item" id="item8">8</div>
				<div class="grid-item" id="item9">9</div>
				<div class="grid-item" id="item10">10</div>
				<div class="grid-item" id="item11">11</div>
				<div class="grid-item" id="item12">12</div>
				<!-- <div id="pagingArea"> -->
				<!-- 스크립트단으로 감 -->
				<%-- 	<ui:pagination pagingVO="${pagingVO }" type="bootstrap"/> --%>
				<!-- </div> -->
			</div><!-- grid-contents -->
			<div id="paging"><!-- paging 처리 박스 -->
			<style>
				#paging { position:relative; overflow:hidden; width:250px; margin:3% auto; text-align:center;font-size:20px; }
				
				.prev {display:block; float:left; color:#4169E1;font-weight:200;}
				.paging_number {display:block; float:left; margin:0 20px}
				.paging_number a {color:#4169E1; }
				.paging_number a.active { color:yellow; font-weight:800;}
				.next {display:block; float:left; color:#4169E1;font-weight:200;}
			</style>
				<a href="#" class="prev">Prev</a>
				<div class="paging_number">
					<a href="#" class="active">1</a> 
					<a href="#">2</a> 
					<a href="#">3</a>
					<a href="#">4</a>
				</div>
				<a href="#" class="next">Next</a>
			</div>
		</div>
	</div><!-- content tag End -->
</div>
	<script type="text/javascript">
		$("a.paging").on("click", function(event) {
			event.preventDefault();
			let page = $(this).data("page");
			if (!page)
				return false;
			searchForm.find("[name=page]").val(page);
			searchForm.submit();
			return false;
		});
		
		
		
	</script>
</body>
</html>