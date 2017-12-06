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
			
			<c:import url="../user/login.jsp"/>
			<c:import url="../user/findidpwd.jsp"/>
			<c:import url="../user/register.jsp"/>
		</div>
    </div>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=vWkJuuK8gXcwBG8Rijlh&submodules=geocoder">
	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');

	});
</script>

<!-- <script type="text/javascript" src="http://openAPI.seoul.go.kr:8088/784645794a6b616931377242486776/xml/ListPublicPhysicalPlant/1/5/">

</script> -->
<div id="container">
	<div id="navigator">
		
		
		<div class="row">
			<div class="col-lg-6">
				<div class="checkbox" id="check">
					<label> <input type="checkbox" value=""> 현재 장소에서 검색
					</label>
				</div>
				<div class="input-group" style="width: 150%; margin-left: 50px">
					<input type="text" id="address" class="form-control" placeholder="Search for...">
					<span class="input-group-btn">
						<button class="btn btn-default" id="submit" type="button">검색!</button>
					</span>
				</div>
				<!-- /input-group -->
			</div>
			<!-- /.col-lg-6 -->
		</div>
		
			<div role="tabpanel">

  			<!-- Nav tabs -->
  			<ul class="nav nav-tabs" role="tablist">
    			<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">헬스장 찾기</a></li>
    			<li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">공공체육시설 찾기</a></li>    			
  			</ul>

			  <!-- Tab panes -->
  			<div class="tab-content">
    			<div role="tabpanel" class="tab-pane active" id="home">
    				<ul>
    				<c:forEach items="${list}" var="hlist">
    					<li>
    					<div id="thumbnail">
  							<a href=""><img src=""></a>
  						</div>
  							${hlist.gym_name }<br>${hlist.location } 
    					</li>
    				</c:forEach>
    				</ul>
    			</div>
    			<div role="tabpanel" class="tab-pane" id="profile">
    			<ul>
    				<li>
    				<div id="thumbnail">
  							<a href=""><img src=""></a>
  						</div>
  							공공체육시설1
    				</li>
    				<li>
    				<div id="thumbnail">
  							<a href=""><img src=""></a>
  						</div>
  							공공체육시설2
    				</li>
    				<li>
    				<div id="thumbnail">
  							<a href=""><img src=""></a>
  						</div>
  							공공체육시설3
    				</li>
    				<li>
    				<div id="thumbnail">
  							<a href=""><img src=""></a>
  						</div>
  							공공체육시설4
    				</li>
    				<li>
    				<div id="thumbnail">
  							<a href=""><img src=""></a>
  						</div>
  							공공체육시설5
    				</li>
    			</ul>
    			</div>
  			</div>

			</div>
			<div id="paging">
			<nav>
  				<ul class="pagination">
    			<li>
      				<a href="#" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
      				</a>
    			</li>
    			<li><a href="#">1</a></li>
    			<li><a href="#">2</a></li>
    			<li><a href="#">3</a></li>
    			<li><a href="#">4</a></li>
    			<li><a href="#">5</a></li>
    			<li>
      				<a href="#" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
      				</a>
    			</li>
  				</ul>
			</nav>
			</div>
		</div>
	</div>
	
	<div id="maparea">
		<div id="map"></div>

		<script type="text/javascript">
		var map = new naver.maps.Map("map", {
		    center: new naver.maps.LatLng(37.3595316, 127.1052133),
		    zoom: 10,
		    mapTypeControl: true
		});
		
		
		
		var infoWindow = new naver.maps.InfoWindow({
		    anchorSkew: true
		});

		map.setCursor('pointer');

		// search by tm128 coordinate
		function searchCoordinateToAddress(latlng) {
		    var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

		    infoWindow.close();

		    naver.maps.Service.reverseGeocode({
		        location: tm128,
		        coordType: naver.maps.Service.CoordType.TM128
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('올바른 주소가 아닙니다.');
		        }

		        var items = response.result.items,
		            htmlAddresses = [];

		        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
		            item = items[i];
		            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

		            htmlAddresses.push((i+1) +'. '+ addrType +' '+ item.address);
		            htmlAddresses.push('&nbsp&nbsp&nbsp -> '+ item.point.x +','+ item.point.y);
		        }

		        infoWindow.setContent([
		                '<div style="padding:10px;min-width:200px;line-height:150%;">',
		                '<h4 style="margin-top:5px;">검색 좌표 : '+ response.result.userquery +'</h4><br />',
		                htmlAddresses.join('<br />'),
		                '</div>'
		            ].join('\n'));

		        infoWindow.open(map, latlng);
		    });
		}

		// result by latlng coordinate
		function searchAddressToCoordinate(address) {
		    naver.maps.Service.geocode({
		        address: address
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('올바른 주소가 아닙니다.');
		        }
		        
		        	var marker;

		        var item = response.result.items[0],
		            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
		            point = new naver.maps.Point(item.point.x, item.point.y);

		        infoWindow.setContent([
		                '<div style="padding:10px;min-width:200px;line-height:150%;">',
		                '<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery +'</h4><br />',
		                addrType +' '+ item.address +'<br />',
		                '&nbsp&nbsp&nbsp -> '+ point.x +','+ point.y,
		                '</div>'
		            ].join('\n'));


		        map.setCenter(point);
		        infoWindow.open(map, point);
		    });
		}

		function initGeocoder() {
		    map.addListener('click', function(e) {
		        searchCoordinateToAddress(e.coord);
		    });

		    $('#address').on('keydown', function(e) {
		        var keyCode = e.which;

		        if (keyCode === 13) { // Enter Key
		            searchAddressToCoordinate($('#address').val());
		        
		            /* var marker = new naver.maps.Marker({
		                position: searchAddressToCoordinate($('#address').val()),
		                map: map
		            }); */
		        }
		    });
		    
		    $('#submit').on('click', function(e) {
		        e.preventDefault();

		        searchAddressToCoordinate($('#address').val());
		        
		        /* var marker = new naver.maps.Marker({
	                position: searchAddressToCoordinate($('#address').val()),
	                map: map
	            }); */
		       
		    });		   

		    searchAddressToCoordinate('용산구');
		}
		 
		

		naver.maps.onJSContentLoaded = initGeocoder;
		</script>
	</div>
</div>
<c:import url="../include/common/end.jsp" />
<c:import url="../include/main/footer.jsp" />