<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.kh.fitnessground.workout.yoga.model.vo.Yoga, java.util.List" %>

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
					<ul class="closed">
						<li>다양한 헬스 운동</li>
					</ul></li>
				<li><a href="#">요가</a>
					<ul class="active">
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
   <!-- 동영상 리스트  -->
	  <div
	      class="col-sm-8 col-md-8 col-lg-8 col-sm-offset-1 col-md-offset-1 col-lg-offset-1">
	      <div class="workout_videos">
	         <div class="row justify-content-center">
				<c:if test="${!empty list}">
				   <c:forEach items="${list}" var="y" varStatus="st">
	   
		            <div class="video">
		            	<div id="video-iframe">
		               <iframe id="video-thumbnail" src="https://www.youtube.com/embed/${y.url}"
		                  frameborder="0" gesture="media" allow="encrypted-media"
		                  allowfullscreen></iframe>
		                   <a href="#" data-toggle="modal" data-target=".${y.v_no }">
	                  		<div id="video-cover"></div>
		                  </a>
		                  </div>
		               <div id="video-info">
			               <span id="video-text">${y.title}</span>
			               <span id="video-text"><c:url var="detail" value="#detail" /></span>
		               </div> 
		            </div>
		            	   <!-- video modal -->
					<div class="modal fade ${y.v_no }" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					   <div class="modal-content">
					
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
					          <h4 class="modal-title" id="myLargeModalLabel">${y.title}<a class="anchorjs-link" href="#myLargeModalLabel"><span class="anchorjs-icon"></span></a></h4>
					        </div>
					        <div class="modal-body">
					        	<div class="modal-play">
						           <iframe id="video-play" src="https://www.youtube.com/embed/${y.url}"
					                  frameborder="0" gesture="media" allow="encrypted-media"
					                  allowfullscreen></iframe>
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
	
	      </div>
	   </div>


<script type="text/javascript">
$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').focus()
	})

</script>
	   
  
   

</div>



<c:import url="../include/main/footer.jsp" />
<c:import url="../include/common/end.jsp" />