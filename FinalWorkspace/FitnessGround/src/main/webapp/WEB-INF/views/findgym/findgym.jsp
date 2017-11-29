<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=UTF-8; IE=edge">
<meta name="viewport"
	content="width=device=width, initial-scale=1.0, 
	maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<c:import url="../include/common/head.jsp" />

<c:import url="../include/main/nav.jsp" />

<title>운동시설 찾기</title>
<br>
<br>
<br>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vWkJuuK8gXcwBG8Rijlh&submodules=geocoder">
	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');

	});
</script>

<link rel="stylesheet"
	href="/fitnessground/resources/css/findgym/findgym.css" />
</head>
<c:import url="../include/common/headend.jsp" />
<div id="container">
	<div id="navigator">
		<div class="checkbox">
			<label> <input type="checkbox" value=""> 현재 장소에서 검색
			</label>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<div class="input-group" style="width: 50%">
					<input type="text" class="form-control" placeholder="Search for...">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">Go!</button>
					</span>
				</div>
				<!-- /input-group -->
			</div>
			<!-- /.col-lg-6 -->
		</div>
		<div role="tabpanel">

			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#home"
					aria-controls="home" role="tab" data-toggle="tab">헬스장 찾기</a></li>
				<li role="presentation"><a href="#profile"
					aria-controls="profile" role="tab" data-toggle="tab">공공체육시설 찾기</a></li>
			</ul>

			<!-- Tab panes -->
			<div class="tab-content">
				<div role="tabpanel" class="tab-pane active" id="home">
					<ul id="panel">
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
					</ul>
				</div>
				<div role="tabpanel" class="tab-pane" id="profile">
					<ul>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="maparea">
		<div id="map"></div>

		<script type="text/javascript">
			var mapOptions = {
				center : new naver.maps.LatLng(37.3595704, 127.105399),
				zoom : 10
			};

			var map = new naver.maps.Map('map', mapOptions);
		</script>
	</div>
</div>
<c:import url="../include/common/end.jsp" />
<c:import url="../include/main/footer.jsp" />
</html>