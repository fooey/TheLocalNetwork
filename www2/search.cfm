<cfscript>
	head.title = 'Search The Local Network';
	head.description = 'Search The Local Network';
	include "/layout/template-open.cfm";
</cfscript>
	
	
	
<form class="well" action="/search.cfm" id="cse-search-box">
    <input type="hidden" name="cx" value="partner-pub-2680194687384513:2796089650" />
    <input type="hidden" name="cof" value="FORID:10" />
    <input type="hidden" name="ie" value="UTF-8" />
	
	<div style="text-align: center;">
		<input class="span6" type="text" name="q" id="q">
		<input class="btn btn-primary" type="submit" name="sa" id="sa" value="Search">
	</div>
	
</form>

<cfif structKeyExists(url, "q")>
	<div style="width:800px;margin:0 auto;">
		
		<h3>Search Results</h3>
		<div id="cse-search-results"></div>
		<script type="text/javascript">
			var googleSearchIframeName = "cse-search-results";
			var googleSearchFormName = "cse-search-box";
			var googleSearchFrameWidth = 800;
			var googleSearchDomain = "www.google.com";
			var googleSearchPath = "/cse";
		</script>
		<script type="text/javascript" src="http://www.google.com/afsonline/show_afs_search.js"></script>
	</div>
</cfif>
	
	
	

<cfscript>
	include "/layout/template-close.cfm";
</cfscript>