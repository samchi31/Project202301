<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	a{
		text-decoration-line: none;
		font-size : 10px;
	}
	.modalTd{
		text-align : center;
	}
	.bedDive{
	    width: 390px;
	    align-self: center;
	    text-align: center;
	}
	.bed6_01_03{
		margin-right: 15px;
	}
	.bed6_04_06{
		margin-right: 15px;
    	margin-top: 15px;
	}
</style>

<div class="grid-stack">
  <div class="grid-stack-item " gs-w="2" gs-h="2">
  	<div class="grid-stack-item-content ">
    <h4> 환자관리 </h4><hr>
    	<form id="radi-search-form" class="search-form" name="searchForm"
					onkeydown="f_block()">
			<div>
			
			<select id="searchOption" class="radi-select" style="width:75px;">
				<option value ="search">검색</option>
				<option value="paName">이름</option>
				<option value="paHp">전화번호</option>
				<option value="paReg">생년월일</option>
			</select> 
			
			<input name="searchBtn" class="radi-input" id="searchWord"
				type="text" value="" style="width:100px; display:inline-block;"> 
			<input class="btn-submit"
				id="Search" type="button" value="검색">
			</div>
		</form>
		<table class="table-blue scrollhover" >
			<thead>
				<tr>
					<th><a>환자번호</a></th>
					<th><a>환자명</a></th>
					<th><a>생년월일</a></th>
					<th><a>전화번호</a></th>
					<th><a>성별</a></th>
				</tr>
			</thead>
			<tbody id="radiTBody">
			
			</tbody>
		</table>
    </div>
  </div>
 
 

  
  

  <div class="grid-stack-item" gs-w="3" gs-h="2">
  	<div class="grid-stack-item-content"><h4>대기실</h4><hr>
  	<div class="tab patient-wait">
	    <ul class="tabnav">
	      <li><a href="#docOffice01">1진료실</a></li>
	      <li><a href="#docOffice02">2진료실</a></li>
	      <li><a href="#docOffice03">3진료실</a></li>
	    </ul>
    <div class="tabcontentWrap">
	    <div class="tabcontent">
	   		<div id="docOffice01" style="background-color:white; display:inline-block" >
	    		<table class="table-blue" >
					<thead>
						<tr>
							<th><a>환자번호</a></th>
							<th><a>환자명</a></th>
							<th><a>생년월일</a></th>
							<th><a>상태</a></th>
						</tr>
					</thead>
					<tbody id="doc01_disp">
						<c:forEach items="${DO101List }" var="list">
							<tr>
								<td>${list["paNo"] }</td>
								<td>${list["paName"] }</td>
								<td>${list["paReg"] }</td>
								<td>${list["waitstNm"] }</td>
							</tr>
						</c:forEach> 
					</tbody>
				</table>
    	</div>
    	<div id="docOffice02" style="background-color:white; display:inline-block" >
    		<table class="table-blue" >
				<thead>
					<tr>
						<th><a>환자번호</a></th>
						<th><a>환자명</a></th>
						<th><a>생년월일</a></th>
						<th><a>상태</a></th>
					</tr>
				</thead>
				<tbody id="doc02_disp">
					<c:forEach items="${DO102List }" var="list">
						<tr>
							<td>${list["paNo"] }</td>
							<td>${list["paName"] }</td>
							<td>${list["paReg"] }</td>
							<td>${list["waitstNm"] }</td>
						</tr>
					</c:forEach> 
				</tbody>
			</table>
    	</div>
    	<div id="docOffice03" style="background-color:white; display:inline-block" >
    		<table class="table-blue" >
				<thead>
					<tr>
						<th><a>환자번호</a></th>
						<th><a>환자명</a></th>
						<th><a>생년월일</a></th>
						<th><a>상태</a></th>
					</tr>
				</thead>
				<tbody id="doc03_disp">
					<c:forEach items="${DO103List }" var="list">
						<tr>
							<td>${list["paNo"] }</td>
							<td>${list["paName"] }</td>
							<td>${list["paReg"] }</td>
							<td>${list["waitstNm"] }</td>
						</tr>
					</c:forEach> 
				</tbody>
			</table>
    	</div>
    </div>
  </div>
 </div>
    </div>
  </div>  
    
  <div class="grid-stack-item" gs-w="4" gs-h="2">
    <div class="grid-stack-item-content"><h4>입/퇴원</h4><hr>
    	 <div class="tab patient-hospt">
		    <ul class="tabnav">
		      <li><a href="#inHospt">입원</a></li>
		      <li><a href="#outHospt">퇴원</a></li>
		    </ul>
		    <div class="tabcontentWrap">
			    <div class="tabcontent" >
			      <div id="inHospt" style="display:flex;">
			    	<table>
			    		<tr>
				    		<td><label style="width:50px;">차트번호</label></td>
				    		<td><input type="text" id="chartNo" name="chartNo" value="" readonly disabled/></td>
			    		</tr>
			    		<tr>
				    		<td><label>환자명</label></td>
				    		<td><input type="text" id="patientName" name="patientName" value="" readonly disabled/></td>
			    		</tr>
			    		<tr>
				    		<td><label>담당의</label></td>
				    		<td><input type="text" id="chargeOf" name="chargeOf" value="" readonly disabled/></td>
			    		</tr>
			    		<tr>
				    		<td><label>입원일자</label></td>
				    		<td><input type="datetime" id="hsptInDt" name="hsptInDt" value="" readonly disabled/></td>
			    		</tr>
			    		<tr>
				    		<td><label>퇴원일자</label></td>
				    		<td><input type="text" id="hsptOutDt" name="hsptOutDt" value="" readonly disabled/></td>
			    		</tr>
			    		<tr>
			    			<td colspan="2">
			    			<input type="button" id="wardChoose" value="병실배정" data-bs-toggle="modal" data-bs-target="#exampleModalToggle">
			    			<input type="button" id="inHosptBtn" name="inHosptBtn" value="입원등록"/>
			    			</td>
			    		</tr>
			    	</table>
			    	<div style="width:50px;"></div>
				  <div id="hospitalList" style="display:inline-block;">
				  	<table class="table-blue scrollhover" >
				  		<thead>
							<tr>
								<th><a>차트번호</a></th>
								<th><a>환자번호</a></th>
								<th><a>이름</a></th>
								<th><a>생년월일</a></th>
								<th><a>담당의</a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${operationList }" var="oper">
								<tr class="operTr">
									<td>${oper["trmCd"] }</td>
									<td>${oper["paNo"] }</td>
									<td>${oper["paName"] }</td>
									<td>${oper["paReg"] }</td>
									<td>${oper["empNm"] }</td>
								</tr>
							</c:forEach>
						</tbody>
				  	</table>
				  </div>
				  </div>
			      <div id="outHospt">
				    	<table>
    					</table>
				  </div>
				</div>
			</div>
		</div>
	</div>
  </div>




<div class="grid-stack-item" gs-w="3" gs-h="4">
    <div class="grid-stack-item-content"><h4>수납</h4><hr>
		<div>
			<div>제증명및기타<input class="form-control" type="number" name="rdEtcf" value="${receive_detail.rdEtcf}" /></div>
			<div>진료비 총액<input class="form-control" type="number" name="rdTtfe" value="${receive_detail.rdTtfe}" /></div>
			<div>환자부담 총액<input class="form-control" type="number" name="rdPafe" value="${receive_detail.rdPafe}" /></div>
			<div>납부할 금액<input class="form-control" type="number" name="rdBffe" value="${receive_detail.rdBffe}" /></div>
			<div>이미 납부한 금액<input class="form-control" type="number" name="rdAtfe" value="${receive_detail.rdAtfe}" /></div>
			<div>진찰료<input class="form-control" type="number" name="rdCofe" value="${receive_detail.rdCofe}" /></div>
			<div>입원료<input class="form-control" type="number" name="rdHpfe" value="${receive_detail.rdHpfe}" /></div>
			<div>식대<input class="form-control" type="number" name="rdFdfe" value="${receive_detail.rdFdfe}" /></div>
			<div>투약및조제료<input class="form-control" type="number" name="rdDrfe" value="${receive_detail.rdDrfe}" /></div>
			<div>주사료<input class="form-control" type="number" name="rdIjfe" value="${receive_detail.rdIjfe}" /></div>
			<div>물리치료비<input class="form-control" type="number" name="rdPtfe" value="${receive_detail.rdPtfe}" /></div>
			<div>치료재료대<input class="form-control" type="number" name="rdMtfe" value="${receive_detail.rdMtfe}" /></div>
			<div>영상검사료<input class="form-control" type="number" name="rdExfe" value="${receive_detail.rdExfe}" /></div>
			<div>영상진단료<input class="form-control" type="number" name="rdMdfe" value="${receive_detail.rdMdfe}" /></div>
			<div>수술료<input class="form-control" type="number" name="rdOperfe" value="${receive_detail.rdOperfe}" /></div>
		</div>
    </div>
  </div>


 
 
  <div class="grid-stack-item" gs-w="2" gs-h="3">
    <div class="grid-stack-item-content"><h4>접수</h4><hr>
    <div class="tab patient-rcp">
			    <ul class="tabnav">
			      <li><a href="#operWait">접수</a></li>
			      <li><a href="#operSchedule">환자등록</a></li>
			    </ul>
			    <div class="tabcontentWrap">
				    <div class="tabcontent">
				      <div id="operWait">
					    	<table>
					    		<tr>
						    		<td><label>환자번호</label></td>
						    		<td><input type="text" id="regipaNo" name="regipaNo" value="" readonly disabled/></td>
					    		</tr>
					    		<tr>
							    	<td><label>환자명</label></td>
							    	<td><input type="text" id="regipaName" name="regipaName" value=""readonly disabled/></td>
					    		</tr>
					    		<tr>
							    	<td><label>생년월일</label></td>
							    	<td><input type="text" id="regipaReg" name="regipaReg" value="" readonly disabled/></td>
					    		</tr>
					    		<tr>
							    	<td><label>전화번호</label></td>
							    	<td><input type="text" id="regipaHp" name="regipaHp" value="" readonly disabled/></td>
					    		</tr>
					    		<tr>
							    	<td><label>성별</label></td>
							    	<td><input type="text" id="regipaSex" name="regipaSex" value="" readonly disabled/></td>
					    		</tr>
						    	<tr>
						    		<td>
							    	<select>
							    		<option name="officeCd" value="DO101">제 1진료실</option>
							    		<option name="officeCd" value="DO102">제 2진료실</option>
							    		<option name="officeCd" value="DO103">제 3진료실</option>
							    	</select>
						    		</td>
						    		<td>
						    			<input type="button" id="regiBtn" value="접수">
						    			<input type="button" id="listBtn" value="체크" onclick="fn_waitList()">
						    		</td>
						    	</tr>
					    	</table>
				      </div>
				      <div id="operSchedule">
					    	<table>
					    		<tr>
							    	<td><label>환자명</label></td>
							    	<td><input type="text" id="paName" name="paName" value=""/></td>
					    		</tr>
					    		<tr>
							    	<td><label>생년월일</label></td>
							    	<td><input type="text" id="paReg" name="paReg" value="" /></td>
					    		</tr>
					    		<tr>
							    	<td><label>전화번호</label></td>
							    	<td><input type="text" id="paHp" name="paHp" value=""/></td>
					    		</tr>
					    		<tr>
							    	<th><label>우편번호</label></th>
							    	<td><input type="text" id="paZip" name="paZip" value=""/></td>
					    		</tr>
					    		<tr>
							    	<th><label>주소</label></th>
							    	<td><input type="text" id="paAdd1" name="paAdd1" value=""/></td>
					    		</tr>
					    		<tr>
							    	<th><label>상세주소</label></th>
							    	<td><input type="text" id="paAdd2" name="paAdd2" value=""/></td>
					    		</tr>
					    		<tr>
							    	<th><label>성별</label></th>
							    	<td><select id="paSex">
							    		<option value="M">남</option>
							    		<option value="F">여</option>
							    	</select>
							    	</td>
					    		</tr>
						    	<tr>
						    		<td colspan="2">
						    			<input type="button" id="newPAbtn" value="등록">
						    		</td>
						    	</tr>
					    	</table>
				      </div>

				    </div>
				</div>
			</div>
	  
    </div>
  </div>
 </div>
  
<div class="grid-stack-item" gs-w="3" gs-h="2">
    <div class="grid-stack-item-content"><h4>SMS</h4><hr>
    	<div class="tab patient-sms">
		    <ul class="tabnav">
		      <li><a href="#sendSMS">전송</a></li>
		      <li><a href="#updateSMS">수정</a></li>
		    </ul>
	    <div class="tabcontentWrap">
		    <div class="tabcontent">
		      <div id="sendSMS" style="display:flex;">
		      	<div style="border:pink solid 1px; width:250px;">
		      		<table class="table-blue">
	      				<c:forEach var="sms" items="${smsList }" varStatus="i">
	      					 <tr>
	      						<td>${i.index}${sms.smsCont }</td>
	      					</tr>
	      				</c:forEach>
		      		</table>
		      	</div>
		      	<div style="margin-left:20px;">
		      		<textarea rows="5" cols="40"></textarea>
		      	</div>
		      	<div style="display:block;">
		      		<input type="button" value="전송" />
		      	</div>
		      </div>
			      
		      
		      
		      <div id="updateSMS">
				<table>
					<tr id="smstList">
						
						
					</tr>
						<input type="button" id="newSms" value="추가" data-bs-toggle="modal" data-bs-target="#smsInsert">
						<input type="button" id="updateSms" value="수정" data-bs-toggle="modal" data-bs-target="#smsUpdate">
						<input type="button" id="deleteSms" value="삭제">
				</table>	      
		      </div>
	      </div>
		</div>
    	</div>
	</div>
</div>




<div class="grid-stack-item" gs-w="3" gs-h="2">
    <div class="grid-stack-item-content"><h4>비품관리</h4><hr>
    	<div class="tab patient-items">
		    <ul class="tabnav">
		      <li><a href="#itemList">비품관리</a></li>
		      <li><a href="#orderItems">비품발주</a></li>
		    </ul>
	    <div class="tabcontentWrap">
		    <div class="tabcontent">
		      <div id="itemList">
		      </div>
		      <div id="orderItems">
						      
		      </div>
	      </div>
		</div>
    	</div>
	</div>
</div>
</div>  

<!-- 모달 시작 -->
<!-- Modal -->
<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel">인원 구분</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table style="width:100%">
          <tr>
            <td class="modalTd">
            <img alt="병실구분 2인실" src="${pageContext.request.contextPath }/resources/images/ptbedfull.png"/>
            </td>
            <td class="modalTd">
            <img alt="병실구분 4인실" src="${pageContext.request.contextPath }/resources/images/ptbedfull.png"/>
            </td>
            <td class="modalTd">
            <img alt="병실구분 6인실" src="${pageContext.request.contextPath }/resources/images/ptbedfull.png"/>
            </td>
          </tr>
          <tr>
          	<td class="modalTd">
	          	<div><label>2인실</label></div>
	          	<label>101호</label><input type="radio" name="hosil"  data-bs-target="#exampleModalToggle2"/>	
	       		<label>102호</label><input type="radio" name="hosil"  data-bs-target="#exampleModalToggle2"/>
          	</td>
          	<td class="modalTd">
          		<div><label>4인실</label></div>
          		<label>103호</label><input type="radio" name="hosil" data-bs-target="#exampleModalToggle3"/>
       			<label>104호</label><input type="radio" name="hosil" data-bs-target="#exampleModalToggle3"/>
          	</td>
          	<td class="modalTd">
          		<div><label>6인실</label></div>
          			<label>105호</label><input type="radio" name="hosil" />
       				<label>106호</label><input type="radio" name="hosil" />
          	</td>
          </tr>
        </table>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle4" data-bs-toggle="modal" data-bs-dismiss="modal">침상 구분</button>
      </div>
    </div>
  </div>
</div>
<!-- 2인실  -->
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel2">침상 구분</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body bedDive" >
       	<img alt="2인실 01호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <img alt="2인실 02호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">등록</button>
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
      </div>
    </div>
  </div>
</div>
<!-- 2인실 끝 -->

<!-- 4인실  -->
<div class="modal fade" id="exampleModalToggle3" aria-hidden="true" aria-labelledby="exampleModalToggleLabel3" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel3">침상 구분</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body bedDive">
       	<img alt="4인실 01호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <img alt="4인실 02호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <img alt="4인실 03호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <img alt="4인실 04호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">등록</button>
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
      </div>
    </div>
  </div>
</div>
<!-- 4인실 끝 -->

<!-- 6인실  -->
<div class="modal fade" id="exampleModalToggle4" aria-hidden="true" aria-labelledby="exampleModalToggleLabel4" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalToggleLabel4">침상 구분</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body bedDive">
       	<img alt="6인실 01호 침상" class="bed6_01_03" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <img alt="6인실 02호 침상" class="bed6_01_03" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <img alt="6인실 03호 침상" class="bed6_01_03" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <img alt="6인실 04호 침상" class="bed6_04_06" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <img alt="6인실 05호 침상" class="bed6_04_06" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <img alt="6인실 06호 침상" class="bed6_04_06" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
      </div>
      <div class="modal-footer">
       <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">등록</button>
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
      </div>
    </div>
  </div>
</div>
<!-- 6인실 끝 -->
<!-- 모달 끝 -->



<!-- SMS등록모달 -->
<!-- Modal -->
<div class="modal fade" id="smsInsert" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">SMS 등록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table>
        	<div>제목</div>
        	<input type="text">
        	<div>내용</div>
        	<textarea id="smsCont" rows="15" cols="50"></textarea>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" id="smsInsertBtn" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- SMS등록모달 끝 -->

<!-- SMS수정모달 -->
<!-- Modal -->
<div class="modal fade" id="smsUpdate" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">SMS 수정</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <table>
        	<div>제목</div>
        	<input type="text">
        	<div>내용</div>
        	<textarea id="smsCont" rows="15" cols="50"></textarea>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" id="smsUpdateBtn" class="btn btn-primary">수정</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- SMS수정모달 끝 -->



<script type="text/javascript">

	GridStack.init()

	function f_block(){
		if(event.keyCode==13){
			event.preventDefault();
		}
	}


	/* 검색 */
	//엔터키 누르면 검색실행되게 하는 코드
	$(document).ready(function(){
	    $("input[name=searchBtn]").keydown(function () {
			//event.stopPropagation();
	        if(event.keyCode == 13){//키가 13이면 실행 (엔터는 13)
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
			
			if(searchWord == ''){
				swal('검색 실패!', "검색어를 입력해주세요", 'error');
				return false;
			}
			
			let data = {
				searchOption:searchOption,
				searchWord:searchWord
			}
			
			$.ajax({
				url : "patientSearch",
				method : "post",
				data : JSON.stringify(data),
				contentType : "application/json;charset=utf-8",
				dataType : "json",
				beforeSend: function(xhr) {
			            xhr.setRequestHeader(header, token);
			    },
				success : function(result) { 
// 					console.log(result);
					if(result == null || result.length == 0){
						// 기록이 없을 때
						swal('검색실패', "환자 정보가 없습니다.", "error");
					}else if(result.length == 1){
						// 기록이 하나일 때
						let trTags = [];
						$.each(result, function(i, v){
							let trTag = $("<tr class='trClass'>")
							.append(
								$("<td>").html(v.paNo)
								, $("<td>").html(v.paName)
								, $("<td>").html(v.paReg)
								, $("<td>").html(v.paHp)
								, $("<td>").html(v.paSex)
							).data("waitVO",v);
							trTags.push(trTag);
						})
						$("#radiTBody").html(trTags);
						
						$(".trClass").on("click",function(){
							let paNo = $(this).find('td').eq(0).html()
							let paName = $(this).find('td').eq(1).html()
							let paReg = $(this).find('td').eq(2).html()
							let paHp = $(this).find('td').eq(3).html()
							let paSex = $(this).find('td').eq(4).html()
							
							$("#regipaNo").val(paNo);
							$("#regipaName").val(paName);
							$("#regipaReg").val(paReg);
							$("#regipaHp").val(paHp);
							$("#regipaSex").val(paSex);
						})
					}else{
						// 기록이 여러개일 때
						let trTags = [];
						$.each(result, function(i, v){
// 							console.log(v)
							let trTag = $("<tr class='trClass'>")
							.append(
								$("<td>").html(v.paNo)
								, $("<td>").html(v.paName)
								, $("<td>").html(v.paReg)
								, $("<td>").html(v.paHp)
								, $("<td>").html(v.paSex)
							).data("waitVO",v);
							trTags.push(trTag);
						})
						$("#radiTBody").html(trTags);
						
						$(".trClass").on("click",function(){
							let paNo = $(this).find('td').eq(0).html()
							let paName = $(this).find('td').eq(1).html()
							let paReg = $(this).find('td').eq(2).html()
							let paHp = $(this).find('td').eq(3).html()
							let paSex = $(this).find('td').eq(4).html()
							
							$("#regipaNo").val(paNo);
							$("#regipaName").val(paName);
							$("#regipaReg").val(paReg);
							$("#regipaHp").val(paHp);
							$("#regipaSex").val(paSex);
							
						})
						
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

// 	function fn_move(i,v){
// // 		console.log(i)
// 		console.log("체크"+v);
// 	}

	/* 검색 끝 */

	
//탭 메뉴 이동
$(function(){
	let paTab = $(".patient-wait");
	let paTabContents = $(".patient-wait .tabcontent > div");
	let rcpTab = $(".patient-rcp");
	let rcpTabContents = $(".patient-rcp .tabcontent > div");
	let hosptTab = $(".patient-hospt");
	let hosptTabContents = $(".patient-hospt .tabcontent > div");
	let smstTab = $(".patient-sms");
	let smsTabContents = $(".patient-sms .tabcontent > div");
	
	$('.tabcontent > div').hide();
	
	let paTabNavs = $('.patient-wait li a').click(function () {
		paTabContents.hide().filter(this.hash).fadeIn();
		paTabNavs.removeClass('active');
		$(this).addClass('active');
		return false;
	});
	paTabNavs.eq(0).click();
	
	let rcpTabNavs = $('.patient-rcp li a').click(function () {
		rcpTabContents.hide().filter(this.hash).fadeIn();
		rcpTabNavs.removeClass('active');
		$(this).addClass('active');
		return false;
	});
	rcpTabNavs.eq(0).click();
	
	let hosptTabNavs = $('.patient-hospt li a').click(function () {
		hosptTabContents.hide().filter(this.hash).fadeIn();
		hosptTabNavs.removeClass('active');
		$(this).addClass('active');
		return false;
	});
	hosptTabNavs.eq(0).click();
	
	let smsTabNavs = $('.patient-sms li a').click(function () {
		smsTabContents.hide().filter(this.hash).fadeIn();
		smsTabNavs.removeClass('active');
		$(this).addClass('active');
		return false;
	});
	smsTabNavs.eq(0).click();

});
	
// SMS 문자열 추가
$("#newSms").on("click",function(){
		
});
	
	
	
	
// 입원 환자 리스트에서 등록 테이블로 넣기 // 
$(".operTr").on("click",function(){
	let dt = new Date();
	let year = dt.getFullYear();
	let month = dt.getMonth()+1;
	let day = dt.getDate();
	
	let format = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2));
	
	let trmCd = $(this).find("td").eq(0).html();
	let paNo = $(this).find("td").eq(1).html();
	let paName = $(this).find("td").eq(2).html();
	let paReg = $(this).find("td").eq(3).html();
	let empNm = $(this).find("td").eq(4).html();
	console.log(trmCd)
	$("#chartNo").val(trmCd);
	$("#patientName").val(paName);
	$("#chargeOf").val(empNm);
	$("#hsptInDt").val(format);
});
///	리스트에 등록 끝 ///////


// 신규 환자 등록 //
$(function(){
	$("#newPAbtn").on("click", function(){
		let paName = $("#paName").val();
		let paReg = $("#paReg").val();		
		let paHp = $("#paHp").val();		
		let paZip = $("#paZip").val();		
		let paAdd1 = $("#paAdd1").val();	
		let paAdd2 = $("#paAdd2").val();	
		let paSex = $("#paSex").val();	

		let data = {
				paName : paName,
				paReg : paReg,
				paHp : paHp,
				paZip : paZip,
				paAdd1 : paAdd1,
				paAdd2 : paAdd2,
				paSex : paSex,
		}
		$.ajax({
			url : "/HurryUp/receiption/newPatient",
			method : "post",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) { 			
				$("#paName").val("");
				$("#paReg").val("");
				$("#paHp").val("");
				$("#paZip").val("");
				$("#paAdd1").val("");
				$("#paAdd2").val("");
				$("#paSex").val("");
				swal("환자등록 성공")
				
				fn_selectPatient();
			}					
		});
	});
});	

// 새로 등록한 환자 접수 테이블에 넣기	//
function fn_selectPatient(){
	$.ajax({
		url : "/HurryUp/receiption/selectPatient",
		method : "post",
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success : function(result) {
			let regipaNo  = result.paNo;
			let regipaName = result.paName;
			let regipaReg = result.paReg;
			let regipaHp = result.paHp;
			let regipaSex = result.paSex;
			$("#regipaNo").val(regipaNo);
			$("#regipaName").val(regipaName);
			$("#regipaReg").val(regipaReg);
			$("#regipaHp").val(regipaHp);
			$("#regipaSex").val(regipaSex);
		}
	})
 }

//새로 등록한 환자 접수 테이블에 넣기	끝	//


// 접수 등록 //
$(function(){
	$("#regiBtn").on("click", function(){
		let paNo = $("#regipaNo").val();		
		let officeCd = $("[name=officeCd]:selected").val();
		console.log(paNo)
		console.log(officeCd)
		let data = {
				paNo : paNo,
				officeCd: officeCd
		}
		$.ajax({
			url : "/HurryUp/receiption/registration",
			method : "post",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) { 
				$("#regipaNo").val("");
				$("#regipaName").val("");
				$("#regipaReg").val("");
				$("#regipaHp").val("");
				$("#regipaSex").val("");
				swal("환자 접수가 완료되었습니다.")
				fn_insertHitsory();
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(error);
			}
		});
	});
});	

// 대기 히스토리 등록 함수 //
function fn_insertHitsory(){
	$.ajax({
		url : "/HurryUp/receiption/waitingHistory",
		method : "post",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
   		 },
		success : function(result) { 
		}
	})
}

// 대기 히스토리 함수 끝 //


// 접수된 환자 대기실에 표시하기 //
function fn_waitList(){
	let officeCd = $("[name=officeCd]:selected").val();
	let data = {"officeCd":officeCd}
	console.log("officeCd : " + officeCd);
	console.log("data : " + JSON.stringify(data));
	
	$.ajax({
		url:"/HurryUp/receiption/waitingList",
		type:"post",
		data:JSON.stringify(data),
		contentType:"application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
   		},
		dataType : "json",
		success:function(result) {
			console.log("result : " + JSON.stringify(result));
			
			let trTags = [];
			$.each(result, function(i,v){
				let trTag = $("<tr>")
				.append(
					$("<td>").html(v.paNo)
					, $("<td>").html(v.paName)
					, $("<td>").html(v.paReg)
					, $("<td>").html(v.waitstNm)
				).data("waitList",v);
				trTags.push(trTag);
			});
			if(officeCd == "DO101"){
				$("#doc01_disp").html(trTags);
			} else if(officeCd == "DO102"){
				$("#doc02_disp").html(trTags);
			} else{
				$("#doc03_disp").html(trTags);
			}
		}// success 끝 
	});
}
// 접수된 환자 대기실에 표시하기 끝//


/****************************************************************/
// 수납 qqq

let $rdEtcf = $("input[name=rdEtcf]");
let $rdTtfe = $("input[name=rdTtfe]");
let $rdPafe = $("input[name=rdPafe]");
let $rdBffe = $("input[name=rdBffe]");
let $rdAtfe = $("input[name=rdAtfe]");
let $rdCofe = $("input[name=rdCofe]");
let $rdHpfe = $("input[name=rdHpfe]");
let $rdFdfe = $("input[name=rdFdfe]");
let $rdDrfe = $("input[name=rdDrfe]");
let $rdIjfe = $("input[name=rdIjfe]");
let $rdPtfe = $("input[name=rdPtfe]");
let $rdMtfe = $("input[name=rdMtfe]");
let $rdExfe = $("input[name=rdExfe]");
let $rdMdfe = $("input[name=rdMdfe]");
let $rdOperfe = $("input[name=rdOperfe]");

let trmCd = -1;

//접수환자 클릭 시 차트 수납 목록 표시
let f_getChart = function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/receive/chart/" + rcpNo,
		method : "get",
		dataType:"text",
		success : function(resp) {
			console.log("chart : ", resp);
			if(!resp) { return; }		 	
			let data = JSON.parse(resp);
					
			f_setReceiveData(data);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
};

// 가짜로 가격 랜덤 ( 7000 + 0 ~ 10000 )
let f_randPrice = function(){
	// 0 <= r <= 10 
	let rand_0_10 = Math.floor(Math.random() * 11);
	return 7000 + rand_0_10 * 1000;
};
// 가격 박기
let f_setReceiveData = function(v_data){
	let price1 = 0;
	let price2 = 0;
	
	trmCd = v_data.trmCd;
	
	// 제증명및 기타
	$rdEtcf.val(f_randPrice);
	
	// 수술 비, 물리치료비
	$.each(data.diagHistoryVOList, function(i, v){
		console.log(i,v);
		if(v.operTf == "Y"){
			price1 += 121300;
		}					
		if(v.physiotherapyTf == "Y"){
			price2 += 13400;
		}
		
	});	
	$rdOperfe.val(price1);
	$rdPtfe.val(price2);
	
	// 수술했으면
	if(price1 > 0){
		// 입원비
		$rdHpfe.val(174000);
		// 식대
		$rdFdfe.val(9000);
		// 투약및조제료
		$rdDrfe.val(10000);
		// 주사료
		$rdIjfe.val(13000);
	}
	
	// 진료비
	$rdCofe.val(v_randPrice());
	
	// 영상검사료
	price1=0;
	$.each(data.filmOrderVOList,function(i, v){
		price1 += 21000;
	});
	$rdExfe.val(price1);
	
	
	// 진료비 총액
	$rdTtfe.val($rdOperfe.val() + $rdPtfe.val() + $rdHpfe.val() 
			+ $rdFdfe.val() + $rdDrfe.val() + $rdIjfe.val() 
			+ $rdCofe.val() + $rdExfe.val());
};

// 수납 정보 입력
let f_complete = function(){
	
	if(trmCd == -1){ return; } 
	let data = {
			rdOperfe : $rdOperfe.val()
			, rdPtfe : $rdPtfe.val()
			, rdHpfe : $rdHpfe.val() 
			, rdFdfe : $rdFdfe.val()
			, rdDrfe : $rdDrfe.val()
			, rdIjfe : $rdIjfe.val() 
			, rdCofe : $rdCofe.val()
			, rdExfe : $rdExfe.val()
			, trmCd : trmCd 
	};
	
	$.ajax({
		url : "${pageContext.request.contextPath}/receive/detail",
		method : "post",
		data : data,
		contentType : "application/json;charset=UTF-8",
		//dataType : "",
		beforeSend: function(xhr) {
	    	xhr.setRequestHeader(header, token);
	    },
		success : function(resp) {
			console.log(resp);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}


/****************************************************************/
</script>