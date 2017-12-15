<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="../include/common/head.jsp" />

<link rel="stylesheet"
	href="/fitnessground/resources/css/findgym/findgym.css" />

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

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vWkJuuK8gXcwBG8Rijlh&submodules=geocoder">	

</script>

<c:import url="../include/common/headend.jsp" />

<script type="text/javascript">
	function loadGymList(page){
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
				
				// 리스트 처리
				var values="";
				
				for(var i in json.gymlist)
				{
					values += "<a href=''>" + "<div id='wrapper'><img src='/fitnessground/resources/images/pic01.jpg' style='height:100px; weight:100px;'>" + "</a>" + 
							"<div id='health-desc'>"+json.gymlist[i].gym_name + "<br/>" + 
							json.gymlist[i].location + "<br/></div></div>";
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
	
	function loadPublicList(ppage)
	{
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
					values += "<a href=''>" + "<div id='wrapper'><a href='#'><img src='/fitnessground/resources/images/pic01.jpg' style='height:100px; weight:100px;'></a>" +
								"<div id='public-desc'>" + json.publiclist[i].public_name + "<br/>" + json.publiclist[i].location + "<br/></div></div>";
				}
				"<a href=''>" + "<div id='wrapper'><a href='#'><img src='/fitnessground/resources/images/pic01.jpg' style='height:100px; weight:100px;'>" + "</a>" + 
				"<div id='health-desc'>"+json.gymlist[i].gym_name + "<br/>" + 
				json.gymlist[i].location + "<br/></div></div>";
		
				console.log(values);
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
	<div class="row">
		<br> <br>
	</div>
	<div class="row">
		<div class="col-md-4">
			<div class="row">
				<div class="input-group">
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
					<ul class="nav nav-tabs" role="tablist" style="text-align:center;">
						<li role="presentation" class="active" id="list"><a href="#home"
							aria-controls="home" role="tab" data-toggle="tab">헬스장 찾기</a></li>
						<li role="presentation" id="list"><a href="#profile"
							aria-controls="profile" role="tab" data-toggle="tab">공공체육시설 찾기</a></li>
					</ul>
					
					<!-- Tab panes -->					
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="home">
							<div class="row">
										<div id="healthlist">
										<c:forEach var="glist" items="${gympage.list}">
										<div id='wrapper'>
										<a href='#'><img src="/fitnessground/resources/images/pic01.jpg" style="height:100px; weight:100px;"></a>
										<div id="health-desc">${glist.gym_name}<br/>
										${glist.location}<br/>
										</div></div>
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
 						<c:if test="${gympage.currentPage eq i }">
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
						<div role="tabpanel" class="tab-pane" id="profile">
							<div class="row">
								<div id="publiclist">
									<c:forEach var="plist" items="${gympage.plist}">
									<div id="wrapper">
									<a href='#'><img src="/fitnessground/resources/images/pic01.jpg" style="height:100px; weight:100px;"></a>
										<div id="public-desc">
										${plist.public_name}<br/>
										${plist.location}<br/>
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
				
			</div>
			<div class="col-md-6 ">
			<div id="map">
				<script type="text/javascript"
					src="/fitnessground/resources/js/gym/gymmap.js"></script>
			</div>
			</div>
		</div>
	</div>
	<!-- row -->
<!-- container -->
<c:import url="../include/main/footer.jsp" />
<c:import url="../include/common/end.jsp" />
