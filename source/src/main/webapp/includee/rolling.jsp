<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="<c:url value = '/resources/css/rolling.css'/>" rel = "stylesheet" />
<%-- <img src="${pageContext.request.contextPath }/resources/images/Hurry UPOP70.png" style="position: relative; left: 84%; "/> --%>
<div class="rollingbanner">
	<div class="wrap">
		<div class="roller">
			<ul>
				<li class="kapi">
						<strong class="name">2023.03.01은 시스템 점검이 있습니다. 필요한 자료는 꼭 백업하시기 바랍니다. => </strong>
				</li>
			</ul>
		</div>
	</div>
</div>

<script>
//DOM 생성 후
var originalID, cloneID; //인터벌 포인터
window.addEventListener('DOMContentLoaded', function(){

	//롤링 배너 복제본 생성
    let roller = document.querySelector('.roller');
    roller.id = 'roller1';

    let clone = roller.cloneNode(true);
    clone.id = 'roller2';
    document.querySelector('.wrap').appendChild(clone); //부착

	//원본, 복제본 배너 위치 지정
    document.querySelector('#roller1').style.left = '0px';
    document.querySelector('#roller2').style.left = document.querySelector('.roller ul').offsetWidth +'px';

	//클래스 할당
    roller.classList.add('original');
    clone.classList.add('clone');

	//인터벌 메서드로 애니메이션 생성
    let rollerWidth = document.querySelector('.roller ul').offsetWidth;//회전 배너 너비값
	let betweenDistance = 1;//이동 크기 - 정수여야 함
	originalID = window.setInterval(betweenRollCallback, parseInt(1000/100), betweenDistance, document.querySelector('#roller1'));
	cloneID = window.setInterval(betweenRollCallback, parseInt(1000/100), betweenDistance, document.querySelector('#roller2'));

	//인터벌 애니메이션 함수(공용)
	function betweenRollCallback(d, roller){
		let left = parseInt(roller.style.left);
		roller.style.left = (left - d)+'px';//이동
		//조건부 위치 리셋
		if(rollerWidth + (left - d) <= 0){
			roller.style.left = rollerWidth+'px';
		}
	}		
});


</script>