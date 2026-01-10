------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2013 ------------
------------------------------

pdLogPath = ":"..resourceName.."/logs/pdlog.log"

function outputPdLog ( text )

	local pdLog = fileOpen ( pdLogPath, false )
	local filesize = fileGetSize ( pdLog )
	fileSetPos ( pdLog, filesize )
	fileWrite ( pdLog, timestamp()..": "..text.."\n" )
	fileClose ( pdLog )
end