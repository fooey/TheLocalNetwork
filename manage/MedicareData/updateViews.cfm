<cfscript>
	local.tags = [
		"nursing home"
		,"nhc"
		,"nursing home providers"
		,"nursing home ownership and affiliation"
		,"hhc"
		,"hospital compare"
		,"supplier"
		,"dialysis"
		,"dfc"
		,"helpful contacts"
		,"websites"
	];
	//local.tags = ["supplier"];
	local.specificViews = [
		"m5eg-upu5"		// Home Health Care - Zip Codes
		,"uy9i-rbhv"	// CASPER / ASPEN Contacts
	];
	//local.specificViews = [];
	local.jsonViews = [];
	
	
	writeOutput("<h3>Getting views by tag</h3>");
	getPageContext().getOut().flush();
		
	for(local.tag in local.tags){
		writeOutput("Getting tag: #local.tag# ... ");
		getPageContext().getOut().flush();
		
		local.jsonView  = application.cfc.medicareApi.getViews(tags=local.tag); 
		local.jsonViews.addAll(local.jsonView);
		
		writeOutput(" #arrayLen(local.jsonView)# views <br>");
		getPageContext().getOut().flush();
	}
	
	
	writeOutput("<hr><h3>Getting views not available by tags</h3>");
	getPageContext().getOut().flush();
	
	for(local.view in local.specificViews){
		writeOutput("Getting view: #local.view# ... ");
		getPageContext().getOut().flush();
		
		local.jsonView  = application.cfc.medicareApi.getViews(view=local.view);
		local.jsonViews.addAll(local.jsonView);
		
		writeOutput(" #arrayLen(local.jsonView)# views <br>");
		getPageContext().getOut().flush();
	}
	
	writeOutput("<hr><h3>Processing results</h3>");
	
	writeOutput("Converting #arrayLen(local.jsonViews)# json to query objects <br>");
	getPageContext().getOut().flush();
	
	local.qryViews = application.cfc.medicareData.viewsJsonToQuery(local.jsonViews);

	
	writeOutput("Checking #local.qryViews.recordCount# unique views for updates<br>");
	getPageContext().getOut().flush();
	
	application.cfc.medicareData.updateViewsFromQuery(local.qryViews);
	numQueued = application.cfc.medicareData.queueFileUpdates();
	writeOutput("Queued #numQueued# files for updating<br>");
	
	if(numQueued){
		application.cfc.mail.sendNotice(
			subject = "MedicareData - #numQueued# Files Queued"
		);
	}
</cfscript>