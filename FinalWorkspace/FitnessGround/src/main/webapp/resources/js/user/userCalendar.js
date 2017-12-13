function setCalendar() {
	var $calendar = $('#calendar').fullCalendar({
		locale: "ko",
		height: "auto",
		selectable: true,
		select: function(start, end, jsEvent, view) {
			var user_no = $("input[name=user_no]");
			var title = prompt("운동 내용을 입력해주세요.", "");
			if (title != null) {
				var job = {content:title, upload_date:start};
				$.ajax({				// 스케줄 추가
				 	type : "post",
				 	url : "uscheduleInsert.do",
				 	data : JSON.stringify(job),
				 	contentType : "application/json; charset=utf-8",
				 	success : function(data){
				 		location.href="uschedule.do?userno="+user_no.val();
				 	},
				 	error: function(request,status,error){
				 		alert("error code : " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
				 	}
				});
			};
			$calendar.fullCalendar("unselect");
		},
		eventClick: function(calEvent, jsEvent, view) {
			var user_no = $("input[name=user_no]");
			if(calEvent.url != "") {
				if(calEvent.category == '헬스') {
					$(this).attr("href", "javascript:detailView(" + calEvent.vno + ")")
				}else {
			        $(this).attr("data-toggle", "modal");
					$(this).attr("data-title", calEvent.title);
					$(this).attr("data-url", calEvent.url);
					$(this).attr("data-content", calEvent.content);
					$(this).attr("data-target", "#detailView");
				}
			} else {
				if (confirm("'"+calEvent.title+"' 을 삭제하시겠습니까?")===true) {
	            	/*$('#calendar').fullCalendar('removeEvents', calEvent.id);*/
					var job = {s_no:calEvent.id};
					$.ajax({				// 스케줄 삭제
					 	type : "post",
					 	url : "uscheduleDel.do",
					 	data : JSON.stringify(job),
					 	contentType : "application/json; charset=utf-8",
					 	success : function(data){
					 		location.href="uschedule.do?userno="+user_no.val();
					 	},
					 	error: function(request,status,error){
					 		alert("error code : " + request.status + "\n"
									+ "message : " + request.responseText + "\n"
									+ "error : " + errorData);
					 	}
					});
	            }
			}
	    }
	});
}

//modal 띄우기(title,url, content 값을 모달로)
$('#detailView').on('show.bs.modal', function (event) {
     var tag = $(event.relatedTarget); // sth that triggered the modal
     var title = tag.data('title'); // Extract info from data-* attributes
     var vid = tag.data('url');
     var content = tag.data('content');
     
     var modal = $(this);
     modal.find('.modal-title').text(title);
     modal.find('.modal-play').html("<iframe id='video-play' src='https://www.youtube.com/embed/"+vid+"' frameborder='0'"+
            "gesture='media' allow='encrypted-media' allowfullscreen></iframe>");
     modal.find('#span-content').text(content);
})