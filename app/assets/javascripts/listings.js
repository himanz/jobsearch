$(document).ready(function() {
	// Gets the relevant description of the listing from server
  $('.show-description').on("click", function() {
  	var button = $(this);
  	var id = $(this).closest('div').attr("data-id");
  	var listing = $(this).closest('.listing-row');

  	$(button).remove();
  	$(listing).append("<button class='toggle-description'>Description</button>");
  	$.get('listings/' + id + '/description', function(data) {
      $(listing).append("<div class='description'>"+ data + "</div>");  
  	});
  });

  // Toggle show / hide of description
  $('.toggle-description').on("click", function() {
  	// $(this).closest('.listing-row').find(".description").toggle();
  	$(this).next(".description").slideToggle();
  });
});