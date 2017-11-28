<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8; IE=edge">
<meta name="viewport" content="width=device=width, initial-scale=1.0, 
	maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<c:import url="../include/common/head.jsp"/>
<c:import url="../include/common/headend.jsp"/>
<c:import url="../include/main/nav.jsp"/>
<title>운동시설 찾기</title>
<br><br>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vWkJuuK8gXcwBG8Rijlh&submodules=geocoder"></script>
</head>
<body>
<div id="container">
<div class="row">
 <div class="col-lg-6">
    <div class="input-group" style="width:50%">
      <input type="text" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button">Go!</button>
      </span>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
</div>
<ul class="nav nav-tabs">
  <li role="presentation" class="active"><a href="#">헬스장 찾기</a></li>
  <li role="presentation"><a href="#">공공체육시설 찾기</a></li>
  
</ul>

	<div id="map" style="width:70%; height:700px; float:right"></div>
	
	<script type="text/javascript">
		var mapOptions = {
				center: new naver.maps.LatLng(37.3595704, 127.105399),
				zoom: 10
		};
		
		var map = new naver.maps.Map('map', mapOptions);
	</script>
</div>
</body>
<c:import url="../include/main/footer.jsp"/>
<c:import url="../include/common/end.jsp"/>
</html>