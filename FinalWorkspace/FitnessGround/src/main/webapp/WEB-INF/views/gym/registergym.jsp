<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>

<c:import url="../include/common/head.jsp" />

<link rel="stylesheet" href="/fitnessground/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/fitnessground/resources/css/gym/registergym.css">
<style type="text/css">
	.wrap {
	width: 500px;
	margin: 0 auto;
}
.btn-holder {
	text-align: center;
	margin: 10px 0 10px 0;
}
#calendar table {
	border-collapse: collapse;
	text-align: center;
}
#calendar table thead td {
	height: 30px;
	font-weight: bold;
}	
#calendar table td {
	border: solid 1px #000;
}
#calendar table td.date-cell {
	height: 50px;
}
#calendar table td.sun {
	color: red;
}
#calendar table td.sat {
	color: blue;
}
#calendar table td.not-this-month {
	background: #ddd;
	color: #999;
}

#datesettings{
	position: fixed;
	display: none;
	width: 70vw;
	height: 30vh;
	top: 100vh;
	right: 0px;
	background-color: white;
	left: 15vw;
	z-index: 999;
	border: 1px solid black;
}

#dateinsert {
	padding-right: 30px;
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
			<div id="collapseOne" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="mainimage">
						<!-- 이미지 드래그 앤 드롭 -->
						<div class='bigimage' id='bigimage' style='width: 360px; height: 360px;'>
							<img src="/fitnessground/resources/images/gymimages/draganddrop.png" style="width: 300px; height: 108px; border-radius: 10px; margin-top: 126; margin-left: 30px;">
						</div>
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
						aria-controls="collapseTwo" id="panel2">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						&nbsp;&nbsp;헬스장 정보
					</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse"
				role="tabpanel" aria-labelledby="headingTwo">
				<div class="panel-body">
				
						<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
							<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">
								<span class="glyphicon glyphicon-pencil" class="input-group-addon" aria-hidden="true"></span>
							</span>
							<input type="text" class="form-control" aria-describedby="basic-addon1" id="gymname" name="gymname" placeholder="헬스장 이름"  oninput="gymemptycheck();">
							</div>
							
							<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">
								<span class="glyphicon glyphicon-time" class="input-group-addon" aria-hidden="true"></span>
							</span>
							<input type="text" class="form-control" aria-describedby="basic-addon1" id="optime" name="optime" placeholder="헬스장 운영시간 ex) 10:00 ~ 24:00"  oninput="gymemptycheck();">
							</div>
							
							<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">
								<span class="glyphicon glyphicon-phone-alt" class="input-group-addon" aria-hidden="true"></span>
							</span>
							<input type="text" class="form-control" aria-describedby="basic-addon1" id="tel" name="tel" placeholder="헬스장 번호" oninput="gymemptycheck();">
							</div>
							
							<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">
								<span class="glyphicon glyphicon-earphone" class="input-group-addon" aria-hidden="true"></span>
							</span>
							<input type="text" class="form-control" aria-describedby="basic-addon1" id="phone" name="phone" placeholder="핸드폰 번호" oninput="gymemptycheck();">
							</div>
							
							<div class="input-group">
							<span class="input-group-addon" id="basic-addon1">
								<span class="glyphicon glyphicon-usd" class="input-group-addon" aria-hidden="true"></span>
							</span>
							<input type="text" class="form-control" aria-describedby="basic-addon1" id="price" name="price" placeholder="월 회비 ex) 1개월 *만원 / 3개월 * 만원" oninput="gymemptycheck();">
							</div>
							
						</div>
						<div class="col-lg-8 col-md-8 col-sm-6 col-xs-0" style="height: 200px;">
							
						</div>
						
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							
								<div class="checks etrans">
									<a>
								 		<input type="checkbox" id="ex_chk0" onclick="boxcheck(0);"> 
								  		<label for="ex_chk0">헬스</label> 
									</a>
								  
								  	<a>
								  		<input type="checkbox" id="ex_chk1" onclick="boxcheck(1);"> 
								  		<label for="ex_chk1">요가</label> 
								  	</a>
								  
								  	<a>
								  		<input type="checkbox" id="ex_chk2" onclick="boxcheck(2);"> 
								  		<label for="ex_chk2">필라테스</label> 
								  	</a>
								  
								  	<a>
								  		<input type="checkbox" id="ex_chk3" onclick="boxcheck(3);"> 
								  		<label for="ex_chk3">맨몸운동</label> 
								  	</a>
								</div>				
								
											
								<textarea class="col-lg-12 col-md-12 col-sm-12 col-xs-12" placeholder="헬스장 설명" style="height: 300px;" id="gymdesc" oninput="gymemptycheck();"></textarea>
						</div>
				
				</div>
			</div>
		</div>
		<div class="panel panel-default" id="panelThree">
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapseThree"
						aria-expanded="false" aria-controls="collapseThree"  id="panel3"> <span
						class="glyphicon glyphicon-ok" aria-hidden="true"></span>
						&nbsp;&nbsp;헬스장 일정
					</a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse in"
				role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body">
					
					<div class='col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-12 col-xs-12'>
						<div class='btn-holder'>
							<button id='btnPrev' class="btn btn-danger">&lt;</button>
							 <span id='currentDate'></span> 
							<button id='btnNext' class="btn btn-danger">&gt;</button>
						</div>
						<div id="calendar"></div>
					</div>
					<script type="text/javascript" src="/fitnessground/resources/js/gym/calendar.js"></script>
					<div id="datesettings">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="height: 20px; padding: 0px;">
							<button type="button" class="btn btn-danger form-control" style="padding: 0px; height: 20px;" onclick="dateclose();">
								<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
							</button>
						</div>
						<div id="dateinsert" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<!-- 일정 등록 div -->
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
		<div class="panel panel-default" id="panelFour">
			<div class="panel-heading" role="tab" id="headingFour">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse"
						data-parent="#accordion" href="#collapsefour"
						aria-expanded="false" aria-controls="collapsefour"  id="panel4"> <span
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