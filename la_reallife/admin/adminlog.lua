------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

adminLogPath = ":"..resourceName.."/logs/adminlog.log"

function outputAdminLog ( text )

	local adminLog = fileOpen ( adminLogPath, false )
	local filesize = fileGetSize ( adminLog )
	fileSetPos ( adminLog, filesize )
	fileWrite ( adminLog, timestamp()..": "..text.."\n" )
	fileClose ( adminLog )
end


AdminChatLogPath = ":"..resourceName.."/logs/adminchatlog.log"

function outputAdminChatLog ( text )

	local AdminChatLog = fileOpen ( AdminChatLogPath, false )
	local filesize = fileGetSize ( AdminChatLog )
	fileSetPos ( AdminChatLog, filesize )
	fileWrite ( AdminChatLog, timestamp()..": "..text.."\n" )
	fileClose ( AdminChatLog )
end