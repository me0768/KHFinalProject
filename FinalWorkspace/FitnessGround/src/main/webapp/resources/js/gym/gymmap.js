/**
 * 시설 지도
 */
var map = new naver.maps.Map("map");

var infoWindow = new naver.maps.InfoWindow({
	anchorSkew : true
});

var markers = [];
var infoWindows = [];
var markerBuffer;//시설마커버퍼
var markerCurrent;//시설현재마커
var uMarkerBuffer;//사용자마커버퍼
var uMarkerCurrent;//사용자현재마커

// search by tm128 coordinate
// 주소 -> 위도, 경도로 변경
function searchCoordinateToAddress(latlng) {
	var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);

	infoWindow.close();

	naver.maps.Service.reverseGeocode({
		location : tm128,
		coordType : naver.maps.Service.CoordType.TM128
	}, function(status, response) {
		if (status === naver.maps.Service.Status.ERROR) {
			return alert('올바른 주소가 아닙니다.');
		}

		/*
		 * var item = response.result.items[0], point = new
		 * naver.maps.Point(item.point.x, item.point.y); 현재 장소 좌표 구하는 변수
		 * map.setCenter(point); onLoadGym(map, plant_no);현재 맵의 위도 경도 구하는 함수
		 * 
		 */
		
		var items = response.result.items, htmlAddresses = [];

		for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
			item = items[i];
			addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]';

			htmlAddresses.push((i + 1) + '. ' + addrType + ' ' + item.address);
			htmlAddresses.push('&nbsp&nbsp&nbsp -> ' + item.point.x + ','
					+ item.point.y);
		}

		infoWindow.setContent([
				'<div style="padding:10px;min-width:200px;line-height:150%;">',
				'<h4 style="margin-top:5px;">검색 좌표 : '
						+ response.result.userquery + '</h4><br />',
				htmlAddresses.join('<br />'), '</div>' ].join('\n'));

		infoWindow.open(map, latlng);
		
		marker = new naver.maps.Marker({
			map: map,
			position: latlng,
			title: "나의 위치",
			zIndex: 150		
	});	
		
	});
}

function changeCoordToAddress(latlng)
{
	var tm128 = naver.maps.TransCoord.fromLatLngToTM128(latlng);
	
	infoWindow.close();
	
	naver.maps.Service.reverseGeocode({
		location : tm128,
		coordType : naver.maps.Service.CoordType.TM128
	}, function(status, response) {
		if (status === naver.maps.Service.Status.ERROR) {
			return alert('올바른 주소가 아닙니다.');
	} else return tm128;
});
}


// result by latlng coordinate 위도 경도 -> 주소로 변경
function searchAddressToCoordinate(address) {
	naver.maps.Service.geocode({
		address : address
	}, function(status, response) {
		if (status === naver.maps.Service.Status.ERROR) {
			return alert('올바른 주소가 아닙니다.');
		}

		var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명 주소]'
					: '[지번 주소]', point = new naver.maps.Point(item.point.x, item.point.y);

		infoWindow.setContent(['<div style="padding:10px;min-width:200px;line-height:150%;">',
				'<h4 style="margin-top:5px;">검색 주소 : '+ response.result.userquery
				+ '</h4><br />', addrType + ' ' + item.address + '<br />',
				'&nbsp&nbsp&nbsp -> ' + point.x + ',' + point.y, '</div>' ].join('\n'));
		
		map.setCenter(point);
		
		marker = new naver.maps.Marker({
			map: map,
			position: point,
			title: "나의 위치",
			zIndex: 150		
		});	
		
		infoWindow.open(map, point); 
		});
}

// 현재 위치에서 가까운 위치의 체육관을 찾아주는 함수
/*
 * function onNearestGym(map, plant_no){ this.markerBuffer=this.markerCurrent;
 * var mapCenter = map.getCenter(); var lat = mapCenter.lat(); var lng =
 * mapCenter.lng(); var queryString = { "plant_no": plant_no, "lat": lat, "lng":
 * lng };
 * 
 * $.ajax({ url: "nearestgym.do", data: queryString, dataType: "json", type:
 * "post", success: function(data){ var gym = data.gym; if(gym.plant_no == 1) {
 * markerCurrent = new naver.maps.Marker({ map: map, position: new
 * naver.maps.LatLng(publicgym.lat, publicgym.lng), title:
 * publicgym.public_name, zIndex:100 }); } var contentString = ['div
 * style="padding:20px;">', '<h3><b>' + data.public_name + '</b></h3>', '<p>' +
 * data.location + "<br><br>" + data.homepage + "</p></div>"].join('');
 * 
 * var infoWindow = new naver.maps.InfoWindow({ anchorSkew : true, content:
 * contengString }); infoWindow.open(map, markerCurrent);
 * markerBuffer.setMap(null); }, error: function(request, status, error){
 * alert("code:" + request.status + "\n" + "message:" + request.responseText +
 * "\n" + "error:" + error) } }); }
 */

function initMap() {
	/*map.addListener('click', function(e) {
		searchCoordinateToAddress(e.coord);
	});*/
	map.setOptions({
		scaleControl : true,
		logoControl : false,
		mapDataControl : false,
		zoomControl : false,
		minZoom : 10,
		maxZoom : 12,
		zoom : 10,
		mapTypeControl : false
	});

	$('#address').on('keydown', function(e) {
		var keyCode = e.which;

		if (keyCode === 13) { // Enter Key
			searchAddressToCoordinate($('#address').val());
		}
	});

	$('#submit').on('click', function(e) {
		e.preventDefault();
		searchAddressToCoordinate($('#address').val());
	});
	
	naver.maps.Event.addListener(map, 'zoom_changed', function(){
		//줌에 변경이 있을경우실행됨
		setGymlist(map);
	});
	  
	naver.maps.Event.addListener(map, 'dragend', function(){
		//화면이동이 끝나면 실행됨 
		setGymlist(map);
	});
	
	$('#geolocation').on("click", function() {
		onLoadGeolocation();
	});
	
	

	// searchAddressToCoordinate('용산구');
}

// geolocation 성공 시 실행 함수
function onSuccessGeolocation(position) {
	var location = new naver.maps.LatLng(position.coords.latitude,
			position.coords.longitude);
	var center = map.getCenter();
	
	marker = new naver.maps.Marker({
			map: map,
			position: center,
			title: "나의 위치",
			zIndex: 150
	});	
	
	infoWindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5>'
			+ "latitude: "
			+ center.lat()
			+ "<br />longitude: "
			+ center.lng()
			+ '</div>');
	
	
	infoWindow.open(map, center);

	map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
	map.setZoom(10); // 지도의 줌 레벨을 변경합니다.

/*
 * infoWindow.setContent('<div style="padding:20px;">' + '<h5 style="align:
 * center;"검색 결과 </h5>' + '<br />' + 'latitude: ' + location.lat() + '<br />' +
 * 'longitude: ' + location.lng() + '</div>');
 */

	/* infoWindow.open(map, location); */
}

function onErrorGeolocation() {
	var center = map.getCenter();

	infoWindow.setContent('<div style="padding:20px;">'
					+ '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'
					+ "latitude: " + center.lat() + "<br />longitude: "
					+ center.lng() + '</div>');

	infoWindow.open(map, center);
}



function onLoadGeolocation(){
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(
				onSuccessGeolocation, onErrorGeolocation);
	} else {
		var center = map.getCenter();

		infoWindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5>'
										+ "latitude: "
										+ center.lat()
										+ "<br />longitude: "
										+ center.lng()
										+ '</div>');
		infoWindow.open(map, center);
	}
}

function setGymlist(map){
	console.log(markers);
	for (var i = 0, ii = this.markers.length; i < ii; i++) {
		this.markers[i].setMap(null);
	}
	this.markers = [];
	this.infoWindows = [];
	onLoadPublic(map);
}
  	
function onLoadPublic(map){
	var mapBounds = map.getBounds();
	var minLat = mapBounds.minY();
	var maxLat = mapBounds.maxY();
	var minLng = mapBounds.minX();
	var maxLng = mapBounds.maxX();
	
	var queryString = {
		"minLat": minLat,
		"maxLat": maxLat,
		"minLng": minLng,
		"maxLng": maxLng
	};
	
	$.ajax({
		url:"publicmap.do",
		data: queryString,
		type: "post",
		dataType: "json",
		success:function(data){
			var jsonStr = JSON.stringify(data);
			var json=JSON.parse(jsonStr);
			console.log(data.publiclist);
			console.log(data.publiclist.lat);
			console.log(data.publiclist.lng);
			var marker;
			var infoWindow;
			for(var i in json.publiclist)
			{
				
				marker = new naver.maps.Marker({
					map: map,
					position: new naver.maps.LatLng(json.publiclist[i].lat, json.publiclist[i].lng),
					title: json.publiclist[i].public_name,
					zIndex: 150,
					icon:{
						url: "/fitnessground/resources/images/public_marker.png",
						size : new naver.maps.Size(44, 44),
						origin : new naver.maps.Point(0, 0),
						anchor : new naver.maps.Point(22, 44)
					}
				
				});	
				
			var contentString = ["<div style='padding:20px;'>"+
								"<h3><b>" + json.publiclist[i].public_name + "</b></h3>" +
								"<p>" + json.publiclist[i].location + "<br><br>"+
								json.publiclist[i].homepage + "</p>"+
								"</div>"].join("");
			
			infoWindow = new naver.maps.InfoWindow({
				anchorSkew: true,
				content: contentString
			});		
			
			markers.push(marker);
			infoWindows.push(infoWindow);	
			}
			
			for(var i = 0, ii=markers.length; i < ii; i++)
			{
				naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
			}
			
			// map.setCenter(location);
		},
		error: function(request, status, error){
			alert("code:" + request.status + "\n" + "message:" + request.responseText
					+ "\n" + "error:" + error);
		}
	});
}

function getClickHandler(seq) { // 클릭 이벤트 핸들러 추가하는 함수
	return function(e) {
		var marker = markers[seq];
		var infoWindow = infoWindows[seq];

		if (infoWindow.getMap()) {
			infoWindow.close();
		} else {
			infoWindow.open(map, marker);
		}
	};
}

$(window).on("load", function() {
	initMap();
	onLoadGeolocation();
	onLoadPublic(map);
});