function setCalendar() {
	var $calendar = $('#calendar').fullCalendar({
		locale: "ko",
	    height: 'auto',  
	    header: {
	    	left:   'prev',
	        center: 'title',
	        right:  'next'
	    },
	    eventLimit: true,
		selectable: true,
		select: function(start, end, jsEvent, view) {
			userScheduleInput(start);
		},
		eventClick: function(calEvent, jsEvent, view) {
			var user_no = $("input[name=user_no]");
			if(calEvent.vno != 0) {
				$(this).attr("href", "javascript:detailView(" + calEvent.vno+ ",\"" + calEvent.category1 + "\"" + ",\"" + calEvent.category2 + "\"" + ",\"" + "1" + "\"" + ")");
			} else {
				$(this).attr("href", "javascript:userScheduleDetail(" + calEvent.id + ",\"" + calEvent.title + "\"" + ",\"" + "2" + "\"" + ")");
			}
	    }
	});
}