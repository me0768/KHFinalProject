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
			$("#mainimage").empty();
			$(".carousel-indicators").empty();
			$("#div2").remove();
			$("#div3").remove();
			$("#div4").remove();
			
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
					var imgli = "<div class='col-lg-2 col-md-2 col-sm-2 col-xs-4'>" +
									"<a href='javascript:imageclick(" + index+ ")' class='thumbnail' id='smallimg" + index + "'>" +
										"<img src='" + e.target.result + "' alt='Image' id='imagelist' style='border-radius: 5px;'>" +
									"</a>" +
								"</div>";
					var mainimage = "<div class='bigimage' id='bigimage" + index + "' style='width: 360px; height: 360px;'>" +
										"<img src='" + e.target.result + "' style='width: 360px; height: 360px; border-radius: 10px;'>" +
									"</div>";
					$("#mainimage").append(mainimage);
					if( index == 0 ){
						$("#bigimage" + index + "").show();
					} else {
						$("#bigimage" + index + "").hide();
					}
					
					var windowWidth = $( window ).width();
					if( windowWidth < 700){ // 모바일
						if(index < 3){
							if( index == 0){
								var indicator = "<li data-target='#Carousel' data-slide-to='0' class='active'></li>";
								$(".carousel-indicators").append(indicator);
							}
							$("#li1").append(imgli);
						} else if ( index < 6){
							if( index == 3){
								var indicator = "<li data-target='#Carousel' data-slide-to='1'></li>";
								$(".carousel-indicators").append(indicator);
								var item = "<div class='item' id='div2'>" +
											"<div id='li2'></div>" +
											"</div>";
								$(".carousel-inner").append(item);
							}
							$("#li2").append(imgli);
						} else if ( index < 9){
							if(index == 6){
								var indicator = "<li data-target='#Carousel' data-slide-to='2'></li>";
								$(".carousel-indicators").append(indicator);
								var item = "<div class='item' id='div3'>" +
											"<div id='li3'></div>" +
											"</div>";
								$(".carousel-inner").append(item);
							}
							$("#li3").append(imgli);
						} else if ( index < 12){
							if( index == 9){
								var indicator = "<li data-target='#Carousel' data-slide-to='3'></li>";
								$(".carousel-indicators").append(indicator);
								var item = "<div class='item' id='div4'>" +
											"<div id='li4'></div>" +
											"</div>";
								$(".carousel-inner").append(item);
							}
							$("#li4").append(imgli);
						} else {
							alert("이미지는 최대 12장까지 업로드 할 수 있습니다.");
							$('#Carousel').append(prevnext);
							return;
						}
					} else { // 태블릿이상 ~ 데스크탑
						if(index < 6){
							if( index == 0){
								var indicator = "<li data-target='#Carousel' data-slide-to='0' class='active'></li>";
								$(".carousel-indicators").append(indicator);
							}
							// 목록 붙임
							$("#li1").append(imgli);
						} else if (index < 12 && index > 5){
							if( index == 6){
								var indicator = "<li data-target='#Carousel' data-slide-to='2'></li>";
								$(".carousel-indicators").append(indicator);
								var item = "<div class='item' id='div2'>" +
											"<div id='li2'></div>" +
											"</div>";
								$(".carousel-inner").append(item);
							}
							// 목록 붙임
							$("#li2").append(imgli);
						} else {
							alert("이미지는 최대 12장까지 업로드 할 수 있습니다.");
							$('#Carousel').append(prevnext);
							return;
						}
					}
					$("#smallimg0").css({"border":"3px solid #8deb7a", "border-radius":"8px"});
					index++;
				}
				reader.readAsDataURL(f);
				gymimageborder();
			});
			
			// 이미지가 다 삽입되고나면 캐러셀 좌우 버튼 생성
			$("#Carousel").append(prevnext);
		}
		
		function imageclick(index){
			for(var i = 0; i < 12; i++){
				$("#bigimage" + i + "").hide();
				$("#smallimg" + i + "").css({"border-color":"#33333300"});
			}
			$("#bigimage" + index + "").show();
			$("#smallimg" + index + "").css({"border":"3px solid #8deb7a", "border-radius":"8px"});
		}
		
		function gymimageborder(){
			var check = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>&nbsp;&nbsp;헬스장 사진";
			$("#panel1").html(check);
			$("#panelOne").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
			$("#headingOne").css("color","green");
		}