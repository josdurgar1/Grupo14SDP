<%--
 * header.jsp
 *
 * Copyright (C) 2014 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript">
		function relativeRedir(loc) {	
			var b = document.getElementsByTagName('base');
			if (b && b[0] && b[0].href) {
	  			if (b[0].href.substr(b[0].href.length - 1) == '/' && loc.charAt(0) == '/')
	    		loc = loc.substr(1);
	  			loc = b[0].href + loc;
			}
			window.location.replace(loc);
		}
	</script>

<div>
	<img src="images/logotrip.png" alt="Acme-Trip Co., Inc." />
</div>

<div>
	<ul id="jMenu">
		<!-- Do not forget the "fNiv" class for the first level links !! -->
		<security:authorize access="hasRole('ADMIN')">
			<li><a class="fNiv"><spring:message	code="master.page.administrator" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="administrator/action-1.do"><spring:message code="master.page.administrator.action.1" /></a></li>
					<li><a href="administrator/action-2.do"><spring:message code="master.page.administrator.action.2" /></a></li>					
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="hasRole('USER')">
			<li><a class="fNiv"><spring:message	code="master.page.trips" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="trip/user/list.do"><spring:message code="master.page.user.trip.list" /></a></li>
					<li><a href="trip/user/create.do"><spring:message code="master.page.user.trip.create" /></a></li>					
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="security/login.do"><spring:message code="master.page.login" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="trip/list.do"><spring:message code="master.page.trip.list" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="activityType/list.do"><spring:message code="master.page.activityType.list" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="user/list.do"><spring:message code="master.page.user.list" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li><a class="fNiv" href="trip/list.do"><spring:message code="master.page.trip.list" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li><a class="fNiv" href="activityType/list.do"><spring:message code="master.page.activityType.list" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li><a class="fNiv" href="user/list.do"><spring:message code="master.page.user.list" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="user/create.do"><spring:message code="master.page.register" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li>
				<a class="fNiv"> 
					<spring:message code="master.page.profile" /> 
			        (<security:authentication property="principal.username" />)
				</a>
				<ul>
					<li class="arrow"></li>
					<li><a href="profile/action-1.do"><spring:message code="master.page.profile.action.1" /></a></li>
					<li><a href="profile/action-2.do"><spring:message code="master.page.profile.action.2" /></a></li>
					<li><a href="folder/actor/list.do"><spring:message code="master.page.list.folders" /></a></li>					
					<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" /> </a></li>
				</ul>
			</li>
		</security:authorize>
	</ul>
</div>

<div>
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>
