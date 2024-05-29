------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2013 ------------
------------------------------

fraktionsLogPath = ":"..resourceName.."/logs/fraktionslog.log"

function outputFraktionsLog ( text )

	local fraktionsLog = fileOpen ( fraktionsLogPath, false )
	local filesize = fileGetSize ( fraktionsLog )
	fileSetPos ( fraktionsLog, filesize )
	fileWrite ( fraktionsLog, timestamp()..": "..text.."\n" )
	fileClose ( fraktionsLog )
end