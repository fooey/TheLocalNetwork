<cfscript>
	include "/layout/template-open.cfm";
</cfscript>

<div class="row">
	<div class="span12">
		<h1 class="page-header">Medicare Data!</h1>
	</div>
</div>
<div class="row">
	<div class="span4">

		<ul class="nav nav-list">
			<li class="nav-header">API / Remote</li>
			<li><a href="./listViews.cfm?tags=nhc">List Views</a></li>	
			<li><a href="./updateViews.cfm">Update Views</a></li>
			<li><a href="./downloadFiles.cfm">Download Next Queued File</a></li>

			<li class="nav-header">Local DB</li>
			<li><a href="./dbListViews.cfm">List Views</a></li>
		</ul>

	</div>
</div>




<cfscript>
	include "/layout/template-close.cfm";
</cfscript>
