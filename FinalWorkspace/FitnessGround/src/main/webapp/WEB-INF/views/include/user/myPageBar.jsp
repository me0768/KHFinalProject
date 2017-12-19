<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

		<div class="hidden-xs hidden-sm hidden-md visible-lg">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
				    <div class="navbar-header">
				      <h1><a class="navbar-brand" href="mypage.do?userno=${sessionScope.user.user_no}" style="font-size:20pt;">마이페이지</a></h1>
				    </div>
				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				      <ul class="nav navbar-nav">
				        <li class="" style="margin-left:30px;" id="myPageBarText"><a href="udetail.do">회원정보</a></li>
						<li style="margin-left:15px;" id="myPageBarText"><a href="userpwd.do">비밀번호변경</a></li>
						<li style="margin-left:15px;" id="myPageBarText"><a href="userboard.do?userno=${sessionScope.user.user_no}">게시글관리</a></li>
						<c:if test="${ sessionScope.user.user_level == 0 }">
							<li style="margin-left:15px;" id="myPageBarText"><a href="uschedule.do?userno=${sessionScope.user.user_no}">운동스케줄</a></li>
						</c:if>
						<li style="margin-left:15px;" id="myPageBarText"><a href="userdel.do">회원탈퇴</a></li>
				      </ul>
				    </div>
				    
			    </div>
			<%-- <ul>
				<li><h1><a href="mypage.do?userno=${sessionScope.user.user_no}">My Page</a></h1></li>
				<li id="myPageBarText"><a href="udetail.do">회원정보</a></li>
				<li id="myPageBarText"><a href="userpwd.do">비밀번호변경</a></li>
				<li id="myPageBarText"><a href="userboard.do?userno=${sessionScope.user.user_no}">게시글관리</a></li>
				<c:if test="${ sessionScope.user.user_level == 0 }">
					<li id="myPageBarText"><a href="uschedule.do?userno=${sessionScope.user.user_no}">운동스케줄</a></li>
				</c:if>
				<li id="myPageBarText"><a href="userdel.do">회원탈퇴</a></li>
			</ul> --%>
			</nav>
		</div>
		<div class="col-sm-12 visible-xs visible-sm visible-md hidden-lg navbar-fixed-top" style="margin-top:40px; padding-left: 0px !important; padding-right: 0px !important;">
			<ul class="nav nav-tabs" style="background:white;">
			  <li role="presentation" class="dropdown">
			    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false" id="sm_title">
			      My Page <span class="caret"></span>
			    </a>
			    <ul class="dropdown-menu" role="menu">
			    <li><a href="mypage.do?userno=${sessionScope.user.user_no}">Home</a>
				<li><a href="udetail.do">회원정보</a></li>
				<li><a href="userpwd.do">비밀번호변경</a></li>
				<li><a href="userboard.do?userno=${sessionScope.user.user_no}">게시글관리</a></li>
				<c:if test="${ sessionScope.user.user_level == 0 }">
					<li><a href="uschedule.do?userno=${sessionScope.user.user_no}">운동스케줄</a></li>
				</c:if>
				<li><a href="userdel.do">회원탈퇴</a></li>
			    </ul>
			  </li>
			</ul>
		</div>