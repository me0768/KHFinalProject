<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />	
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />	
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
   <script type="text/javascript" src="/fitnessground/resources/js/gym/mypagegym.js"></script>
    
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
			<c:import url="profileEdit.jsp"/>		
			<c:import url="login.jsp"/>
			<c:import url="findidpwd.jsp"/>
			<c:import url="register.jsp"/>
		</div>
    </div>
    
	<div id="myPageBar">
		<c:import url="../include/user/myPageBar.jsp"/>
	</div>
	
	<div class="mypage_info col-md-3 col-md-offset-2 col-sm-12">
		<div class="mypage_info_title" align="center">
			<a href="javascript:profileEdit()">
				<c:if test="${null eq sessionScope.user.rename_image}">
					<img src="/fitnessground/resources/images/myimages/nullicon.png" class="img-circle" style="background:#DAECF3;">
				</c:if>
				<c:if test="${null ne sessionScope.user.rename_image}">
					<img src="/fitnessground/resources/images/myimages/${sessionScope.user.rename_image}" class="img-circle" style="background:#DAECF3;">
				</c:if>
			</a>
			<p align="center">${sessionScope.user.name} 님</p>
		</div>
		<div class="mypage_info_content">
			<p>
				<span class="btn-lg glyphicon glyphicon-user" aria-hidden="true"> 닉네임</span>
				${sessionScope.user.nickname}
			</p>
			<p>
				<span class="btn-lg glyphicon glyphicon-envelope" aria-hidden="true"> E-mail</span>
				${sessionScope.user.email}
			</p>
			<p>
				<span class="btn-lg glyphicon glyphicon-phone" aria-hidden="true"> Phone</span>
				${sessionScope.user.phone}
			</p>
			<div id="mypage_btn">
				<table>
					<tr align="center">
						<td><button class="btn btn-default" onclick="location.href='udetail.do'">회원정보수정</button></td>
						<td><button class="btn btn-default" onclick="location.href='userpwd.do'">비밀번호변경</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
		<c:if test="${ sessionScope.user.user_level == 0 }">
		<c:import url="../workout/detailView.jsp" />
		<div class="mypage_schedule col-md-4 col-sm-12 col-md-offset-1">
			<div id="yesterdaySchedule">
				<table>
					<thead><tr>
						<th>어제의 운동</th>
						<td align="right">${yesterDate}</td>
					</tr></thead>
					<tbody>
					<c:choose>
						<c:when test="${!empty yesterday}">
							<c:forEach items="${yesterday}" var="s" varStatus="st">
								<tr>
									<td colspan="2">
										<c:if test="${null eq s.content}">
											<c:if test="${s.category1 eq '헬스'}">
												<a href='javascript:detailView(${s.v_no})'>${s.title}</a>
											</c:if>
											<c:if test="${s.category1 ne '헬스'}">
												<a href="#workout-modal" data-toggle="modal" data-title="${s.title}" data-url="${s.url}" 
											  		data-content="${s.content}" data-target="#detailView">${s.title}</a>									
											</c:if>
										</c:if>
										<c:if test="${null ne s.content}">${s.content}</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="2">운동내역이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<script type="text/javascript">
			//modal 띄우기(title,url, content 값을 모달로)
			$('#detailView').on('show.bs.modal', function (event) {
			     var tag = $(event.relatedTarget); // sth that triggered the modal
			     var title = tag.data('title'); // Extract info from data-* attributes
			     var vid = tag.data('url');
			     var content = tag.data('content');
			     
			     var modal = $(this);
			     modal.find('.modal-title').text(title);
			     modal.find('.modal-play').html("<iframe id='video-play' src='https://www.youtube.com/embed/"+vid+"' frameborder='0'"+
			            "gesture='media' allow='encrypted-media' allowfullscreen></iframe>");
			     modal.find('#span-content').text(content);
			   })
			</script>
			<div id="todaySchedule">
				<table>
					<thead><tr align="center">
						<th>오늘의 운동</th>
						<td align="right">${currentDate}</td>
					</tr></thead>
					<tbody>
					<c:choose>
						<c:when test="${!empty today}">
							<c:forEach items="${today}" var="s" varStatus="st">
								<c:url var="detail" value="">
									<c:param name="sno" value="${s.s_no}"/>
								</c:url>
								<tr>
									<td colspan="2">
										<c:if test="${null eq s.content}">
											<c:if test="${s.category1 eq '헬스'}">
												<a href='javascript:detailView(${s.v_no})'>${s.title}</a>
											</c:if>
											<c:if test="${s.category1 ne '헬스'}">
												<a href="#workout-modal" data-toggle="modal" data-title="${s.title}" data-url="${s.url}" 
											  		data-content="${s.content}" data-target="#detailView">${s.title}</a>									
											</c:if>
										</c:if>
										<c:if test="${null ne s.content}">${s.content}</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="2">운동내역이 없습니다.</td></tr>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<div id="moreS" align="right"><button class="btn btn-default" onclick="location.href='uschedule.do?userno=${sessionScope.user.user_no}'">MORE</button></div>
		</div>
		</c:if>
		<c:if test="${ sessionScope.user.user_level == 1 }">
			<div class="mypage_gymmanage col-md-4 col-sm-12 col-md-offset-1">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="regcount">
					<input type="hidden" id="userno" value="${ sessionScope.user.user_no }">
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="gymsearchdiv">
					<div class="input-group">
						<input type="text" oninput="gymsearch(${ sessionScope.user.user_no });" id="gymsearch" class="form-control" placeholder="헬스장 이름으로 검색">
						<span class="input-group-addon"><a href="javascript:gymsearch(${ sessionScope.user.user_no })"><span class="glyphicon glyphicon-search"></span></a></span>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="gymlist">
					<!-- 헬스장 리스트 -->
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<a href="moveregistergym.do">
						<Button class="btn btn-default col-lg-5 col-lg-offset-7 col-md-5 col-md-offset-7 col-sm-5 col-sm-offset-7 col-xs-5 col-xs-offset-7" style="padding: 0px;">헬스장 등록하러가기</Button>
					</a>
				</div>
			</div>
		</c:if>
	</c:if>	
	
    <c:import url="../include/main/footer.jsp" />
    <c:import url="../include/common/end.jsp" />