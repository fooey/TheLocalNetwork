<cfscript>
	head.title = 'Defamation Response';
	head.description = 'Defamation Response';
	include '/layout/template-open.cfm';
</cfscript>
<cfhtmlhead text='<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW">' />


<div class="row">
	<div class="span10 offset1">
		<div class="legal">
			

			<address style="text-align:center">
				The Local Network LLC
				2847 E. 1290 S.
				St. George, UT 84790
				the-local-network.com
			</address>
			
			
			<p><cfoutput>#dateFormat(now(), 'long')#</cfoutput></p>
			
			
			<address contenteditable=true>
				[NAME]
				[ADDRESS 1]
				[ADDRESS 2]
				[CITY, STATE] [ZIP]
			</address>
			
			<p>Re:	<span contenteditable=true>[NAME OF NURSING HOME]</span></p>
			
			<p>Dear <span contenteditable=true>[Mr., Ms.] [NAME]</span>:</p>
			
			<p>
				I am writing to you on behalf of The Local Network LLC (&#8220;The Local Network&#8221;) in response to your
				<span contenteditable=true>[letter, e mail, voice-mail, message]</span>
				<span contenteditable=true>[dated, on, of]</span>
				<span contenteditable=true>[DATE]</span>,
				in which you complain of alleged information or content posted by a third-party upon a website which The Local Network makes available to users
				of the internet subject to the Terms and Conditions of Use stated thereon at <nobr><a href="http://the-local-network.com/legal/TermsAndConditions.cfm">http://the-local-network.com/legal/TermsAndConditions.cfm</a></nobr>.
			</p>
			
			<p>
				As a provider or user of an interactive computer service, 
				The Local Network is not considered the publisher or speaker of any information or content posted 
				or otherwise provided by another person upon a website which The Local Network hosts. See 47 U.S.C. &sect; 230(c)(1). 
				The Local Network does not regularly review any such information or content, 
				and The Local Network takes no responsibility and assumes no liability for any such information or content. 
				As a result, The Local Network neither has nor assumes any obligation to remove any such information or content.
			</p>
			
			<p>
				While The Local Network takes your concerns seriously and appreciates your recent 
				<span contenteditable=true>[letter, email, voice-mail, message]</span>, 
				The Local Network is in no way responsible or liable for the information or content posted by others upon the internet or elsewhere.
			</p>
			
			<p>Sincerely,</p>
			
			<p>THE LOCAL NETWORK LLC</p>
	
	
	
			<p style="margin-top: 4em;">Jason W. Rushton</p>
		
	</div>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script>
	$(function(){
		$('[contenteditable=true]')
			.css({'background-color': '#ffc', 'font-weight': 'bold'})
			.on('focus', function(){
				$(this).css({'background-color': 'inherit', 'font-weight': 'inherit'})
			});
	});
</script>
