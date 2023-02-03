<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 

<link href="<%=request.getContextPath()%>/resources/css/gridstack.min.css" rel="stylesheet"/>
<style type="text/css">
.grid-stack { 
		background: #FFFFFF;
		border-radius: 10px; 
		
	}
	.grid-stack-item-content { 
		background-color: #F2F1F1; 
		border-radius: 10px;
		border-top: 10px solid #6AAFE6;
		box-shadow: 10px 10px 10px rgba(0,0,0,0.1);
		padding: 20px;
		
	}
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
		font-size : 10px;
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

<div class="grid-stack">
  <div class="grid-stack-item" gs-w="4" gs-h="5">
  	<div class="grid-stack-item-content">
    <h1> 환자관리 </h1>
    	<div style="text-align: left;">
    	<select name='카테고리'>
    		<option value='환자이름'>환자 이름</option>
    		<option value='환자 코드'>환자 코드</option>
    		<option value='환자'>환자</option>
    	</select>
    		<input type="text" id="searchWD">
    		<button type="button" id="button1">검색</button>
    	</div>
    	<div style="border:1px solid">
			환자 정보 검색 부분    	
	    	<table border="1">
		        <tr>
		            <th>환자번호</th>
		            <th>환자명</th>
		            <th>생년월일</th>
		            <th>전화번호</th>
		        </tr>
		        <tr>
		            <td>${patientList[0].paNo}</td>
		            <td>${patientList[0].paName}</td>
		            <td>${patientList[0].paReg1}</td>
		            <td>${patientList[0].paHp}</td>
		        </tr>
		        <tr>
		            <td>${patientList[1].paNo}</td>
		            <td>${patientList[1].paName}</td>
		            <td>${patientList[1].paReg1}</td>
		            <td>${patientList[1].paHp}</td>
		        </tr>
		        <tr>
		            <td>${patientList[2].paNo}</td>
		            <td>${patientList[2].paName}</td>
		            <td>${patientList[2].paReg1}</td>
		            <td>${patientList[2].paHp}</td>
		        </tr>
		        <tr>
		            <td>${patientList[3].paNo}</td>
		            <td>${patientList[3].paName}</td>
		            <td>${patientList[3].paReg1}</td>
		            <td>${patientList[3].paHp}</td>
		        </tr>
		        <tr>
		            <td>${patientList[4].paNo}</td>
		            <td>${patientList[4].paName}</td>
		            <td>${patientList[4].paReg1}</td>
		            <td>${patientList[4].paHp}</td>
		        </tr>
    		</table>
    	</div>
    	
    	<form:form modelAttribute="patient" method="post">
    		<table class="table table-bordered" id="insertForm">
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
    				<th>주민번호1 </th>
    				<td>
    					<form:input path="paReg1" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    				<th>주민번호2 </th>
    				<td>
    					<form:input path="paReg2" type="text" cssClass="form-control"/>
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
    				<th>보험여부 </th>
    				<td>
    					<form:input path="paInyn" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    				<th>임신여부 </th>
    				<td>
    					<form:input path="paPrn" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    				<th>개인정보동의여부 </th>
    				<td>
    					<form:input path="paPiyn" type="text" cssClass="form-control"/>
    				</td>
    			</tr>
    			<tr>
    			<tr>
					<td colspan="2">
					<form:button type="submit" class="btn btn-success">저장</form:button>
					<td>
    			</tr>
    		</table>
    	</form:form>
    </div>
  </div>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  <div class="grid-stack-item" gs-w="4" gs-h="2">
    <div class="grid-stack-item-content">물리치료실 대기현황
<%--     	<img src="<c:url value='/resources/images/ptbedfull.png'/>" alt="로고"> --%>
    
    </div>
  </div>
  <div class="grid-stack-item" gs-w="4" gs-h="2">
    <div class="grid-stack-item-content">스케쥴 관리
    	<p>컨텐츠 or 버튼 들어갈꺼임~</p>
    </div>
  </div>
  <div class="grid-stack-item" gs-w="4" gs-h="1">
  	<div class="grid-stack-item-content">공지사항
    	<p>컨텐츠 or 버튼 들어갈꺼임~</p>
    </div>
  </div>
  <div class="grid-stack-item" gs-w="4" gs-h="1">
    <div class="grid-stack-item-content">데이터 통계
    	<p>컨텐츠 or 버튼 들어갈꺼임~</p>
    </div>
  </div>
  <div class="grid-stack-item" gs-w="2" gs-h="2">
    <div class="grid-stack-item-content">빈공간
    	<p>컨텐츠 or 버튼 들어갈꺼임~</p>
    </div>
  </div>
  <div class="grid-stack-item" gs-w="2" gs-h="2">
    <div class="grid-stack-item-content">제1진료실
    	<p>컨텐츠 or 버튼 들어갈꺼임~</p>
    </div>
  </div>
  <div class="grid-stack-item" gs-w="2"gs-h="2">
    <div class="grid-stack-item-content">제2진료실
    	<p>컨텐츠 or 버튼 들어갈꺼임~</p>
    </div>
  </div>
  <div class="grid-stack-item" gs-w="2"gs-h="2">
    <div class="grid-stack-item-content">제3진료실
    	<p>컨텐츠 or 버튼 들어갈꺼임~</p>
    </div>
  </div>
</div>

<script type="text/javascript">

	GridStack.init();
	
</script>