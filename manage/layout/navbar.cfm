<cfoutput>
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">
			<a href="#application.paths.rel.root#/" class="brand"><span>The Local Network</span></a>
			
			<div>
				<ul class="nav">
					<!---<li><a href="#application.paths.rel.root#/">Dashboard</a></li>--->
					<li><a href="#application.paths.rel.root#/reviews.cfm">Review Approval</a></li>
					<li><a href="#application.paths.rel.root#/replies.cfm">Reply  Approval</a></li>
					<!---<li><a href="#application.paths.rel.root#/users.cfm">Users</a></li>--->
					<li class="dropdown">
						<a href="##" class="dropdown-toggle" data-toggle="dropdown">Docs <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="/manage/docs/ComplaintResponse.cfm">Defamation Complaint Response</a></li>
							<li><a href="/manage/docs/ComplaintResponse.phone.cfm">Defamation Phone Response</a></li>
							<li class="divider"></li>
							<li><a href="/legal/TermsAndConditions.cfm">Terms and Conditions of Use</a></li>
							<li><a href="/legal/PrivacyPolicy.cfm">Privacy Policy</a></li>
							<li><a href="/legal/ContentGuidelines.cfm">Content Policies and Guidelines</a></li>
						</ul>
					</li>
					<li><a href="#application.paths.rel.root#/?reset=user">Logout</a></li>
					<li><a href="#application.paths.rel.root#/?reset=app">reset app</a></li>
				</ul>
			</div>
			
		</div>
	</div>
</div>
</cfoutput>