<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<link href="<%=request.getContextPath()%>/resources/css/gridstack.min.css" rel="stylesheet"/>
<title>원무과</title>
<style type="text/css">
	#patient {
		background-color: #ffffff;
		border : 1px solid #FF0000 ;
		width:80%; 
/* 		height: 82%;  */
		margin: auto; 
		text-align: center;"
	}
	#button1 {
		background-color: #ffffff;
		font-size : 15px;
		font-style:NanumSquareRound ;
	    
	}
	button {
	 border: none;
	 }
	
	.table1 {
	margin: 0 0 40px 0;
  	width: 100%;
  	box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  	display: table;
 	margin: 0 0 40px 0;
  	width: 100%;
  	box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  	display: table;
  	text-align: center;
	}
	.table2 {
	margin: 0 0 40px 0;
  	width: 100%;
  	box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  	display: table;
 	margin: 0 0 40px 0;
  	width: 100%;
  	box-shadow: 0 1px 3px rgba(0,0,0,0.2);
  	display: table;
  	text-align: center;
	}
	
	thead tr {
		background-color : #3161A3;
		color : #ffffff 
	}
	insertForm{
		width : 150px;
		height : 150px;
	}
</style>
<script>
$(function(){
	
	//환자 검색
	$("#button1").on("click", function(){
		let searchOption = $("#searchOption :selected").val();
		let searchWord = $("#searchWord").val();

		if(searchWord == ''){
			swal('검색 실패!', "검색어를 입력해주세요", 'warning');
			return false;
		}
		
		let data = {
				searchOption:searchOption,
				searchWord:searchWord
		}

		$.ajax({
			url : "receiptionPatientSearch",
			method : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			dataType:"json",
			success : function(result) {
				console.log(result);
				if(result == null || result.length == 0){
					//환자가 없을 때 
					swal('검색 실패!',"검색하신 환자 정보가 없습니다.",'error');
				}else if(result.length == 1){
					//환자가 한명일 때 
// 					$.each(result, function(i, v){
// 						paNo = `<a href='javascript:void(0);' onclick='patientCexHistory(\${v.paNo})';>\${v.paNo}</a>`
// 						$("#p_No").html(paNo);
// 						$("#p_Nm").html(v.paName);
// 						$("#p_reg").html(v.paReg);
// 						$("#p_sex").html(v.paSex);	
// 					});
				}else{
//  					환자가 여러명일 때 해결해야 함

				}
			}
		});
		
		$("#searchWord").val("");
		
	})
});

</script>
<div class="grid-stack">
  <div class="grid-stack-item" gs-w="4" gs-h="4">
  	<div class="grid-stack-item-content">
    <h4> 접수 </h4><hr>
    	<div style="text-align: left;">
    	<input type="radio" name="searchOption" value="paName" selected >환자명
    	<input type="radio" name="searchOption" value="paHp">전화번호
    	<input type="radio" name="searchOption" value="paReg">생년월일
    		<input type="text" id="searchWD">
    		<button type="button" id="button1">검색</button>
    	</div> 	
    	
    	<form:form commandName="receiptionVO" action="registration" method="post" style="margin-left : 0px;">
    		<table class="table table" id="insertForm" >
    			<tr>
    				<th>환자번호 </th>
    				<td>
    					<form:input path="paNo" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    				<th>환자명 </th>
    				<td>
    					<form:input path="paName" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    				<th>생년월일 </th>
    				<td>
    					<form:input path="paReg" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    				<th>전화번호 </th>
    				<td>
    					<form:input path="paHp" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    				<th>우편번호 </th>
    				<td>
    					<form:input path="paZip" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    				<th>주소 </th>
    				<td>
    					<form:input path="paAdd1" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    				<th>상세주소 </th>
    				<td>
    					<form:input path="paAdd2" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
					<td >
    					<form:select path="officeCd" >
    						<form:option value="DO101">제1진료실</form:option>
    						<form:option value="DO102">제2진료실</form:option>
    						<form:option value="DO103">제3진료실</form:option>
    					</form:select>
    				</td>
    				<td>
					<form:button type="submit" class="btn btn-success">접수</form:button>
    				</td>
    			</tr>
    		</table>
    	</form:form>
    </div>
  </div>
 
 
 
 
 
 
  <div class="grid-stack-item" gs-w="4" gs-h="5">
    <div class="grid-stack-item-content"><h4>입퇴원</h4><hr>

    
    </div>
  </div>
  <div class="grid-stack-item" gs-w="4" gs-h="3">
    <div class="grid-stack-item-content"><h4>수납</h4><hr>
    	<p>컨텐츠 or 버튼 들어갈꺼임~</p>
    </div>
  </div>
  <div class="grid-stack-item" gs-w="4" gs-h="2">
  	<div class="grid-stack-item-content"><h4>대기실</h4><hr>
    	<div style="width:180px; height:160px; background-color:white; display:inline-block" >제1 진료실</div>
    	<div style="width:180px; height:160px; background-color:white; display:inline-block" >제2 진료실</div>
    	<div style="width:180px; height:160px; background-color:white; display:inline-block" >제3 진료실</div>
    </div>
  </div>
  <div class="grid-stack-item" gs-w="4" gs-h="1">
    <div class="grid-stack-item-content"><h4>공지사항</h4><hr>
    	<p>컨텐츠 or 버튼 들어갈꺼임~</p>
    </div>
  </div>
</div>

<script type="text/javascript">

	GridStack.init();
	
</script>