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
		border: 1px solid #3333338a;
		border-radius: 10px;
		height: 150px;
		padding: 0px;
		margin-top: 10px;
	}
	
	#mainimage{
		disyplay: inline-block;
		border: 1px solid #3333338a;
		border-radius: 10px;
		padding: 0px;
		height: 400px;
		padding-top: 20px;
	}
	
	#Carousel{
		display: block;
		padding-top: 20px;
		padding-bottom: 0px;
	}
	
	#imagelist{
		width: 100%;
		height: 70%;
	}
	
	a.thumbnail{
		padding: 0px;
		border: 0px;
	}
	
	.my_button{
		margin-top: 10px;
	}
	
	.bigimage {
		margin-left: auto;
		margin-right: auto;
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
						aria-controls="collapseOne" id="panel1">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						&nbsp;&nbsp;헬스장 사진
					</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in"
				role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="mainimage">
						
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="image_list">
						<div>
							<div class="col-md-12">
					                <div id="Carousel" class="carousel slide">
					                 
					                <ol class="carousel-indicators">
					                    <!-- <li data-target="#Carousel" data-slide-to="0" class="active"></li>
					                    <li data-target="#Carousel" data-slide-to="1"></li> -->
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

<script type="text/javascript" src="/fitnessground/resources/js/gym/registergym.js"></script>

<c:import url="../include/main/footer.jsp" />

<c:import url="../include/common/end.jsp" />