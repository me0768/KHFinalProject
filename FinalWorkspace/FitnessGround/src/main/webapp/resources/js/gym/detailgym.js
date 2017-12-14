$(document).ready(function(){
	var image = $("#imagevalue").val();
	imageoutput(image);
});
 function imageoutput(image){
	 var arr = new Array();
	 arr = image.split(',');
	 console.log(image);
	 if(image == ''){
		 indicators = '<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>';
		 item = '<div class="item active">' +
	      '<img src="resources/images/gymimages/로고.png" id="detailimg">' +
	      '<div class="carousel-caption">' +
	      '</div>' +
	    '</div>';
		 $("#indicator").append(indicators);
		 $("#inner").append(item);
	 } else {
		 for(var i=0; i < arr.length; i++){
			 var indicators = '';
			 var item = '';
			 if(i == 0){
				 indicators = '<li data-target="#carousel-example-generic" data-slide-to="' + i + '" class="active"></li>';
				 item = '<div class="item active">' +
			      '<img src="resources/images/gymimages/' + arr[i] + '" id="detailimg">' +
			      '<div class="carousel-caption">' +
			      '</div>' +
			    '</div>';
			 } else {
				 indicators = '<li data-target="#carousel-example-generic" data-slide-to="' + i + '"></li>';
				 item = '<div class="item">' +
			      '<img src="resources/images/gymimages/' + arr[i] + '" id="detailimg">' +
			      '<div class="carousel-caption">' +
			      '</div>' +
			    '</div>';
			 }
			 $("#indicator").append(indicators);
			 $("#inner").append(item);
		 }
	 }
 }
 
