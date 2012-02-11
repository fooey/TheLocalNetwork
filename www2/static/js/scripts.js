!function( $ ){
    "use strict";
	
	var scriptName = document.location.pathname;
	if(scriptName.charAt(0) !== '/'){
		scriptName = '/' + scriptName;
	}
	
	var $navLinks = $('.nav').find('a');
	var $activeNavLinks = $navLinks.filter('[href$="' + scriptName + '"]');
	
	$activeNavLinks
		.closest('li')
		.addClass('active')
		.closest('li.dropdown')
		.addClass('active');
	
}( window.jQuery || window.ender );