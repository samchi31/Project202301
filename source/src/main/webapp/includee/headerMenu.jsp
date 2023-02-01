<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
	<ul class="menu">
		<li id="main_logo"><img src="<%=request.getContextPath()%>/resources/images/mainlogo.png" alt="로고"></li>
		<c:forEach items="${menuList }" var="menu">
			<li class="menu-item">
				<a href='<c:url value='${menu.menuURL }'/>' class="menu-link">${menu.menuText }</a>
			</li>
		</c:forEach>

		<li class="user-photo">
			<figure class="user-photo-link"
				style="background-image: url(<%=request.getContextPath()%>/resources/images/profile.png);"></figure>
		</li>
		<li class="user_info"><a href="" class="menu-link-user">김간호(간호사)님
				접속중입니다.</a></li>
	</ul>
</div>