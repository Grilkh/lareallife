------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

lottoLogPath = ":"..resourceName.."/logs/lottolog.log"

function outputLottoLog ( text )

	local lottoLog = fileOpen ( lottoLogPath, false )
	local filesize = fileGetSize ( lottoLog )
	fileSetPos ( lottoLog, filesize )
	fileWrite ( lottoLog, timestamp()..": "..text.."\n" )
	fileClose ( lottoLog )
end