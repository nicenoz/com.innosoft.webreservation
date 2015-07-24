// Scrollspy Animation
$(document).ready(function() {
	  // Add slide down animation to dropdown //	
	  $('.dropdown').on('show.bs.dropdown', function(e) {
		  $(this).find('.dropdown-menu').first().stop(true, true).slideDown("slow");
		  $('span', this).toggleClass("caret caret-up");
	  });
	
	  // Add slide up animation to dropdown //
	  $('.dropdown').on('hide.bs.dropdown', function(e) {
		  $(this).find('.dropdown-menu').first().stop(true, true).slideUp("fast");   
		  $('span', this).toggleClass("caret caret-up");
	  });	  
});

// jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
	$('a.page-scroll').bind('click', function(event) {
		var $anchor = $(this);
		
		$('html, body').stop().animate({	
		scrollTop: $($anchor.attr('href')).offset().top	
	}, 1500, 'easeInOutExpo');
		
		event.preventDefault();
	});
});
