$(document).ready(function() {
	// Gets the relevant description of the listing from server or toggles slide
  $('.show-description').on("click", function(evt) {
  	evt.stopImmediatePropagation();
  	if ($(this).hasClass('toggle-description'))	 {
  		$(this).closest('.listing-row').find(".description").slideToggle();
  	} else {
	  	var btn = $(this);
	  	var id = $(this).closest('div').attr("data-id");
	  	var listing = $(this).closest('.listing-row');
      $(btn).addClass('toggle-description');
	  	btn.button('loading');
	  	$.get('listings/' + id + '/description', function(data) {
	      $(listing).append("<div class='description'>"+ data + "</div>");
	      btn.button('reset');  
	  	});
    }
  });
});