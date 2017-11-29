<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:import url="../include/common/head.jsp" />
	
	<style type="text/css">
		.my_button{
			margin-top: 20px;
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

		        
		    	<div>
		    		<div class="imgs_wrap">
		    			<img id="img" />
		    		</div>
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
		  <div class="panel panel-default" id="panelTwo">
		    <div class="panel-heading" role="tab" id="headingTwo">
		      <h4 class="panel-title">
		        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		          	<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		    			&nbsp;&nbsp;헬스장 정보
		        </a>
		      </h4>
		    </div>
		    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
		      <div class="panel-body">
		        Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
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
		});
		
		function fileUploadAction(){
			console.log("fileUploadAction");
			$("#input_imgs").trigger("click");
		}
		
		function handleImgFileSelect(e) {
			//이미지 정보들을 초기화
			sel_files = [];
			$(".imgs_wrap").empty();
			
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
					var html = 	"<a href=\"#\" id=\"img_id_"+index+"\">" + 
									"<img src=\""+e.target.result+"\" style='height: 100px; width: 100px; z-index: 1; margin-left: 20px; margin-top: 10px;'>" +
									/* "<a href=\"javascript:void(0);\"  data-file='"+f.name+"' class='selProductFile'  style='position: absolute;' >" +  */
										"<span class='glyphicon glyphicon-remove' onclick=\"deleteImageAction("+index+")\" aria-hidden='true' title='Click to remove' style='z-index: 100; margin-left: -20px; top: -80px;'></span>" + 
									/* "</a>" + */
								"</a>";
					$(".imgs_wrap").append(html);
					index++;
				}
				reader.readAsDataURL(f);
			});
		}
		
		function deleteImageAction(index){
			console.log("index : " + index);
			sel_files.splice(index, 1);
			
			var img_id = "#img_id_" + index;
			$(img_id).remove();
			
			console.log(sel_files)
		}
	</script>

	<c:import url="../include/main/footer.jsp" />

    <c:import url="../include/common/end.jsp" />