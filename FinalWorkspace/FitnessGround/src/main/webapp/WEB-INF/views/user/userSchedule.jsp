<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />	
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
	<link rel="stylesheet" href="/fitnessground/resources/css/user/fullcalendar.css" />		
    <%-- <c:import url="../include/common/headend.jsp" /> --%>
    <!-- headend 대신 넣는 코드(removed jquery.min.js)  -->
   <!-- css 파일 로드-->
    <link rel="stylesheet" href="/fitnessground/resources/css/bootstrap.css">
   <link rel="stylesheet" href="/fitnessground/resources/css/common/compiled_main.css" />
   <link rel="stylesheet" href="/fitnessground/resources/css/common/main.css" />
   <link rel="stylesheet" href="/fitnessground/resources/css/common/login.css" />
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
   </head>
   <body class="homepage">   
   <!-- java script 파일 로드 -->
   <script type="text/javascript" src="/fitnessground/resources/js/jquery-3.2.1.js"></script>
   <script type="text/javascript" src="/fitnessground/resources/js/bootstrap.js"></script>
   <script type="text/javascript" src="/fitnessground/resources/js/common/jquery.scrolly.min.js"></script>
   <script type="text/javascript" src="/fitnessground/resources/js/common/jquery.dropotron.min.js"></script>
   <script type="text/javascript" src="/fitnessground/resources/js/common/jquery.onvisible.min.js"></script>
   <script type="text/javascript" src="/fitnessground/resources/js/common/skel.min.js"></script>
   <script type="text/javascript" src="/fitnessground/resources/js/common/util.js"></script>
   <script type="text/javascript" src="/fitnessground/resources/js/common/main.js"></script>
   <script type="text/javascript" src="/fitnessground/resources/js/workout/workout.js"></script>
    
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
					<c:if test="${null ne us.content}">
						<input type="hidden" name="usTitle" value="${us.content}">
					</c:if>
					<c:if test="${null eq us.content}">
						<input type="hidden" name="usTitle" value="${us.title}">
					</c:if>
					<input type="hidden" name="usID" value="${us.s_no}">
					<input type="hidden" name="usVNO" value="${us.v_no}">
					<input type="hidden" name="usContent" value="${us.title_content}">
					<input type="hidden" name="usDate" value="${us.upload_date}">
					<input type="hidden" name="usUrl" value="${us.url}">
					<input type="hidden" name="usCategory" value="${us.category1}">
			</c:forEach>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="user_no" value="${sessionScope.user.user_no}">
	
	<c:import url="../workout/detailView.jsp" />
	<div id="calendar" class="col-md-offset-2 col-md-8"></div>
	
	
    <script type="text/javascript">
    	$(function (){
    		setCalendar();
    		
    		var list = new Array();
    		var event = new Object();
    		var date = $("input[name=usDate]");
    		var title = $("input[name=usTitle]");
    		var content = $("input[name=usContent]");
    		var url = $("input[name=usUrl]");
    		var id = $("input[name=usID]");
    		var category = $("input[name=usCategory]");
    		var vno = $("input[name=usVNO]");
    		
    		for(var idx=0; idx<date.length; idx++) {
                event.start = date[idx].value;
                event.end = date[idx].value;
   				event.title = title[idx].value;
   				event.content = content[idx].value;
   				event.url = url[idx].value;
   				event.id = id[idx].value;
   				event.category = category[idx].value;
   				event.vno = vno[idx].value;
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