------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

payLogPath = ":"..resourceName.."/logs/paylog.log"

function outputPayLog ( text )

	local payLog = fileOpen ( payLogPath, false )
	local filesize = fileGetSize ( payLog )
	fileSetPos ( payLog, filesize )
	fileWrite ( payLog, timestamp()..": "..text.."\n" )
	fileClose ( payLog )
end