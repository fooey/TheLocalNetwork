
head.ready(function(){
    "use strict";
	
	
	$('form.userContentSection').find('.buttons input').on('click', function(e){
		e.preventDefault();
		
		var $btn = $(this);
		var $form = $btn.closest('form');
		var $pub = $form.find('.publicize');
		
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
					action: action,
					publicize: $pub.hasClass('active')
				}
			})
		    .done(function() {
				$(this).slideUp().remove();
				var numRemaining = $('.userContentSection').length;
				var $counter = $('.nav-tabs .active span');
				$counter.text($counter.text()-1);
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
