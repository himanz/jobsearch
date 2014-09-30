$(document).ready(function() {
  $('.description').on("click", function() {
  	var id = $(this).closest('div').attr("data-id");
  	var hold = $(this)
  	$.get('listings/' + id, function(data) {
      hold.append(data);
      console.log(data);
  	});
  });
});