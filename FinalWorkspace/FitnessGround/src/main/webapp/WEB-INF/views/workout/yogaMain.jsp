<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page
	import="com.kh.fitnessground.workout.yoga.model.vo.Yoga, java.util.List"%>


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

<!-- <div id="workout-head">
	<h2 id="workout-title">Yoga</h2>
</div> -->

<!-- yoga body -->
<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12" id="workout-body">


	<!-- tab testing -->
	<div class="container is-bg-a">
		<!-- tab-list -->
		<div class="wrap">
			<div class="tab-wrap">
				<ul class="tab-list tab-b is-col-3">
					<li><a href="healthMain.do"><span>헬스</span></a></li>
					<li class="in"><a href="#"><span>요가</span></a></li>
					<li><a href="#"><span>필라테스</span></a></li>
					<li><a href="#"><span>맨몸운동</span></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- // tab-list -->

	<div class="container news-section-tab">
		<!-- news-section-tab -->
		<div class="wrap">
			<div class="tab-wrap" id="press-cate">
				<ul class="tab-list">
					<li id="tab-li"><a href="#">빈야사요가</a></li>
					<li id="vertical-bar"><span>|</span></li>
					<li id="tab-li"><a href="#">다이어트요가</a></li>
					<li id="vertical-bar"><span>|</span></li>
					<li id="tab-li"><a href="#">체형교정요가</a></li>
					<li id="vertical-bar"><span>|</span></li>
					<li id="tab-li"><a href="#">부위별요가</a></li>
					<li id="vertical-bar"><span>|</span></li>
					<li id="tab-li"><a href="#">초보자를위한 요가</a></li>
				</ul>

			</div>
			<div class="sort-area">
				<select name="sort" id="sort">
					<option value="1">All</option>
					<option value="2">최신순</option>
					<option value="3">인기순</option>
				</select>
				<!-- animated 검색바 -->
				<main>
				<div class="srch_wrpr">
					<input type="checkbox" name="" class="checkbox">
					<div class="srch_sb_cnt">
						<input type="text" name="text_bar" id="" class="sech_txt_inpt"
							placeholder="Type to search...">
						<button class="srch_btn">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</div>
				</div>
				</main>
				<hr id="video-line">
			</div>
		</div>
	</div>
	<!-- thumbnail youtube API call -->
					<script type="text/javascript">
					var list = new Array(); 
					var duration; 
					var thumbnail;
					<c:forEach items="${list}" var="item">
					list.push("${item.url}");
					</c:forEach>
					console.log(list);
					$(document).ready(function(){
						for(var i=0;i<5;i++){
							$.get("https://www.googleapis.com/youtube/v3/videos", {
								part : 'contentDetails',
								maxResults : 50,
								id : list[i],
								key : 'AIzaSyACiHNLQp0NoZLhAx6u2JbtMGjCp3STK3A'
							}, function(data) {
								
								$.each(data.items, function(i, item) {
									duration = item.contentDetails.duration;
									console.log("time:" + duration);
									$('#video-info').append(duration);
								});
				
							});
						}
						for(var i=0;i<5;i++){
							$.get("https://www.googleapis.com/youtube/v3/videos", {
								part : 'snippet',
								maxResults : 50,
								id : list[i],
								key : 'AIzaSyACiHNLQp0NoZLhAx6u2JbtMGjCp3STK3A'
							}, function(data) {
								
								$.each(data.items, function(i, item) {
									 thumbnail = item.snippet.thumbnails.medium.url;

									$('#video-info').append('<img src=\"'+thumbnail+'\">');
								});
				
							});
						}
						});
					</script>

	<!-- 동영상 리스트 (a태그덮어씌움~modal) -->
	<div class="container workout_videos">
		<c:if test="${!empty list}">
			<c:forEach items="${list}" var="y" varStatus="st">
					
				<div class="video">
					<div id="video-iframe${y.v_no}">
						<%-- <iframe id="video-thumbnail"
							src="https://www.youtube.com/embed/${y.url}" frameborder="0"
							gesture="media" allow="encrypted-media" allowfullscreen></iframe>
						<a href="#" data-toggle="modal" data-target=".${y.v_no }">
							<div id="video-cover"></div>
						</a> --%>
					</div>
					<div id="video-info">
						<span id="video-text">${y.title}</span> <span id="video-text"><c:url
								var="detail" value="#detail" /></span>
					</div>
				</div>
				<!-- video modal -->
				<div class="modal fade ${y.v_no }" tabindex="-1" role="dialog"
					aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">

							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
								<h4 class="modal-title" id="myLargeModalLabel">${y.title}<a
										class="anchorjs-link" href="#myLargeModalLabel"><span
										class="anchorjs-icon"></span></a>
								</h4>
							</div>
							<div class="modal-body">
								<div class="modal-play">
									<iframe id="video-play"
										src="https://www.youtube.com/embed/${y.url}" frameborder="0"
										gesture="media" allow="encrypted-media" allowfullscreen></iframe>
								</div>
								<div class="modal-desc">
									<div id="video-content">
										<span>${y.content }</span>
									</div>
									<div id="video-reply">
										<input type="text" id="reply-input" placeholder="댓글을 입력하세요">
										<button type="submit" id="reply-btn">댓글달기</button>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>


	</div>

	<!-- 사이드바  -->
	<!-- <div class="col-sm-2 col-md-2 col-lg-2">
		<div class="workout_sidebar">
			<ul>
				<li><a href="#">헬스</a>
					<ul class="closed">
						<li>다양한 헬스 운동</li>
					</ul></li>
				<li><a href="#">요가</a>
					<ul class="active">
						<li>빈야사</li>
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
						<li>팔굽혀 펴기</li>
						<li>하체</li>
						<li>복근</li>
						<li>철봉</li>
						<li>전신 프로그램</li>
						<li>(초보자)3개월 운동</li>
					</ul></li>
			</ul>
		</div>
	</div>
 -->

	<script type="text/javascript">
		$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').focus()
		})
	</script>




</div>



<c:import url="../include/main/footer.jsp" />
<c:import url="../include/common/end.jsp" />