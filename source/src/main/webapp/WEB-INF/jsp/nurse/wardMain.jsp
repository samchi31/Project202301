<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
*, ::after, ::before{
	box-sizing: content-box;
}

html, body {
	height: 100%;
	overflow: hidden;
}

th, td {
	background-color: white;
	border-radius: 5px;
	text-align: center;
	height: 4rem;
}

.ward-div{
	float:left;
	margin: 10px;
}
.ward-wrapper{
	height: 53.25rem;
}

.patient-info{
	width: 20rem;
	height: 50.5rem;
	display: flex;
}
.patient-manage {
	float:left;
	width: 50.5rem;
	height: 50.5rem;
	overflow: auto;
}
.ward-order-container {
	width: 41rem;
    height: 52rem;
}
.ward-order-item1{
	width: 41rem;
	height: 25rem;
	margin-top: 0;
	margin-left: 0;
}
.ward-order-item2{
	width: 41rem;
	height: 23rem;
	margin-top: 5px;
	margin-left: 0;
}

.ward_input{
	width: 19.5rem;
	height: 2rem;
	flex-direction: column; 
}

.ward_title{
	flex-direction: column; 
}

#prMemo{
	height: 15rem;
}

/*tab css*/
	.tab{ margin:10px; overflow:hidden;}
	.tabnav{font-size:0;}
	.tabnav li{display: inline-block; text-align:center; border-right:1px solid #ddd;}
	.tabnav li a:before{content:""; position:absolute; left:0; top:0px; width:100%; height:3px; }
	.tabnav li a.active:before{background:#7ea21e;}
	.tabnav li a.active{border-bottom:1px solid #fff;}
	.tabnav li a{ position:relative; display:block; background: #f8f8f8; color: #000; padding:0 15px; line-height:46px; text-decoration:none; font-size:16px;}
	.tabnav li a:hover, .tabnav li a.active{background:#fff; color:#7ea21e; }
	.tabcontent{ width:800px; border-top:none; background:#fff;}
	.tabcontentWrap{padding: 20px;  height:265px; overflow-y:auto; overflow-x:auto;  border-top:none; background:#fff;}

</style>

<script>
let wardPatientList = function(){
	$.ajax({
		url : "wardPatientList",
		method : "get",
		contentType: "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			let trTags = [];
            $.each(result, function(i, v){
               let aTag = $("<a>").html(v.hsptNo).attr("href",'#').attr("class", "a_btn");
               console.log(v);
               let trTag = $("<tr>")
                           .append(
                              $("<td>").html(aTag)      
                              , $("<td>").html(v.wrRno)      
                              , $("<td>").html(v.bedNo)      
                              , $("<td>").html(v.paName)      
                              , $("<td>").html(v.icdName)      
                           ).data("patient",v);
               trTags.push(trTag)
            });
            $("#wardPatientListBody").html(trTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
wardPatientList();

</script>
<body>
	<div class="ward-wrapper">
		<div class="patient-info card ward-div">
			<h4>환자 정보</h4>
		    	<div class="form-group">
				    <label class="ward_title" for="pwCd">입퇴원 번호</label>
				    <input type="text" name="pwCd" id="pwCd" class="ward_input" readonly="readonly" />
				</div>
                <div class="form-group">
				    <label class="ward_title" for="paName">환자명</label>
				    <input type="text" name="paName" id="paName" class="ward_input" readonly="readonly" />
				</div>
				<div class="form-group">
				    <label class="ward_title" for="paReg">생년월일</label>
				    <input type="text" name="paReg" id="paReg" class="ward_input" readonly="readonly">
				</div>
                <div class="form-group">
				   	<label class="ward_title" for="empName">담당의사</label>
				    <input type="text" name="empName" id="empName" class="ward_input" readonly="readonly" />
				</div>
				<div class="form-group">
				    <label class="ward_title" for="pwIndt">입원일자</label>
				    <input type="text" name="pwIndt" id="pwIndt" class="ward_input" readonly="readonly" />
				</div>
                <div class="form-group">
				    <label class="ward_title" for="pwDays">재원일수</label>
				    <input type="text" class="ward_input" name="pwDays" id="pwDays" readonly="readonly" />
				</div>
                <div class="form-group">
				    <label class="ward_title" for="paTel">연락처</label>
				    <input type="text" name="paTel" id="paTel" class="ward_input" readonly="readonly" />
				</div>
                <div class="form-group">
				    <label class="ward_title" for="prMemo">입원 메모</label>
				    <textarea class="ward_input" id="prMemo" readonly="readonly"></textarea>
				</div>
		</div>
		<div class="patient-manage card ward-div">
			<h4>환자관리</h4>
			<table>
				<thead>
					<tr>
						<th>입퇴원번호</th>
						<th>병실</th>
						<th>병상</th>
						<th>환자명</th>
						<th>상병</th>
					</tr>
				</thead>
				<tbody id='wardPatientListBody'>
				</tbody>
			</table>
		</div>
		<div class="ward-order-container ward-div">
			<div class="ward-order-item1 card ward-div">
				<h4>병동order</h4>
				<div class="tab">
				    <ul class="tabnav">
				      <li><a href="#diet">식이</a></li>
				      <li><a href="#io">IO</a></li>
				      <li><a href="#vital">vital</a></li>
				      <li><a href="#nursingrecord">간호기록</a></li>			      
				    </ul>
				    <div class="tabcontentWrap">
					    <div class="tabcontent">
					      <div id="diet"></div>
					      <div id="io"></div>
					      <div id="vital"></div>
					      <div id="nursingrecord"></div>
					    </div>
					</div>
				  </div>	
			</div>
			<div class="ward-order-item2 card ward-div"></div>			
		</div>
	</div>
</body>

<script>
	/* tab 메뉴 */
$(function(){
	$('.tabcontent > div').hide();
	$('.tabnav a').click(function () {
	  $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	  $('.tabnav a').removeClass('active');
	  $(this).addClass('active');
	  return false;
	}).filter(':eq(0)').click();
});
</script>
