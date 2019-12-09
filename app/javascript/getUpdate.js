
$(document).ready(function(){

 	setInterval(function(){ 
 		$(".flash-red").toggleClass("text-danger");
 	}, 1000);

 	setInterval(function(){ 
 		//get_latest_update_nav();
 	}, 2000);

 	function get_latest_update_nav(){
	 	$.ajax({
	      url: '/messages/check',
	      async: true,
	      method: "POST",
	      //data: data,
	      success: function(results) {
	        var res = JSON.parse(results);
	        //console.log(results);

	        if(results==1){
	        	$("#user-dropdown-nav").addClass('flash-red');
	        	$(".messages-nav").addClass('flash-red');
	        } else {
	        	$("#user-dropdown-nav").removeClass('flash-red');
	        	$(".messages-nav").removeClass('flash-red');
	        }

	      }
	    });
 	}
 
});