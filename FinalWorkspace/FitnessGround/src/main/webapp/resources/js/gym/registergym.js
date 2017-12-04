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
			$("#input_imgs").trigger("click");
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
		
		// ***********************
		// 이미지 드래그 앤 드롭
		// ***********************
		var fd = document.getElementById('mainimage');
		var list = document.getElementById('list');
		function fdOver(e)
		{
			e.stopPropagation();
			e.preventDefault();
			if (e.type == "dragover")
			{
				// 파일 올림
				$("#mainimage").css({"border":"2px solid #0600ff"});
			}
			else
			{
				// 파일 놓음 [원상복구]
				$("#mainimage").css({"border":"2px dashed #3333338a"});
			}
		}
		function fdUpload(e){
			e.stopPropagation();
			e.preventDefault();
			fdOver(e); // (e.type != "dragover") 캔슬을위해 [여기서 별도로 작업해줘도 상관없음]
			
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
		 
			var files = e.target.files || e.dataTransfer.files;
			var filesArr = Array.prototype.slice.call(files);
			
			var index = 0;
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					var bigimagerr = "<div class='bigimage' id='bigimage' style='width: 360px; height: 360px;'>" +
									"<img src='/fitnessground/resources/images/gymimages/draganddrop.png' style='width: 300px; height: 108px; border-radius: 10px; margin-top: 126; margin-left: 30px;'>" +					
									"</div>";
					$("#mainimage").append(bigimagerr);
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_files.push(f);
				
				var reader = new FileReader();
				reader.onload = function imagelist(e){
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
		fd.addEventListener("dragover", fdOver, false);
		fd.addEventListener("dragleave", fdOver, false);
		fd.addEventListener("drop", fdUpload, false);
		
		function handleImgFileSelect(e) {
			//이미지 정보들을 초기화
			sel_files = [];
			$("#li1").empty();
			
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
					/*var bigimagerr = "<div class='bigimage' id='bigimage' style='width: 360px; height: 360px;'>" +
									"<img src='/fitnessground/resources/images/gymimages/draganddrop.png' style='width: 300px; height: 108px; border-radius: 10px; margin-top: 126; margin-left: 30px;'>" +					
									"</div>";
					$("#mainimage").append(bigimagerr);*/
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				$("#mainimage").empty();
				sel_files.push(f);
				
				var reader = new FileReader();
				reader.onload = function imagelist(e){
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
		
		/**
		 * Checkboxy, a simple jQuery checkbox plug-in
		 * Version 1.0.0
		 * Copyright 2013, Dmitry Stillman (https://github.com/stillman)
		 * Licensed under GPL v3
		 */
		(function($) {

		$.fn.checkboxy = function(options) {
			function deinit() {
				// Remove event handlers
				$('input.' + options.class + '[data-checkboxy-el-id]').off('change.checkboxy');
			}

			function init() {
				// Remove old event handlers (if any)
				deinit();

				$(options.tagname + '.' + options.class).on('click', function(evt) {
					if ($(this).closest('label').length) {
						// There is a <label> around the element
						return true;
					}

					$input = $('input.' + options.class + '[data-checkboxy-el-id="' + $(this).data('checkboxy-el-id') + '"]');

					if (!$input.prop('disabled')) {
						$input.trigger('change');
					}
				});

				// Add event handlers
				$('input.' + options.class + '[data-checkboxy-el-id]').on('change.checkboxy', function() {
					$(options.tagname + '.' + options.class + '[data-checkboxy-el-id="' + $(this).data('checkboxy-el-id') + '"]').toggleClass('checked');
				});
			}

			options = $.extend({}, {
				tagname: 'span',
				class: 'checkboxy'
			}, options);

			$(options.tagname + '.' + options.class).remove();

			this.each(function(id) {
				var $input = $(this);
				var $checkboxy = $('<' + options.tagname + '/>').addClass(options.class);

				$input
					.attr('data-checkboxy-el-id', id)
					.addClass(options.class)
					.hide();

				if ($input.prop('checked')) {
					$checkboxy.addClass('checked');
				}

				if ($input.prop('disabled')) {
					$checkboxy.addClass('disabled');
				}

				$checkboxy
					.attr('data-checkboxy-el-id', id)
					.insertBefore(this);
			});

			init();

			return this;
		};

		})(jQuery);
		
		var checkgymname = 0;
		var checkoptime = 0;
		var checktel = 0;
		var checkphone = 0;
		var checkprice = 0;
		var checkbox0 = 0;
		var checkbox1 = 0;
		var checkbox2 = 0;
		var checkbox3 = 0;
		var checkdesc = 0;		
		
		function gymemptycheck(){
			if( $("#gymname").val() != "" ){
				checkgymname = 1;
			} else {
				checkgymname = 0;
			}
			if( $("#optime").val() != "" ){
				checkoptime = 1;
			} else {
				checkoptime = 0;
			}
			if( $("#tel").val() != "" ){
				checktel = 1;
			} else {
				checktel = 0;
			}
			if( $("#phone").val() != "" ){
				checkphone = 1;
			} else {
				checkphone = 0;
			}
			if( $("#price").val() != "" ){
				checkprice = 1;
			} else {
				checkprice = 0;
			}
			if($("#gymdesc").val() != ""){
				checkdesc = 1;
			} else {
				checkdesc = 0;
			}
			borderchange();
		}
		
		function boxcheck(id){
			if(id == 0){
				if( checkbox0 == 0)
					checkbox0 = 1;
				else
					checkbox0 = 0;
			} else if(id == 1){
				if( checkbox1 == 0)
					checkbox1 = 1;
				else
					checkbox1 = 0;
			} else if(id == 2){
				if( checkbox2 == 0)
					checkbox2 = 1;
				else
					checkbox2 = 0;
			} else if(id == 3){
				if( checkbox3 == 0)
					checkbox3 = 1;
				else
					checkbox3 = 0;
			}
			borderchange();
		}
		
		function borderchange(){
			var sum = checkgymname + checkoptime + checktel + checkphone + checkprice + checkdesc;
			var checkbox = checkbox0 + checkbox1 + checkbox2 + checkbox3;	
			if( sum == 6 && checkbox > 0 ){
				var check = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>&nbsp;&nbsp;헬스장 정보";
				$("#panel2").html(check);
				$("#panelTwo").css({'boader-color':'#B0F6AC', 'box-shadow':'0 0 1px 1px rgb(117, 254, 109)'});
				$("#headingTwo").css("color","green");
			} else{
				var check = "<span class='glyphicon glyphicon-remove' aria-hidden='true'></span>&nbsp;&nbsp;헬스장 정보";
				$("#panel2").html(check);
				$("#panelTwo").css({'boader-color':'#F60808', 'box-shadow':'0 0 1px 1px rgb(232, 13, 13)'});
				$("#headingTwo").css("color","red");
			}
		}
		
		
		
		// *********************************************
		// 달력
		// *********************************************
		
		