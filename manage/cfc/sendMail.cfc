<cfcomponent>
	<cfscript>
		public function sendNotice(
			subject,
			content = "",
			to = "medicareData@the-local-network.com",
			from = "notifications@the-ln.com"
		){
			new mail().send(
				type = "html",
				from = arguments.from,
				to = arguments.to,
				subject = arguments.subject,
				body = arguments.content
			);
		}
	</cfscript>

</cfcomponent>
