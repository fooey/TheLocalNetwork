
head.ready(function(){
    "use strict";
	
	
	$('form.userContentSection').find('input').on('click', function(e){
		e.preventDefault();
		
		var $btn = $(this);
		var $form = $btn.closest('form');
		
		var action = $btn.val();
		
		$form
			.children(':first-child')
				.removeClass('alert alert-error')
				.find('.alert-heading')
					.remove();
		
		$btn.siblings().andSelf().hide()
			.parent()
				.append($('<button class="btn btn-disabled">Processing Request: ' + action + '</button>'))
			.button();
			
			
		var jqxhr = $.ajax({
				url: $form.attr('action'),
				type: 'POST',
				cache: false,
				context: $form,
				data:{
					action : action
				}
			})
		    .done(function() {
				$(this).slideUp().remove();
				var numRemaining = $('.userContentSection').length;
				$('.nav-tabs .active span').text(numRemaining);
			})
		    .fail(function(jqXHR, textStatus) {
				$form
					.children(':first-child')
						.addClass('alert alert-error')
						.find(':hidden')
							.show()
						.end()
						.prepend('<h1 class="alert-heading page-header">' + jqXHR.statusText + '</h1>');
			})
		    .always(function() {
				$form.find('.btn-disabled').remove();
			});
		
	});
	
});
