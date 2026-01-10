useLogPath = ":"..resourceName.."/logs/uselog.log"

function outputUseLog ( text )

	local useLog = fileOpen ( useLogPath, false )
	local filesize = fileGetSize ( useLog )
	fileSetPos ( useLog, filesize )
	fileWrite ( useLog, timestamp()..": "..text.."\n" )
	fileClose ( useLog )
end