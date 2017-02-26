<cfcontent type="text/html; charset=utf-8">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title></title>

	<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	<link href="/static/css/bootstrap-2.0.1.min.css" rel="stylesheet">
	<link href="/manage/static/css/custom.css" rel="stylesheet">
	<style>
		dd{word-break: break-all;}
	</style>
</head>
<body>

<cfscript>
	param name="url.tag" default="";
	qryTags = application.cfc.medicareData.getTags();
	qryViews = application.cfc.medicareData.getViews(tag=url.tag);
</cfscript>

<div class="container">
	<div class="row"><div class="span12">
		<table class="table">
			<thead>
				<tr>
					<td>id</td>
					<td>name</td>
					<!--- <td>pubDate</td> --->
					<!--- <td>modified</td> --->
					<td>updated</td>
					<!--- <td>updateId</td> --->
					<!--- <td>authorId</td> --->
					<!--- <td>ownerId</td> --->
				</tr>
			</thead>
			<tbody>
			<cfoutput query="qryViews">
				<tr title="#jsStringFormat(description)#">
					<td><a href="#application.cfc.medicareApi.getViewUrl(id)#">#id#</a></td>
					<td>#name#</td>
					<!--- <td>#dateFormat(application.util.date.epochToLocal(publicationDate), 'mm/dd/yy')#</td> --->
					<td>#dateFormat(updatedAt, 'mm/dd/yy')#</td>
					<!--- <td>#dateFormat(application.util.date.epochToLocal(viewLastModified), 'mm/dd/yy')#</td> --->
					<!--- <td><a href="#application.cfc.medicareApi.getUserUrl(rowsUpdatedBy)#">#rowsUpdatedBy#</a></td> --->
					<!--- <td><a href="#application.cfc.medicareApi.getUserUrl(authorId)#">#authorId#</a></td> --->
					<!--- <td><a href="#application.cfc.medicareApi.getUserUrl(ownerId)#">#ownerId#</a></td> --->
				</tr>
			</cfoutput>
			</tbody>
			<tfoot>
				<tr>
					<cfoutput><td colspan="8"><small><em>#qryViews.RecordCount# Results</em></small></td></cfoutput>
				</tr>
			</tfoot>
		</table>
	</div></div>



	<div class="row"><div class="span12">
		<ul class="nav nav-pills">
			<li><a href="?tag=">All</a></li>
			<li><a href="?tag=NULL">Untagged</a></li>
		<cfoutput query="qryTags">
			<li><a href="?tag=#qryTags.tag#">#qryTags.tag#</a></li>
		</cfoutput>
		</ul>
	</div></div>

</div>
</body>
</html>
