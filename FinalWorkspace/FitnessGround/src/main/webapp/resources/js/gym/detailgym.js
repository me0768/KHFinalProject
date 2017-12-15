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
 
 function scrollmove(data){
	 var info = $("#info").scrollTop();
	 var schedule = $("#schedule").scrollTop();
	 var location = $("#location").scrollTop();
	 console.log("info : " + info + ", sch : " + schedule + ", loc : " + location);
	 if(data == 1){
		 $("#scrollView").scrollTop(0);
		 return false;
	 } else if (data == 2){
		 $("#scrollView").scrollTop(600);
		 return false;
	 } else {
		 $("#scrollView").scrollTop(1200);
		 return false;
	 } 
 }