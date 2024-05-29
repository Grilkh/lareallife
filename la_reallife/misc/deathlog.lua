------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

deathLogPath = ":"..resourceName.."/logs/deathlog.log"

function outputDeathLog ( text )

	local deathLog = fileOpen ( deathLogPath, false )
	local filesize = fileGetSize ( deathLog )
	fileSetPos ( deathLog, filesize )
	fileWrite ( deathLog, timestamp()..": "..text.."\n" )
	fileClose ( deathLog )
end