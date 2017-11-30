<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="../include/common/head.jsp" />

<link rel="stylesheet"
	href="/fitnessground/resources/css/workout/workout.css" />

<c:import url="../include/common/headend.jsp" />

<script type="text/javascript"
	src="/fitnessground/resources/js/workout/workout.js"></script>

<!-- Header -->
<div id="mypage_header">
	<!-- Nav -->
	<c:import url="../include/main/nav.jsp" />
</div>


<!-- yoga head 부분  -->

<div
	id="workout-head">
	<h2 id="workout-title">Yoga</h2>
</div>

<!-- yoga body -->
<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12" id="workout-body">
	<!-- 사이드바  -->
	<div class="col-sm-2 col-md-2 col-lg-2">
		<div class="workout_sidebar">
			<ul>
				<li><a href="#">헬스</a>
					<ul class="active">
						<li>one</li>
						<li>two</li>
						<li>three</li>
						<li>four</li>
						<li>five</li>
					</ul></li>
				<li><a href="#">요가</a>
					<ul class="closed">
						<li>빈야사 </li>
						<li>체형교정</li>
						<li>다이어트</li>
						<li>부위별 요가</li>
						<li>초보자</li>
					</ul></li>
				<li><a href="#">필라테스</a>
					<ul class="closed">
						<li>스트레칭</li>
						<li>전신운동</li>
						<li>복근집중운동</li>
						<li>하체운동</li>
					</ul></li>
				<li><a>맨몸운동</a>
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
	<!-- 동영상 리스트  -->
	<div
		class="col-sm-9 col-md-9 col-lg-9 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
		<div class="workout_videos">
			<div class="row justify-content-center">
				<div class="video">
					<iframe width="250" src="https://www.youtube.com/embed/x7L4rhfJt7U"
						frameborder="0" gesture="media" allow="encrypted-media"
						allowfullscreen></iframe>
					<p id="video_text">title</p>
					<p id="video_text">description</p>
				</div>
				<div class="video">
					<iframe width="250" src="https://www.youtube.com/embed/x7L4rhfJt7U"
						frameborder="0" gesture="media" allow="encrypted-media"
						allowfullscreen></iframe>
						<p id="video_text">title</p>
					<p id="video_text">description</p>
				</div>
				<div class="video">
					<iframe width="250" src="https://www.youtube.com/embed/x7L4rhfJt7U"
						frameborder="0" gesture="media" allow="encrypted-media"
						allowfullscreen></iframe>
						<p id="video_text">title</p>
					<p id="video_text">description</p>
				</div>
			</div>

		</div>
	</div>
	
	<!-- YoutubeAPI 호출, Ajax  -->
	<script type="text/javascript">
    	var playlist1 = 'PL59_4lUZbIwO80AlZBTfoVfF12IoxAfvG'; //빈야사 playlistid
    	var vTitle;
    	var vDesc;
    	var vId;
    	var job;
    	 $(document).ready(function(){
    	       $.get(
    	           "https://www.googleapis.com/youtube/v3/playlistItems", {
    	               part: 'snippet',
    	               maxResults: 50,
    	               playlistId: playlist1,
    	               key: 'AIzaSyACiHNLQp0NoZLhAx6u2JbtMGjCp3STK3A'},
    	               function(data){
    	                   var output;
    	                   var vmap = new Map();
    	                   
    	                   $.each(data.items, function(i, item){
    	                	   vTitle = item.snippet.title.replace(/&/gi, "+");
    	                       vDesc = item.snippet.description.replace(/&/gi, "+");
    	                       vId = item.snippet.resourceId.videoId;
    	                   });
    	                   job = new Object();
    	                   job.title = vTitle;
    	                   job.content = vDesc;
    	                   job.url = vId;
    	                 console.log("json객체:"+job);
    	               }
    	               ); 
    	 /*Controller로 넘기기 */
    	 	$.ajax({
    	 		url : "ylist.do",
    	 		data: JSON.stringify(),
    	 		type: "post",
    	 		contentType : "application/json; charset=utf-8",
    	 		success : function(result){
    	 			console.log("전송성공");
    	 		},
    	 		error : function(request, status, errorData){
    	 			alert("error code : " + request.status + "\n"
    	 					+ "message : " + request.responseText
    	 					+ "\n" + "error : " + errorData);
    	 		}
    	 	});
    	 });
    
    
    
    
    </script>
	
	
	
</div>



<c:import url="../include/main/footer.jsp" />
<c:import url="../include/common/end.jsp" />