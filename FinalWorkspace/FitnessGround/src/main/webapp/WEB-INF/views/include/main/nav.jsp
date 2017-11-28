<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav id="nav">
	<ul>
		<li><a href="main.do">Home</a></li>
		<li><a href="#">운동법</a>
			<ul>
				<li><a href="#">헬스</a></li>
				<li><a href="#">요가</a></li>
				<li><a href="#">필라테스</a></li>
				<li><a href="#">맨몸운동</a>
					<!-- <ul>
						<li><a href="#">Lorem ipsum dolor</a></li>
						<li><a href="#">Phasellus consequat</a></li>
						<li><a href="#">Magna phasellus</a></li>
						<li><a href="#">Etiam dolore nisl</a></li>
					</ul> -->
				</li> 
			</ul></li>
		<li><a href="left-sidebar.html">운동시설찾기</a></li>
		<li><a href="community.do">커뮤니티</a></li>
		<c:if test="${ sessionScope.user == null}">
			<li><a href="javascript:login()">로그인</a></li>
		</c:if>
		<c:if test="${ sessionScope.user != null}">
			<li><a href="#">${sessionScope.user.name }님</a>
				<ul>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="padding-left: 0px; padding-right: 0px;">
					<c:if test="${ sessionScope.user.rename_image == null }">
						<img src="/fitnessground/resources/images/myimages/nullimage.jpg" class="img-circle" style="width: 85px; height: 85px;">
					</c:if>
					<c:if test="${ sessionScope.user.rename_image != null }">
						<img src="/fitnessground/resources/images/myimages/${ sessionScope.user.rename_image }" class="img-circle" style="width: 85px; height: 85px;">
					</c:if>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					<li><a href="mypage.do">MyPage</a></li>
					<li><a href="#">내 문의내역</a></li>
					<c:if test="${ sessionScope.user.user_level == 1 }">
						<li><a href="moveregistergym.do">헬스장 등록</a></li>
					</c:if>
					<li><a href="logout.do">로그아웃</a></li>
					</div>
				</ul>
			</li>
		</c:if>
	</ul>
</nav>

