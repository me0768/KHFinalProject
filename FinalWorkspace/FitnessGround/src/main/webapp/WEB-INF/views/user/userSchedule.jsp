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

	<c:choose>
		<c:when test="${!empty list}">
			<c:forEach items="${list}" var="us" varStatus="st">
					<input type="hidden" name="usDate" value="${us.upload_date}">
					<c:if test="${null ne us.content}">
						<input type="hidden" name="usTitle" value="${us.content}">
					</c:if>
					<c:if test="${null eq us.content}">
						<input type="hidden" name="usTitle" value="${us.title}">
					</c:if>
					<input type="hidden" name="usContent" value="${us.title_content}">
					<input type="hidden" name="usID" value="${us.s_no}">
					<input type="hidden" name="usVNo" value="${us.v_no}">
					<input type="hidden" name="usCategory1" value="${us.category1}">
					<input type="hidden" name="usCategory2" value="${us.category2}">
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="user_no" value="${sessionScope.user.user_no}">
			
	<c:import url="../workout/detailView.jsp" />
	<c:import url="./userScheduleEdit.jsp"/>
	
	<div id="calendar" class="col-md-offset-2 col-md-8" style="margin-bottom:90px !important;"></div>
	
    <script type="text/javascript">
    	$(function (){
			$('#myPageBar nav ul #uSchedule').addClass('activeMenu');	
    		
    		setCalendar();    		
    		var list = new Array();
    		var event = new Object();
    		var date = $("input[name=usDate]");
    		var title = $("input[name=usTitle]");
    		var content = $("input[name=usContent]");
    		var id = $("input[name=usID]");
    		var vno = $("input[name=usVNo]");
    		var category1 = $("input[name=usCategory1]");
    		var category2 = $("input[name=usCategory2]");
    		
    		for(var idx=0; idx<date.length; idx++) {
                event.start = date[idx].value;
                event.end = date[idx].value;
   				event.title = title[idx].value;
   				event.content = content[idx].value;
   				event.id = id[idx].value;
   				event.vno = vno[idx].value;
   				if(vno[idx].value != 0) {
   					event.color = "#022D41";
   					event.textColor = "#ffffff";
   				} else {
   					event.color = "#ebab36";
   					event.textColor = "#ffffff";
   				}
   				event.category1 = category1[idx].value;
   				event.category2 = category2[idx].value;
                list.push(event);
                $('#calendar').fullCalendar('addEventSource',list);
                list.pop();
    		}
    	});	
    </script>
	</c:if>	
	
    <c:import url="../include/main/footer.jsp" />
    <c:import url="../include/common/end.jsp" />
    
    <script src='/fitnessground/resources/js/user/moment.min.js'></script>
    <script src='/fitnessground/resources/js/user/fullcalendar.js'></script>
    <script src='/fitnessground/resources/js/user/locale-all.js'></script>
	<script src='/fitnessground/resources/js/user/userCalendar.js'></script>