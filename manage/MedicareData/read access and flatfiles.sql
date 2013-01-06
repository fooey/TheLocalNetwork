
--SELECT *
--FROM OPENROWSET(
--	'Microsoft.ACE.OLEDB.12.0',
--	'c:\inet\wr\LocalNursingHomes\v1\data\NHCAboutNH.mdb'; 'admin';'',
--	vwNHC_NH
--)


--DROP TABLE #tempImport

SELECT TOP(10) *
--INTO #tempImport
FROM OPENROWSET(
	'Microsoft.ACE.OLEDB.12.0',
	'Text;Database=c:\inet\wr\LocalNursingHomes\v4\data\;HDR=YES',
	'SELECT * FROM [Nursing_Home_Compare_-_Survey_Dates.csv]'
)

--SELECT top(10) *
--FROM #tempImport

--SELECT COUNT(DISTINCT [provider number])
--FROM #tempImport

--