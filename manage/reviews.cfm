<cfscript>
	if(cgi.REQUEST_METHOD EQ "POST"){
		param name="url.rId"; 
		param name="form.action"; 
		param name="form.publicize" default="false"; 
		
		if (form.action EQ "Approve"){
			 application.cfc.userContent.approveReview(reviewId = url.rId, publicize=form.publicize);
		}
		else if(form.action EQ "Delete"){
			 application.cfc.userContent.deleteReview(reviewId = url.rId);
		}
		else if(form.action EQ "Filter"){
			 application.cfc.userContent.filterReview(reviewId = url.rId);
		}
		else{
			throw("invalid action: #form.action#");
		}
		application.util.cfscript.header(statusCode=204);
		abort;
	}
	
	
	param name="url.siteId" type="numeric" default="1";  
	qryUnapprovedReviewsSummary = application.cfc.userContent.getUnapprovedReviewsSummary();
	qryUnapprovedReviews = application.cfc.userContent.getUnapprovedReviews(siteId = url.siteId, num = 200);
	
	
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

<cfquery name="qryDupes"  dbtype="query">
	SELECT ipAddress, count(*)  AS num
	FROM qryUnapprovedReviews
	GROUP BY ipAddress
	HAVING COUNT(*) > 1
	
	UNION ALL
	SELECT ipAddress, 999  AS num
	FROM qryUnapprovedReviews
	WHERE ipAddress LIKE '12.157.18[89].%'
		OR ipAddress LIKE '12.157.19[01].%'
</cfquery>
<cfif qryDupes.recordCount>
	<ul>
		<cfoutput query="qryDupes">
			<li>#qryDupes.num# x #qryDupes.ipAddress#</li>
		</cfoutput>
	</ul>
</cfif>
		
<cfoutput query="qryUnapprovedReviews">
	<cfscript>
		facilityLink = application.cfc.networkNav.getFacilityLink(
			siteId = url.siteId,
			uid = qryUnapprovedReviews.uid,
			facilityType = qryUnapprovedReviews.type
		);
		
		htmlEscapedReview = htmlEditFormat(review);
		reviewHtml = listChangeDelims(trim(htmlEscapedReview), "</p><p>", chr(10));
		
		stateTag = "##" & REReplaceNoCase(qryUnapprovedReviews.stateName, "[^a-z]", "", "ALL");
		cityTag = "##" & REReplaceNoCase(qryUnapprovedReviews.cityName, "[^a-z]", "", "ALL");
		
		twitterMsg = "#application.util.string.titleCase(facilityName)# #rating# star review: http://local-nursing-homes.com/?rid=#qryUnapprovedReviews.id# #cityTag# #stateTag# ##Review ##ElderCare";
		
		fbMsg = (
			"New #rating# Star User Review of #application.util.string.titleCase(facilityName)# located in #qryUnapprovedReviews.cityName#, #qryUnapprovedReviews.stateName#"
			& chr(10)
			& "http://local-nursing-homes.com/?rid=#qryUnapprovedReviews.id#"
			& chr(10)
			& chr(10)
		);
		fbReview = application.util.string.abbreviate(
			inputString = htmlEscapedReview,
			maxLength = (410-len(fbMsg)),
			breakWords = false
		);
		if(htmlEscapedReview NEQ fbReview){
			fbReview &= "...";
		}
		fbReview = chr(34) & fbReview & chr(34);
		
		fbMsg &= fbReview;
		
		
		googReview = application.util.string.abbreviate(
			inputString = htmlEscapedReview,
			maxLength = 400,
			breakWords = false
		);
		if(htmlEscapedReview NEQ googReview){
			googReview &= "...";
		}
		googReview = chr(34) & googReview & chr(34);
		
		gPlusMsg = (
			"#application.util.string.titleCase(facilityName)# #rating# Star Review" & chr(13) & chr(10)
			& chr(13) & chr(10)
			& googReview & chr(13) & chr(10)
			& chr(13) & chr(10)
			& "#cityTag# #qryUnapprovedReviews.stateName# ##Review ##ElderCare" & chr(13) & chr(10)
			& "http://local-nursing-homes.com/?rid=#qryUnapprovedReviews.id#"
		);
		
		local.bloggerTitleTag = application.util.string.titleCase(facilityName);
		local.bloggerTitleTag = replace(local.bloggerTitleTag, "&", " and ", "ALL");
		local.bloggerTitleTag = replace(local.bloggerTitleTag, ",", " ", "ALL");
		local.bloggerTitleTag = rereplace(local.bloggerTitleTag, " {2,}", " ", "ALL");
		
		bloggerMsg = (
			"#application.util.string.titleCase(facilityName)# #rating# Star Review" & chr(13) & chr(10)
			& chr(13) & chr(10)
			& "Review, #qryUnapprovedReviews.stateName#" & chr(13) & chr(10)
			& chr(13) & chr(10)
			& "<p><a href='http://local-nursing-homes.com/?rid=#qryUnapprovedReviews.id#'>New #rating# Star User Review of #application.util.string.titleCase(facilityName)# located in #qryUnapprovedReviews.cityName#, #qryUnapprovedReviews.stateName#</a></p>" & chr(13) & chr(10)
			& chr(13) & chr(10)
			& "<blockquote style='white-space:pre-wrap'><i>#googReview#</i></blockquote>" & chr(13) & chr(10)
			& chr(13) & chr(10)
			& "<p><a href='http://local-nursing-homes.com/?rid=#qryUnapprovedReviews.id#'>http://local-nursing-homes.com/?rid=#qryUnapprovedReviews.id#</a></p>"
		);
	</cfscript>
	
	<form class="form-inline row userContentSection" action="#cgi.script_name#?rId=#id#" method="post">
		<div class="span12">
			
			<div class="row">
				<div class="span9">
					
					<h4 class="page-subheader"><a href="#facilityLink#" target="_blank">#application.util.string.titleCase(facilityName)#</a></h4>
					<div class="userContent">
						<p>#reviewHtml#</p>
					</div>
					<hr>
					
					<div class="row">
						<div class="span3">
							<div class="userContent">
								<h7>Twitter</h7>
								<textarea rows="6">#twitterMsg#</textarea>
							</div>
						</div>
						<div class="span3">
							<div class="userContent">
								<h7>Facebook</h7>
								<textarea rows="6">#fbMsg#</textarea>
							</div>
						</div>
						<!---<div class="span3">
							<div class="userContent">
								<h7>Google+</h7>
								<textarea rows="4">#gPlusMsg#</textarea>
							</div>
						</div>--->
						<div class="span3">
							<div class="userContent">
								<h7>Blogger</h7>
								<textarea rows="6">#bloggerMsg#</textarea>
							</div>
						</div>
					</div>
					
				</div>
				<div class="span3">
					<h4 class="page-subheader">Submitted: #dateFormat(dateRated, 'ddd, mmm dd')#</h4><!--- #type# --->
					<table width='100%'>
						<col>
						<col width="#5*18#">
						<tr>
							<td>ProvNum</td>
							<td>#qryUnapprovedReviews.uid#</td>
						</tr>
						<tr>
							<td>ReviewId</td>
							<td>#qryUnapprovedReviews.id#</td>
						</tr>
						<tr>
							<td>ipAddress</td>
							<td>#qryUnapprovedReviews.ipAddress#</td>
						</tr>
						<tr>
							<td>Reviews / Ratings</td>
							<td>#numberFormat(qryUnapprovedReviews.reviewCount)# / #numberFormat(qryUnapprovedReviews.ratingCount)#</td>
						</tr>
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
					
					<div class="control-group">
						<div class="buttons">
							<input type="submit" name="action" value="Approve" class="btn btn-success" />
							<input type="submit" name="action" value="Delete" class="btn" />
							<input type="submit" name="action" value="Filter" class="btn" />
						</div>
					</div>
					
					<!---<div class="control-group">
						<div align="center"><span class="btn publicize" data-toggle="button">Publicize?</span></div>
					</div>--->
					
				</div>
			</div>
			
		</div>
	</form>
</cfoutput>
	
	
	

<cfscript>
	include "/layout/template-close.cfm";
</cfscript>