$(document).ready(function() {
	// Gets the relevant description of the listing from server or toggles slide
  $('.show-description').on("click", function(evt) {
  	evt.stopImmediatePropagation();
  	var btn = $(this);
  	if (btn.hasClass('toggle-description'))	 {
  		btn.closest('.listing-row').find(".description").slideToggle();
  		if (btn.hasClass('show')) {
        btn.text("+ Description");
        btn.removeClass('show');
  		} else {
  			btn.text("- Description");
  			btn.addClass('show');
  		}
  	} else {
	  	
	  	var id = $(this).closest('div').attr("data-id");
	  	var listing = $(this).closest('.listing-row');
      $(btn).addClass('toggle-description');
	  	btn.button('loading');
	  	$.get('listings/' + id + '/description') 
	  		.done(function(data) {
	      $(listing).append("<div class='description' id='" + id + "-description'>" + data + "</div>");
	      btn.button('reset');
	      btn.text("- Description");
	      btn.addClass('show');  
	  	});
    }
  });

  $(".companyFill").on("click", function() {
    $("#listing_company").val($(this).data("name"));
    $("#listing_company_information").val($(this).data("information"));
    $("#listing_location").val($(this).data("location"));
  });
});