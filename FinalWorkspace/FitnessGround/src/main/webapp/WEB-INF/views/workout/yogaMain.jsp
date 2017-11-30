<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="/fitnessground/resources/css/workout/workout.css" />

<c:import url="../include/common/head.jsp" />
<c:import url="../include/common/headend.jsp" />
<script type="text/javascript"
	src="/fitnessground/resources/js/workout/workout.js"></script>
<c:import url="../include/main/nav.jsp" />

<!-- yoga body 부분  -->

	<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12" id="workout-head">
		<h2>Yoga</h2>
		<hr>
	</div>
	<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12" id="workout-body">
		<div class="col-sm-1 col-md-1 col-lg-1">
			<div class="workout_sidebar">
				<ul>
					<li><a href="#"><i class="fa fa-cog"></i>Overview</a>
						<ul class="closed">
							<li>one</li>
							<li>two</li>
							<li>three</li>
							<li>four</li>
							<li>five</li>
						</ul></li>
					<li><a href="#"><i class="fa fa-bar-chart"></i>Statistic</a>
						<ul class="closed">
							<li>one</li>
							<li>two</li>
							<li>three</li>
							<li>four</li>
							<li>five</li>
						</ul></li>
					<li><a href="#"><i class="fa fa-hand-o-up"></i>Event</a>
						<ul class="closed">
							<li>one</li>
							<li>two</li>
							<li>three</li>
							<li>four</li>
							<li>five</li>
						</ul></li>
					<li><a><i class="fa fa-upload"></i>Update</a>
						<ul class="active">
							<li>Upload File</li>
							<li>Version Infos</li>
						</ul></li>
					<li><a href="#"><i class="fa fa-comments-o"></i>Feedback</a>
						<ul class="closed">
							<li>one</li>
							<li>two</li>
							<li>three</li>
							<li>four</li>
							<li>five</li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="workout_videos">
			<div id="workout-video"></div>
		
		</div>
	</div>



<c:import url="../include/main/footer.jsp" />
<c:import url="../include/common/end.jsp" />