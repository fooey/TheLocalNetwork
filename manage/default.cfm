<cfscript>
	include "/layout/template-open.cfm";
</cfscript>

		
<cfquery name="qryTotals">
	SELECT
		userRating = cast(isNull(avg(ra.ratingAvg),0) AS decimal(2,1)),
		userRatingCount = ISNULL(SUM(ratingCount), 0),
		userReviewCount = ISNULL(SUM(reviewCount), 0)
	FROM Logging.dbo.RatingsAggregate ra WITH(READUNCOMMITTED)
</cfquery>
<cfquery name="qryLnhTotals">
	SELECT
		userRating = cast(isNull(avg(ra.ratingAvg),0) AS decimal(2,1)),
		userRatingCount = ISNULL(SUM(ratingCount), 0),
		userReviewCount = ISNULL(SUM(reviewCount), 0)
	FROM Logging.dbo.RatingsAggregate ra WITH(READUNCOMMITTED)
	WHERE siteId = 1
</cfquery>
<cfquery name="qryNotLnhTotals">
	SELECT
		userRating = cast(isNull(avg(ra.ratingAvg),0) AS decimal(2,1)),
		userRatingCount = ISNULL(SUM(ratingCount), 0),
		userReviewCount = ISNULL(SUM(reviewCount), 0)
	FROM Logging.dbo.RatingsAggregate ra WITH(READUNCOMMITTED)
	WHERE siteId <> 1
</cfquery>
<cfquery name="qryTimeline">
	DECLARE @today DATE = sysDateTime();
	DECLARE @minDate DATE = dateAdd(dy, -90, @today)
	
	; WITH
		ratingsAgg AS (
			SELECT
				weekRated = convert(date, dateadd(week, datediff(week, 0, dateRated), 0)),
				userRating = cast(isNull(avg(rating),0) AS decimal(2,1)),
				userRatingCount = ISNULL(COUNT(*), 0),
				userReviewCount = ISNULL(COUNT(review), 0)
			FROM Logging.dbo.Ratings WITH(READUNCOMMITTED)
			WHERE dateRated >= @minDate
			GROUP BY dateadd(week, datediff(week, 0, dateRated), 0)
		)
		, repliesAgg AS (
			SELECT
				weekReplied = CONVERT(date, dateadd(week, datediff(week, 0, rr_date), 0)),
				replyCount = ISNULL(COUNT(*), 0)
			FROM Logging.dbo.ratingReplies WITH(READUNCOMMITTED)
			WHERE rr_date >= @minDate
			GROUP BY dateadd(week, datediff(week, 0, rr_date), 0)
		)
	
	SELECT
		weekRated,
		userRatingCount,
		userReviewCount,
		weekReplied = ISNULL(weekReplied, weekRated),
		replyCount = ISNULL(replyCount, 0)
	FROM ratingsAgg
		LEFT JOIN repliesAgg ON weekRated = weekReplied
	ORDER BY weekRated
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

					<cfif qryUnapprovedReviewsSummary.recordCount>
						<li class="nav-header"><h4>Reviews</h4></li>
						<cfoutput query="qryUnapprovedReviewsSummary">
							<li><a href="./reviews.cfm?siteId=#siteId#">#siteName# - <span>#num#</span></a></li>
						</cfoutput>
					</cfif>
					
					<cfif qryUnapprovedRepliesSummary.recordCount>
						<li class="nav-header"><h4>Replies</h4></li>
						<cfoutput query="qryUnapprovedRepliesSummary">
							<li><a href="./replies.cfm?siteId=#siteId#">#siteName# - <span>#num#</span></a></li>
						</cfoutput>
					</cfif>
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
					<td class="num">#decimalFormat(qryTotals.userRatingCount)#</td>
					<td class="num">#decimalFormat(qryLnhTotals.userRatingCount)#</td>
					<td class="num">#decimalFormat(qryNotLnhTotals.userRatingCount)#</td>
				</tr>
				<tr>
					<th>Total Number of Reviews</th>
					<td class="num">#decimalFormat(qryTotals.userReviewCount)#</td>
					<td class="num">#decimalFormat(qryLnhTotals.userReviewCount)#</td>
					<td class="num">#decimalFormat(qryNotLnhTotals.userReviewCount)#</td>
				</tr>
			</tbody>
		</table>
		</cfoutput>
			
		<cfchart chartwidth="700" chartheight="460" showmarkers="0" showlegend="true" showXgridlines="true" showYgridlines="true">
			<cfchartseries
				type="line"
				serieslabel="Ratings by Week"
				seriescolor="##049CDB"
				query="qryTimeline"
				valuecolumn="userRatingCount"
				itemcolumn="weekRated">
			<cfchartseries
				type="line"
				serieslabel="Reviews by Week"
				seriescolor="##46a546"
				query="qryTimeline"
				valuecolumn="userReviewCount"
				itemcolumn="weekRated">
			</cfchartseries>
			<cfchartseries
				type="line"
				serieslabel="Replies by Week"
				seriescolor="##ffc40d"
				query="qryTimeline"
				valuecolumn="replyCount"
				itemcolumn="weekReplied">
			</cfchartseries>
		</cfchart>
		
		
	</div>
</div>
	
	
	

<cfscript>
	include "/layout/template-close.cfm";
</cfscript>