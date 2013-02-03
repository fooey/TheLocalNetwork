<cfoutput>
<h3 class="page-header">Sections</h3>

<div class="row">
	<div class="span3">
		<cfset qryUnapprovedReviewsSummary = application.cfc.userContent.getUnapprovedReviewsSummary() />
		<cfset qryUnapprovedRepliesSummary = application.cfc.userContent.getUnapprovedRepliesSummary() />
		
		<ul class="nav nav-list">
			<!---<li><a href="./users.cfm">Users</a></li>--->
			
			<li class="nav-header"><h4>Menu</h4></li>
			<li><a href="./">Dashboard</a></li>

			<li class="nav-header"><h4>Reviews Moderation</h4></li>
			<cfloop query="qryUnapprovedReviewsSummary">
				<li><a href="./reviews.cfm?siteId=#siteId#">#siteName# - <span>#num#</span></a></li>
			</cfloop>
			
			<li class="divider"><hr></li>
		
			<li class="nav-header"><h4>Replies Moderation</h4></li>
			<cfloop query="qryUnapprovedRepliesSummary">
				<li><a href="./replies.cfm?siteId=#siteId#">#siteName# - <span>#num#</span></a></li>
			</cfloop>
			
			<li class="divider"><hr></li>
			
			<li class="nav-header"><h4>Documents</h4></li>
			<li><a href="/manage/docs/ComplaintResponse.cfm">Defamation Complaint Response</a></li>
			<li><a href="/manage/docs/ComplaintResponse.phone.cfm">Defamation Phone Response</a></li>
			
			<li class="divider"><hr></li>
			
			<li class="nav-header"><h4>Legal</h4></li>
			<li><a href="/legal/TermsAndConditions.cfm">Terms and Conditions of Use</a></li>
			<li><a href="/legal/PrivacyPolicy.cfm">Privacy Policy</a></li>
			<li><a href="/legal/ContentGuidelines.cfm">Content Policies and Guidelines</a></li>
			
			<li class="divider"><hr></li>
			
			<li class="nav-header"><h4>CF Administrator</h4></li>
			<li><a href="cacheClearer.cfm">Cache Clearer</a></li>
		</ul>
	</div>
</div>
</cfoutput>