$(document).ready(function() {
	// Gets the relevant description of the listing from server or toggles slide
  $('.show-description').on("click", function(evt) {
  	evt.stopImmediatePropagation();
  	if ($(this).hasClass('toggle-description'))	 {
  		$(this).closest('.listing-row').find(".description").slideToggle();
  	} else {
	  	var button = $(this);
	  	var id = $(this).closest('div').attr("data-id");
	  	var listing = $(this).closest('.listing-row');
      $(button).addClass('toggle-description');
	  	  
	  	$.get('listings/' + id + '/description', function(data) {
	      $(listing).append("<div class='description'>"+ data + "</div>");  
	  	});
    }
  });
});