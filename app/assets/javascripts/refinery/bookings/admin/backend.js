$(document).ready(function() {
  
  function drawCalendar(dates, startDate){
	  $('#calendar').html("").DatePicker({
      flat: true,
      date: [],
      current: startDate,
      format: 'd-m-Y',
      calendars: 2,
      mode: 'range',
  		onRender: function(date) {
    		return {
  				className: $.inArray(date.valueOf(), dates) != -1 ? 'datepickerBooked' : false
    		}
    	},
    	locale: {
				days: ["Søndag", "Mandag", "Tirsdag", "Onsdag", "Torsdag", "Fredag", "Lørdag", "Søndag"],
				daysShort: ["Søn", "Man", "Tir", "Ons", "Tor", "Fre", "Lør", "Søn"],
				daysMin: ["Sø", "Ma", "Ti", "On", "To", "Fr", "Lø", "Sø"],
				months: ["Januar", "Februar", "Marts", "April", "Maj", "Juni", "Juli", "August", "September", "Oktober", "November", "December"],
				monthsShort: ["Jan", "Feb", "Mar", "Apr", "Maj", "Jun", "Jul", "Aug", "Sep", "Okt", "Nov", "Dec"],
				weekMin: 'u.'
			}
    });

	}
	
  $.ajax({
    url: "/refinery/bookings",
    dataType: 'json',
    type: "GET",
    success: function(data, status, xhr) { 
      dateArray = []
      for (i = 0; i < data.dates.length; i++){
        date = data.dates[i].split(",");
        dateArray.push(new Date(date[0], date[1]-1, date[2]).valueOf());
      }
      drawCalendar(dateArray, data.start_date.toString());
    }
  });
  
  $('#book_action').click(function(event){
    event.preventDefault();
    date = $('#calendar').DatePickerGetDate('d-m-Y')
    $.ajax({
      url: "/refinery/bookings/book",
      dataType: 'json',
      data: {from: date[0], to: date[1]},
      type: "POST",
      beforeSend: function(){
        $('#book_action').addClass('loading');
      },
      complete: function(){
        $('#book_action').removeClass('loading');
      },
      success: function(data, status, xhr) { 
        dateArray = []
        for (i = 0; i < data.dates.length; i++){
          date = data.dates[i].split(",");
          dateArray.push(new Date(date[0], date[1]-1, date[2]).valueOf());
        }
        drawCalendar(dateArray, data.start_date.toString());
      }
    });
  });
  
  $('#release_action').click(function(event){
    event.preventDefault();
    date = $('#calendar').DatePickerGetDate('d-m-Y')
    $.ajax({
      url: "/refinery/bookings/release",
      dataType: 'json',
      data: {from: date[0], to: date[1]},
      type: "POST",
      beforeSend: function(){
        $('#release_action').addClass('loading');
      },
      complete: function(){
        $('#release_action').removeClass('loading');
      },
      success: function(data, status, xhr) { 
        dateArray = []
        for (i = 0; i < data.dates.length; i++){
          date = data.dates[i].split(",");
          dateArray.push(new Date(date[0], date[1]-1, date[2]).valueOf());
        }
        drawCalendar(dateArray, data.start_date.toString());
      }
    });
  });
  
});