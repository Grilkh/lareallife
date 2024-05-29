------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2013 ------------
------------------------------

local LogPath = ":"..resourceName.."/logs/"

function outputLog ( text, logname )

	if not logname then
		logname = "misc"
	end
	logname = logname..".log"
	local log = getLog ( LogPath..logname )
	local filesize = fileGetSize ( log )
	fileSetPos ( log, filesize )
	fileWrite ( log, logTimestamp()..": "..text.."\n" )
	fileClose ( log )
end

function getLog ( path )

	if not fileExists ( path ) then
		fileClose ( fileCreate ( path ) )
	end
	return fileOpen ( path, false )
end

function logTimestamp ()

	local logtime = getRealTime()
	local year = tostring ( logtime.year + 1900 )
	local month = tostring ( logtime.month + 1 )
	local day = tostring ( logtime.monthday )
	local hour = tostring ( logtime.hour )
	local minute = tostring ( logtime.minute )
	local second = tostring ( logtime.second + 1 )
	
	if #month == 1 then
		month = "0"..month
	end
	if #day == 1 then
		day = "0"..day
	end
	if #hour == 1 then
		hour = "0"..hour
	end
	if #minute == 1 then
		minute = "0"..minute
	end
	if #second == 1 then
		second = "0"..second
	end
	
	return "["..day.."-"..month.."-"..year.." "..hour..":"..minute..":"..second.."]"
end


function outputAdminLog ( text )

	outputLog ( text, "admin" )
	
end


function outputAdminChatLog ( text )

	outputLog ( text, "adminchat" )
	
end

function outputBadLog ( text )

	outputLog ( text, "bad" )
	
end

function outputDeathLog ( text )

	outputLog ( text, "death" )
	
end

function outputLottoLog ( text )

	outputLog ( text, "lotto" )
	
end

function outputPayLog ( text )

	outputLog ( text, "pay" )
	
end

function outputUseLog ( text )

	outputLog ( text, "use" )
	
end

function outputFraktionsLog ( text )

	outputLog ( text, "fraktions" )
	
end

function outputPdLog ( text )

	outputLog ( text, "pd" )
	
end