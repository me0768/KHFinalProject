<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset=UTF-8">
	<title>myPage</title>
	<c:import url="../include/common/head.jsp" />
    <c:import url="../include/common/headend.jsp" />
	<div id="page-wrapper">
		<!-- Header -->
		<div id="mypage_header">
            <!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.do">Home</a></li>
					<li><a href="#">운동법</a>
						<ul>
							<li><a href="#">Lorem ipsum dolor</a></li>
							<li><a href="#">Magna phasellus</a></li>
							<li><a href="#">Etiam dolore nisl</a></li>
							<li><a href="#">And a submenu &hellip;</a>
							<ul>
									<li><a href="#">Lorem ipsum dolor</a></li>
									<li><a href="#">Phasellus consequat</a></li>
									<li><a href="#">Magna phasellus</a></li>
									<li><a href="#">Etiam dolore nisl</a></li>
								</ul></li>
							<li><a href="#">Veroeros feugiat</a></li>
						</ul></li>
					<li><a href="left-sidebar.html">운동시설찾기</a></li>
					<li><a href="right-sidebar.html">커뮤니티</a></li>
					<c:if test="${ sessionScope.user == null}">
						<li><a href="#" onclick="return login();">로그인</a></li>
					</c:if>
					<c:if test="${ sessionScope.user != null}">
						<li><a href="logout.do">로그아웃</a></li>
						<li><a href="mypage.do">MyPage</a></li>
					</c:if>
				</ul>
			</nav>	
		</div>
    </div>
</head>
<body>
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