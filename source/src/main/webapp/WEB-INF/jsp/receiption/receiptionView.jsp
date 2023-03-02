<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>원무과</title>
<style type="text/css">
	   #patient {
      background-color: #ffffff;
      border : 1px solid #FF0000 ;
      width:80%; 
      margin: auto; 
      text-align: center;"
   }
   
   #button1 {
      background-color: #ffffff;
      font-size : 15px;
      font-style:NanumSquareRound ;
       
   }
   .table1 {
   	margin: 0 0 40px 0;
   }
   
   .table2 {
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
   a {
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
   .cover{ 
       display : inline-block;
   } 
   
   .pTag {
   color: #868e96;
    font-family: 'spo';
    margin-bottom: 0px;
   }
   .form-control {
	font-family: 'spo';
	font-size: 12px;
}

.form-input {
	width: 5.25rem;
	height: 1.7rem;
	background-color: #004262;
	color: white;
	border: none;
	font-size: 12px;
	float: right;
}


select {
	width: 6.5rem;
	height: 1.6rem;
	font-size: 13px;
	border: 1px solid #ddd;
}

select>input {
	width: 14.25rem;
	height: 1.6rem;
	/* 	padding-bottom: 5px; */
	font-size: 16px;
	border: 1px solid #ddd;
}

.btn-submit {
	width: 5.25rem;
	height: 1.7rem;
	background-color: #004262;
	color: white;
	border: none;
	/* 	margin: 0.188rem; */
	/* 	box-shadow: 1px 1px 2px grey; */
	font-size: 13px;
}



</style>
<!-- 그리드 스택  -->
<div class="grid-stack">
   
  <!-- 그리드스택 아이템 -->
  <div class="grid-stack-item " gs-w="2" gs-h="2">
	<div class="grid-stack-item-content ">
    <h4 class="h4-title1">환자관리 </h4>
    <p class="pTag">이름, 생년월일, 전화번호로 환자 조회 가능합니다.</p>
    <hr>
    <form id="radi-search-form" class="search-form" name="searchForm" onkeydown="f_block()">
		<select id="searchOption" class="radi-select" style=" width:75px; ">
			<option value ="search">검색</option>
			<option value="paName">이름</option>
			<option value="paHp">전화번호</option>
			<option value="paReg">생년월일</option>
	    </select> 
		    <input name="searchBtn" class="radi-input" id="searchWord" type="text" value="" style="width:100px; display:inline-block;"> 
		    <input class="btn-submit" id="Search" type="button" value="검색">
		    <input class="btn-submit" id="proofPrint" type="button" data-bs-toggle="modal" data-bs-target="#layerpop" value="제증명출력">
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
         <tbody id="radiTBody"></tbody>
      </table>
    </div>
  </div>
	
  <!-- 그리드스택 아이템2 -->
  <div class="grid-stack-item" gs-w="3" gs-h="3">
     <div class="grid-stack-item-content"><h4 class="h4-title1">대기실</h4><p class="pTag">진료 접수를 한 환자를 진료실 별로 확인 할 수 있습니다.</p><hr>
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
    
   <!-- 그리드스택 아이템 -->
  <div class="grid-stack-item" gs-w="4" gs-h="3">
    <div class="grid-stack-item-content"><h4 class="h4-title1">입/퇴원</h4><p class="pTag">입원 가능한 환자 정보를 클릭 후 입력된 폼에 병실 배정을 진행 하여 입원 등록을 할 수 있습니다.</p><hr>
        <div class="tab patient-hospt">
          <ul class="tabnav">
            <li><a href="#inHospt">입원</a></li>
            <li><a href="#outHospt">퇴원</a></li>
            <li><a href="#manaHospt">관리</a></li>
          </ul>
          <div class="tabcontentWrap">
             <div class="tabcontent" >
               <div id="inHospt" style="display:flex; position: absolute;left: 3%;">
                  <div >
                <table>
                   <tr>
                      <td><label style="width:50px;">차트번호</label></td>
                      <td><input class="form-control form-control-sm" type="text" id="chartNo" name="chartNo" value="" readonly disabled/></td>
                   </tr>
                   <tr>
                      <td><label>환자명</label></td>
                      <td><input class="form-control form-control-sm" type="text" id="patientName" name="patientName" value="" readonly disabled/></td>
                   </tr>
                   <tr>
                      <td><label>담당의</label></td>
                      <td><input class="form-control form-control-sm" type="text" id="chargeOf" name="chargeOf" value="" readonly disabled/></td>
                   </tr>
                   <tr>
                      <td><label>입원일자</label></td>
                      <td><input class="form-control form-control-sm" type="datetime" id="hsptInDt" name="hsptInDt" value="" readonly disabled/></td>
                   </tr>
                   <tr>
                      <td><label>퇴원일자</label></td>
                      <td><input class="form-control form-control-sm" type="text" id="hsptOutDt" name="hsptOutDt" value="" readonly disabled/></td>
                   </tr>
                   <tr>
                      <td><label>질병코드</label></td>
                      <td><input class="form-control form-control-sm" type="text" id="diseaseCd" name="diseaseCd" value="" readonly disabled/></td>
                   </tr>
                </table>
                      <input type="button" class="btn-submit" id="wardChoose" value="병실배정" data-bs-toggle="modal" data-bs-target="#exampleModalToggle" style="margin-top:5px;"/>
                </div>
                <div style="width:20px;"></div>
             
              <div id="hospitalList" style="display:inline-block; width: 350px;">
                 <table class="table-blue scrollhover" >
                    <thead>
                     <tr>
                        <th><a>차트번호</a></th>
                        <th><a>환자번호</a></th>
                        <th><a>이름</a></th>
                        <th><a>생년월일</a></th>
                        <th><a>담당의</a></th>
                        <th><a>질병코드</a></th>
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
                           <td>${oper["diseaseCd"] }</td>
                        </tr>
                     </c:forEach>
                  </tbody>
                 </table>
              </div>
              </div>
              <div id="outHospt">
		    	<table class="table-blue scrollhover" >
		    		<thead>
		    			<tr>
		    				<th><a>환자이름</a></th>
		    				<th><a>입퇴원번호</a></th>
		    				<th><a>차트번호</a></th>
		    				<th><a>입원일시</a></th>
		    				<th><a>퇴원예정일</a></th>
		    				<th><a>병상</a></th>
		    				<th><a>질병코드</a></th>
		    			</tr>
		    		</thead>
		    		<tbody id="tbdOutHsptList">
						<c:forEach items="${outHsptList }" var="outHspt">
							<tr class="hsptTr">
								<td>${outHspt["paName"] }</td>
								<td>${outHspt["hsptNo"] }</td>
								<td>${outHspt["trmCd"] }</td>
								<td>${outHspt["hsptInDt"] }</td>
								<td>${outHspt["hsptOutDt"] }</td>
								<td>${outHspt["wrRno"] }호 ${outHspt["bedNo"] }번</td>
								<td>${outHspt["diseaseCd"] }</td>
							</tr>
								<div><input type="hidden" value="${outHspt['rcpNo']}"/></div>
						</c:forEach>
					</tbody>
						
  					</table>
  					  <div>
  					  	<input type="hidden" id="hiddenHsptNo" value=""/>
  					  </div>
					  <div>
						<input class="btn-submit" type="button" id="exitHospt" value="퇴원" style="margin-top:5px;"/>
						<input class="btn-submit" type="button" id="cancleHospt" value="입원취소"/>
					  </div>
			  </div>
			   <div id="manaHospt">
			       <table class="table-blue scrollhover" >
		    		  <thead>
			    		  <tr>
	                         <th><a>이름</a></th>
	                         <th><a>생년월일</a></th>
			    		  	 <th><a>병실</a></th>
	                         <th><a>침대</a></th>
	                         <th><a>입실일자</a></th>
	                         <th><a>퇴원예정</a></th>
	                         <th><a>담당의</a></th>
	                         <th><a>비고</a></th>
			    		  </tr>
    		   		  </thead>
    		   		  <tbody id="outHsptListTbody">
    		   		  	<c:forEach items="${outHsptList }" var="outHspt">
							<tr class="hsptTr">
								<td>${outHspt["paName"] }</td>
								<td>${outHspt["hsptNo"] }</td>
								<td>${outHspt["trmCd"] }</td>
								<td>${outHspt["hsptInDt"] }</td>
								<td>${outHspt["hsptOutDt"] }</td>
								<td>${outHspt["wrRno"] }호 ${outHspt["bedNo"] }번</td>
								<td>${outHspt["diseaseCd"] }</td>
								<td>-</td>
							</tr>
								<div><input type="hidden" value="${outHspt['rcpNo']}"/></div>
						</c:forEach>
    		   		  </tbody>
	    		   </table>
	    		   <div>
	    		   	<input class="btn-submit" type="button" value="병실이동" data-bs-toggle="modal" data-bs-target="#exampleModalToggle" style="margin-top:5px;"/>
	    		   </div>
    		   </div>
				</div>
			</div>
		</div>
	</div>
  </div>

  

<div class="grid-stack-item" gs-w="3" gs-h="5">
    <div class="grid-stack-item-content">
    	<h4 class="h4-title1">수납</h4>
    	<p class="pTag">진료 및 퇴원을 통한 환자의 정보를 토대로 수납을 진행합니다.</p>
    	<hr>
    	<button id="rec_btn">수납</button>
		<div>
			         <div class="mb-3 row">
         	<label class="col-sm-3 col-form-label">제증명및기타</label>
         	<div class="col-sm-9">
         		<input class="form-control" type="number" name="rdEtcf" value="${receive_detail.rdEtcf}" />
         	</div>
         </div>
         <div class="mb-3 row">
         	<label class="col-sm-3 col-form-label">진료비 총액</label>
         	<div class="col-sm-9">
         		<input class="form-control" type="number" name="rdTtfe" value="${receive_detail.rdTtfe}" />
         	</div>
         </div>
         <div class="mb-3 row">
         	<label class="col-sm-3 col-form-label">환자부담 총액</label>
         	<div class="col-sm-9">
         		<input class="form-control" type="number" name="rdPafe" value="${receive_detail.rdPafe}" />
         	</div>
         </div>
         <div class="mb-3 row">
         	<label class="col-sm-3 col-form-label">납부할 금액</label>
         	<div class="col-sm-9">
	        	<input class="form-control" type="number" name="rdBffe" value="${receive_detail.rdBffe}" />
	        </div>
         </div>
         <div class="mb-3 row">
         	<label class="col-sm-3 col-form-label">이미 납부한 금액</label>
         	<div class="col-sm-9">
         		<input class="form-control" type="number" name="rdAtfe" value="${receive_detail.rdAtfe}" />
         	</div>
         </div>
         <div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">진찰료</label>
     		<div class="col-sm-9">    
         		<input class="form-control" type="number" name="rdCofe" value="${receive_detail.rdCofe}" />
         	</div>
         </div>	
         <div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">입원료</label>		
         	<div class="col-sm-9">  	
			    <input class="form-control" type="number" name="rdHpfe" value="${receive_detail.rdHpfe}" />
			</div>
		</div>
		<div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">식대</label>		
         	<div class="col-sm-9"> 
    			<input class="form-control" type="number" name="rdFdfe" value="${receive_detail.rdFdfe}" />
    		</div>
    	</div>
    	<div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">투약및조제료</label>		
         	<div class="col-sm-9"> 
         	<input class="form-control" type="number" name="rdDrfe" value="${receive_detail.rdDrfe}" />
        	</div>
        </div>
        <div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">주사료</label>		
         	<div class="col-sm-9"> 
        		<input class="form-control" type="number" name="rdIjfe" value="${receive_detail.rdIjfe}" />
        	</div>
        </div>
         <div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">물리치료비</label>		
         	<div class="col-sm-9"> 
        		<input class="form-control" type="number" name="rdPtfe" value="${receive_detail.rdPtfe}" />
        	</div>
        </div>
        <div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">치료재료대</label>		
         	<div class="col-sm-9"> 
        		<input class="form-control" type="number" name="rdMtfe" value="${receive_detail.rdMtfe}" />
        	</div>
        </div>
        <div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">영상검사료</label>		
         	<div class="col-sm-9"> 
    			<input class="form-control" type="number" name="rdExfe" value="${receive_detail.rdExfe}" />
    		</div>
    	</div>
    	<div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">영상진단료</label>		
         	<div class="col-sm-9"> 
	    		<input class="form-control" type="number" name="rdMdfe" value="${receive_detail.rdMdfe}" />
	    	</div>
	    </div>
	    <div class="mb-3 row">
     		<label class="col-sm-3 col-form-label">수술료</label>		
         	<div class="col-sm-9">
		    	<input class="form-control" type="number" name="rdOperfe" value="${receive_detail.rdOperfe}" />
		    </div>
		</div>
		</div>
    </div>
  </div>


 
 
  <div class="grid-stack-item" gs-w="2" gs-h="3">
    <div class="grid-stack-item-content"><h4 class="h4-title2">접수</h4><p class="pTag">환자 검색을 통해 담겨진 등록 폼에 배정을 할 진료실을 지정하여 등록버튼을 눌러줍니다.</p><hr>
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
						    		<td><input class="form-control form-control-sm" type="text" id="regipaNo"  name="regipaNo" value="" readonly disabled/></td>
					    		</tr>
					    		<tr>
							    	<td><label>환자명</label></td>
							    	<td><input class="form-control form-control-sm" type="text" id="regipaName" name="regipaName" value=""readonly disabled/></td>
					    		</tr>
					    		<tr>
							    	<td><label>생년월일</label></td>
							    	<td><input class="form-control form-control-sm" type="text" id="regipaReg" name="regipaReg" value="" readonly disabled/></td>
					    		</tr>
					    		<tr>
							    	<td><label>전화번호</label></td>
							    	<td><input class="form-control form-control-sm" type="text" id="regipaHp" name="regipaHp" value="" readonly disabled/></td>
					    		</tr>
					    		<tr>
							    	<td><label>성별</label></td>
							    	<td><input class="form-control form-control-sm" type="text" id="regipaSex" name="regipaSex" value="" readonly disabled/></td>
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
						    			<input class="btn-submit" type="button" id="regiBtn" value="접수" onclick="fn_waitList()">
						    			
						    		</td>
						    	</tr>
					    	</table>
				      </div>
				      <div id="operSchedule">
					    	<table>
					    		<tr>
							    	<td><label>환자명</label></td>
							    	<td><input class="form-control form-control-sm" type="text" id="paName" name="paName" value=""/></td>
					    		</tr>
					    		<tr>
							    	<td><label>생년월일</label></td>
							    	<td><input class="form-control form-control-sm" type="text" id="paReg" name="paReg" value="" /></td>
					    		</tr>
					    		<tr>
							    	<td><label>전화번호</label></td>
							    	<td><input class="form-control form-control-sm" type="text" id="paHp" name="paHp" value=""/></td>
					    		</tr>
					    		<tr>
							    	<th><label>우편번호</label></th>
							    	<td><input class="form-control form-control-sm" type="text" id="paZip" name="paZip" value=""/></td>
					    		</tr>
					    		<tr>
							    	<th><label>주소</label></th>
							    	<td><input class="form-control form-control-sm" type="text" id="paAdd1" name="paAdd1" value=""/></td>
					    		</tr>
					    		<tr>
							    	<th><label>상세주소</label></th>
							    	<td><input class="form-control form-control-sm" type="text" id="paAdd2" name="paAdd2" value=""/></td>
					    		</tr>
					    		<tr>
							    	<th><label>성별</label></th>
							    	<td><select id="paSex">
							    		<option value="M">남</option>
							    		<option value="F">여</option>
							    	</select>
						    			<input class="btn-submit" type="button" id="newPAbtn" value="등록">
							    	</td>
					    		</tr>
						    	<tr>
						    		<td colspan="2">
						    		</td>
						    	</tr>
					    	</table>
				      </div>

				    </div>
				</div>
			</div>
	  
    </div>
  </div>
  
<div class="grid-stack-item" gs-w="3" gs-h="2">
    <div class="grid-stack-item-content"><h4 class="h4-title2">SMS</h4><hr>
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
	      						<td>${i.index} - ${sms.smsTitle }</td>
	      					</tr>
	      				</c:forEach>
		      		</table>
		      	</div>
		      	<div style="margin-left:20px;">
		      		<textarea id="smsTextarea" rows="5" cols="40"></textarea>
		      	</div>
		      	<div style="display:block;">
		      		<input type="button" value="전송" />
		      	</div>
		      </div>
		      
		      <div id="updateSMS">
				<table>
					<c:forEach var="sms" items="${smsList }" varStatus="i">
	      					 <tr>
	      						<td>${i.index} - ${sms.smsTitle }</td>
	      					</tr>
	      				</c:forEach>
					<tr id="smstList">
						
					</tr>
					<tr>
						<td colspan="2">
						<input class="btn-submit" type="button" id="newSms" value="추가" data-bs-toggle="modal" data-bs-target="#smsInsert">
						<input class="btn-submit" type="button" id="updateSms" value="수정" data-bs-toggle="modal" data-bs-target="#smsUpdate">
						<input class="btn-submit" type="button" id="deleteSms" value="삭제">
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
	          	<label>101호</label><input type="radio" name="wardRno" value="101" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal"/>	
	       		<label>102호</label><input type="radio" name="wardRno" value="102" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" data-bs-dismiss="modal"/>
          	</td>
          	<td class="modalTd">
          		<div><label>4인실</label></div>
          		<label>103호</label><input type="radio" name="wardRno" value="103" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal" data-bs-dismiss="modal"/>
       			<label>104호</label><input type="radio" name="wardRno" value="104" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal" data-bs-dismiss="modal"/>
          	</td>
          	<td class="modalTd">
          		<div><label>6인실</label></div>
          			<label>105호</label><input type="radio" name="wardRno" value="105" data-bs-target="#exampleModalToggle4" data-bs-toggle="modal" data-bs-dismiss="modal"/>
       				<label>106호</label><input type="radio" name="wardRno" value="106" data-bs-target="#exampleModalToggle4" data-bs-toggle="modal" data-bs-dismiss="modal"/>
          	</td>
          </tr>
        </table>
      </div>
      <div class="modal-footer">
<!--         <button class="btn btn-primary" data-bs-target="#exampleModalToggle4" data-bs-toggle="modal" data-bs-dismiss="modal">침상 구분</button> -->
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
       	<div class="cover"><img alt="2인실 01호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/></div>
       	<div><input type="checkbox"  name="wardBedNo" value="1"></div>
        <div class="cover"><img alt="2인실 02호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/></div>
        <div><input type="checkbox"  name="wardBedNo" value="2"></div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
        <button class="btn btn-primary wardRegi">등록</button>
        <button class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
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
       		<div><input type="checkbox"  name="wardBedNo" value="1"></div>
        <img alt="4인실 02호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        	<div><input type="checkbox"  name="wardBedNo" value="2"></div>
        <img alt="4인실 03호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        	<div><input type="checkbox"  name="wardBedNo" value="3"></div>
        <img alt="4인실 04호 침상" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        	<div><input type="checkbox"  name="wardBedNo" value="4"></div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
        <button class="btn btn-primary  wardRegi" data-bs-dismiss="modal">등록</button>
        <button class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
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
       	<input type="checkbox"  name="wardBedNo" value="1">
        <img alt="6인실 02호 침상" class="bed6_01_03" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <input type="checkbox"  name="wardBedNo" value="2">
        <img alt="6인실 03호 침상" class="bed6_01_03" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <input type="checkbox"  name="wardBedNo" value="3">
        <img alt="6인실 04호 침상" class="bed6_04_06" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <input type="checkbox"  name="wardBedNo" value="4">
        <img alt="6인실 05호 침상" class="bed6_04_06" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <input type="checkbox"  name="wardBedNo" value="5">
        <img alt="6인실 06호 침상" class="bed6_04_06" src="${pageContext.request.contextPath }/resources/images/ptbedemty.png"/>
        <input type="checkbox"  name="wardBedNo" value="6">
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal" data-bs-dismiss="modal">뒤로가기</button>
       <button class="btn btn-primary wardRegi" >등록</button>
        <button class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
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
        	<input type="text" id="smsInsertTitle"  value=""/>
        	<div>내용</div>
        	<textarea id="smsInsertCont" rows="15" cols="50"></textarea>
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

<!-- ************************** 제증명 모달 시작********************************* -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- header title -->
        <h4 class="modal-title h4-title2">제증명 출력</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
      	<div class="mb-3 row">
		    <label class="col-sm-2 col-form-label">환자명</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="proof_paName" readonly="readonly" disabled>
		    </div>
		 </div>
		 <div class="mb-3 row">
		    <label class="col-sm-2 col-form-label">환자번호</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="proof_paNo" readonly="readonly" disabled>
		    </div>
		 </div>
		 <div class="mb-3 row">
		    <label class="col-sm-2 col-form-label">진료차트</label>
		    <div class="col-sm-10">
			    <select class="form-select" id="proofTrmCd">
					<option selected>선택</option>
			    </select>
		    </div>
		 </div>
		 <div class="mb-3 row">
		    <label class="col-sm-2 col-form-label">항목</label>
		    <div class="col-sm-10">
			    <select class="form-select" id="proofCate" onchange="">
					<option selected>선택</option>
					<option value="prescription">처방전</option>
					<option value="certificate">진단서</option>
			    </select>
		    </div>
		 </div>
		 <div id="printArea"></div>
		 
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        <button type="button" id="proofCreateBtn" class="btn_blue" >생성</button>
        <button type="button" class="btn_blue" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- ******************* 제증명 모달 끝************************* -->

<script type="text/javascript">

	GridStack.init()

	$("#proofCreateBtn").on("click", function(){
	let trmCd = $('#proofTrmCd option:selected').val();
	let proofCate = $('#proofCate option:selected').val();
	
	let aTag = $('<a>').attr(
			{
				"type" : "button",
				"href": "${pageContext.request.contextPath}/commons/documentSelect?trmCd="+ trmCd +"&proofCate="+ proofCate,
				"download" : ''
			}).html("출력");
	
	$('#printArea').html(aTag);
	
	});
	
	
	$("#outHsptListTbody").on("click","tr",function(){
		let c_tr = $(this);
		let hsptNo = c_tr.children().eq(1).text();
		console.log(hsptNo)
		$("#hiddenHsptNo").val(hsptNo);
	});
	
	$("#tbdOutHsptList").on("click","tr",function(){
		let c_tr = $(this);
		let hsptNo = c_tr.children().eq(1).text();
		console.log(hsptNo)
		$("#hiddenHsptNo").val(hsptNo);
	});
	
	
	$("#cancleHospt").on("click",function(){
		let hsptNo = $("#hiddenHsptNo").val();
		let data = {hsptNo : hsptNo};
		$.ajax({
			url : "${pageContext.request.contextPath}/receiption/cancleHospt",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
		    },
			success : function(result) { 
				let trTags = [];
				$.each(result, function(i, v){
//						console.log(v)
					let trTag = $("<tr class='trClass'>")
					.append(
						$("<td>").html(v.paName)
						, $("<td>").html(v.hsptNo)
						, $("<td>").html(v.trmCd)
						, $("<td>").html(v.hsptInDt)
						, $("<td>").html(v.hsptOutDt)
						, $("<td>").html(v.wrRno+"실"+v.bedNo+"호")
						, $("<td>").html(v.diseaseCd)
					).data("list",v);
					trTags.push(trTag);
				})
				$("#tbdOutHsptList").html(trTags);
			}
		})
	});
	
	
	$("#exitHospt").on("click",function(){
		let hsptNo = $("#hiddenHsptNo").val();
		let data = {hsptNo : hsptNo};
		$.ajax({
			url : "${pageContext.request.contextPath}/receiption/exitHospt",
			method : "post",
			data : JSON.stringify(data),
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			beforeSend: function(xhr) {
		            xhr.setRequestHeader(header, token);
		    },
			success : function(result) { 
				let trTags = [];
				$.each(result, function(i, v){
//						console.log(v)
					let trTag = $("<tr class='trClass'>")
					.append(
						$("<td>").html(v.paName)
						, $("<td>").html(v.hsptNo)
						, $("<td>").html(v.trmCd)
						, $("<td>").html(v.hsptInDt)
						, $("<td>").html(v.hsptOutDt)
						, $("<td>").html(v.wrRno+"실"+v.bedNo+"호")
						, $("<td>").html(v.diseaseCd)
					).data("list",v);
					trTags.push(trTag);
				})
				$("#tbdOutHsptList").html(trTags);
			}
		})
	});
	
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
							
							/* 모달창으로 환자정보 전송 */
							$('#proof_paName').val(paName);
							$('#proof_paNo').val(paNo);
							
							/* 진료차트조회 */
							loadTrmChart(paNo);
							
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
							
							/* 모달창으로 환자정보 전송 */
							$('#proof_paName').val(paName);
							$('#proof_paNo').val(paNo);
							
							/* 진료차트조회 */
							loadTrmChart(paNo);
							
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
	
////////////// SMS ////////////////////////////////
//추가
$("#smsInsertBtn").on("click",function(){
	let smsTitle = $("#smsInsertTitle").val();
	let smsCont = $("#smsInsertCont").val();
	
	let data = {
		smsTitle : smsTile,
		smsCont : smsCont
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/receiption/smsInsert",
		method : "post",
		data : JSON.stringify(data),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			
		}
	})
});
/// 추가 끝 

//수정 탭 - 클릭해서 모달 창에 띄우기 

	
	
// 입원 관련 리스트 조회
function fn_wardList(){
	$.ajax({
		url : "${pageContext.request.contextPath}/receiption/wardList",
		method : "post",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) {
			let trTags = [];
			$.each(result, function(i, v){
//					console.log(v)
				let trTag = $("<tr class='trClass'>")
				.append(
					$("<td>").html(v.paName)
					, $("<td>").html(v.hsptNo)
					, $("<td>").html(v.trmCd)
					, $("<td>").html(v.hsptInDt)
					, $("<td>").html(v.hsptOutDt)
					, $("<td>").html(v.wrRno+"호"+v.bedNo+"번")
					, $("<td>").html(v.diseaseCd)
				).data("list",v);
				trTags.push(trTag);
			})
			$("#tbdOutHsptList").html(trTags);
// 			$("#outHsptListTbody").html(trTags);
		}
	})
}	
	
	
	
// 입원 등록하기 form////
$(".wardRegi").on("click",function(){
	let wardRno = $("[name=wardRno]:checked").val();
	let wardBedNo = $("[name=wardBedNo]:checked").val();
	let chartNo = $("#chartNo").val();
	let patientName = $("#patientName").val();
	let hsptInDt = $("#hsptInDt").val();
	let diseaseCd = $("#diseaseCd").val();
	
	let data ={
		  hsptInDt : hsptInDt
		, bedNo : wardBedNo
		, wrRno : wardRno
		, trmCd : chartNo
		, diseaseCd : diseaseCd
	}
		
	if(chartNo != ''){
	$.ajax({
		url : "${pageContext.request.contextPath}/receiption/wardRegist",
		method : "post",
		data : JSON.stringify(data),
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		success : function(result) { 			
			swal("입원 등록 하였습니다","침상등록 성공하였습니다","success")
			$("#chartNo").val("");
			$("#patientName").val("");
			$("#chargeOf").val("");
			$("#hsptInDt").val("");
			$("#diseaseCd").val("");
			fn_wardList();
		}					
	});
	} else {
		swal('정보를 입력해주세요', "환자 정보가 없습니다.", "error");
	}
})
	
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
	let diseaseCd = $(this).find("td").eq(5).html();
	$("#chartNo").val(trmCd);
	$("#patientName").val(paName);
	$("#chargeOf").val(empNm);
	$("#hsptInDt").val(format);
	$("#diseaseCd").val(diseaseCd);
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
			url : "${pageContext.request.contextPath}/receiption/newPatient",
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
		url : "${pageContext.request.contextPath}/receiption/selectPatient",
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
			url : "${pageContext.request.contextPath}/receiption/registration",
			method : "post",
			data : JSON.stringify(data),
			beforeSend: function(xhr) {
	            xhr.setRequestHeader(header, token);
	    	},
			contentType : "application/json;charset=utf-8",
			dataType : "json",
			success : function(result) { 
				swal("환자 접수가 완료되었습니다.")
				$("#regipaNo").val("");
				$("#regipaName").val("");
				$("#regipaReg").val("");
				$("#regipaHp").val("");
				$("#regipaSex").val("");
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
		url : "${pageContext.request.contextPath}/receiption/waitingHistory",
		method : "post",
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
   		 },
		success : function(result) {
			fn_waitList()
		}
	})
}

// 대기 히스토리 함수 끝 //


// 접수된 환자 대기실에 표시하기 //
function fn_waitList(){
	let officeCd = $("[name=officeCd]:selected").val();
	let data = {"officeCd":officeCd}
	
	$.ajax({
		url:"${pageContext.request.contextPath}/receiption/waitingList",
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
/* 진료차트조회 */
function loadTrmChart(paNo){
	let data = {
			"paNo" : paNo
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath}/commons/loadTrmChart",
		method : "post",
		data : JSON.stringify(data),
		contentType : "application/json;charset=utf-8",
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
    	},
		dataType : "json",
		success : function(result) {
			let optionTags = [];
			let optionTag = '';
			$.each(result, function(i,v){
				optionTag = $('<option>').attr("value",v.trmCd).html(v.trmCd +' (' + v.trmDt + ')');
				optionTags.push(optionTag);
			});
			$('#proofTrmCd').html(optionTags);
		},
		error : function(jqXHR, status, error) {
			console.log(jqXHR);
			console.log(status);
			console.log(error);
		}
	});
}
</script>