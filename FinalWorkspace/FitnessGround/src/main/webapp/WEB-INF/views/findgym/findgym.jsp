<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../include/common/head.jsp" />
<link rel="stylesheet" href="/fitnessground/resources/css/findgym/findgym.css" />
<%-- <div id="page-wrapper">
	<!-- Header -->
	<div id="mypage_header">
		<c:import url="../user/login.jsp" />
		<c:import url="../user/findidpwd.jsp" />
		<c:import url="../user/register.jsp" />
		<c:import url="../include/main/nav.jsp" />
	</div>
</div> --%>
<div id="mypage_header">
	<!-- Nav -->
	<c:import url="../include/main/nav.jsp"/>
	<c:import url="../user/login.jsp"/>
	<c:import url="../user/findidpwd.jsp"/>
</div>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vWkJuuK8gXcwBG8Rijlh&submodules=geocoder"></script>
<c:import url="../include/common/headend.jsp" />
<script type="text/javascript" src="/fitnessground/resources/js/gym/gymmap.js"></script>

<script type="text/javascript">
	$(function(){
		var mode = ${mode};
		if(mode == 1) {
			$('#health').addClass('active');
			$('#public').removeClass('active');
			$('#healthTab').addClass('active');
			$('#publicTab').removeClass('active');
		} else if(mode == 2) {
			$('#public').addClass('active');
			$('#health').removeClass('active');
			$('#publicTab').addClass('active');
			$('#healthTab').removeClass('active');
		}
		//$('#myPageBar nav ul #uBoard').addClass('activeMenu');	
	});	
	function loadGymList(page) {
		$.ajax({
			url:"findhealth.do",
			type: "post",
			dataType: "json",
			data : {"page":page},
			success : function(data){
				console.log(data.gymlist);
				console.log(data.currentPage);
				console.log(data.maxPage);
				
				var jsonStr = JSON.stringify(data);
														
				var json = JSON.parse(jsonStr);
				console.log(json);
				// 리스트 처리
				var values="";
				
				for(var i in json.gymlist)
				{
					if(json.gymlist[i].rename_image == null){
						values += "<div id='wrapper'><div id='health-desc'><a href='#'>" + json.gymlist[i].gym_name + "<br>" + json.gymlist[i].location + "<br>" + json.gymlist[i].tel + "</a></div>" +
						"<div id='thumbnail'>" + "<a href='#'><img src='/fitnessground/resources/images/default_image.png' style='height:100px; width:100px;'></a></div></div>";
					} else {
						values += "<div id='wrapper'><div id='health-desc'><a href='#'>" + json.gymlist[i].gym_name + "<br>" + json.gymlist[i].location + "<br>" + json.gymlist[i].tel + "</a></div>" +
						"<div id='thumbnail'>" + "<a href='#'><img src=" + json.gymlist[i].rename_image + " style='height:100px; width:100px;'></a></div></div>";
					}
				} 
				
				console.log(values);
				$("#healthlist").html(values);
				
				var valuesPaging="";
					if(data.currentPage <=1){
						valuesPaging+="<li class='disabled'><a href='#' aria-label='Previous'>" +
					"<span aria-hidden='true'>&laquo;</span></a></li>";
					}else{
						valuesPaging+="<li><a href='javascript:loadGymList(" + (data.currentPage - 1) + ")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
					}	
				for(var i=data.startPage;i<=data.endPage;i++){
					if(data.currentPage==i){
						valuesPaging+="<li class='disabled'><a href='#'>" + i + "</a></li>";
					}else{
						valuesPaging+="<li><a href='javascript:loadGymList(" + i + ")'>" + i + "</a></li>";
					}
					}
				if(data.currentPage >= data.maxPage){
					valuesPaging+="<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				}else{ 
					valuesPaging+="<li><a href='javascript:loadGymList(" + (data.currentPage + 1) + ")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				}
				$("#healthpaging").html(valuesPaging);
				
				
				
				},			
			error : function(request, status, errorData){
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
					}
			});	
	}
	
	function loadPublicList(ppage) {
		$.ajax({
			url:"findpublic.do",
			type: "post",
			datatype: "json",
			data: {"ppage":ppage},
			success: function(data){
				console.log(data.publiclist);
				console.log(data.pcurrentPage);
				console.log(data.pmaxPage);
				
				var jsonStr = JSON.stringify(data);
														
				var json = JSON.parse(jsonStr);
				
				// 리스트 처리
				var values="";
				
				for(var i in json.publiclist)
				{
					if(json.publiclist[i].tel == null){
						values += "<div id='wrapper'><div id='public-desc'><a href='#'>" + json.publiclist[i].public_name + "<br>" + json.publiclist[i].location + "<br>" + 
						"- </a></div>" + "<div id='thumbnail'><a href='#'><img src='/fitnessground/resources/images/default_image.png' style='height:100px; width:100px;'></a></div></div>";
					} else {
						values += "<div id='wrapper'><div id='public-desc'><a href='#'>" + json.publiclist[i].public_name + "<br>" + json.publiclist[i].location + "<br>" + 
						json.publiclist[i].tel + "</a></div>" + "<div id='thumbnail'><a href='#'><img src='/fitnessground/resources/images/default_image.png' style='height:100px; width:100px;'></a></div></div>";
					}
					
				}
				
				$("#publiclist").html(values);
				
				var valuesPaging="";
					if(data.pcurrentPage <=1){
						valuesPaging+="<li class='disabled'><a href='#' aria-label='Previous'>" +
					"<span aria-hidden='true'>&laquo;</span></a></li>";
					}else{
						valuesPaging+="<li><a href='javascript:loadPublicList(" + (data.pcurrentPage - 1) + ")' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>";
					}	
				for(var i=data.pstartPage;i<=data.pendPage;i++){
					if(data.pcurrentPage==i){
						valuesPaging+="<li class='disabled'><a href='#'>" + i + "</a></li>";
					}else{
						valuesPaging+="<li><a href='javascript:loadPublicList(" + i + ")'>" + i + "</a></li>";
					}
					}
				if(data.pcurrentPage >= data.pmaxPage){
					valuesPaging+="<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				}else{ 
					valuesPaging+="<li><a href='javascript:loadPublicList(" + (data.pcurrentPage + 1) + ")' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>";
				}
				$("#publicpaging").html(valuesPaging);
				setGymlist(map);
				},			
			error : function(request, status, errorData){
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
					}
		});
		
	}
</script>
 
<div id="container" class="container">
	<div class="row"><br><br></div>
	<div class="row">
		<div class="col-md-4">
			<div class="row">
				<div class="input-group" style="margin-top:30px">
						<input type="text" class="form-control" id="address"
							placeholder="Search for..." style='height:30px'> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button" id="submit"  style='height:30px'>
								<span class="glyphicon glyphicon-search" ></span>
							</button>
							<button class="btn btn-default" type="button" id="geolocation"  style='height:30px'>
								<span class="glyphicon glyphicon-map-marker"></span>
							</button>
						</span>
				</div>
			</div>

			<div class="row">
				<div role="tabpanel" id="panel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist" style="text-align: center;">
						<li role="presentation" class="active" id="healthTab"><a href="#health" aria-controls="home" role="tab" data-toggle="tab">헬스장 찾기</a></li>
						<li role="presentation" id="publicTab"><a href="#public" aria-controls="profile" role="tab" data-toggle="tab">공공체육시설 찾기</a></li>
					</ul>
					<!-- Tab panes 헬스 -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="health">
							<div class="row">
								<div id="healthlist">
									<c:forEach var="glist" items="${gympage.list}">
										<div id='wrapper'>
										<div id="health-desc">
										<a href='#'>
										${glist.gym_name}<br>
										${glist.location }<br>
										${glist.tel }
										</a>
										</div>
										<div id="thumbnail">
										<c:if test="${empty glist.rename_image}">
										<a href='#'><img src="/fitnessground/resources/images/default_image.png" style="width: 100px; height: 100px;"></a>
										</c:if>
										<c:if test="${not empty glist.rename_image }">
										<<img src="${glist.rename_image }" style="width: 100px; height: 100px;">
										</c:if>
										
										</div>
										</div>
										</c:forEach>
										</div>
									</c:forEach>
								</div>
							</div>
							<div id="paging">
					<nav>
						<ul class="pagination" id="healthpaging">
						 <!-- 페이지 번호 처리 -->
						<c:if test="${gympage.currentPage <=1 }">
 						<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>
 						</c:if>
 						
 						<c:if test="${gympage.currentPage > 1 }">
 						<input type="hidden" name="page" value="${gympage.currentPage - 1}">
 						<li><a href='javascript:loadGymList(${gympage.currentPage - 1 })' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>
 						</c:if>
						
						<c:forEach var="i" begin="${gympage.startPage }" end="${gympage.endPage }" step="1">
 						<c:if test="${gympage.currentPage eq i }">`
 						<li class='disabled'><a href='#'>${i }</a></li>
 						<input type="hidden" name="page" value="${gympage.currentPage }">
 						</c:if>
 						
 						<c:if test="${gympage.currentPage ne i }">
 						<li><a href="javascript:loadGymList(${i })">${i }</a></li>
 						<input type="hidden" name="page" value="${i}">
 						</c:if>
 						</c:forEach>
						
						<c:if test="${gympage.currentPage >= gympage.maxPage }">
 						<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>
 						<input type="hidden" name="page" value="${gympage.currentPage }">
 						</c:if>
 						
 						<c:if test="${gympage.currentPage < gympage.maxPage }">
 						<li><a href='javascript:loadGymList(${gympage.currentPage + 1})' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>
 						<input type="hidden" name="page" value="${gympage.currentPage + 1}">
 						</c:if>
						</ul>
					</nav>
				</div>
						</div>
						<!-- 공공 체육 시설 -->
						<div role="tabpanel" class="tab-pane" id="public">
							<div class="row">
								<div id="publiclist">
									<c:forEach var="plist" items="${gympage.plist}">
									<div id='wrapper'>
									<div id="public-desc">
									<a href='#'>
									${plist.public_name }<br>
									${plist.location }<br>
									<c:if test="${empty plist.tel }">
										-
									</c:if>
									<c:if test="${not empty plist.tel }">
										${plist.tel }
									</c:if>
									</a>
									</div>
									<div id="thumbnail">
									<a href='#'><img src="/fitnessground/resources/images/default_image.png" style="height:100px; width:100px;"></a>
									</div>										
									</div>
									</c:forEach>								
								</div>
							</div>
							<div id="paging">
								<nav>
									<ul class="pagination" id="publicpaging">
										<!-- 페이지 번호 처리 -->
										<c:if test="${gympage.pcurrentPage <=1 }">
											<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>
										</c:if>
										<c:if test="${gympage.pcurrentPage > 1 }">
											<input type="hidden" name="page" value="${gympage.pcurrentPage - 1}">
											<li><a href='javascript:loadPublicList(${gympage.pcurrentPage - 1 })' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>
										</c:if>
										<c:forEach var="i" begin="${gympage.pstartPage }" end="${gympage.pendPage }" step="1">
											<c:if test="${gympage.pcurrentPage eq i }">
												<li class='disabled'><a href='#'>${i }</a></li>
												<input type="hidden" name="page" value="${gympage.pcurrentPage }">
											</c:if>
											<c:if test="${gympage.pcurrentPage ne i }">
												<li><a href="javascript:loadPublicList(${i })">${i }</a></li>
												<input type="hidden" name="page" value="${i}">
											</c:if>
										</c:forEach>
										<c:if test="${gympage.pcurrentPage >= gympage.pmaxPage }">
											<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>
											<input type="hidden" name="page" value="${gympage.pcurrentPage }">
										</c:if>
										<c:if test="${gympage.pcurrentPage < gympage.pmaxPage }">
											<li><a href='javascript:loadPublicList(${gympage.cpurrentPage + 1})' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>		
			<div class="col-md-8 ">
			<div id="map">
				<script type="text/javascript" src="/fitnessground/resources/js/gym/gymmap.js"></script>
			</div>
			</div><!-- div class -->
			</div> <!-- row -->
		</div><!-- container -->
<c:import url="../include/main/footer.jsp" />
<c:import url="../include/common/end.jsp" />
