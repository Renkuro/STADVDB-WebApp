$(document).ready(function() {
	var currDate = new Date();
	var currMonth = currDate.getMonth();
	var currYear = currDate.getFullYear();
	var eventList = new Object();
	var buttonsHandler = new Object();

	// set initial monthYear input values
	monthDropdown = $("#monthSelect");
	yearInput = $("#yearSelect");
	monthDropdown.val(currMonth + 1);
	yearInput.val(currYear);

	//Scripts responsible for calendar management
	function daysOfMonth(month, year) {
	 	//this function acts as an exclusive upper bound of the current month, used for calculations regarding the last day of the month
	 	var d = new Date(year, month+1, 0);
	 	return d.getDate();
	 }

	 // return name of month given index
	 function returnMonthString(month) {
	 	months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	 	return months[month];
	 }

	 // get values from monthyear selector
	 function loadMonthYearSelector () {
	 	months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	 	monthDropdown = $("#monthSelect");
	 	yearInput = $("#yearSelect");
	 }

	 // put the date in a db compatible format
	 function formatDate(date) {
	     return date.getFullYear().toString() + '-' + (date.getMonth() + 1).toString().padStart(2, 0) + '-' + date.getDate().toString().padStart(2, 0);
	 }

	 // render events on the events div of each day
	 function eventRender (eArray) {
	 	//remove all buttons in events div
		for (i = 0; i < daysOfMonth(currMonth, currYear); i++) {
			$("#" + i + ' .events').children().remove()
		}

		daysWithEvents = [];
		// render events
 		for (e of eArray) {
			// get the date of the events
			day = new Date(Date.parse(e.date)).getDate();
			daysWithEvents.push(day);
			var buttondiv = document.createElement('div');
			$(buttondiv).addClass('buttonContainer');
			var button = document.createElement('button');
			$(button).prop('type', 'button');
			$(button).prop('class', "list-group-item list-group-item-action");
			var numEvents = $("#" + day + ' .events').children().length;
			$(button).prop('id', "event" + e.id);
			$(button).text(e.title);
			$(button).click(function() {activeThis(this)});
			// store event details in hidden elements within the button
			var creator = document.createElement('p');
			$(creator).prop('hidden', true);
			$(creator).addClass('eventcreator');
			$(creator).text(e.creator);
			var description = document.createElement('p');
			$(description).prop('hidden', true);
			$(description).addClass('eventdesc');
			$(description).text(e.description);
			var invited = document.createElement('p');
			$(invited).prop('hidden', true);
			$(invited).addClass('eventinvited');
			$(invited).text(JSON.stringify(e.invited));
			// if the logged in user is not the creator, get their response to the invite.
			var response = document.createElement('p');
			$(response).prop('hidden', true);
			$(response).addClass('eventresponse');
			// if the user did not create this event, get their response to this event invitation
			if (username != e.creator) {
				var responsetext = e.invited.find((o) => {return o["username"] === username}).response;
				$(response).text(responsetext);
			}
			$(buttondiv).append(creator);
			$(buttondiv).append(description);
			$(buttondiv).append(invited);
			$(buttondiv).append(response);
			// append button to DOM (inside .events div of their respective dates)
			$(buttondiv).append(button);
			$("#" + day + ' .events').append(buttondiv);
		}

		//
		for (i = 0; i <= daysOfMonth(currMonth, currYear); i++) {
			var button = document.createElement('button');
			$(button).prop('disabled', true);
			$(button).prop('class', "list-group-item list-group-item-action");
			$(button).text("No events today.");
			if (!daysWithEvents.includes(i)) {
				$("#" + i + ' .events').append(button);
			}
		}
	 }

	 // render the event indicators on the calendar date
	 // blue for user created, red for invited and declined, green for invited and accepted
	 function eventIndicatorRender (eArray) {
	 	for (e of eArray) {
	 		day = new Date(Date.parse(e.date)).getDate();
	 		// set the event indicators
			if (e.creator != username) {
				for (i of e.invited) {
					if (i.username == username) {
						if (i.response == false) {
							$("#" + day).addClass('inviteDeclinedEvent');
						}
						else {
							$("#" + day).addClass('inviteAcceptedEvent');
						}
					}
				}
			}
			else {
				$("#" + day).addClass('createdEvent');
			}
	 	}
	 }

	 // display calendar with all events for that month and year
	 function loadCalendar(year, month, events, callback) {
	 	var calendar_body = $("#calendar_body");
	 	$(".calendar_row").remove();

	 	var calendar_body = $("#calendar_body");
	 	var monthDropdown = $("#monthSelect");
	 	var yearInput = $("#yearSelect");

	 	var tempDate = new Date(year, month, 0);
	 	var days = daysOfMonth(month, year);
    	var startDay = tempDate.getDay(); //returns which day of the week the start date is as a number
    	var currDate = 0;
    	var dateCounter = daysOfMonth(year, month);

    	//First Row
		//condition checks if the start day is sunday, if it is, omit the first row
		if (startDay != 6) {
			var d = $("<div class=\"row align-items-stretch flex-grow-1 calendar_row\"></div>");
		// append empty dates for days before the month starts
			for (var i = 0; i <= startDay; i++) {
				var date = $("<div class=\"col calendar_date\">"+
				"<span class=\"date_today text-secondary text-decoration-none\"> </span></div>"
				);
				d.append(date);
			}
		}

		// days after the month starts within the first week
    	for (var j = startDay; j < 6; j++) {
			var date = $("<div class=\"col calendar_date\" data-bs-toggle=\"modal\" data-bs-target=\"#eventsModal\" >"+
    			"<a class=\"date_today text-secondary text-decoration-none\">"+(currDate+1)+"</a></div>"
    		);
			// event div for events
			$(date).addClass('calendar_date');
			var eventdiv = document.createElement('div');
			$(eventdiv).prop('class', 'events visually-hidden list-group');
			date.append(eventdiv);
			$(date).prop('id', (currDate+1));
			currDate = currDate + 1;
			d.append(date);
		}

		calendar_body.append(d);

    	//Remaining weeks
    	for (var k = 0; k < 5; k++) {
    		var d = $("<div class=\"row align-items-stretch flex-grow-1 calendar_row\"></div>");
    		for (var m = 0; m < 7; m++) {
    			if (currDate < daysOfMonth(month, year)) {
    				var date = $("<div class=\"col calendar_date\"  data-bs-toggle=\"modal\" data-bs-target=\"#eventsModal\">"+
        					"<a class=\"date_today text-secondary text-decoration-none\">"+(currDate+1)+"</a></div>"
        			);
					// event div for events
					var eventdiv = document.createElement('div');
					$(eventdiv).prop('class', 'events visually-hidden list-group');
					date.append(eventdiv);
					$(date).prop('id', (currDate+1));
    				currDate = currDate + 1;
    			} else {
    				var date = $("<div class=\"col calendar_date\">"+
    					"<span class=\"date_today text-secondary text-decoration-none\">&nbsp;</span></div>"
    					);
    			}
    			d.append(date);
    		}
    		calendar_body.append(d);
    	}

	    	//Special case, month starts on sunday so an empty row should be generated at the end to maintain layout consistency
	    	if (startDay == 6) {
	    		var d = $("<div class=\"row align-items-stretch flex-grow-1 calendar_row\"></div>");
			// days before the month starts
			for (var i = 0; i <= 6; i++) {
				var date = $("<div class=\"col calendar_date\">"+
					"<span class=\"date_today text-secondary text-decoration-none\"> </span></div>"
					);
				d.append(date);
			}
		}
	calendar_body.append(d);
	// append any events to the day they belong in
	eventRender(events);
	eventIndicatorRender(events);
	if (callback != undefined) {
			callback();
		}
	}

    //Change calendar when a year change is performed
    $("#yearSelect").change(function() {
    	currYear = $("#yearSelect").val();
		getEvents();
    });

    //Change calendar when a month change is performed
    $("#monthSelect").change(function() {
		currMonth = parseInt($("#monthSelect").val(), 10) - 1;
		getEvents(function() {});
    });

	// this function toggles the edit/delete event button when an event is clicked
	function activeThis(x) {
		// get all event buttons in a date modal
		var btnid = x.id;
		var creator = $(x).parent().find(".eventcreator").text();
		var buttons = $(x).parent().parent().children();

		// if the event is already active, deactivate all active buttons and hide view/edit event button
		if ($('#'+btnid).hasClass("active")) {
			$('#'+btnid).removeClass("active");
			$("#editEventButton").addClass("visually-hidden");
			$("#deleteEventButton").addClass("visually-hidden");
		}
		// else if the event is inactive, display edit/view event button
		else {
			// deactivate all buttons
			for (i = 0; i < buttons.length; i++) {
				if ($(buttons.get(i)).children("button").hasClass("active")) {
					$(buttons.get(i)).children("button").removeClass("active");
				}
			}
			// make current button active
			$('#'+btnid).addClass("active");
			// save info to hidden element
			$("#eventid").text(x.id);
			// display the view/edit event button
			if ($("#editEventButton").hasClass("visually-hidden"))
			{
				$("#editEventButton").removeClass("visually-hidden");
			}

			if ($("#deleteEventButton").hasClass("visually-hidden") && creator == username) {
				$("#deleteEventButton").removeClass("visually-hidden");
			}
		}
	}

    // fill up the event modal with the events of a date when a date is selected from the calendar
	// it contains the list of all events on a certain date
    var eventsModal = $('#eventsModal')
    eventsModal.on('show.bs.modal', function (event) {
		// get the date of the selected date
    	var date = $("#"+event.relatedTarget.id + ' a').text();
		// hidden element
		$("#eventsmodaldate").text(date);
    	var modalTitle = eventsModal.find('.modal-title');
    	var modalBody = eventsModal.find('.modal-body');
    	$("#"+event.relatedTarget.id+' .events').children().remove(); //purge list for a clean slate
    	eventRender(eventList);
    	modalTitle.text('Events on '+returnMonthString(currMonth)+' '+date+', '+currYear);
		// append events to the event div inside the modal
		var buttons = $("#"+event.relatedTarget.id + ' .events').children();
		modalBody.html(buttons);
    	}
	)

	// hide events modal
    eventsModal.on('hidden.bs.modal', function(event) {
    	if (!($("#editEventButton").hasClass("visually-hidden"))) {
    		$("#editEventButton").addClass("visually-hidden");
			$("#deleteEventButton").addClass("visually-hidden");
    	}
    })

	// load user and all events from the db
$("#invitedList").empty();	function getEvents(callback) {

			$.get('/getEvents', {username: username, month: currMonth, year: currYear}, function(res) {
				eventList = res.events;
				loadMonthYearSelector();
				loadCalendar(currYear, currMonth, eventList);
				if (callback != undefined){
					callback();
				}
			});

	}

	// when the add event modal is opened, get the data that can be loaded into the hidden inputs
	var addEventModal = $("#addNewEventModal");
	addEventModal.on('show.bs.modal', function(event) {
		$("#addEventSubmitBtn").prop('disabled', true);
		$("#editorInviteAnother").prop('hidden', false);
		$("#newEventTitle").val("");
		$("#newEventDescription").val("");
		var datenum = $("#eventsmodaldate").text();
		date = new Date(currYear, currMonth, datenum);
		$("#addeventsmodaldate").text(formatDate(date));
		// empty invited buttons list and add an empty one
		$("#invitedList").empty();
		$("#inviteErrorAdd").text("");
		$("#inviteAnother").click();
		
	});

	// initial loading and rendering of events on load
	getEvents();

	// finally adding a new event to the db
	$('#addEventSubmitBtn').click(function () {
		date = $('#addeventsmodaldate').text();
		title = $("#newEventTitle").val();
		description = $("#newEventDescription").val();
		invited = [];
		for (invitetext of $("#invitedList .input-group")) {
			var inviteName = $(invitetext).children(".invited");
			invitedUsername = inviteName.val();
			if (invitedUsername != "" && !invited.includes(invitedUsername)) {
				invited.push({username: invitedUsername, response: false});
			}
		}
		$.get('/addEvent', {date: date, title: title, creator: username, description: description, invited: invited}, function(res) {
			getEvents(function() {});
		});
	});

	// disallow submission when title is empty
	$("#newEventTitle").keyup(function () {
		if ($(this).val() == "" || $("#inviteErrorAdd").text() != "") {
			$("#addEventSubmitBtn").prop('disabled', true);
		}
		else
			$("#addEventSubmitBtn").prop('disabled', false);
	});
	$("#editEventTitle").keyup(function () {
		if ($(this).val() == "" || $("#inviteErrorEdit").text() != "")
			$("#editEventSubmitBtn").prop('disabled', true);
		else
			$("#editEventSubmitBtn").prop('disabled', false);
	});

	// when the edit event modal is opened, get the data that can be loaded into the hidden inputs
	var editEventModal = $("#viewEditModal");
	editEventModal.on('show.bs.modal', function(event) {
		clearInvite();
		$("#editEventSubmitBtn").prop('disabled', false);
		$("#inviteErrorEdit").text("");
		$("#editorInviteAnother").prop('hidden', false);
		$("#editorInviteAnother").prop('disabled', false);
		var datenum = $("#eventsmodaldate").text();
		var eventid = $("#eventid").text();
		date = new Date(currYear, currMonth, datenum);
		// hidden elements
		$("#editeventsmodaldate").text(formatDate(date));
		$("#editeventseventid").text(eventid);
		// load event details from button
		var title = $("#" + eventid).text();
		var creator = $("#" + eventid).parent().find(".eventcreator").text();
		var description = $("#" + eventid).parent().find(".eventdesc").text();
		var invited = JSON.parse($("#" + eventid).parent().find(".eventinvited").text());
		// load event details into edit event modal inputs
		$("#editEventTitle").val(title);
		$("#editEventCreator").val(creator);
		$("#editEventDescription").val(description);

		if (creator != username) {
			// get user response
			var response = $("#" + eventid).parent().find(".eventresponse").text();
			$("#editEventTitle").attr('readonly', true);
			$("#editEventDescription").attr('readonly', true);
			$("#editEventTitle").attr('readonly', true);
			// accept/decline invitation
			addInviteConfirmation(creator);
			$("input:radio[name=response][value=" + response + "]").prop('checked',true);
		}

		else {
			$("#invitedList").empty();
			$("#editEventTitle").attr('readonly', false);
			$("#editEventDescription").attr('readonly', false);
			$("#editEventTitle").attr('readonly', false);
			if (invited.length == 0) {
				addInviteEdit("", false);
			}
			for (i in invited) {
				addInviteEdit(invited[i].username, invited[i].response);
			};
		}
	});

	// finally confirming the edits made do an event
	$("#editEventSubmitBtn").click(function () {
		// get the details and add it
		var id = $("#editeventseventid").text().substring(5);
		var title = $("#editEventTitle").val();
		var desc = $("#editEventDescription").val();
		invited = [];
		for (i of $(".invited")) {
			if ($(i).val() != "" && !invited.includes($(i).val())) {
				invited.push($(i).val());
			}

		}
		// condition for self created event
		if ($("#editEventCreator").val() == username) {
			$.get('/editSelfEvent', {id: id, title: title, desc: desc, invited: invited}, function(res) {
				getEvents();
			});
		}
		// condition for editing response to event invite
		else {
			var response = $('input[name="response"]:checked').val();
			$.get('/editInviteResponse', {id: id, username: username ,response: response}, function(res) {
				getEvents();
			});
		}
	});

	// add another textbox to invite another username when creating another event
	$("#inviteAnother").click(function () {
		addInviteNew();
	});

	// add another textbox to invite another username when editing an event
	$("#editorInviteAnother").click(function () {
		addInviteEdit("", false);
	});

	// add invite text field to edit event modal
	function addInviteEdit(val, response) {
		var divContainer = $("<div class=\"input-group mb-3\"></div>");
		var errored = $("<p class=\"error\" hidden>false</p>");
		var spanForLayout = $("<span class=\"input-group-text\" id=\"basic-addon1\">@</span>");
		var addInvited = $("<input type=\"text\" class=\"form-control invited\" placeholder=\"Username\" aria-label=\"Username\" aria-describedby=\"basic-addon1\">");
		var responseIndicator = $("<span class=\"dot\"></span>");
		if (response == true) {
			$(responseIndicator).addClass('inviteAcceptedEvent');
			$(responseIndicator).removeClass('inviteDeclinedEvent');
		}
		else {
			$(responseIndicator).removeClass('inviteAcceptedEvent');
			$(responseIndicator).addClass('inviteDeclinedEvent');
		}
		// check if the invited username exists
		$(addInvited).keyup(checkValidation);
		divContainer.append(spanForLayout);
		divContainer.append(addInvited);
		divContainer.append(responseIndicator);
		divContainer.append(errored);
		$(addInvited).val(val);
		$("#editorInvitedList").append(divContainer);
	}

	// add invite text field to add event modal
	function addInviteNew () {
		var divContainer = $("<div class=\"input-group mb-3\"></div>");
		var errored = $("<p class=\"error\" hidden>false</p>");
		var spanForLayout = $("<span class=\"input-group-text\" id=\"basic-addon1\">@</span>");
		var addInvited = $("<input type=\"text\" class=\"form-control invited\" placeholder=\"Username\" aria-label=\"Username\" aria-describedby=\"basic-addon1\">");
		// check if the invited username exists
		$(addInvited).keyup(checkValidation);
		divContainer.append(spanForLayout);
		divContainer.append(addInvited);
		divContainer.append(errored);
		$("#invitedList").append(divContainer);
	}

	function checkValidation() {
		var input = $(this);
		//store list of all input elements
		var inviteeList = $(this).parent().parent().children(".input-group").children(".invited");
		$.get('/exists', {username: $(this).val()}, function(result) {
			// if the username doesn't exist
			if ((result == "" || result.username == username) && (input.val() != "")) {
				$(input).css('border', '2px solid red');
				$(input).parent().children(".error").text("nonexistent");
				$("#inviteErrorAdd").text("A username does not exist, or is your own username.");
				$("#inviteErrorEdit").text("A username does not exist, or is your own username.");
				$("#editorInviteAnother").prop('disabled', true);
				$("#inviteAnother").prop('disabled', true);
				$("#addEventSubmitBtn").prop('disabled', true);
				$("#editEventSubmitBtn").prop('disabled', true);
			}
			// if it does
			else {
				$(input).css('border', '1px solid #CCCCCC');
				$(input).parent().children(".error").text("false");
			}
			// other testing parameters
				var errorTest = false;
				var errorTestTitleEdit = false;
				var errorTestTitleNew = false;

			//duplicate entry test
				inviteeList.each(function(index, element) {
					var thisFailed = false;
					//loop through each element in the list of inputs
					for (invitee of inviteeList) {
						thisErrorField = $(this).parent().children(".error");
						inviteeErrorField = $(invitee).parent().children(".error");
						//exclude self from test
						if (!$(this).is($(invitee))) {
							//if the element has a duplicate value
							//conditions are: same value, the value is not a nonexistent username
							if ($(this).val() == $(invitee).val() && $(this).val() != "" && thisErrorField.text() != "nonexistent" && inviteeErrorField.text() != "nonexistent") {
								thisErrorField.text("duplicate");
								$(this).css('border', '2px solid blue');
								inviteeErrorField.text("duplicate");
								$(invitee).css('border', '2px solid blue');
								$("#inviteErrorAdd").text("A duplicate username was found in the invitee list.");
								$("#inviteErrorEdit").text("A duplicate username was found in the invitee list.");
								thisFailed = true;
							}
						}
						// used for when an element's duplicate has disappeared, will modify both the offending and the affected elements (if possible)
						// test for "nonexistent" is present to avoid removing the error for a nonexistent value
						if (!thisFailed && thisErrorField.text() != "nonexistent") {
							$(this).css('border', '1px solid #CCCCCC');
							$(this).parent().children(".error").text("false");
						}
					}
					
				});

				//test for when the buttons should be reenabled again
				for (invitee of inviteeList) {	
					if ($(invitee).parent().children(".error").text() != "false") {
						errorTest = true;
					}
				}

				//empty title test for edit event
				if ($("#editEventTitle").val() == "") {
					errorTestTitleEdit = true;
				}

				//empty title test for add event
				if($("#newEventTitle").val() == "") {
					errorTestTitleNew = true;
				}

				//if no invite error is found, reenable invite addition and remove error messages
				if (!errorTest) {
					$("#inviteErrorAdd").text("");
					$("#inviteErrorEdit").text("");
					$("#editorInviteAnother").prop('disabled', false);
					$("#inviteAnother").prop('disabled', false);
				}

				//if no errors in both the title and invite fields, reenable submit button (editEvent)
				if (!errorTestTitleEdit && !errorTest) {
					$("#editEventSubmitBtn").prop('disabled', false);
				}

				//if no errors in both the title and invite fields, reenable submit button (addEvent)
				if (!errorTestTitleNew && !errorTest) {
					$("#addEventSubmitBtn").prop('disabled', false);
				}
		});
	}

	// add invite confirmation dialog
	function addInviteConfirmation(sender) {
		var prompt = document.createElement('h5');
		var divFormContainerYes = document.createElement('div');
		var divFormContainerNo = document.createElement('div');
		$(divFormContainerYes).prop('class', "form-check form-check-inline");
		$(divFormContainerNo).prop('class', "form-check form-check-inline");
		$(prompt).text(sender + " is inviting you to this event! ");
		$("#editorInvitedList").append(prompt);

		var responseYes = document.createElement('input');
		$(responseYes).prop('type', 'radio');
		$(responseYes).prop('id', 'responseYes');
		$(responseYes).prop('name', 'response');
		$(responseYes).prop('class', "form-check-input");
		$(responseYes).val(true);
		var labelYes = document.createElement('label');
		$(labelYes).prop('for', true);
		$(labelYes).prop('class', "form-check-label");
		$(labelYes).text('Accept');
		$(labelYes).css('font-size', '1rem');
		$(divFormContainerYes).append(responseYes);
		$(divFormContainerYes).append(labelYes);
		$("#editorInvitedList").append(divFormContainerYes);

		var responseNo = document.createElement('input');
		$(responseNo).prop('type', 'radio');
		$(responseNo).prop('id', 'responseNo');
		$(responseNo).prop('name', 'response');
		$(responseNo).prop('class', "form-check-input");
		$(responseNo).val(false);
		var labelNo = document.createElement('label');
		$(labelNo).prop('for', false);
		$(labelNo).prop('class', "form-check-label");
		$(labelNo).text('Decline');
		$(labelNo).css('font-size', '1rem');
		$(divFormContainerNo).append(responseNo);
		$(divFormContainerNo).append(labelNo);
		$("#editorInvitedList").append(divFormContainerNo);
		$("#editorInviteAnother").prop('hidden', true);
	}

	// empty invited usernames list
	function clearInvite() {
		$("#editorInvitedList").empty();
	}

	//helper function to allow search result buttons to change the calendar

	function jumpToDate(eventButton) {
		var eventButtonDate = new Date(($(eventButton).children(".eventButtonDateString").text()));
		var dateVal = eventButtonDate.getDate();
		var monthVal = eventButtonDate.getMonth()+1;
		var yearVal = eventButtonDate.getFullYear();

		var IDString = $(eventButton).children(".eventID").text();

		$("#monthSelect").val(monthVal);
		$("#yearSelect").val(yearVal);

		currYear = yearVal;
		currMonth = monthVal-1;

		getEvents(function() {
			$("#"+dateVal).click();
			$("#"+IDString).click();
		});
	}

	// event when the user searches for an event title
	$("#submitsearch").click(function () {
		var titleSearchQuery = $("#searchbar").val();
		if (titleSearchQuery != "") {
			$("#searchResultsTitle").text("Search results for: \""+titleSearchQuery+"\"");
			$.get('findEvents', {title: titleSearchQuery}, function (res) {
				var eventArray = res;

				eventArray = eventArray.filter(function(item) {
					return item.creator == username || item.invited.some(person => person.username == username);
				});
				eventArray = eventArray.sort((a, b) => new Date(a.date) - new Date(b.date));
				$("#searchResultsContent").text("");
				if (eventArray.length == 0) {
					// Create an empty button to show that no event exists
					var button = document.createElement('button');
					$(button).prop('disabled', true);
					$(button).prop('class', "list-group-item list-group-item-action");
					$(button).text("No events found.");
					$("#searchResultsContent").append(button);
				} else {
					for (e of eventArray) {
						// Date section of button
						var eventDate = new Date(e.date);
						var eventDateString = eventDate.toLocaleString('en-US', {
							day: 'numeric',
							year: 'numeric',
							month: 'long'
						});

						// Title section of button
						var eventName = e.title

						var eventID = "event"+e.id;

						//TODO: create a button with an attached function that changes the date to the given date, and set the event IMMEDIATELY as active
						var eventButton = document.createElement('button');

						//The following functions creates hidden elements on the button for date referencing and event referencing
						var pEventDateString = document.createElement('p');
						var pEventID = document.createElement('p');

						$(pEventDateString).prop('hidden', true);
						$(pEventDateString).prop('class', "eventButtonDateString");
						$(pEventDateString).text(eventDateString);

						$(pEventID).prop('hidden', true);
						$(pEventID).prop('class', "eventID");
						$(pEventID).text(eventID);

						$(eventButton).append(pEventDateString);
						$(eventButton).append(pEventID);

						//Attach an on-click event handler that is responsible for date jumping and event loading
						$(eventButton).click(function () {jumpToDate(this)});

						//
						$(eventButton).prop('type', "button");
						$(eventButton).prop('class', "list-group-item list-group-item-action");
						$(eventButton).attr('data-bs-dismiss', "modal");
						$(eventButton).attr('data-bs-target', "#searchResultModal");

						var spanContainer = document.createElement('span');
						$(spanContainer).prop('class', "d-flex flex-row");

						var dateSpan = document.createElement('span');
						var titleSpan = document.createElement('span');

						$(dateSpan).prop('class', "flex-grow-1");
						$(titleSpan).prop('class', "flex-grow-2");

						$(dateSpan).text(eventDateString);
						$(titleSpan).text(eventName);

						$(spanContainer).append(dateSpan);
						$(spanContainer).append(titleSpan);

						$(eventButton).append(spanContainer);

						$("#searchResultsContent").append(eventButton);
					}
				}
			})
		} else {
			$("#searchResultsTitle").text("No query entered for search");
			$("#searchResultsContent").text("");
			var button = document.createElement('button');
			$(button).prop('disabled', true);
			$(button).prop('class', "list-group-item list-group-item-action");
			$(button).text("No query was found, please check the search query.");
			$("#searchResultsContent").append(button);
		}
	});

	// clear the search bar and any search results
	$("#clearsearch").click(function() {
		$("#searchbar").val("");
		$(".searchResult").removeClass("searchResult");
	});

	// when the delete event modal shows up
	var deleteEventModal = $("#deleteEventModal");
	$(deleteEventModal).on("show.bs.modal", function () {
		$("#deleteeventid").text($("#eventid").text().substring(5));
	});

	// when the confirm delete button is clicked for an event
	$("#deleteYes").click(function() {
		$.get('/delEvent', {id: $("#deleteeventid").text()}, function(res) {
			getEvents();
		});
	});
});
