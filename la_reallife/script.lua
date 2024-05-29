function joinHandler()

	setElementDimension ( source, 5 )
    fadeCamera( source, true)
    setCameraTarget( source, source )
	
	if isWithinNightTime () then
		setCameraMatrix ( source, -1991.32, -617.9, 56.8, -2080.488, -823.09, 83.6, 0, 70 )
	else
		setCameraMatrix ( source, -1991.32, -617.9, 56.8, -2080.488, -823.09, 83.6, 0, 70 )
	end
	syncInvulnerablePedsWithPlayer (source)
end
addEventHandler("onPlayerJoin", getRootElement(), joinHandler)

--[[function isSerialValid ( player )

	local serial = getPlayerSerial ( player )
	local validserial = true
	for i = 32, 46 do
		if gettok ( serial, 1, string.byte(i) ) == serial then
		else
			validserial = false
			outputDebugString ( "Char "..tostring(i) )
			outputDebugString ( serial )
			outputDebugString ( gettok ( serial, 1, string.byte(i) ) )
		end
	end
	for i = 58, 64 do
		if gettok ( serial, 1, string.byte(i) ) ~= serial then
			validserial = false
			outputDebugString ( "Char "..tostring(i) )
			outputDebugString ( serial )
			outputDebugString ( gettok ( serial, 1, string.byte(i) ) )
		end
	end
	for i = 91, 96 do
		if gettok ( serial, 1, string.byte(i) ) ~= serial then
			validserial = false
			outputDebugString ( "Char "..tostring(i) )
			outputDebugString ( serial )
			outputDebugString ( gettok ( serial, 1, string.byte(i) ) )
		end
	end
	for i = 123, 126 do
		if gettok ( serial, 1, string.byte(i) ) ~= serial then
			validserial = false
			outputDebugString ( "Char "..tostring(i) )
			outputDebugString ( serial )
			outputDebugString ( gettok ( serial, 1, string.byte(i) ) )
		end
	end
	if validserial then
		return true
	else
		return false
	end
end]]

invalidChars = {}
for i = 33, 39 do
invalidChars[i] = true
end
for i = 40, 43 do
invalidChars[i] = true
end
invalidChars[47] = true
for i = 58, 64 do
invalidChars[i] = true
end
invalidChars[92] = true
invalidChars[94] = true
invalidChars[96] = true
for i = 123, 126 do
invalidChars[i] = true
end

function hasInvalidChar ( player )

	name = getPlayerName ( player )
	for i, index in pairs ( invalidChars ) do
		if not gettok ( name, 1, i ) or gettok ( name, 1, i ) ~= name then
			return true
		end
	end
	return false
end

function serverstart ()

	setGameType ( "LA Reallife" )
	setMapName ( "Los Angeles" )
	lastadtime = 0
	for i = 1, 14 do
		_G["arenaSlot"..i.."Occupied"] = false
	end
	setTimer ( checkRestartTimer, 50000, -1 )
	clearPlayerList()
end
addEventHandler ( "onResourceStart", getResourceRootElement ( getThisResource() ), serverstart )

function clearPlayerList()

	local loggedresult = mysql_query(handler, "SELECT * FROM loggedin")
	if loggedresult then
		loggedsatz = mysql_fetch_assoc(loggedresult)
		while loggedsatz do
			MySQL_DelRow("loggedin", "Name LIKE '"..loggedsatz["Name"].."'")
			loggedsatz = mysql_fetch_assoc(loggedresult)
		end
	end
	mysql_free_result(loggedresult)
end

function checkRestartTimer ()

	local curtime = getRealTime()
	local hour = curtime.hour
	local minute = curtime.minute
	if hour == 4 and minute == 0 then
		restartServer()
	elseif hour == 3 and minute == 55 then
		outputChatBox ( "ACHTUNG: Server restartet in 5 Minuten!", getRootElement(), 200, 20, 20 )
		local time = getRealTime()
		if time.weekday == 6 then
			local result = mysql_query ( handler, "TRUNCATE TABLE weed" )
			mysql_free_result ( result )
		end
	end
end

function checkForEmptyTrucks ()

	local vehicles = getElementsByType ( "vehicle" )
	for theKey,theVehicle in ipairs(vehicles) do
		local model = getElementModel ( theVehicle )
		if model then
			if getVehicleOccupant(theVehicle) == false and trucks[model] then
				destroyElement ( getVehicleTowedByVehicle ( theVehicle ) )
				destroyElement ( theVehicle )
			elseif getVehicleOccupant(theVehicle) == false and truckTrailer[model] and not getVehicleTowingVehicle ( theVehicle ) then
				destroyElement ( theVehicle )
			end
		end
	end
end
--setTimer ( checkForEmptyTrucks, 60000, -1 )
--[[
badData = { ["adminlvl"]=true, ["money"]=true, [""]=true }
function dataChange ( data, value )

	if client then
		if badData[data] then
			setElementData ( source, data, value )
		end
	end
end
addEventHandler ( "onElementDataChange", getRootElement(), dataChange )]]