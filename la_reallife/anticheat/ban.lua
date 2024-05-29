function banLAPlayer ( player, reason )

	reason = MySQL_Save ( reason )
	if client then
		if player == client then
			if reason ~= "Event-Faking" and reason ~= "EventFaking" and reason ~= "Event Faking" then
				local pname = MySQL_Save(getPlayerName(player))
				outputChatBox ( pname.." wurde vom Anticheatsystem gebannt.", getRootElement(), 255, 0, 0 )
				local ip = getPlayerIP ( player )
				local serial = getPlayerSerial ( player )
				mysql_la_query ( "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..pname.."', 'Anticheat', '"..reason.."', '"..timestamp().."', '"..ip.."', '"..serial.."')")
				kickPlayer ( player, "Vom Anticheat gebannt!" )
			end
		end
	end
end
--[[
function timeBanTimersStart ()

	timeBans = {}
	timeBanReasons = {}
	local result = mysql_query ( handler, "SELECT * FROM ban" )
	bans = mysql_fetch_assoc ( result )
	if bans then
		insertIntoTbanTable ()
	end
end
timeBanTimersStart ()

function insertIntoTbanTable ()

	local key = bans["Name"]
	
	if bans["STime"] > 0 then
		timeBans[key] = bans["STime"]
		timeBanReasons[key] = bans["Grund"]
	end
	
	bans = mysql_fetch_assoc ( result )
	if bans then
		insertIntoTbanTable ()
	else
		mysql_free_result ( result )
		tbanRefresh ()
	end
end

function tbanRefresh ()

	local sec = getTBanSecTime ( duration )
	for key, index in pairs ( timeBans ) do
		local diff = index - sec
		if diff <= 1200000 then
			setTimer ( MySQL_DelRow, diff * 1000, 1, "ban", "Name LIKE '"..key.."'")
			timeBans[key] = nil
			timeBanReasons[key] = nil
		end
	end
	setTimer ( tbanRefresh, 1200000, 1 )
end]]

function banLaPlayerServer ( player, reason )
	
	if reason ~= "Event Faking" then
		reason = MySQL_Save ( reason )
		local pname = MySQL_Save(getPlayerName(player))
		outputChatBox ( pname.." wurde vom Anticheatsystem gebannt.", getRootElement(), 255, 0, 0 )
		local ip = getPlayerIP ( player )
		local serial = getPlayerSerial ( player )
		mysql_la_query ( "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..pname.."', 'Anticheat', '"..reason.."', '"..timestamp().."', '"..ip.."', '"..serial.."')")
		kickPlayer ( player, "Vom Anticheat gebannt!" )
	end
end

function timebanPlayer ( pname, time, admin, reason )

	local player = getPlayerFromName ( pname )
	if player then
		kickPlayer ( player, "Du wurdest für "..time.." Stunden von "..admin.." gebannt! ( "..reason..")" )
	end
	local exist = MySQL_DatasetExist ( "players", "Name LIKE '"..pname.."'")
	if exist then
		local sec = getTBanSecTime ( time )
		mysql_la_query ( "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial, STime) VALUES ('"..pname.."', '"..admin.."', '"..reason.."', '"..timestamp().."', '0.0.0.0', 'Timeban', '"..sec.."' ) " )
		return true
	end
	return false
end

function getTBanSecTime ( duration )

	return getSecTime ( duration )
end

--58199887
--58211893

function getSecTime ( duration )

	local time = getRealTime()
	local year = time.year
	local day = time.yearday
	local hour = time.hour
	local minute = time.minute
	
	local total = year * 365 * 24 * 60 + day * 24 * 60 + ( hour + duration ) * 60 + minute
	
	return total
end
outputServerLog ( tostring ( getSecTime ( - ( 3 * 24 * 60 * 60 + 1 ) ) ) )