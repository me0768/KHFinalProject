$(document).ready(function() {
	var list = new Array();
	
	var $calendar = $("#calendar").fullCalendar({
		locale: "ko",
		height: "auto",
		selectable: true,
		select: function(start, end, jsEvent, view) {
			var title = prompt("Enter a title for this event", "New event");
			if (title != null) {
				var event = {
					title: title.trim() != "" ? title : "New event",
					start: start,
					end: end
				};
				$calendar.fullCalendar("renderEvent", event, true);
			};
			$calendar.fullCalendar("unselect");
		}
	});
});
