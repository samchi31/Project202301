<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
	.grid-stack { 
		background: #FFFFFF;
		border-radius: 10px; 
	}
	.grid-stack-item-content { 
		background-color: #FFE4E1; 
		border-radius: 10px;
	}
</style>

<div class="grid-stack"></div>

<script type="text/javascript">
	var items = [
	  {w: 6, h: 5, content: '환자정보조회'}, // will default to location (0,0) and 1x1
	  {w: 3, h: 5, content: '촬영환자목록'}, // will be placed next at (1,0) and호사)님 접속중입니다. 2x1
	  {w: 3, h: 3, content: '촬영현황'}, //el태그로 하면 우리 데이터 들어갈 수 잇어!@
	  {w: 3, h: 2, content: '일정'},
	];
	var grid = GridStack.init();
	grid.load(items);
</script>
</body>
