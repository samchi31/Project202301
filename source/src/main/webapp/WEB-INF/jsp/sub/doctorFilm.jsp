<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="wrapper">
	<div style="margin:0.5rem">
		<h1>촬영결과</h1>
	</div>
	<div class="grid-stack">
		<div class="grid-stack-item "
			gs-x="0" gs-y="0" gs-w="4" gs-h="6" gs-no-resize="true" gs-no-move="true">
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
				      				<th>파일이름</th>
									<th>촬영일시</th>
								</tr>
				      		</thead>
				      		<tbody id="tbody_fList">
				      		</tbody>
				      	</table>
					</div>
				</div>
			</div>
		</div>
		<div class="grid-stack-item" 
			gs-x="4" gs-y="0" gs-w="7" gs-h="6" gs-no-resize="true" gs-no-move="true">
			<div class="grid-stack-item-content card-grid" >
				<h4 class="h4-title2">촬영 상세</h4>
				<div id="film_detail">				
<%-- 					<c:url value="/resource/imageRadi/${image }" var="imgURL"/> --%>
<!-- 					<img src="imgURL" > -->
					
					
				</div>				
			</div>	
		</div>				
	</div>
</div>

<script>
	GridStack.init();
	//console.log(opener.trmCd);
	let trmCd = opener.trmCd;
	
	let tbody_fList = $("#tbody_fList").on('click', 'tr', function(event){
		// console.log(this);
		film_detail.empty();
		
		let data = $(this).data("object");
		
		console.log(data);
		
		let imgTag = $("<img>").attr("src", "${pageContext.request.contextPath}/resourceFile"+data.attStreCours + data.attSavename)
		.css("width","100%").css("height","100%");
		
		film_detail.append(imgTag);
	});
	
	let film_detail = $("#film_detail");
	
	let f_getFilmList = () => {
		if(trmCd == -1 || trmCd == "" || trmCd == null) return;
		
		$.ajax({
			url : "${pageContext.request.contextPath}/doctor/filmList/" + trmCd,
			method : "get",
			dataType : "json",
			success : function(resp) {
				console.log("f_getFilmList resp : ",resp);
				
				tbody_fList.empty();
				let trTags = [];
				$.each(resp, function(index, v){
					// console.log(index, v);
					$.each(v.filmAtchDetailVOList, function(i, value){
						console.log(i, value);
						let tr = $("<tr>").append($("<td>").html(value.attSavename), $("<td>").html(value.attStreCours));
						tr.data("object", value);
						trTags.push(tr);
					});					
				});
				tbody_fList.append(trTags);
			},
			error : function(jqXHR, status, error) {
				console.log(jqXHR);
				console.log(status);
				console.log(error);
			}
		});			
	};
	f_getFilmList();
	
	
	
	
</script>