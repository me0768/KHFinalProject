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
				<div role="tabpanel">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home"
							aria-controls="home" role="tab" data-toggle="tab">헬스장 찾기</a></li>
						<li role="presentation"><a href="#profile"
							aria-controls="profile" role="tab" data-toggle="tab">공공체육시설
								찾기</a></li>
					</ul>
					
					<!-- Tab panes -->					
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane active" id="home">
							<div class="row">
										<a href=""><img src="" style="height:100px; weight:100px;"></a>	
										<div id="healthlist">
											<script type="text/javascript">
											$(document).ready(function(){
												$.ajax({
													url:"findhealth.do",
													type: "post",
													dataType: "json",
													success : function(data){
														console.log(data.gymlist);
														var jsonStr = JSON.stringify(data.gymlist);
														
														var json = JSON.parse(jsonStr);
														
														var values = $("#healthlist").html();
														
														for(var i in json.list)
														{
															values += json.list[i].gym_name + "<br/>" +
																		json.list[i].location + "<br/>";
														}
														
														$("#healthlist").html(values);
													},
													error : function(request, status, errorData){
														alert("error code : " + request.status + "\n"
																+ "message : " + request.responseText + "\n"
																+ "error : " + errorData);
													}
												});							
												});
											</script>
										</div>
							</div>
						</div>
						
						<div role="tabpanel" class="tab-pane" id="profile">
							<ul>
								<li>
									<div id="thumbnail">
										<a href=""><img src=""></a>
									</div> 공공체육시설1
								</li>
								<li>
									<div id="thumbnail">
										<a href=""><img src=""></a>
									</div> 공공체육시설2
								</li>
								<li>
									<div id="thumbnail">
										<a href=""><img src=""></a>
									</div> 공공체육시설3
								</li>
								<li>
									<div id="thumbnail">
										<a href=""><img src=""></a>
									</div> 공공체육시설4
								</li>
								<li>
									<div id="thumbnail">
										<a href=""><img src=""></a>
									</div> 공공체육시설5
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div id="paging">
					<nav>
						<ul class="pagination">
							<li><a href="#" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="col-md-8 ">
			<div id="map">
				<script type="text/javascript"
					src="/fitnessground/resources/js/gym/gymmap.js"></script>
			</div>
		</div>
	</div>
	<!-- row -->
</div>
<!-- container -->
<c:import url="../include/main/footer.jsp" />
<c:import url="../include/common/end.jsp" />
