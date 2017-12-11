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
	$(document).ready(function(){
		$.ajax({
			url:"findhealth.do",
			type: "post",
			dataType: "json",
			success : function(data){
				console.log(data.gymlist);
				console.log(data.currentPage);
				
				
				var jsonStr = JSON.stringify(data);
														
				var json = JSON.parse(jsonStr);
												
				//var values = $("#healthlist").html();
				
				// 리스트 처리
				var values;
				
				for(var i in json.gymlist)
				{
					values += "<a href=''>" + 
					
						"<img src=" + json.gymlist[i].rename_image + 
					
						"<img src=''" +						
										
					 " style='height:100px; weight:100px;'>" + "</a>" + 
							json.gymlist[i].gym_name + "<br/>" +
							json.gymlist[i].location + "<br/>";
				}
				
				console.log(values);
				$("#healthlist").html(values);
					
				// 페이징 처리
				var page;
				var currentPage = data.currentPage;
				var startPage = data.startPage;
				var endPage = data.endPage;
				var maxPage = data.maxPage;
				
				if(currentPage <= 1){
					$(".pagination").html(
							"<li class='disabled'>"+"<a href='#' aria-label='Previous'>" + 
						        "<span aria-hidden='true'>" + "&laquo;" + "</span>"
						      + "</a>"+"</li>");
				} else {
					$(".pagination").html(
							"<li>"+"<a href='findhealth.do?cpage=${ currentPage - 1 }' aria-label='Previous'>" + 
						        "<span aria-hidden='true'>" + "&laquo;" + "</span>"
						      + "</a>"+"</li>" );
				}
				/* 현재 페이지 숫자 보여주기 */
				for(var p = startPage; p <= endPage; p++)
				{
					if(p == currentPage){
						$(".pagination").html(
							"<li>" + "<a href='#'>" + p + "</a></li>"	
						);	
					} else {
						$(".pagination").html(
								"<li>" + "<a href='fitnesshealth.do?cpage= p '>"+ p + "</a></li>"
							);
					}
				}
				
				if(currentPage >= maxPage){
					$(".pagination").html(
						"<li class='disabled'>" + "<a href='#' aria-label='Next'>" + 
						        "<span aria-hidden='true'>" + "&raquo;" + "</span>" +
						      "</a>" + "</li>"
					);
					} else {
						$(".pagination").html(
								"<li>" + "<a href='findhealth.do?cpage=${ currentPage + 1 }' aria-label='Next'>" + 
								        "<span aria-hidden='true'>" + "&raquo;" + "</span>" +
								      "</a>" + "</li>");
					}
				},			
			error : function(request, status, errorData){
					alert("error code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + errorData);
					}
			});							
		});
	
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
											
										<div id="healthlist">

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
						<!-- 페이지 번호 처리 -->
						
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
