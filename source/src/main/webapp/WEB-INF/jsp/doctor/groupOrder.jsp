<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="wrapper">
	<div class="grid-stack">
		<div class="grid-stack-item "
			gs-x="0" gs-y="0" gs-w="4" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >그룹오더 목록</div>
		</div>
		<div class="grid-stack-item" 
			gs-x="0" gs-y="3" gs-w="4" gs-h="2" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >처방자료</div>	
		</div>
		<div class="grid-stack-item" 
			gs-x="4" gs-y="0" gs-w="8" gs-h="5" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >그룹오더 정보</div>	
		</div>		
		<div class="grid-stack-item" 
			gs-x="7" gs-y="2" gs-w="5" gs-h="3" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card" >
				 <div class="tab">
				    <ul class="tabnav">
				      <li><a href="#dise">상병</a></li>
				      <li><a href="#medi">처방</a></li>
				      <li><a href="#sym">증상</a></li>
				      <li><a href="#exam">검사</a></li>
				      <li><a href="#radi">방사선</a></li>				      
				      <li><a href="#group">그룹오더</a></li>				      
				    </ul>
				    <div class="tabcontentWrap">
					    <div class="tabcontent">
					      <div id="dise"></div>
					      <div id="medi">
					      	<table class="table table-bordered table-hover table-head-fixed">
					      		<thead>
					      			<tr>
					      				<th>약품코드</th>
										<th>약품명</th>
										<th>투여</th>
										<th>단위</th>
										<th>급여구분</th>
									</tr>
					      		</thead>
					      		<tbody>
					      		</tbody>
					      	</table>
					      </div>
					      <div id="sym"></div>
					      <div id="exam"></div>
					      <div id="radi"></div>
					      <div id="group"></div>
					    </div>
					</div>
				  </div>		
			</div>	
		</div>	
		
	</div>
</div>

<script>
	GridStack.init();
</script>