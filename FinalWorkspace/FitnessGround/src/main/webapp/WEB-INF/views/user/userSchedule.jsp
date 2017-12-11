<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />	
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
	<link rel="stylesheet" href="/fitnessground/resources/css/user/fullcalendar.css" />		
    <c:import url="../include/common/headend.jsp" />
    <style>
    #calendar {
		margin-top:120px;
		margin-bottom:120px;
	}
    </style>
    
    <c:if test="${ sessionScope.user == null }">
		<script type="text/javascript">
			$(function (){
				alert("로그인이 필요합니다.");
				location.href="main.do";
			});
		</script>
	</c:if>
	
    <c:if test="${ sessionScope.user != null }">
	<div id="page-wrapper">
		<!-- Header -->
		<div id="mypage_header">
            <!-- Nav -->
			<c:import url="../include/main/nav.jsp" />			
			<c:import url="login.jsp"/>
			<c:import url="findidpwd.jsp"/>
			<c:import url="register.jsp"/>
		</div>
    </div>
    
	<div id="myPageBar">
		<c:import url="../include/user/myPageBar.jsp"/>
	</div>
	
	<div id="calendar" class="col-md-offset-2 col-md-8"></div>
	
	
	</c:if>	
	
    <c:import url="../include/main/footer.jsp" />
    <c:import url="../include/common/end.jsp" />
    
    <script src='/fitnessground/resources/js/user/moment.min.js'></script>
    <script src='/fitnessground/resources/js/user/fullcalendar.js'></script>
    <script src='/fitnessground/resources/js/user/locale-all.js'></script>
	<script src='/fitnessground/resources/js/user/userCalendar.js'></script>