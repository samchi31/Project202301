<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="wrapper">
	<div style="margin:0.5rem">
		<h1>촬영결과</h1>
	</div>
	<div class="grid-stack">
		<div class="grid-stack-item "
			gs-x="0" gs-y="0" gs-w="4" gs-h="5" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<h4 class="h4-title2">촬영목록</h4>
				<div class="tabcontentWrap tab-mid">
			    	<div class="tabcontent">
						<table class="table-blue">
			      			<colgroup>
					      		<col style="width: 40%;" />
					      		<col style="width: 40%;" />
					      	</colgroup>
				      		<thead class="fixedHeader">
				      			<tr>
				      				<th>촬영코드</th>
									<th>촬영일시</th>
								</tr>
				      		</thead>
				      		<tbody id="tbodyGoList">
				      		</tbody>
				      	</table>
					</div>
				</div>
			</div>
		</div>
		<div class="grid-stack-item" 
			gs-x="4" gs-y="0" gs-w="8" gs-h="5" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<h4 class="h4-title2">그룹오더정보</h4>
				<div>				
					<c:url value="/resource/imageRadi/${image }" var="imgURL"/>
					<img src="imgURL" >
					
					
				</div>				
			</div>	
		</div>				
	</div>
</div>