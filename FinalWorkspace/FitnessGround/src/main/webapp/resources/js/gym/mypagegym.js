$(document).ready(function(){
		mygymlist();
	});

	function mygymlist(){
		var user_no = $("#userno").val();
		var queryString = { "user_no": user_no };
		$.ajax({
			url: 'mygymlist.do',
			data: queryString,
			dataType: 'json',
			type: 'post',
			success: function(data){
				var values = '';
				values += '등록된 헬스장 (' + data.gymcount + ')';
				$("#regcount").html(values);
				for(var i=0; i < data.gymcount; i++ ){
					
				}
			}
		});
	}