$(document).ready(function() {

  function drawCalendar(dates, startDate){
    $('#calendar').DatePicker({
      flat: true,
      date: [],
      current: startDate,
      format: 'd-m-Y',
      calendars: 2,
      mode: 'multiple',
      onRender: function(date) {
    		return {
    			disabled: true,
    			className: $.inArray(date.valueOf(), dates) != -1 ? 'datepickerBooked' : false
    		}
    	}
    });
  }
  
  
  $.ajax({
    url: "/bookings",
    dataType: 'json',
    type: "GET",
    success: function(data, status, xhr) { 
      dateArray = []
      for (i = 0; i < data.dates.length; i++){
        dateArray.push(new Date(data.dates[i]).valueOf());
      }
      drawCalendar(dateArray, data.start_date.toString());
    }
  });

  
});