<cfscript>
	if(cgi.REQUEST_METHOD EQ "POST"){
		param name="url.rrId"; 
		param name="form.action"; 
		
		if (form.action EQ "Approve"){
			 application.cfc.userContent.approveReply(url.rrId);
		}
		else if(form.action EQ "Delete"){
			 application.cfc.userContent.deleteReply(url.rrId);
		}
		else if(form.action EQ "Filter"){
			 application.cfc.userContent.filterReply(url.rrId);
		}
		else{
			throw("invalid action: #form.action#");
		}
		application.util.cfscript.header(statusCode=204);
		abort;
	}
	
	
	param name="url.siteId" type="numeric" default="1";
	param name="url.ipAddress" type="string" default="any";
	qryUnapprovedRepliesSummary = application.cfc.userContent.getUnapprovedRepliesSummary();
	qryUnapprovedReplies = application.cfc.userContent.getUnapprovedReplies(siteId = url.siteId, ipAddress = url.ipAddress);
	
	
	
	
	include "/layout/template-open.cfm";
</cfscript>

		


<div class="row">
	<div class="span12">
		<ul class="nav nav-tabs">
		<cfoutput query="qryUnapprovedRepliesSummary">
			<li <cfif url.siteId EQ siteId> class="active"</cfif>><a href="./replies.cfm?siteId=#siteId#">#siteName# - <span>#num#</span></a></li>
		</cfoutput>
		</ul>
	</div>
</div>
		
		
<cfoutput query="qryUnapprovedReplies">
<form class="row userContentSection" action="#cgi.script_name#?rrId=#rr_id#" method="post">
	<div class="span12">
			
		<h4 class="page-subheader">
			Submitted: #dateFormat(rr_date, 'mmm dd')#
			at #timeFormat(rr_date, 'hh:mm:tt')#
			from <a href="./replies.cfm?siteId=#siteId#&ipAddress=#rr_ipAddress#">#rr_ipAddress#</a>
			- reply to <a href="http://local-nursing-homes.com/?rid=#rr_ra_id#" target=_blank>#rr_ra_id#</a>
		</h4>
		
		<div class="row">
			<div class="span9">
				<div class="userContent">#paragraphFormat(htmlEditFormat(rr_content))#</div>
			</div>
			<div class="span3">
				<div class="buttons">
					<input type="submit" name="action" value="Approve" class="btn btn-success" />
					<input type="submit" name="action" value="Delete" class="btn" />
					<input type="submit" name="action" value="Filter" class="btn" />
				</div>
			</div>
		</div>
		
	</div>
</form>
</cfoutput>
	
	
	

<cfscript>
	include "/layout/template-close.cfm";
</cfscript>