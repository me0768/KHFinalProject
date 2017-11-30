<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	
	<style type="text/css">
		.hide-bullets {
			list-style:none;
			margin-left: -40px;
			margin-top:20px;
		}
		
		.hide-bullets{
			margin-left: 0px;
		}
		
		.row {
			margin-left: 0px;
		}
		
		#mainimage {
			width: 70%;
			height: 50%;
		}
		
		#botimage {
			width: 100%;
			height: 10%;
		}
		
		
	</style>
	
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
			
			<c:import url="../user/login.jsp"/>
			<c:import url="../user/findidpwd.jsp"/>
			<c:import url="../user/register.jsp"/>
		</div>
    </div>
	<div class="container">
		  <div class="panel panel-default" id="panelOne">
		    <div class="panel-heading" role="tab" id="headingOne">
		      	<h4 class="panel-title">
		        	<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		    			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		    			&nbsp;&nbsp;헬스장 사진
		        	</a>
		      	</h4>
		  </div>
		    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
		      <div class="panel-body">

		        <div class="row">
                    <div class="col-xs-12" id="slider">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1 col-xs-12" id="carousel-bounding-box">
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <!-- 캐러셀 이미지 -->
	                                    </div><!-- Carousel nav -->
	                            </div>
	                        </div>
	                    </div>
	                </div><!--/Slider-->
			        <div class="row hidden-xs" id="slider-thumbs">
	                        <!-- Bottom switcher of slider -->
	                        <ul class="hide-bullets">
	 							<!-- 미리보기 이미지 -->
	                        </ul>                 
	                </div>

		    	<div>
		        	<div class="input_wrap">
		        		<a href="javascript:" onclick="fileUploadAction();" class="btn btn-danger my_button">이미지 업로드</a>
		        		<input type="file" id="input_imgs" multiple/>
		        	</div>
		        </div>
		        
		        </div>
		      </div>
		    </div>
		  </div>
		  <div class="panel panel-default" id="panelTwo">
		    <div class="panel-heading" role="tab" id="headingTwo">
		      <h4 class="panel-title">
		        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		          	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		    			&nbsp;&nbsp;헬스장 정보
		        </a>
		      </h4>
		    </div>
		    <div id="collapseTwo" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
		      <div class="panel-body">
		     
		     	헬스장 정보
		        
		      </div>
		    </div>
		  </div>
		  <div class="panel panel-default" id="panelThree">
		    <div class="panel-heading" role="tab" id="headingThree">
		      <h4 class="panel-title">
		        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		        	<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
		    			&nbsp;&nbsp;헬스장 일정
		        </a>
		      </h4>
		    </div>
		    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
		      <div class="panel-body">
		        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
		      </div>
		    </div>
		  </div>
		  <div class="panel panel-default" id="panelFour">
		    <div class="panel-heading" role="tab" id="headingFour">
		      <h4 class="panel-title">
		        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
		          	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		    			&nbsp;&nbsp;헬스장 위치
		        </a>
		      </h4>
		    </div>
		    <div id="collapsefour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingfour">
		      <div class="panel-body">
		        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
		      </div>
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
			$(".carousel-inner").empty();
			$(".hide-bullets").empty();
			
			// 캐러셀 좌우버튼
			var prevnext = 	"<a class='left carousel-control' href='#myCarousel' role='button' data-slide='prev'>" +
							"<span class='glyphicon glyphicon-chevron-left'></span>" +                                       
					  		"</a>" +
							"<a class='right carousel-control' href='#myCarousel' role='button' data-slide='next'>" +
							"<span class='glyphicon glyphicon-chevron-right'></span>" +                                       
							"</a>";		
			
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
					if( index == 0){ // 인덱스가 0이면 이미지가 액티브 상태
						var mainimage = "<div class='active item' data-slide-number='" + index + "' id='imagemaindiv" + index + "'>" +
										"<img src='" + e.target.result + "' class='img-responsive center-block' id='mainimage'></div>";
						$(".carousel-inner").append(mainimage);
					} else if ( index == 12){ 
						alert("이미지는 최대 12장까지 업로드 할 수 있습니다.");
						$("#myCarousel").append(prevnext); // 인덱스가 12가 되면 리턴전에 캐러셀 좌우버튼 생성
						return;
					}else {			// 인덱스가 0이아니면 일반 아이템으로 들어감
						var mainimage = "<div class='item' data-slide-number='" + index + "' id='imagemaindiv" + index + "'>" +
										"<img src='" + e.target.result + "' class='img-responsive center-block' id='mainimage'></div>";
						$(".carousel-inner").append(mainimage);
					}
					var botimage = "<li class='col-sm-2' id='botimageli" + index + "'>" +
                    					"<a class='thumbnail' onclick='carouselck(" + index + ")' id='carousel-selector-" + index + "'>" +
	                    					"<img src='" + e.target.result + "' style='margin-bottom: 5px;' id='botimage'>" +
	                    					"<h6>" + index + "</h6>" +
                    					"</a>" +
                					"</li>";
                	$(".hide-bullets").append(botimage);
					index++;
				}
				reader.readAsDataURL(f);
			});
			
			// 이미지가 다 삽입되고나면 캐러셀 좌우 버튼 생성
			$("#myCarousel").append(prevnext);
		}
		
		// 아래 미리보기 이미지 버튼 클릭시 큰 미리보기 화면 전환
		function carouselck(index){
			$('#myCarousel').carousel(index);
		}
	</script>

	<c:import url="../include/main/footer.jsp" />

    <c:import url="../include/common/end.jsp" />