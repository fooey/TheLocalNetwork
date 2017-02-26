<cfsetting requesttimeout="#60*30#" />
<cflock timeout="1" name="medicareDownloadView" throwontimeout="false">
<cfscript>
    local.sampleDataHtml = '';

	fileId = application.cfc.medicareData.getFileIdFromQueue();

	if(fileId NEQ 0){
		qryView = application.cfc.medicareData.getViews(id=fileId);
        writeDump(qryView);
        cfflush();

		local.filePath = application.cfc.medicareData.getFilePath(fileId);
		local.tableName = application.cfc.medicareData.getTableName(fileId);

		writeOutput("Downloading #qryView.name# (#qryView.id#) to #local.filePath#<br>");
        cfflush();
		/*
		*/
		fileSize = application.cfc.medicareApi.downloadView(qryView);
		writeOutput("Downloaded #numberFormat(fileSize)# bytes to #local.filePath#<br>");
        cfflush();

		application.cfc.medicareData.importFile(
			path = local.filePath,
			tableName = local.tableName
		);

		/*
		*/
		application.cfc.medicareData.dequeueFile(fileId);

		local.qrySample = application.cfc.medicareData.getSampleData(topNum = 5, tableName = local.tableName);
		local.cols = listToArray(local.qrySample.columnList);

		//writeDump(local.qrySample);


		local.sampleData = [];

		for(local.r = 1; local.r LTE local.qrySample.recordCount; local.r += 1){
			local.row = [];
			for(local.c in local.cols){
				local.val = local.qrySample[local.c][local.r];

				local.rowHtml = "<strong>#local.c#:</strong> #local.val#";
				arrayAppend(local.row, local.rowHtml);
			}
			arrayAppend(local.sampleData, "<ul><li>#arrayToList(local.row, '</li><li>')#</li></ul><hr>");
		}

		local.sampleDataHtml = "<ul style='list-style:none;margin:0;padding:0'><li>#arrayToList(local.sampleData, '</li><li>')#</li></ul>";
		writeOutput("<hr>");
		writeOutput(local.sampleDataHtml);
        cfflush();

		/*
		*/
		application.cfc.mail.sendNotice(
			subject = "MedicareData Update: #qryView.id# - #qryView.name#",
			content = "<h2>#qryView.name#</h2><p>#qryView.description#</p><div>#local.sampleDataHtml#</div>"
		);
	}

</cfscript>
</cflock>

<hr>
done...

<meta http-equiv="refresh" content="3">
