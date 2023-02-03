<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib uri="http://www.ddit.or.kr/class305" prefix="ui" %> --%>
<!DOCTYPE html>
<html>
<head>
<title>촬영기록</title>
<style>
th, td {
	background-color: white;
	border-radius: 5px;
	text-align: center;
}

h4 {
	font-size: 30px;
}
.left {
	float: left;
	width: 665px;
	height: 982px;
}
.patient-info {
	width: 77.813rem;
	height: 53rem;
}
.patient-info-in {
	width: 31.938rem;
    height: 49.438rem;
	margin: 0.625rem;
	background-color: #F2F1F1;
	padding: 1.25rem;
	border-radius: 5px;
	border-top: 5px solid #4F80FF;
	box-shadow: 1px 1px 5px grey;
}
#radi-search-form {
	float: right;
}
.radi-select {
	width: 8.5rem;
	height: 2.5rem;
}
.btn-submit {
	width: 6.25rem;
	height: 2.5rem;
	background-color : #16308D;
	color: white;
	border: none;
	margin: 0.188rem;
    box-shadow: 1px 1px 2px grey;
}
.radi-input{
	width: 14.25rem;
	height: 2.5rem;
}

/* gggggggggggggggggggggg */

#content {
	width:100%;
	background-color:blue;
}

body{
	overflow:hidden; 
}

#left { 
	font-size:25px;
	width:30%; 
	height:100%;
	display:block;
	float:left;
/* 	background-color:pink */
}

#right {
	width:70%; 
	display:block;
	float:left;
/* 	background-color:green */
}
.grid-title {
	display:block;
	width:100%;
	height:0px; 
/* 	background-color:red; */
}

#grid-container {
	width: 99%;
	height:100%;
	display: grid;
/* 	background-color: pink; */
	padding: 10px;
	grid-template-columns: 1fr 1fr 1fr 1fr;
	grid-template-rows: 1fr 1fr 1fr;
	grid-column: 1;
/* 	border:1px solid red; */
}
[class*=grid-item] {
	background-color: #F2F1F1;
/* 	border: 3px solid lightpink; */
    box-shadow: 1px 1px 5px grey;
	padding: 20px;
	font-size: 30px;
	text-align: center;
	height: 200px;
	width: 270px;
	margin : 20px;
	border-radius: 10px
}

.p_list_con{
	font-size: 15px;
}
</style>
</head>
<body>
<div id="wrapper">
	<!-- 전체-->
	<div id="content"><!-- content -->
		<div id="left">
			<div class="patient-info">
				<div class="patient-info-in">
					<div class="patient-info-in-top">
						<h4 id="radi-title">촬영기록</h4>
						<form id="radi-search-form">
							<select class="radi-select">
								<option>환자번호</option>
								<option>이름</option>
							</select> 
							<input class="radi-input" type="text" value="">
							<input class="btn-submit" type="submit" value="검색">
						</form>
					</div>
					<table class="radi-table">
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
		</div>
		<div id="right">
			<div class="grid-title">
			</div>
			<div id="grid-container">
				<div class="grid-item">
					<img alt="HTML"
					src="${pageContext.request.contextPath}/resources/images/mainlog.png"
					width="220" height="140">
					<p class="p_list_con"><span class="p_name" style="padding-right:20px">이름</span>ddddddd어쩌구 저쩌구</p>
				</div>
				<div class="grid-item">2</div>
				<div class="grid-item">3</div>
				<div class="grid-item">4</div>
				<div class="grid-item">5</div>
				<div class="grid-item">6</div>
				<div class="grid-item">7</div>
				<div class="grid-item">8</div>
				<div class="grid-item">9</div>
				<div class="grid-item">10</div>
				<div class="grid-item">11</div>
				<div class="grid-item">12</div>
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