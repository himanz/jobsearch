$(document).ready(function() {
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

  $('.toggle-description').on("click", function() {
  	$(this).next(".description").toggle();
  });
});