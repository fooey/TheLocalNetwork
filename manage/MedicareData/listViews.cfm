<!--- http://api.us.socrata.com/api/catalog/v1?tags=nhc&search_context=data.medicare.gov --->

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
	param name="url.tags" default="nhc";

	resources = application.cfc.medicareApi.getViews(tags = url.tags);

	apiRoot = application.cfc.medicareApi.getUrlRoot();
	exportFormats = application.cfc.medicareApi.getExportFormats();
</cfscript>

<div class="container"><div class="row12">

<!--- <cfdump var="#resources.results#" /> --->
<!--- <cfdump var="#resources.results[1]#" /> --->

<cfoutput>
<ul>
<cfloop collection="#resources#" item="id" >
    <cfset resource = resources[id] />
	<li>
		<dl>
            <dt>name</dt>
            <dd>#resource.name#</dd>

            <dt>id</dt>
            <dd>#resource.id#</dd>

            <dt>description</dt>
            <dd>#resource.description#</dd>

            <!--- <dt>metadata</dt>
            <dd>#serializeJson(result.metadata)#</dd> --->

            <dt>permalink</dt>
            <dd>#resource.permalink#</dd>

            <dt>link</dt>
            <dd>#resource.link#</dd>

            <dt>updatedAt</dt>
            <dd>#parseDateTime(resource.updatedAt)#</dd>

            <dt>createdAt</dt>
            <dd>#parseDateTime(resource.createdAt)#</dd>

            <dt>type</dt>
            <dd>#resource.type#</dd>

            <dt>provenance</dt>
            <dd>#resource.provenance#</dd>

            <!--- <dt>columns_name</dt>
            <dd>#serializeJson(result.resource.columns_name)#</dd> --->

            <!--- <dt>columns_field_name</dt>
            <dd>#serializeJson(result.resource.columns_field_name)#</dd> --->

			<!--- <cfloop collection="#result.resource#" item="resourceKey" >
				<dt>#resourceKey#</dt>

                <cfif NOT structKeyExists(result.resource, resourceKey)>
                    <dd>null</dd>
                <cfelse>
                    <cfset resourceValue = result.resource[resourceKey] />

    				<cfif isDate(resourceValue)>
                        <dd>#ParseDateTime(resourceValue)#</dd>
    				<cfelseif isSimpleValue(resourceValue)>

    					<!---` <cfif listFindNoCase(epochFields, resourceValue)>
    						<dd><strong>#dateFormat(application.util.date.epochToLocal(resourceValue), 'yyyy-mm-dd')#</strong></dd>
    					<cfelseif resourceKey EQ "id">
    						<cfset local.resultApi = application.cfc.medicareApi.getViewUrl(resourceKey) />
    						<cfset local.resultCSV = local.resultApi & "/#result[resourceKey]#/rows.csv" />
    						<cfset local.resultJSON = local.resultApi & "#result[resourceKey]#/rows.json" />

    						<dd>#result[resourceKey]#</dd>
    						<dd><dl>
    							<dt>API Resource</dt>
    							<dd><a href="#local.resultApi#">#local.resultApi#</a></dd>
    							<cfloop array="#exportFormats#" index="ixFormat" >
    								<cfset local.thisResource = local.resultApi & "/rows.#lcase(ixFormat)#?accessType=DOWNLOAD" />
    								<dt>#ixFormat#</dt>
    								<dd><a href="#local.thisResource#">#local.thisResource#</a></dd>
    							</cfloop>
    						</dl></dd>
    					<cfelse>
                        </cfif> --->
    						<dd>#resourceValue#</dd>

    				<!--- <cfelseif resourceKey EQ "tags">
    					<dd><ul>
    						<cfloop array="#resourceValue#" index="ixTag" >
    							<li>
    								<a href="?tags=#ixTag#">#ixTag#</a>
    							</li>
    						</cfloop>
    					</ul></dd> --->

    				<cfelse>
    					<dd>#serializeJson(resourceValue)#</dd>
    				</cfif>
                </cfif>
			</cfloop> --->
		</dl>
	</li>

</cfloop>
</ul>
</cfoutput>


</div></div>
</body>
</html>
