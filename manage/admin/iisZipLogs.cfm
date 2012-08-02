<cfsetting requesttimeout="#5 * 60#" />

<cfscript>
	crcObj = createObject('java', 'java.util.zip.CRC32');
	
	
	iisLogsPath = 'c:\inetpub\logs\LogFiles\';
	previousMonth = dateAdd("m", -1, now());
	dateMask = dateFormat(previousMonth, 'YYMM');
	//logFilter = "u_ex#dateMask#*.log";
	logFilter = "u_ex*.log";
	
	
	logFiles = directoryList(iisLogsPath, true, "path", logFilter);
	//writeDump(logFiles);
	
	for(ixFile in logFiles){
		fileInfo = getFileInfo(ixFile);
		
		directoryPath = fileInfo.parent;
		directoryName = listLast(fileInfo.parent, "/\");
		fileName = fileInfo.name;
		lastModified = fileInfo.lastModified;
		
		modifiedToday = (dayOfYear(lastModified) EQ dayOfYear(now()));
		
		if(NOT modifiedToday){
			zipFile = "#directoryName#.#dateFormat(lastModified, "YYMM")#.zip";
			zipPath = listAppend(directoryPath, zipFile, "\");
						
			zipCreate = application.util.cfscript.zip(
				action = 'zip',
				overwrite = false,
				file = zipPath,
				source = directoryPath,
				filter = fileName,
				recurse = false
			);
			
			zipList = application.util.cfscript.zip(
				action = 'list',
				file = zipPath,
				source = directoryPath,
				filter = fileName,
				recurse = false
			);
			
			crcObj.reset();
			crcObj.update(fileReadBinary(ixFile));
			fileCrc = crcObj.getValue();
			crcMatch = (fileCrc EQ zipList.crc);
			
			if(crcMatch){
				fileDelete(ixfile);
			}
			
			/*
			writeDump({
				zipPath = zipPath,
				fileInfo = fileInfo,
				fileCrc = fileCrc,
				zipCreate = zipCreate,
				zipList = zipList,
				crcPassed = crcMatch
			});
			*/
			
		}
	}
	
</cfscript>