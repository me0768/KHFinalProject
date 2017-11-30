<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="../include/common/head.jsp" />

<style type="text/css">
	.carousel-control {
		left: -12px;
	    height: 40px;
		width: 40px !important;
	    background: none repeat scroll 0 0 #222222;
	    border: 4px solid #FFFFFF;
	    border-radius: 23px 23px 23px 23px;
	    margin-top: 55px;
	}
	.carousel-control.right {
		right: -12px;
	}
	/* The indicators */
	.carousel-indicators {
		right: 50%;
		top: auto;
		bottom: -10px;
		margin-right: -19px;
	}
	/* The colour of the indicators */
	.carousel-indicators li {
		background: #cecece;
	}
	.carousel-indicators .active {
	background: #428bca;
	}
	
	.carousel-inner{
		padding-left: 30px;
		padding-right: 30px;
	}
	
	#image_list {
		disyplay: inline-block;
		border: 1px solid #333;
		border-radius: 10px;
		height: 150px;
		padding: 0px;
	}
	
	#Carousel{
		display: block;
		padding-top: 15px;
	}
	
	#imagelist{
		width: 100%;
		height: 70%;
	}
	
	a.thumbnail{
		padding: 0px;
	}
</style>

<link rel="stylesheet" href="/fitnessground/resources/css/bootstrap.min.css">

<c:import url="../include/common/headend.jsp" />



<c:if test="${ sessionScope.user == null }">
	<script type="text/javascript">
			$(function (){
				alert("로그인이 필요합니다.");
				location.href="main.do";
			});
		</script>
</c:if>
<c:if test="${ sessionScope.user != null }">
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
	<div class="container">
		<div class="panel panel-default" id="panelOne">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne" aria-expanded="true"
						aria-controls="collapseOne"> <span
						class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						&nbsp;&nbsp;헬스장 사진
					</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in"
				role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">

					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="image_list">
						<div>
							<div class="col-md-12">
					                <div id="Carousel" class="carousel slide">
					                 
					                <ol class="carousel-indicators">
					                    <li data-target="#Carousel" data-slide-to="0" class="active"></li>
					                    <li data-target="#Carousel" data-slide-to="1"></li>
					                </ol>
					                 
					                <!-- Carousel items -->
					                <div class="carousel-inner">
					                    
					              	<div class="item active">
					                	<div id="li1">
					                	 	<!-- 목록 생성 -->
					                	</div><!-- .row -->
					                </div><!-- .item -->
	
					                </div><!-- .carousel-inner -->
										<!-- 버튼 생성 -->
					                </div><!-- .Carousel -->
					                 
							</div>
						</div>
					</div>
					

						<div>
							<div class="input_wrap">
								<a href="javascript:" onclick="fileUploadAction();"
									class="btn btn-danger my_button">이미지 업로드</a> <input type="file"
									id="input_imgs" multiple />
							</div>
						</div>

				</div>
				<!-- panel body -->
			</div>
		</div>
		<div class="panel panel-default" id="panelTwo">
			<div class="panel-heading" role="tab" id="headingTwo">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapseTwo" aria-expanded="false"
						aria-controls="collapseTwo"> <span
						class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						&nbsp;&nbsp;헬스장 정보
					</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingTwo">
				<div class="panel-body">헬스장 정보</div>
			</div>
		</div>
		<div class="panel panel-default" id="panelThree">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree"> <span
						class="glyphicon glyphicon-ok" aria-hidden="true"></span>
						&nbsp;&nbsp;헬스장 일정
					</a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body">Anim pariatur cliche reprehenderit,
					enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
					moon officia aute, non cupidatat skateboard dolor brunch. Food
					truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
					sunt aliqua put a bird on it squid single-origin coffee nulla
					assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
					labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
					excepteur butcher vice lomo. Leggings occaecat craft beer
					farm-to-table, raw denim aesthetic synth nesciunt you probably
					haven't heard of them accusamus labore sustainable VHS.</div>
			</div>
		</div>
		<div class="panel panel-default" id="panelFour">
			<div class="panel-heading" role="tab" id="headingFour">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapsefour"
						aria-expanded="false" aria-controls="collapsefour"> <span
						class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						&nbsp;&nbsp;헬스장 위치
					</a>
				</h4>
			</div>
			<div id="collapsefour" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingfour">
				<div class="panel-body">Anim pariatur cliche reprehenderit,
					enim eiusmod high life accusamus terry richardson ad squid. 3 wolf
					moon officia aute, non cupidatat skateboard dolor brunch. Food
					truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,
					sunt aliqua put a bird on it squid single-origin coffee nulla
					assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer
					labore wes anderson cred nesciunt sapiente ea proident. Ad vegan
					excepteur butcher vice lomo. Leggings occaecat craft beer
					farm-to-table, raw denim aesthetic synth nesciunt you probably
					haven't heard of them accusamus labore sustainable VHS.</div>
			</div>
		</div>
	</div>
</c:if>

<script type="text/javascript">
		$("#panelOne").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
		$("#headingOne").css("color","red");
		$("#panelTwo").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
		$("#headingTwo").css("color","red");
		$("#panelThree").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
		$("#headingThree").css("color","green");
		$("#panelFour").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
		$("#headingFour").css("color","red");
		
		
		// 이미지 미리보기
		var sel_files = [];
		$(document).ready(function(){
			$("#input_imgs").on("change", handleImgFileSelect);
			$("#input_imgs").hide();
			
			$('#myCarousel').carousel({
                interval: 5000
	        });
	 
	        $('#carousel-text').html($('#slide-content-0').html());
		});
		
		function fileUploadAction(){
			console.log("fileUploadAction");
			$("#input_imgs").trigger("click");
		}
		
		function handleImgFileSelect(e) {
			//이미지 정보들을 초기화
			sel_files = [];
			$("#li1").empty();
			$("#div2").remove();
			
			// 캐러셀 좌우버튼
			var prevnext = 	"<a data-slide='prev' href='#Carousel' class='left carousel-control' id='prev'>‹</a>" +
           					"<a data-slide='next' href='#Carousel' class='right carousel-control' id='next'>›</a>";
			
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			var index = 0;
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				
				sel_files.push(f);
				
				var reader = new FileReader();
				reader.onload = function(e){
					var imgli = "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-4'><a href='#' class='thumbnail'><img src='" + e.target.result + "' alt='Image' id='imagelist'></a></div>";
					if(index < 6){
						if(index == 5){
							// 아이템 div 생성
							var item = "<div class='item' id='div2'>" +
										"<div id='li2'></div>" +
										"</div>";
							$(".carousel-inner").append(item);
						}
						// 목록 붙임
						$("#li1").append(imgli);
					} else if (index < 12 && index > 5){
						// 목록 붙임
						$("#li2").append(imgli);
					} else {
						alert("이미지는 최대 12장까지 업로드 할 수 있습니다.");
						$('#Carousel').append(prevnext);
						return;
					}
					index++;
				}
				reader.readAsDataURL(f);
			});
			
			// 이미지가 다 삽입되고나면 캐러셀 좌우 버튼 생성
			$("#Carousel").append(prevnext);
		}
		
		$( window ).resize(function open_chatroom(){
			var windowWidth = window.innerWidth;
			if(windowWidth < 376) {
				$("#image_list").css({"height":"150px"});
				$("#imagelist").css({"height":"60px;"});
			} else if (windowWidth < 430){
				$("#image_list").css({"height":"150px"});
				$("#imagelist").css({"height":"35%"});
			} else if (windowWidth < 769){
				$("#image_list").css({"height":"120px"});
			} else {
				$("#image_list").css({"height":"150px"});
			}
		});
	</script>

<c:import url="../include/main/footer.jsp" />

<c:import url="../include/common/end.jsp" />