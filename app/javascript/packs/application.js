// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.jQuery = $;
window.$ = $;

document.addEventListener('DOMContentLoaded', function() {
  var eventCalendarEl = document.getElementById('calendar');
  var userCalendarEl = document.getElementById('user_calendar');
  

  if(eventCalendarEl) {
  	var eventCalendar = new FullCalendar.Calendar(eventCalendarEl, {
	    initialView: 'dayGridMonth',
	    initialDate: '2019-01-01',
	    headerToolbar: {
	      left: 'prev,next today',
	      center: 'title',
	      right: 'dayGridMonth,timeGridWeek,timeGridDay'
	    },
	    events: '/events.json'
    });

    eventCalendar.render();	
  }
  
  if(userCalendarEl) {
    var selectedUsername = document.getElementById('username').value;
    var userCalendar = new FullCalendar.Calendar(userCalendarEl, {
      initialView: 'dayGridMonth',
      initialDate: '2019-01-01',
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      events: '/user_invites.json?username=' + selectedUsername
    });

    userCalendar.render();
  }

});

