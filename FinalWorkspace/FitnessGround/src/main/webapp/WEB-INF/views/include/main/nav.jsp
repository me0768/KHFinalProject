<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<<<<<<< HEAD
			<li><a href="#" onclick="return logout();">로그아웃</a></li>
=======
			<li><a href="logout.do">로그아웃</a></li>
			<li><a href="mypage.do">MyPage</a></li>
>>>>>>> master
		</c:if>
	</ul>
</nav>

<<<<<<< HEAD
<c:import url="./user/login.jsp"/>
=======
>>>>>>> master
