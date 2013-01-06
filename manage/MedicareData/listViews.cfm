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
	param name="url.tags" default="";
	
	views = application.cfc.medicareApi.getViews(tags = url.tags);
	
	epochFields = "rowsUpdatedAt,publicationDate,viewLastModified,createdAt";
	
	apiRoot = application.cfc.medicareApi.getUrlRoot();
	exportFormats = application.cfc.medicareApi.getExportFormats();
</cfscript>

<div class="container"><div class="row12">

<cfoutput>
<ul>
<cfloop array="#views#" index="ixView" >
	<li>
		<h3>#ixView.name#</h3>
		<dl>
			<cfloop collection="#ixView#" item="ixItem" >
				<dt>#ixItem#</dt>
				<cfif isSimpleValue(ixView[ixItem])>
					
					<cfif listFindNoCase(epochFields, ixItem)>
						<dd><strong>#dateFormat(application.util.date.epochToLocal(ixView[ixItem]), 'yyyy-mm-dd')#</strong></dd>
					<cfelseif ixItem EQ "id">
						<cfset local.viewApi = application.cfc.medicareApi.getViewUrl(ixView[ixItem]) />
						<cfset local.viewCSV = local.viewApi & "/#ixView[ixItem]#/rows.csv" />
						<cfset local.viewJSON = local.viewApi & "#ixView[ixItem]#/rows.json" />
						
						<dd>#ixView[ixItem]#</dd>
						<dd><dl>
							<dt>API Resource</dt>
							<dd><a href="#local.viewApi#">#local.viewApi#</a></dd>
							<cfloop array="#exportFormats#" index="ixFormat" >
								<cfset local.thisResource = local.viewApi & "/rows.#lcase(ixFormat)#?accessType=DOWNLOAD" />
								<dt>#ixFormat#</dt>
								<dd><a href="#local.thisResource#">#local.thisResource#</a></dd>
							</cfloop>
						</dl></dd>
					<cfelse>
						<dd>#ixView[ixItem]#</dd>
					</cfif>
					
				<cfelseif ixItem EQ "tags">
					<dd><ul>
						<cfloop array="#ixView[ixItem]#" index="ixTag" >
							<li>
								<a href="?tags=#ixTag#">#ixTag#</a>
							</li>
						</cfloop>
					</ul></dd>
					
				<cfelse>
					<dd>#serializeJson(ixView[ixItem])#</dd>
				</cfif>
			</cfloop>
		</dl>
	</li>
	
</cfloop>
</ul>
</cfoutput>


</div></div>
</body>
</html>

