<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<div>
	<security:authentication property="principal.realMember" var="employeeVO"/>
   <ul class="menu">
      <li id="main_logo">
         <a href="<c:url value='/'/>" style="text-decoration: none;"><img src="<c:url value='/resources/images/mainlogo.png'/>" alt="로고"></a>
      </li>
      <c:forEach items="${menuList }" var="menu" varStatus="stat">
         <li class="menu-item">
         	<c:if test="${menu.menuText eq '접수'}">
         		<security:authorize access="hasAnyRole('HEAD','REC', 'HEAD')" >	<!-- access="hasAnyRole('ROLE_DOC')" -->
		            <a href="<c:url value='${menu.menuURL }?menu=${stat.count}'/>" class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>		
				</security:authorize >
				<security:authorize access="!hasAnyRole('HEAD','REC', 'HEAD')">
					<a href="#" onclick="alert('권한이 없습니다');" id='${menu.menuURL }' 
		            	class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>
				</security:authorize>
         	</c:if>
         	<c:if test="${menu.menuText eq '진료'}">
         		<security:authorize access="hasAnyRole('DOC', 'HEAD')" >	<!-- access="hasAnyRole('ROLE_DOC')" -->
		            <a href="<c:url value='${menu.menuURL }?menu=${stat.count}'/>" class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>		
				</security:authorize >
				<security:authorize access="!hasAnyRole('DOC', 'HEAD')">
					<a href="#" onclick="alert('권한이 없습니다');" id='${menu.menuURL }' 
		            	class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>
				</security:authorize>
         	</c:if>
         	<c:if test="${menu.menuText eq '영상'}">
         		<security:authorize access="hasAnyRole('RAD', 'HEAD')" >	<!-- access="hasAnyRole('ROLE_DOC')" -->
		            <a href="<c:url value='${menu.menuURL }?menu=${stat.count}'/>" class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>		
				</security:authorize >
				<security:authorize access="!hasAnyRole('RAD', 'HEAD')">
					<a href="#" onclick="alert('권한이 없습니다');" id='${menu.menuURL }' 
		            	class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>
				</security:authorize>
         	</c:if>
         	<c:if test="${menu.menuText eq '물리치료'}">
         		<security:authorize access="hasAnyRole('PHY', 'HEAD')" >	<!-- access="hasAnyRole('ROLE_DOC')" -->
		            <a href="<c:url value='${menu.menuURL }?menu=${stat.count}'/>" class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>		
				</security:authorize >
				<security:authorize access="!hasAnyRole('PHY', 'HEAD')">
					<a href="#" onclick="alert('권한이 없습니다');" id='${menu.menuURL }' 
		            	class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>
				</security:authorize>
         	</c:if>
         	<c:if test="${menu.menuText eq '병동관리'}">
         		<security:authorize access="hasAnyRole('CHN','NUR', 'HEAD')" >	<!-- access="hasAnyRole('ROLE_DOC')" -->
		            <a href="<c:url value='${menu.menuURL }?menu=${stat.count}'/>" class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>		
				</security:authorize >
				<security:authorize access="!hasAnyRole('CHN','NUR', 'HEAD')">
					<a href="#" onclick="alert('권한이 없습니다');" id='${menu.menuURL }' 
		            	class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>
				</security:authorize>
         	</c:if>
         	<c:if test="${menu.menuText eq '수술/검사'}">
         		<security:authorize access="hasAnyRole('CHN','NUR', 'HEAD')" >	<!-- access="hasAnyRole('ROLE_DOC')" -->
		            <a href="<c:url value='${menu.menuURL }?menu=${stat.count}'/>" class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>		
				</security:authorize >
				<security:authorize access="!hasAnyRole('CHN','NUR', 'HEAD')">
					<a href="#" onclick="alert('권한이 없습니다');" id='${menu.menuURL }' 
		            	class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>
				</security:authorize>
         	</c:if>
         	<c:if test="${menu.menuText eq '공통'}">
         		<security:authorize access="isAuthenticated()" >	<!-- access="hasAnyRole('ROLE_DOC')" -->
		            <a href="<c:url value='${menu.menuURL }?menu=${stat.count}'/>" class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>		
				</security:authorize >
				<security:authorize access="!isAuthenticated()">
					<a href="#" onclick="alert('권한이 없습니다');" id='${menu.menuURL }' 
		            	class="menu-link <c:if test="${param.menu==stat.count}">active</c:if>">${menu.menuText }
		            </a>
				</security:authorize>
         	</c:if>
         </li>
      </c:forEach>

      <li class="user-photo">
         <figure class="user-photo-link"
            style="background-image: url(<c:url value='/resources/images/profile.png'/>);"></figure>
      </li>
      <li class="user_info"><a href="" class="menu-link-user">${employeeVO.empNm}(${employeeVO.posiName})님
            접속중입니다.</a></li>
   </ul>
</div>