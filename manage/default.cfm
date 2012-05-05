<cfscript>
	include "/layout/template-open.cfm";
</cfscript>

		
<cfquery name="qryTotals">
	SELECT
		userRating = cast(isNull(avg(ra.ratingAvg),0) AS decimal(2,1)),
		userRatingCount = ISNULL(SUM(ratingCount), 0),
		userReviewCount = ISNULL(SUM(reviewCount), 0),
		userReplyCount = (SELECT COUNT(*) FROM RatingReplies  WITH(READUNCOMMITTED))
	FROM Logging.dbo.RatingsAggregate ra WITH(READUNCOMMITTED)
</cfquery>
<cfquery name="qryLnhTotals">
	SELECT
		userRating = cast(isNull(avg(ra.ratingAvg),0) AS decimal(2,1)),
		userRatingCount = ISNULL(SUM(ratingCount), 0),
		userReviewCount = ISNULL(SUM(reviewCount), 0),
		userReplyCount = (SELECT COUNT(*) FROM RatingReplies  WITH(READUNCOMMITTED))
	FROM Logging.dbo.RatingsAggregate ra WITH(READUNCOMMITTED)
	WHERE siteId = 1
</cfquery>
<cfquery name="qryNotLnhTotals">
	SELECT
		userRating = cast(isNull(avg(ra.ratingAvg),0) AS decimal(2,1)),
		userRatingCount = ISNULL(SUM(ratingCount), 0),
		userReviewCount = ISNULL(SUM(reviewCount), 0),
		userReplyCount = 0
	FROM Logging.dbo.RatingsAggregate ra WITH(READUNCOMMITTED)
	WHERE siteId <> 1
</cfquery>
<cfquery name="qryTimeline">
	DECLARE @today DATE = sysDateTime();
	DECLARE @minDate DATE = dateAdd(dy, -30, @today)
	
	; WITH
		ratingsAgg AS (
			SELECT
				dayRated = convert(date, dateRated),
				userRating = cast(isNull(avg(rating),0) AS decimal(2,1)),
				userRatingCount = ISNULL(COUNT(*), 0),
				userReviewCount = ISNULL(COUNT(review), 0)
			FROM Logging.dbo.Ratings WITH(READUNCOMMITTED)
			WHERE dateRated >= @minDate
				AND filtered <> 1
			GROUP BY convert(date, dateRated)
		)
		, repliesAgg AS (
			SELECT
				dayReplied = CONVERT(date, rr_date),
				replyCount = ISNULL(COUNT(*), 0)
			FROM Logging.dbo.ratingReplies WITH(READUNCOMMITTED)
			WHERE rr_date >= @minDate
				AND rr_dateFiltered IS NULL
			GROUP BY CONVERT(date, rr_date)
		)
	
	SELECT
		dayRated,
		userRatingCount,
		userReviewCount,
		dayReplied = ISNULL(dayReplied, dayRated),
		replyCount = ISNULL(replyCount, 0)
	FROM ratingsAgg
		LEFT JOIN repliesAgg ON dayRated = dayReplied
	ORDER BY dayRated
</cfquery>

<div class="row">
	<div class="span12">
		<h1 class="page-header">The Local Network Management Console</h1>
	</div>
</div>
<div class="row">
	<div class="span3">
		<h3 class="page-header">Sections</h3>
		
		<div class="row">
			<div class="span3">
				<cfset qryUnapprovedReviewsSummary = application.cfc.userContent.getUnapprovedReviewsSummary() />
				<cfset qryUnapprovedRepliesSummary = application.cfc.userContent.getUnapprovedRepliesSummary() />
				
				<ul class="nav nav-list">
					<!---<li><a href="./users.cfm">Users</a></li>--->

					<li class="nav-header"><h4>Reviews Moderation</h4></li>
					<cfoutput query="qryUnapprovedReviewsSummary">
						<li><a href="./reviews.cfm?siteId=#siteId#">#siteName# - <span>#num#</span></a></li>
					</cfoutput>
					
					<li class="divider"><hr></li>
				
					<li class="nav-header"><h4>Replies Moderation</h4></li>
					<cfoutput query="qryUnapprovedRepliesSummary">
						<li><a href="./replies.cfm?siteId=#siteId#">#siteName# - <span>#num#</span></a></li>
					</cfoutput>
					
					<li class="divider"><hr></li>
					
					<li class="nav-header"><h4>Documents</h4></li>
					<li><a href="/manage/docs/ComplaintResponse.cfm">Defamation Complaint Response</a></li>
					<li><a href="/manage/docs/ComplaintResponse.phone.cfm">Defamation Phone Response</a></li>
					
					<li class="divider"><hr></li>
					
					<li class="nav-header"><h4>Legal</h4></li>
					<li><a href="/legal/TermsAndConditions.cfm">Terms and Conditions of Use</a></li>
					<li><a href="/legal/PrivacyPolicy.cfm">Privacy Policy</a></li>
					<li><a href="/legal/ContentGuidelines.cfm">Content Policies and Guidelines</a></li>
				</ul>
			</div>
		</div>
		
	</div>
	<div class="span9">
		<h3 class="page-header">Stats</h3>
		
		<cfoutput>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th></th>
					<th><h4>Total</h4></th>
					<th><h4>LNH</h4></th>
					<th><h4>Misc</h4></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>Average User Rating</th>
					<td class="num">#decimalFormat(qryTotals.userRating)#</td>
					<td class="num">#decimalFormat(qryLnhTotals.userRating)#</td>
					<td class="num">#decimalFormat(qryNotLnhTotals.userRating)#</td>
				</tr>
				<tr>
					<th>Total Number of Ratings</th>
					<td class="num">#numberFormat(qryTotals.userRatingCount)#</td>
					<td class="num">#numberFormat(qryLnhTotals.userRatingCount)#</td>
					<td class="num">#numberFormat(qryNotLnhTotals.userRatingCount)#</td>
				</tr>
				<tr>
					<th>Total Number of Reviews</th>
					<td class="num">#numberFormat(qryTotals.userReviewCount)#</td>
					<td class="num">#numberFormat(qryLnhTotals.userReviewCount)#</td>
					<td class="num">#numberFormat(qryNotLnhTotals.userReviewCount)#</td>
				</tr>
				<tr>
					<th>Total Number of Review Replies</th>
					<td class="num">#numberFormat(qryTotals.userReplyCount)#</td>
					<td class="num">#numberFormat(qryLnhTotals.userReplyCount)#</td>
					<td class="num">#numberFormat(qryNotLnhTotals.userReplyCount)#</td>
				</tr>
			</tbody>
		</table>
		</cfoutput>
			
		<cfchart chartwidth="700" chartheight="460" showmarkers="0" showlegend="true" showXgridlines="true" showYgridlines="true" format="png" >
			<cfchartseries
				type="line"
				serieslabel="Ratings by Day"
				seriescolor="##049CDB"
				query="qryTimeline"
				valuecolumn="userRatingCount"
				itemcolumn="dayRated">
			<cfchartseries
				type="line"
				serieslabel="Reviews by Day"
				seriescolor="##46a546"
				query="qryTimeline"
				valuecolumn="userReviewCount"
				itemcolumn="dayRated">
			</cfchartseries>
			<cfchartseries
				type="line"
				serieslabel="Replies by Day"
				seriescolor="##ffc40d"
				query="qryTimeline"
				valuecolumn="replyCount"
				itemcolumn="dayReplied">
			</cfchartseries>
		</cfchart>
		
		
	</div>
</div>
	
	
	

<cfscript>
	include "/layout/template-close.cfm";
</cfscript>