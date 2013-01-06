﻿<cfcomponent>
	<cfscript>
		variables.mailAuth = {
			server = "smtp.gmail.com",
			username = "sysadmin@schtuph.com",
			password = "fredsx",
			port = "465",
			usessl = "true",
			usetls = "false"
		};
		
		
		
		public function sendNotice(
			subject,
			content = "",
			to = "medicareData@the-local-network.com",
			from = "sysadmin@schtuph.com"
		){ 
			new mail().send(
				type = "html",
				from = arguments.from,
				to = arguments.to,
				subject = arguments.subject,
				body = arguments.content,
					
				server = variables.mailAuth.server,
				username = variables.mailAuth.username,
				password = variables.mailAuth.password,
				port = variables.mailAuth.port,
				usessl = variables.mailAuth.usessl,
				usetls = variables.mailAuth.usetls
			);
		}
	</cfscript>
		
</cfcomponent>