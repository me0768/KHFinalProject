<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8; IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<c:import url="../include/common/head.jsp" />

<style type="text/css">
	body{
		position: relative;
	}

	.scrollspy-example {
		position: relative;
		height: 90vh;
		max-height: 90vh;
		overflow: hidden;
		overflow-y: auto;
	}
	
	#detailimg {
		width: 100%;
		height: 60vh;
	}
	
	#gyminfo {
		padding-left: 10px;
		padding-right: 0px;
		padding-top : 10px;
		padding-bottom : 10px;
	}
	
	#gyminfo> div{
		margin-top: 10px;
	}
	
	#gymdesc {
		height: 100px;
		max-height: 100px;
		overflow: hidden;
		overflow-y: auto;
	}
	
	.nav-tabs > li{
		padding: 0px;
		text-align: center;
	}
</style>

<c:import url="../include/common/headend.jsp" />

 <script type="text/javascript" src="/fitnessground/resources/js/gym/detailgym.js"></script>  

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=G0XI103VNKmTZuGNcR9G&submodules=geocoder"></script>

	<div id="page-wrapper">
		<!-- Header -->
		<div id="mypage_header">
			<!-- Nav -->
			<c:import url="../include/main/nav.jsp" />

			<c:import url="../user/login.jsp" />
			<c:import url="../user/findidpwd.jsp" />
			<c:import url="../user/register.jsp" />
		</div>
	</div>
	<div class="container"style="position: relative; padding: 0px;">
	<nav id="navbar-example" class="navbar navbar-default navbar-static" role="navigation">
		<div class="navbar form-control" style="padding:0px; margin-bottom:0px;">
		    <ul class="nav nav-tabs" role="tablist">
		      <li class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><a href="#info">헬스장 정보</a></li>
		      <li class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><a href="#schedule">헬스장 일정</a></li>
		      <li class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><a href="#location">헬스장 위치</a></li>
		    </ul>
		 </div>
	</nav>
		<div data-spy="scroll" data-target="#navbar-example" data-offset="-100px" class="scrollspy-example">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;" id="info">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="padding: 0px;">
					<input type="hidden" id="imagevalue" value="${ gym.rename_image }"> 
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					  <!-- Indicators -->
					  <ol class="carousel-indicators" id="indicator">
					    	<!--  -->
					  </ol>
					
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner" id="inner" role="listbox">
						<!-- 이미지 아이템 -->
					  </div>
					
					  <!-- Controls -->
					  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
				</div>
				
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" id="gyminfo">
					<!-- 헬스장 정보 -->
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h3 style="font-weight: bold;">${ gym.gym_name }</h3>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h6 style="font-weight: bold;"><span class="glyphicon glyphicon-time"></span>   운영시간</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;">
						<h6>${ gym.op_time }</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h6 style="font-weight: bold;"><span class="glyphicon glyphicon-earphone"></span>   전화번호</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;">
						<h6>${ gym.tel }</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h6 style="font-weight: bold;"><span class="glyphicon glyphicon-phone"></span>   핸드폰번호</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;">
						<h6>${ gym.phone }</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h6 style="font-weight: bold;"><i class="fa fa-krw" aria-hidden="true"></i>   가격</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;">
						<h6>${ gym.price }</h6>
						
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h6 style="font-weight: bold;"><i class="fa fa-clone" aria-hidden="true"></i>   분류</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;">
						<h6>${ gym.category }</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h6 style="font-weight: bold;"><i class="fa fa-list-alt" aria-hidden="true"></i>    헬스장 소개</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;" id="gymdesc">
						<h6>${ gym.description }</h6>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="right">
						<button class="btn btn-danger" <%-- ${ gym.gym_no } --%> >문의하기</button>
					</div>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;" id="schedule">
				헬스장 달력<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				<!-- 달력 -->
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding: 0px;" id="location">
				<!-- 지도 -->
				헬스장 지도
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</div>
		</div>
	</div>
	
<c:import url="../include/main/footer.jsp" />

<c:import url="../include/common/end.jsp" />