<cfscript>
	if(cgi.REQUEST_METHOD EQ "POST"){
		param name="url.rId"; 
		param name="form.action"; 
		
		if (form.action EQ "Approve"){
			 application.cfc.userContent.approveReview(url.rId);
		}
		else if(form.action EQ "Delete"){
			 application.cfc.userContent.deleteReview(url.rId);
		}
		else if(form.action EQ "Filter"){
			 application.cfc.userContent.filterReview(url.rId);
		}
		else{
			throw("invalid action: #form.action#");
		}
		application.cfc.cfscript.header(statusCode=204);
		abort;
	}
	
	
	param name="url.siteId" type="numeric" default="1";  
	qryUnapprovedReviewsSummary = application.cfc.userContent.getUnapprovedReviewsSummary();
	qryUnapprovedReviews = application.cfc.userContent.getUnapprovedReviews(siteId = url.siteId);
	
	
	
	
	include "/layout/template-open.cfm";
</cfscript>

		


<div class="row">
	<div class="span12">
		<ul class="nav nav-tabs">
		<cfoutput query="qryUnapprovedReviewsSummary">
			<li <cfif url.siteId EQ siteId> class="active"</cfif>><a href="./reviews.cfm?siteId=#siteId#">#siteName# - <span>#num#</span></a></li>
		</cfoutput>
		</ul>
	</div>
</div>
		
<cfoutput query="qryUnapprovedReviews">
<form class="row userContentSection" action="#cgi.script_name#?rId=#id#" method="post">
	<div class="span12">
			
		
		<div class="row">
			<div class="span9">
				
				<h4 class="page-subheader">#facilityName# (#uid#)</h4><!--- #type# --->
				<div class="userContent">#paragraphFormat(htmlEditFormat(review))#</div>
				
			</div>
			<div class="span3">
				<h4 class="page-subheader">Submitted: #dateFormat(dateRated, 'mmm dd')#</h4><!--- #type# --->
				<table width='100%'>
					<col>
					<col width="#5*18#">
					<tr>
						<td>User Rating</td>
						<td><div class="starsContainer"><span class="stars"><span class="starRating" style="width: #rating * 18#px"></span></span></div></td>
					</tr>
					<tr>
						<td>Average Rating</td>
						<td><div class="starsContainer"><span class="stars"><span class="starRating" style="width: #ratingAvg * 18#px"></span></span></div></td>
					</tr>
					<tr>
						<td>Gov Rating</td>
						<cfif isNumeric(govRating)>
							<td><div class="starsContainer"><span class="stars"><span class="starRating" style="width: #govRating * 18#px"></span></span></div></td>
						</cfif>
					</tr>
				</table>
				
				<hr>
				
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