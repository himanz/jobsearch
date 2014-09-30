$(document).ready(function() {
  $('.description').on("click", function() {
  	var id = $(this).closest('div').attr("data-id");
  	var hold = $(this)
  	$.get('listings/' + id + '/description', function(data) {
      hold.append(data);
      console.log(data);
  	});
  
		// var model = "listing";
		// var attribute = "description";
		// var param = model + "[" + attribute + "]";
		// var value = "test";

		// $.ajax({
		//   url: "listings/" + id + "/description",
		//   type: "GET",
		//   data: 'json'
		// }).done(function(data) {
		//    alert("Works!");
		//    hold.append(data);
  //      console.log(data);
		// });
  });
});