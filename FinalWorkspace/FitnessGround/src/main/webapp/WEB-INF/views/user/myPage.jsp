<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	
	<link rel="stylesheet" href="/fitnessground/resources/css/user/mypage.css" />
	
    <c:import url="../include/common/headend.jsp" />
    
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
		<nav>
			<ul>
				<li><h1><a href="#">My Page</a></h1></li>
				<li><a href="#">회원정보</a></li>
				<li><a href="#">비밀번호변경</a></li>
				<li><a href="#">게시글관리</a></li>
				<li><a href="#">운동스케줄</a></li>
				<li><a href="#">회원탈퇴</a></li>
			</ul>
		</nav>
	</div>
	<div class="mypage_info">
		<div class="mypage_info_title">
			<img alt="user sample image" src="/fitnessground/resources/images/user.png">
			<p align="center">${sessionScope.user.name} 님</p>
		</div>
		<div class="mypage_info_content">
			<p>
				<span class="btn-lg glyphicon glyphicon-user" aria-hidden="true"> 닉네임</span>
				${sessionScope.user.nickname}
			</p>
			<p id="email">
				<span class="btn-lg glyphicon glyphicon-envelope" aria-hidden="true"> E-mail</span>
				${sessionScope.user.email}
			</p>
			<p id="phone">
				<span class="btn-lg glyphicon glyphicon-phone" aria-hidden="true"> Phone</span>
				${sessionScope.user.phone}
			</p>
			<div id="mypage_btn">
				<button class="btn btn-default" id="mypage_btn_up">회원정보수정</button>
				<button class="btn btn-default">비밀번호변경</button>
			</div>
		</div>
	</div>
	<div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>
</body>
</html>