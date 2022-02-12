$(document).ready(function() {
	var date = new Date();
	var month = date.getMonth();
	var year = date.getFullYear();
	console.log(username);

	//Scripts responsible for calendar management
	 function daysOfMonth(month, year) {
	 	//this function acts as an exclusive upper bound of the current month, used for calculations regarding the last day of the month
    	var d = new Date(year, month+1, 0);
    	return d.getDate();
    }

    function loadCalendar(year, month) {
    	var calendar_body = $("#calendar_body");

    	var tempDate = new Date(year, month, 0);
    	var days = daysOfMonth(month, year);
    	var startDay = tempDate.getDay(); //returns which day of the week the start date is as a number
    	var currDate = 0;
    	var dateCounter = daysOfMonth(year, month);
    	//First Row
    	var d = $("<div class=\"row align-items-stretch flex-grow-1\"></div>");
		// days before the month starts
    	for (var i = 0; i <= startDay; i++) {

    		var date = $("<div class=\"col calendar_date\">"+
    					"<span class=\"date_today text-secondary text-decoration-none\"> </span></div>"
    			);
    		d.append(date);
    	}

		// days after the month starts within the first week
    	for (var j = startDay; j < 6; j++) {
    			var date = $("<div class=\"col calendar_date\"  data-bs-toggle=\"modal\" data-bs-target=\"#eventsModal\">"+
        					"<a class=\"date_today text-secondary text-decoration-none\">"+(currDate+1)+"</a></div>"
        			);
    			currDate = currDate + 1;
    			d.append(date);
    		}

    	calendar_body.append(d);

    	//Remaining Rows
    	for (var k = 0; k < 5; k++) {
    		var d = $("<div class=\"row align-items-stretch flex-grow-1\"></div>");
    		for (var m = 0; m < 7; m++) {
    			if (currDate < daysOfMonth(month, year)) {
    				var date = $("<div class=\"col calendar_date\"  data-bs-toggle=\"modal\" data-bs-target=\"#eventsModal\">"+
        					"<a class=\"date_today text-secondary text-decoration-none\">"+(currDate+1)+"</a></div>"
        			);
    				currDate = currDate + 1;
    			} else {
    				var date = $("<div class=\"col calendar_date\">"+
        					"<span class=\"date_today text-secondary text-decoration-none\"> </span></div>"
        			);
    			}
    			d.append(date);
    		}
    		calendar_body.append(d);
    	}
    }

	// 
    function activeThis(x) {
        var buttons = x.parentElement.getElementsByTagName("button");
        if (x.classList.contains("active")) {
            x.classList.remove("active");
            document.getElementById("editEventButton").classList.add("visually-hidden");
        }
        else {
            for (i = 0; i < buttons.length; i++) {
                if (buttons.item(i).classList.contains("active")) {
                    buttons.item(i).classList.remove("active");
                }
            }
            x.classList.add("active");
            if (document.getElementById("editEventButton").classList.contains("visually-hidden"))
                document.getElementById("editEventButton").classList.remove("visually-hidden");
        }
    }

    // <!-- fill up the modals of each date in the present month with the events -->
    var eventsModal = document.getElementById('eventsModal')
    eventsModal.addEventListener('show.bs.modal', function (event) {
      var date = event.relatedTarget.getElementsByClassName("date_today").item(0).textContent;
      var month = document.getElementById("month").textContent;
      var year = document.getElementById("year").textContent;
      var modalTitle = eventsModal.querySelector('.modal-title');
      var modalBody = eventsModal.querySelector('.modal-body');
      modalTitle.textContent = 'Events on '+month.trim()+' '+date.trim()+', '+year.trim();
      if(event.relatedTarget.getElementsByClassName("events").length > 0)
      	modalBody.innerHTML = event.relatedTarget.getElementsByClassName("events").item(0).innerHTML;
    })
    eventsModal.addEventListener('hidden.bs.modal', function(event) {
        if (!(document.getElementById("editEventButton").classList.contains("visually-hidden"))) {
            document.getElementById("editEventButton").classList.add("visually-hidden")
        }
    })

	// load user and all events from the db
	$.get('/getEvents', {username: username, month: month, year: year}, function(res) {
		console.log(res);

		loadCalendar(year, month);
	})
});
