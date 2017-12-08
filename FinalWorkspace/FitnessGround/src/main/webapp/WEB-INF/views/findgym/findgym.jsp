<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type"
	content="text/html; charset=UTF-8; IE=edge">
<meta name="viewport"
	content="width=device=width, initial-scale=1.0, 
	maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<c:import url="../include/common/head.jsp" />

<link rel="stylesheet"
	href="/fitnessground/resources/css/findgym/findgym.css" />

<c:import url="../include/common/headend.jsp" />
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

<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vWkJuuK8gXcwBG8Rijlh&submodules=geocoder">
	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');

	});
</script>

<!-- <script type="text/javascript" src="http://openAPI.seoul.go.kr:8088/784645794a6b616931377242486776/xml/ListPublicPhysicalPlant/1/5/">

</script> -->
<div id="container" class="container">
	<div class="row">
		<br> <br>
	</div>
	<div class="row">
		<div class="col-md-4">
			<div class="row">
				<div class="input-group">
						<input type="text" class="form-control" id="address"
							placeholder="Search for..." style='height:30px'"> <span
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
								<c:forEach items="${list}" var="hlist">	
										<a href=""><img src="#this" style="height:100px; weight:100px;"></a>	
										<div id="healthlist">
											${hlist.gym_name }<br>
											${hlist.location }
										</div>									
								</c:forEach>
							
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
<c:import url="../include/common/end.jsp" />
<c:import url="../include/main/footer.jsp" />