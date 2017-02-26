<cfscript>
	local.tags = [
		"nhc"
		// ,"nursing home"
		// ,"nursing home providers"
		// ,"nursing home ownership and affiliation"
		// ,"hhc"
		// ,"hospital compare"
		// ,"supplier"
		// ,"dialysis"
		// ,"dfc"
		// ,"helpful contacts"
		// ,"websites"
		// ,"general information"
	];
	//local.tags = [];
	local.specificViews = [
		// "m5eg-upu5"		// Home Health Care - Zip Codes
		// ,"uy9i-rbhv"	// CASPER / ASPEN Contacts
	];
	//local.specificViews = [];
	local.views = [];


	writeOutput("<h3>Getting views by tag</h3>");
	getPageContext().getOut().flush();

	// for(local.tag in local.tags){
	// 	writeOutput("Getting tag: #local.tag# ... ");
	// 	getPageContext().getOut().flush();
    //
	// 	arrayAppend(local.views, application.cfc.medicareApi.getViews(tags=local.tag), true);
	// 	// local.views.addAll(local.views);
    //
	// 	writeOutput(" #arrayLen(local.views)# views <br>");
	// 	getPageContext().getOut().flush();
	// }
    local.views = application.cfc.medicareApi.getViews(tags="nhc");


	// writeOutput("<hr><h3>Getting views not available by tags</h3>");
	// getPageContext().getOut().flush();
	//
	// for(local.view in local.specificViews){
	// 	writeOutput("Getting view: #local.view# ... ");
	// 	getPageContext().getOut().flush();
	//
	// 	local.views  = application.cfc.medicareApi.getViews(view=local.view);
	// 	local.views.addAll(local.views);
	//
	// 	writeOutput(" #arrayLen(local.views)# views <br>");
	// 	getPageContext().getOut().flush();
	// }

	// writeOutput("<hr><h3>Processing results</h3>");
    //
	// writeOutput("Converting #arrayLen(local.views)# json to query objects <br>");
	// getPageContext().getOut().flush();
    //
	// local.qryViews = application.cfc.medicareData.viewsJsonToQuery(local.views);
    //
    //
	// writeOutput("Checking #local.qryViews.recordCount# unique views for updates<br>");
	// getPageContext().getOut().flush();
    //
	application.cfc.medicareData.updateViews(local.views);
	numQueued = application.cfc.medicareData.queueFileUpdates();
	writeOutput("Queued #numQueued# files for updating<br>");

	if(numQueued){
		application.cfc.mail.sendNotice(
			subject = "MedicareData - #numQueued# Files Queued"
		);
	}
</cfscript>
