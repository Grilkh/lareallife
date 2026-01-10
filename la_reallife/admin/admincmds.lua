adminsIngame = {}

function executeAdminServerCMD_func ( cmd, arguments )

	executeCommandHandler ( cmd, client, arguments )
end
addEvent ( "executeAdminServerCMD", true )
addEventHandler ( "executeAdminServerCMD", getRootElement(), executeAdminServerCMD_func )

function help_func ( player )
if getElementData ( player, "sprache" ) == "Deutsch" then
	outputChatBox ( "Wichtige Befehle: /admins = Admins anzeigen, /kontakt [Text] bei Problemen, /rebind bei Problemen mit dem Klicksystem.", player, 125, 125, 0 )
else
	outputChatBox ( "Important commands: /admins = Show Admins, /contact [text] if you have problems, /rebind when you've got problems with the click system.", player, 125, 125, 0 )
end
end
addCommandHandler ( "hilfe", help_func )
addCommandHandler ( "help", help_func )

function reporting_func ( player )
if getElementData ( player, "sprache" ) == "Deutsch" then
	outputChatBox ( "Verwende bitte /hilfe für Informationen und Kontakt mit den Admins!", player, 125, 125, 0 )
else
	outputChatBox ( "Please use /contact!", player, 125, 125, 0 )
end
end
addCommandHandler ( "report", reporting_func )

function nickchange_func ( player, cmd, alterName, neuerName )

	local alterName = MySQL_Save ( alterName )
	local neuerName = MySQL_Save ( neuerName )
	if isServerleitung(player) then
		if not getPlayerFromName ( alterName ) then
			if MySQL_DatasetExist ( "players", "Name LIKE '"..alterName.."'") then
				if not MySQL_DatasetExist ( "players", "Name LIKE '"..neuerName.."'") then
					if not MySQL_DatasetExist ( "userdata", "Name LIKE '"..neuerName.."'") then
						-- Data --
						MySQL_SetString ( "achievments", "Name", neuerName, "Name LIKE '"..alterName.."'")
						MySQL_SetString ( "biz", "Inhaber", neuerName, "Inhaber LIKE '"..alterName.."'")
						MySQL_SetString ( "bonustable", "Name", neuerName, "Name LIKE '"..alterName.."'")
						MySQL_SetString ( "houses", "Besitzer", neuerName, "Besitzer LIKE '"..alterName.."'")
						MySQL_SetString ( "inventar", "Name", neuerName, "Name LIKE '"..alterName.."'")
						MySQL_SetString ( "jobdata", "Name", neuerName, "Name LIKE '"..alterName.."'")
						MySQL_SetString ( "logout", "Name", neuerName, "Name LIKE '"..alterName.."'")
						MySQL_SetString ( "packages", "Name", neuerName, "Name LIKE '"..alterName.."'")
						MySQL_SetString ( "players", "Name", neuerName, "Name LIKE '"..alterName.."'")
						MySQL_SetString ( "prestige", "Besitzer", neuerName, "Besitzer LIKE '"..alterName.."'")
						MySQL_SetString ( "userdata", "Name", neuerName, "Name LIKE '"..alterName.."'")
						MySQL_SetString ( "vehicles", "Besitzer", neuerName, "Besitzer LIKE '"..alterName.."'")
						if MySQL_DatasetExist ( "ban", "Name LIKE '"..alterName.."'") then
							MySQL_SetString ( "ban", "Name", neuerName, "Name LIKE '"..alterName.."'")
						end
						outputLog ( "[AENDERUNG]:"..getPlayerName ( player ).." hat "..alterName.." in "..neuerName.." umbenannt.", "admin" )
						
						outputChatBox ( "Du hast den Spieler "..alterName.." in "..neuerName.." umbenannt!", player, 0, 125, 0 )
					else
						outputChatBox ( "Es existiert bereits eine Userdata mit diesem Namen!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Der neue Name ist bereits vergeben!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Der Spieler existiert nicht!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Der Spieler ist noch online!", player, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "nickchange", nickchange_func )

function pwchange_func ( player, cmd, target, newPW )

	if isServerleitung(player) then
		if newPW and target then
			local tname = getPlayerFromName (target)
			if getElementData ( target, "loggedin" ) == 1 then
				outputChatBox ( "Der Spieler ist noch online!", player, 125, 0, 0 )
			else
				local target = MySQL_Save ( target )
				local newPW = MySQL_Save ( newPW )
				local salted = saltPassword ( target, newPW )
				--local empty = ""
				MySQL_SetString( "players", "Passwort", md5(salted), "Name LIKE '" ..target.."'")
				--MySQL_SetString( "players", "Salt", empty, "Name LIKE '" ..target.."'")
				outputChatBox ( "Passwort geändert!", player, 0, 125, 0 )
				outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat das Passwort von "..target.." geaendert.", "admin" )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( getPlayerName(player).." hat das Passwort von "..target.." geändert.", playeritem, 200, 200, 0 )
				end
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\Verwende: /pwchange [Name] [Passwort]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "pwchange", pwchange_func )

function query_func ( player, cmd, sicherheit, ...)
if isServerleitung(player) then
	if sicherheit == "abcdefg" then
		local parametersTable = {...}
		local query = table.concat( parametersTable, " " )
		if isServerleitung(player) then
			local result = mysql_la_query ( query )
			outputChatBox ( "Query: "..tostring ( result ), player, 0, 125, 0 )
		end
	end
else
	local pname = getPlayerName(player)
	outputChatBox ("Spieler "..pname.." wurde vom Sicherheitssystem gebannt! (Grund: Adminquery)",getRootElement(),255,0,0)
	outputLog ( "[BAN]: Spieler "..pname.." wurde vom Sicherheitssystem gebannt! (Grund: Adminquery)", "admin" )
	local ip = getPlayerIP ( player )
	local serial = getPlayerSerial ( player )
	-- mysql_query(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..pname.."', 'Sicherheitssystem', 'Adminquery', '"..timestamp().."', '"..ip.."', '"..serial.."')")
	dbQuery(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..pname.."', 'Sicherheitssystem', 'Adminquery', '"..timestamp().."', '"..ip.."', '"..serial.."')")
	kickPlayer ( player, "Von: Sicherheitssystem, Grund: Adminquery gebannt!" )
end
end
addCommandHandler ( "query", query_func )


function shut_func ( player, cmd, sicherheit )
if isServerleitung(player) then
	if sicherheit == "abcdefg" then
		if isServerleitung(player) then
			outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat die Notabschaltung benutzt.", "admin" )
			shutdown ( "Abgeschaltet von: "..getPlayerName ( player ) )
		end
	end
else
	local pname = getPlayerName(player)
	outputChatBox ("Spieler "..pname.." wurde vom Sicherheitssystem gebannt! (Grund: Shutcommand)",getRootElement(),255,0,0)
	outputLog ( "[BAN]: Spieler "..pname.." wurde vom Sicherheitssystem gebannt! (Grund: Shutcommand)", "admin" )
	local ip = getPlayerIP ( player )
	local serial = getPlayerSerial ( player )
	-- mysql_query(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..pname.."', 'Sicherheitssystem', 'Shutcommand', '"..timestamp().."', '"..ip.."', '"..serial.."')")
	dbQuery(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..pname.."', 'Sicherheitssystem', 'Shutcommand', '"..timestamp().."', '"..ip.."', '"..serial.."')")
	kickPlayer ( player, "Von: Sicherheitssystem, Grund: Shutcommand gebannt!" )
end
end
addCommandHandler ( "shut", shut_func )


function rebind_func ( player )

	if isKeyBound ( player, "ralt", "down", showcurser ) then
		unbindKey ( player, "ralt", "down", showcurser )
	end
	if isKeyBound ( player, "m", "down", showcurser ) then
		unbindKey ( player, "m", "down", showcurser )
	end
	if isKeyBound ( player, "f1", "down", showhmenue ) then
		unbindKey ( player, "f1", "down", showhmenue )
	end
	if isKeyBound ( player, "r", "down", reload ) then
		unbindKey ( player, "r", "down", reload )
	end
	if isKeyBound ( player, "y", "down", "chatbox", "t" ) then
		unbind ( player, "y", "down", "chatbox", "t" )
	end
	bindKey ( player, "ralt", "down", showcurser, player )
	bindKey ( player, "m", "down", showcurser, player )
	bindKey ( player, "f1", "down", showhmenue, player )
	bindKey ( player, "r", "down", reload )
	bindKey ( player, "Y", "down", "chatbox", "t" ) 
	outputChatBox ( "[INFO]: Hotkeys wurden neu gelegt!", player, 225, 225, 0 )
end
addCommandHandler ( "rebind", rebind_func )

function adminlist ( player )

if getElementData ( player, "sprache" ) == "Deutsch" then
	outputChatBox ( "Folgende Teammitglieder stehen dir zur Verfügung:", player, 100, 200, 50 )
else
	outputChatBox ( "Admins which are here for you:", player, 100, 200, 50 )
end
	for key, index in pairs(adminsIngame) do
		if index == 6 then
			outputChatBox ( getPlayerName(key)..", Inhaber", player, 250, 0, 0 )
		elseif index == 5 then
			outputChatBox ( getPlayerName(key)..",  Serverleiter", player, 200, 0, 0 )
		elseif index == 4 then
			outputChatBox ( getPlayerName(key)..", Administrator", player, 150, 0, 0 )
		elseif index == 3 then
			outputChatBox ( getPlayerName(key)..", Super Moderator", player, 0, 50, 250 )
		elseif index == 2 then
--[[			if getPlayerName ( key ) == "[LA]Leyynen" then
				lvl = "Inhaber"
			else
				lvl = "Serverleiter"
			end]]
			outputChatBox ( getPlayerName(key)..", Moderator", player, 250, 250, 50 )
		elseif index == 1 then
			outputChatBox ( getPlayerName(key)..", Supporter", player, 0, 125, 0 )
		end
	end
--[[	for key, index in pairs(SupporterIngame) do 
			if index >= 1 then
				outputChatBox ( "+1 Ticketsupporter!", player, 0, 100, 0 )
			end
	end]]

end
addCommandHandler ("admins", adminlist )
addCommandHandler ("team", adminlist )

function check_func ( admin, cmd, target )

	if isSupporter(admin) then
		local player = getPlayerFromName(target)
		if getElementData ( player, "loggedin" ) == 1 then
			if isHigherAdmin (admin, player) then
				local playtime = getElementData ( player, "playingtime" )
				local playtimehours = math.floor(playtime/60)
				local playtimeminutes = playtime-playtimehours*60
				local playtime = playtimehours..":"..playtimeminutes
				outputChatBox ( "Name: "..getPlayerName(player).." ( ID: "..laGetElementData(player,"playerid").." ), Geld ( Bar/Bank ): "..getElementData ( player, "money" ).."/"..getElementData ( player, "bankmoney" )..", Spielzeit: "..playtime.." Minuten", admin, 200, 200, 0 )
				local job = getElementData ( player, "job" )
				outputChatBox ( "Job: "..job..", Warns: "..getElementData ( player, "warns" )..", Telefonnr: "..getElementData ( player, "telenr" ), admin, 200, 200, 0 )
				outputChatBox ( "Tode: "..getElementData ( player, "deaths" )..", Kills: "..getElementData ( player, "kills" )..", Weed: "..getElementData ( player, "weed" )..", Kokain: "..getElementData ( player, "koks" )..", Materialien: "..getElementData ( player, "mats" ), admin, 200, 200, 0 )
				outputChatBox ( "Werber: "..laGetElementData ( player, "werber" ), admin, 200, 200, 0 )
				local fraktion = tonumber ( getElementData ( player, "fraktion" ) )
				if fraktion == 0 then
					local fraktion = "Zivilist"
				elseif fraktion == 1 then
					local fraktion = "LAPD"
				elseif fraktion == 2 then
					local fraktion = "Camorra"
				elseif fraktion == 3 then
					local fraktion = "Yakuza"
				elseif fraktion == 4 then
					local fraktion = "Emergency"
				elseif fraktion == 5 then
					local fraktion = "Reporter"
				elseif fraktion == 6 then
					local fraktion = "FBI"
				elseif fraktion == 7 then
					local fraktion = "Surenos"
				elseif fraktion == 8 then
					local fraktion = "Army"
				elseif fraktion == 9 then
					local fraktion = "Compton Families"
				elseif fraktion == 10 then
					local fraktion = "Watts Soldiers"
				elseif fraktion == 10 then
					local fraktion = "Terroristen"
				end
				outputChatBox ( "Fraktion: "..fraktion..", Adminlevel: "..getElementData ( player, "adminlvl" ).."", admin, 200, 200, 0 )
				local pname = getPlayerName ( player )
				local licenses = ""
				if getElementData ( player, "carlicense" ) == 1 then licenses = licenses.."Führersch., " end
				if getElementData ( player, "bikelicense" ) == 1 then licenses = licenses.."Motorradsch., " end
				if getElementData ( player, "fishinglicense" ) == 1 then licenses = licenses.."Angelsch., " end
				if getElementData ( player, "lkwlicense" ) == 1 then licenses = licenses.."LKW-Sch., " end
				if getElementData ( player, "gunlicense" ) == 1 then licenses = licenses.."Waffensch. A, " end
				if getElementData ( player, "gunlicenseB" ) == 1 then licenses = licenses.."B, " end
				if getElementData ( player, "gunlicenseC" ) == 1 then licenses = licenses.."C, " end
				if getElementData ( player, "motorbootlicense" ) == 1 then licenses = licenses.."Bootsch., " end
				if getElementData ( player, "segellicense" ) == 1 then licenses = licenses.."Segelsch., " end
				if getElementData ( player, "planelicenseb" ) == 1 then licenses = licenses.."Flugsch. A, " end
				if getElementData ( player, "planelicensea" ) == 1 then licenses = licenses.."B, " end
				if getElementData ( player, "helilicense" ) == 1 then licenses = licenses.."Helisch. " end
				outputChatBox ( "Vorhandene Scheine: ", admin, 200, 0, 200 )
				outputChatBox ( licenses, admin, 200, 50, 200 )
				executeCommandHandler ( "getchangestate", admin, getPlayerName(player) )
				outputChatBox ( "IP: "..getPlayerIP(player), admin, 200, 200, 0 )
				outputChatBox ( "Serial: "..getPlayerSerial(player), admin, 200, 200, 0 )
				outputChatBox ( "Aktuelle Waffe: "..getPedWeapon(player), admin, 125, 125, 125 )
				outputLog ( "[BEFEHL]: "..getPlayerName ( admin ).." hat "..getPlayerName(player).." gecheckt.", "admin" )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( getPlayerName(admin).." hat "..getPlayerName(player).." gecheckt.", playeritem, 200, 200, 0 )
				end
			else
				triggerClientEvent ( admin, "infobox_start", getRootElement(), "\n\Höherer Admin!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( admin, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht\nonline/eingeloggt!", 5000, 150, 0, 0 )
		end
	else
		triggerClientEvent ( admin, "infobox_start", getRootElement(), "\n\nDu bist kein Supporter!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "check", check_func )


function myid_func ( player )
outputChatBox ( "Deine persönliche ID: "..laGetElementData(player,"playerid").."", player, 125, 125, 125 )
outputChatBox ( "Bitte trage diese ID in der Freischaltungsanfrage im Forum ein.", player, 125, 125, 125 )
end
addCommandHandler ( "myid", myid_func )
addCommandHandler ( "meineid", myid_func )

function mark_func ( player )

	if isAdmin(player) then
		local x, y, z = getElementPosition ( player )
		local int = getElementInterior ( player )
		local dim = getElementDimension ( player )
		setElementData ( player, "dingsx", x )
		setElementData ( player, "dingsy", y )
		setElementData ( player, "dingsz", z )
		setElementData ( player, "dingsi", int )
		setElementData ( player, "dingsd", dim )
		outputChatBox ( "Koordinaten gespeichert!", player, 0, 0, 0 )
		outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat sich einen Mark erstellt.", "admin" )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "mark", mark_func )

function gotomark_func ( player )

	if isAdmin(player) then
		local x = getElementData ( player, "dingsx" )
		local y = getElementData ( player, "dingsy" )
		local z = getElementData ( player, "dingsz" )
		local int = getElementData ( player, "dingsi" )
		local dim = getElementData ( player, "dingsd" )
		local seat = getPedOccupiedVehicleSeat ( player )
		if seat == 0 then
			local veh = getPedOccupiedVehicle ( player )
			setElementPosition ( veh, x, y, z )
			setElementInterior ( veh, int )
			setElementDimension ( veh, dim )
			setElementFrozen ( veh, true )
			setTimer ( setElementFrozen, 500, 1, veh, false )
		else
			removePedFromVehicle ( player )
			setElementPosition ( player, x, y, z )
			setElementInterior ( player, int )
			setElementDimension ( player, dim )
		end
		outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat sich zu seinem Mark teleportiert.", "admin" )
	end
end
addCommandHandler ( "gotomark", gotomark_func )

function whisper_func ( player, cmd, target, ... )
	
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	local target = tonumber ( target )
	if isSupporter(player) then
		if stringWithAllParameters == nil then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Text eingeben!", 5000, 125, 0, 0 )
		else
			for id, playeritem in ipairs(getElementsByType("player")) do 
				if getElementData ( playeritem, "playerid" ) then
					if laGetElementData ( playeritem, "playerid" ) == target then
						target = getPlayerName(playeritem)
					if getElementData ( playeritem, "sprache" ) == "Deutsch" then
						outputChatBox ( getPlayerName(player).." supportet: "..stringWithAllParameters, playeritem, 200, 200, 0 )
						outputChatBox ( "Tippe /antworten, um zu antworten.", playeritem, 200, 200, 0 )
					else
						outputChatBox ( getPlayerName(player).." offers help: "..stringWithAllParameters, playeritem, 200, 200, 0 )
						outputChatBox ( "Type /reply to reply.", playeritem, 200, 200, 0 )
					end
						outputChatBox ( "Du hast "..getPlayerName(playeritem).." supportet!", player, 0, 125, 0 )
						laSetElementData ( playeritem, "supporter", player )
						laSetElementData ( playeritem, "isInSupport", true )
						outputLog ( "[W-CHAT]: "..getPlayerName(player).." an "..getPlayerName(playeritem)..": "..stringWithAllParameters.."", "adminchat" )
						outputLog ( "[SUPPORT]: "..getPlayerName ( player ).." hat "..getPlayerName(playeritem).." supportet!", "admin" )
					end
					if isSupporter(playeritem) then
						outputChatBox ( getPlayerName(player).." hat "..target.." supportet!", playeritem, 200, 200, 0 )
					end
				end
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Supporter!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "w", whisper_func )

function reply_func ( player, cmd, ... )
	
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	if laGetElementData ( player, "isInSupport" ) then
		local supporter = laGetElementData ( player, "supporter" )
		if isElement ( supporter ) then
			outputChatBox ( getPlayerName ( player ).." (ID: "..laGetElementData(player,"playerid").."): "..stringWithAllParameters, supporter, 200, 200, 0 )
			outputChatBox ( "Du hast "..getPlayerName ( supporter ).." geantwortet!", player, 0, 125, 0 )
			outputLog ( "[W-ANTWORT]: "..getPlayerName(player).." an "..getPlayerName ( supporter )..": "..stringWithAllParameters.."", "adminchat" )
			outputLog ( "[SUPPORT]: "..getPlayerName ( player ).." hat "..getPlayerName(supporter).." geantwortet!", "admin" )
		else
			outputChatBox ( "Der Supporter ist offline.", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "reply", reply_func )
addCommandHandler ( "antworten", reply_func )

function respawn_func ( player, cmd, respawn )

	if isSupporter(player) then
		if respawn == "faggio" then
			for i = 1, 52 do
				if getVehicleOccupant ( _G["noobcar"..i] ) == false then
					respawnVehicle ( _G["noobcar"..i] )
					setElementDimension ( _G["noobcar"..i], 0 )
					setElementInterior ( _G["noobcar"..i], 0 )
				end
			end
		elseif respawn == "fishing" then
			for i = 1, 9 do
				if getVehicleOccupant ( _G["reefer"..i] ) == false then
					respawnVehicle ( _G["reefer"..i] )
					setElementDimension ( _G["reefer"..i], 0 )
					setElementInterior ( _G["reefer"..i], 0 )
				end
			end
		elseif respawn == "sfpd" or respawn == "lapd" then
			for key, index in pairs ( stateVehs ) do
				if not getVehicleOccupant ( key ) then
					respawnVehicle ( key )
				end
			end
		elseif respawn == "terror" then
			for key, index in pairs ( terrorvehicles ) do
				if not getVehicleOccupant ( key ) then
					respawnVehicle ( key )
				end
			end
			--[[for i = 1, 5 do
				if not getVehicleOccupant ( _G["TerrorVeh"..i] ) then
					respawnVehicle ( _G["TerrorVeh"..i] )
				end
			end]]--
		elseif respawn == "camorra" then
			for key, index in pairs ( camorraVehicles ) do
				if not getVehicleOccupant ( key ) then
					respawnVehicle ( key )
				end
			end
		elseif respawn == "yakuza" then
			for key, index in pairs ( yakuzavehicles ) do
				if not getVehicleOccupant ( key ) then
					respawnVehicle ( key )
				end
			end
		elseif respawn == "mechaniker" then
			for key, index in pairs ( mechanikerVehicles ) do
				if not getVehicleOccupant ( key ) then
					respawnVehicle ( key )
				end
			end
		elseif respawn == "medic" then
			for key, index in pairs ( medicVehicles ) do
				if not getVehicleOccupant ( key ) then
					respawnVehicle ( key )
				end
			end
		elseif respawn == "lat" then
			for key, index in pairs ( NewsVehicles ) do
				if not getVehicleOccupant ( key ) then
					respawnVehicle ( key )
				end
			end
		elseif respawn == "fbi" then
			for key, index in pairs ( federalVehicles ) do
				if not getVehicleOccupant ( key ) then
					respawnVehicle ( key )
				end
			end
		elseif respawn == "taxi" then
			for key, index in pairs ( taxiVehs ) do
				local veh = key
				if not getVehicleOccupant ( veh ) then
					respawnVehicle ( veh )
				end
			end
		elseif respawn == "hotdog" then
			for i = 1, 6 do
				local veh = _G["hotdog"..i]
				if not getVehicleOccupant ( veh ) then
					respawnVehicle ( veh )
				end
			end
		elseif respawn == "surenos" then
			for veh, _ in pairs ( surenosVehicles ) do
				if not getVehicleOccupant ( veh ) then
					respawnVehicle ( veh )
				end
			end
		elseif respawn == "army" then
			for veh, _ in pairs ( armyVehs ) do
				if not getVehicleOccupant ( veh ) then
					respawnVehicle ( veh )
				end
			end
		elseif respawn == "compton" then
			for veh, _ in pairs ( comptonvehicles ) do
				if not getVehicleOccupant ( veh ) then
					respawnVehicle ( veh )
				end
			end
		elseif respawn == "watts" then
			for key, index in pairs ( wattsvehicles ) do
				if not getVehicleOccupant ( key ) then
					respawnVehicle ( key )
				end
			end
		else
			outputChatBox ( "/respawn [lapd|camorra|yakuza|mechaniker|medic|lat|fbi|surenos|army|compton|watts]", player, 125, 125, 255 )
			outputChatBox ( "[faggio|fishing|taxi|hotdog]", player, 125, 125, 255 )
			bool = true
		end
		if bool == true then
		else
			outputChatBox ( "[INFO]: Fahrzeuge respawnt!", player, 225, 225, 0 )
			outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat "..respawn.." respawnt.", "admin" )
			for playeritem, key in pairs(adminsIngame) do
				outputChatBox ( getPlayerName(player).." hat "..respawn.." respawnt.", playeritem, 200, 200, 0 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Supporter!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("respawn", respawn_func )

function tunecar_func ( player, cmd, part )

	if isServerleitung(player) then
		if tonumber ( part ) then
			succes = addVehicleUpgrade ( getPedOccupiedVehicle(player), tonumber ( part ) )
			if succes == false then
				outputChatBox ( "Ungültige Eingabe/Fahrzeug!", player, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /tunecar [Part]", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("tunecar", tunecar_func )

function rfreeze_func ( player, cmd, target )

	if getElementType(player) == "console" then
		laSetElementData ( player, "adminlvl", 99 )
	end
	if isAdmin(player) then
		local target = getPlayerFromName ( target )
		if getElementData ( target, "loggedin" ) == 1 then
			if isHigherAdmin (admin, target) then
				local veh = getPedOccupiedVehicle ( target )
				if veh then
					setElementFrozen ( veh, not isElementFrozen ( veh ) )
				else
					setElementFrozen ( target, not isElementFrozen ( target ) )
				end
				if isElementFrozen ( target ) then
					fix = "gefreezed."
				else
					fix = "unfreezed."
				end
				outputChatBox ( "Du hast "..getPlayerName(target).." "..fix, player, 0, 125, 0 )
				outputChatBox ( "Du wurdest von "..getPlayerName(player).." "..fix, target, 0, 125, 0 )
				outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat "..getPlayerName(target).." "..fix, "admin" )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( getPlayerName(player).." hat "..getPlayerName(target).." "..fix, playeritem, 200, 200, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht\nonline/eingeloggt!", 5000, 150, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "rfreeze", rfreeze_func )

function intdim ( player, cmd, target, int, dim )

	if isSMod(player) then
		local target = getPlayerFromName ( target )
		setElementInterior ( target, tonumber ( int ) )
		setElementDimension ( target, tonumber ( dim ) )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Super Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("intdim", intdim )

function cleartext_func ( player )

	if getElementType(player) == "console" then
		laSetElementData(player, "adminlvl", 99 )
	end
	if isAdmin(player) then
		for i = 1, 100 do
			outputChatBox ( " " )
		end
		outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat den Chat gecleart.", "admin" )
		for playeritem, key in pairs(adminsIngame) do
			outputChatBox ( getPlayerName(player).." hat den Text gecleart.", playeritem, 200, 200, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("cleartext", cleartext_func )

function gmx_func ( player, cmd, minutes, grund )
	
	if getElementType(player) == "console" then
		laSetElementData ( player, "adminlvl", 99 )
	end
	if isServerleitung(player) then
		if getPlayerName ( player ) ~= "[LA]Tobi" then
			if not tonumber(minutes) then
				outputChatBox ( "Verwende /gmx [Zeit] [Grund]", player, 175, 0, 0 )
				return
			elseif grund then
				if tonumber(minutes) <= 0 then
					minutes = 1
				end
				minutes = tonumber(minutes)
				restartServerTimer = setTimer ( restartServer, minutes*60000, 1, grund )
				if minutes == 1 then
					outputChatBox ( "[HINWEIS]: Der Server wird in einer Minute neu gestartet. (Grund: "..grund..")", getRootElement(), 200, 0, 0 )
					outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." will den Server in einer Minute neustarten.", "admin" )
				else
					outputChatBox ( "[HINWEIS]: Der Server wird in "..minutes.." Minuten neu gestartet. (Grund: "..grund..")", getRootElement(), 200, 0, 0 )
					outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." will den Server in "..minutes.." Minuten neustarten.", "admin" )
				end
				outputChatBox ( "Verwende /stopgmx um den Neustart abzubrechen!", player, 0, 0, 150 )
				local btime = getRealTime()
				local bmonth = btime.month
				local bday = btime.monthday
				local bhour = btime.hour
				local bminute = btime.minute
				local bsecond = btime.second
				outputServerLog ( bday.."."..bmonth..", "..bhour..":"..bminute..":"..bsecond.." - "..getPlayerName ( player ).." hat den Server neu gestartet!")
				outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat den Server neu gestartet!", "admin")
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( getPlayerName(player).." will den Server neustarten!", playeritem, 200, 200, 0 )
				end
			else
				outputChatBox ( "Verwende /gmx [Zeit] [Grund]", player, 175, 0, 0 )			
			end
		else
			outputChatBox ( "[HINWEIS]: [LA]Tobi versuchte den Server neuzustarten. Da dies jedoch nicht gut endet, wurd die Aktion abgebrochen!", getRootElement(), 255, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("gmx", gmx_func )

function stopgmx_func ( player, cmd)
	if getElementType(player) == "console" then
		laSetElementData ( player, "adminlvl", 99 )
	end
	if isServerleitung(player) then
		local pname = getPlayerName(player)
		killTimer(restartServerTimer)
		outputChatBox ( "[HINWEIS]: Der Serverneustart wurde abgebrochen!", getRootElement(), 200, 0, 0 )
		outputLog ( "[BEFEHL]: "..pname.." hat den Serverneustart abgebrochen!", "admin") 	
		for playeritem, key in pairs(adminsIngame) do
			outputChatBox ( getPlayerName(player).." hat den Serverneustart abgebrochen!", playeritem, 200, 200, 0 )
		end
	end
end
addCommandHandler ("stopgmx", stopgmx_func )

function restartServer(grund)
	
	local btime = getRealTime()
	local bmonth = btime.month
	local bday = btime.monthday
	local bhour = btime.hour
	local bminute = btime.minute
	local bsecond = btime.second
	if isThisTheBetaServer () then
		setServerPassword ( betaServerPasswort )
	else
		setServerPassword ( "" )
	end
	i = 0
	for id, playeritem in ipairs(getElementsByType("player")) do 
		i = i + 1
		setTimer ( kickPlayerGMX, 50+100*i, 1, playeritem, grund )
	end
	setTimer ( restartNow, 100+200*i, 1 )
end

function restartNow ()

	if not isThisTheBetaServer () then
		setServerPassword ( "" )
	end
	
	elementData = nil
	--local thisResource = getThisResource()
	--local resourceName = getResourceName(thisResource)
	--restartResource ( resourceName )
	local allResources = getResources()
	for index, res in ipairs(allResources) do
		if getResourceState(res) == "running" then
			restartResource(res)
		end
	end
end

function kickPlayerGMX ( player, grund)

	kickPlayer ( player, "Server wird neu gestartet! Grund: "..grund.."" )
end

local schnellKontaktActivated = false

function report_func ( player, cmd, ... )	
	if schnellKontaktActivated == true then
		local parametersTable = {...}
		local stringWithAllParameters = table.concat( parametersTable, " " )
		if stringWithAllParameters == nil then
			outputChatBox ("Bitte einen Text angeben!", player, 125, 0, 0 )
		elseif stringWithAllParameters == "" or stringWithAllParameters == " " or stringWithAllParameters == "  " then
			outputChatBox ("Bitte einen Text angeben!", player, 125, 0, 0 )
		else
			counter = 0
			for playeritem, index in pairs(adminsIngame) do 
				outputChatBox ( "Anfrage von "..getPlayerName(player).." ("..getElementData(player,"telenr")..")(ID: "..getElementData(player,"playerid").."): ", playeritem, 200, 255, 0 )
				outputChatBox ( stringWithAllParameters, playeritem, 200, 200, 0 )
				counter = counter + 1
			end
			outputLog ( "[KONTAKT]: "..getPlayerName(player)..": "..stringWithAllParameters.."", "adminchat" )
			if counter >= 1 then
				outputChatBox ( "Deine Anfrage wurde gesendet! Bitte schreib nichts sinnloses, ansonsten wirst du gekickt!", player, 0, 125, 0 )
			else
				outputChatBox ( "Leider ist kein Supporter online. Mit /admins siehst du wenn einer online ist!", player, 0, 125, 0 )
			end
		end
	else
		outputChatBox ( "Schnellkontakt zurzeit deaktiviert!", player, 150, 0, 0 )
	end
end
addCommandHandler ("schnellkontakt", report_func )
addEvent ( "report", true )
addEventHandler ( "report", getRootElement(), report_func )

function activateSchnellKontakt_func ( player )
	if isAdmin(player) then
		local pname = getPlayerName(player)
		if schnellKontaktActivated == true then
			schnellKontaktActivated = false
			outputChatBox ( pname.." hat den Schnellkontakt deaktiviert!", getRootElement(), 200, 200, 0 )
		else
			schnellKontaktActivated = true
			outputChatBox ( pname.." hat den Schnellkontakt aktiviert! /schnellkontakt", getRootElement(), 200, 200, 0 )
		end
	end
end
addCommandHandler ("aschnellkontakt", activateSchnellKontakt_func )

function contact_func ( player, cmd, ... )	
	
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	if stringWithAllParameters == nil then
		outputChatBox ("Please enter a text!", player, 125, 0, 0 )
	elseif stringWithAllParameters == "" or stringWithAllParameters == " " or stringWithAllParameters == "  " then
		outputChatBox ("Please enter a text!", player, 125, 0, 0 )
	else
		counter = 0
		for playeritem, index in pairs(adminsIngame) do 
			outputChatBox ( "[ENG] Anfrage von "..getPlayerName(player).." ("..getElementData(player,"telenr")..")(ID: "..getElementData(player,"playerid").."): ", playeritem, 200, 255, 0 )
			outputChatBox ( stringWithAllParameters, playeritem, 200, 200, 0 )
			counter = counter + 1
			outputLog ( "[KONTAKT]: "..getPlayerName(player)..": "..stringWithAllParameters.."", "adminchat" )
		end
		if counter >= 1 then
			outputChatBox ( "Your Report has been sent! Please don't spam or something like this, or you'll get kicked!", player, 0, 125, 0 )
		else
			outputChatBox ( "What a pitty! No Supporter is online. Use /admins, and you'll see which Admin here is for you!", player, 0, 125, 0 )
		end
	end
end
addCommandHandler ("contact", contact_func )


function ochat_func ( player, cmd, ... )
	
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	if isAdmin(player) then
		if stringWithAllParameters == nil then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Text eingeben!", 5000, 125, 0, 0 )
		else
			if tonumber(getElementData ( player, "adminlvl" )) == 2 then
				rank = "Moderator"
				outputChatBox ( "{{ #FAFA32"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif tonumber(getElementData ( player, "adminlvl" )) == 3 then
				rank = "S-Moderator"
				outputChatBox ( "{{ #0032FA"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif tonumber(getElementData ( player, "adminlvl" )) == 4 then
				rank = "Administrator"
				outputChatBox ( "{{ #960000"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif tonumber(getElementData ( player, "adminlvl" )) == 5 then
				rank = "Serverleiter"
				outputChatBox ( "{{ #C80000"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			elseif tonumber(getElementData ( player, "adminlvl" )) == 6 then
				rank = "Inhaber"
				outputChatBox ( "{{ #FF0000"..rank.." "..getPlayerName(player)..": #FFFFFF"..stringWithAllParameters.." }}", getRootElement(), 255, 255, 255, true )
			end
			outputLog ( "[O-CHAT]: "..getPlayerName(player)..": "..stringWithAllParameters.."", "adminchat" )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("o", ochat_func )

function achat_func ( player, cmd, ... )	
	
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	if isSMod(player) then
		if stringWithAllParameters == nil then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Text eingeben!", 5000, 125, 0, 0 )
		else
			local rank = "Admin Stufe "..getElementData ( player, "adminlvl" )
			if tonumber(getElementData ( player, "adminlvl" )) == 3 then rank = "Super Moderator" end
			if tonumber(getElementData ( player, "adminlvl" )) == 4 then rank = "Administrator" end
			if tonumber(getElementData ( player, "adminlvl" )) == 5 then rank = "Serverleiter" end
			if tonumber(getElementData ( player, "adminlvl" )) == 6 then rank = "Führer" end
			for playeritem, index in pairs(adminsIngame) do 
				if laGetElementData ( playeritem, "adminlvl" ) then
					if isSMod(playeritem) then
						outputChatBox ( "[ "..rank.." "..getPlayerName(player)..": "..stringWithAllParameters.." ]", playeritem, 255, 255, 0 )
					end
				end
			end
			outputLog ( "[A-CHAT]: "..getPlayerName(player)..": "..stringWithAllParameters.."", "adminchat" )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Super Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("a", achat_func )

function suchat_func ( player, cmd, ... )	
	
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	if isSupporter(player) then
		if stringWithAllParameters == nil then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nBitte einen Text eingeben!", 5000, 125, 0, 0 )
		else
			local rank = "Admin Stufe "..getElementData ( player, "adminlvl" )
			if tonumber(getElementData ( player, "adminlvl" )) == 1 then rank = "Supporter" end
			if tonumber(getElementData ( player, "adminlvl" )) == 2 then rank = "Moderator" end
			if tonumber(getElementData ( player, "adminlvl" )) == 3 then rank = "Super Moderator" end
			if tonumber(getElementData ( player, "adminlvl" )) == 4 then rank = "Administrator" end
			if tonumber(getElementData ( player, "adminlvl" )) == 5 then rank = "Serverleiter" end
			if tonumber(getElementData ( player, "adminlvl" )) == 6 then rank = "Führer" end
			for playeritem, index in pairs(adminsIngame) do 
				if laGetElementData ( playeritem, "adminlvl" ) then
					if isSupporter(playeritem) then
						outputChatBox ( "[ "..rank.." "..getPlayerName(player)..": "..stringWithAllParameters.." ]", playeritem, 75, 125, 125 )
					end
				end
			end
			outputLog ( "[SU-CHAT]: "..getPlayerName(player)..": "..stringWithAllParameters.."", "adminchat" )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Supporter!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("su", suchat_func )

function makeleader_func ( player, cmd, target, fraktion )

	local target = getPlayerFromName ( target )
	local fraktion = tonumber(fraktion)
	if isSMod(player) then
		if getPlayerPing ( target ) == false then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /makeleader [Player] [Fraktion]", 5000, 0, 125, 125 )
		else
			if getElementData ( target, "loggedin" ) == 1 then
				if fraktion >= 0 then
					fraktionMembers[laGetElementData ( target, "fraktion")][target] = nil
					if fraktion == 0 then
						laSetElementData ( target, "rang", 0 )
						outputChatBox ( "Du wurdest soeben zum Zivilisten gemacht.", target, 0, 125, 0 )
					end
					if fraktion == 1 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du wurdest soeben zum Polizeichief ernannt! Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 2 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun Corleone der Camorra - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 3 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun der Vater der Yakuza - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 4 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun der Leiter des Notdienstes! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 5 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun der Chefredakteur der \"Los Angeles Times\" - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 6 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun der Direktor des Federal Bureau of Investigation - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 7 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun der Padre der Surenos - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 125 )
					end
					if fraktion == 8 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun Commander der Army - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 9 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun der Big Boss der Compton Families - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 10 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun der Drogenbaron der Watts Soldiers - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 11 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist nun der Führer der Terroristen - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion ~= 0 then
						fraktionMembers[fraktion][target] = fraktion
					end
					laSetElementData ( target, "fraktion", fraktion )
					for playeritem, key in pairs(adminsIngame) do 
						outputChatBox ( getPlayerName(player).." hat "..getPlayerName(target).." zum Leader von Fraktion "..fraktion.." gemacht.", playeritem, 200, 200, 0 )
					end
					outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat "..getPlayerName(target).." zum Leader von Fraktion "..fraktion.." gemacht.", "admin" )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültige Fraktions-ID!", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht\nonline/eingeloggt!", 5000, 150, 0, 0 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Super Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("makeleader", makeleader_func )

function setrank_func ( player, cmd, target, fraktion, rang )

	local target = getPlayerFromName ( target )
	local fraktion = tonumber(fraktion)
	local rang = tonumber(rang)
	if isSMod(player) then
		if getPlayerPing ( target ) == false then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /setrank [Player] [Fraktion] [Rank]", 5000, 0, 125, 125 )
		else
			if getElementData ( target, "loggedin" ) == 1 then
				if fraktion >= 0 then
					fraktionMembers[laGetElementData ( target, "fraktion")][target] = nil
					if fraktion == 0 then
						outputChatBox ( "Du wurdest soeben zum Zivilisten gemacht.", target, 0, 125, 0 )
					end
					if fraktion == 1 then
						outputChatBox ( "Du wurdest soeben ins LAPD aufgenommen! Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 2 then
						outputChatBox ( "Du wurdest soeben in die Camorra aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 3 then
						outputChatBox ( "Du wurdest soeben in die Yakuza aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 4 then
						outputChatBox ( "Du wurdest soeben beim Notdienst aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 5 then
						outputChatBox ( "Du wurdest soeben bei der Los Angeles Times aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 6 then
						outputChatBox ( "Du wurdest soeben ins FBI aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 7 then
						outputChatBox ( "Du wurdest soeben bei den Surenos aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 125 )
					end
					if fraktion == 8 then
						outputChatBox ( "Du wurdest soeben in die Army aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 9 then
						outputChatBox ( "Du wurdest soeben in die Compton Families aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 10 then
						outputChatBox ( "Du wurdest soeben in die Watts Soldiers aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion == 11 then
						outputChatBox ( "Du wurdest soeben zu den Terroristen aufgenommen! - Für mehr Infos öffne das Hilfemenü!", target, 0, 125, 0 )
					end
					if fraktion ~= 0 then
						fraktionMembers[fraktion][target] = fraktion
					end
					laSetElementData ( target, "fraktion", fraktion )
					laSetElementData ( target, "rang", rang )
					for playeritem, key in pairs(adminsIngame) do 
						outputChatBox ( getPlayerName(player).." hat "..getPlayerName(target).." zu Rang "..rang.." von Fraktion "..fraktion.." gemacht.", playeritem, 200, 200, 0 )
					end
					outputLog( "[BEFEHL]: "..getPlayerName ( player ).." hat "..getPlayerName(target).." zu Rang "..rang.." von Fraktion "..fraktion.." gemacht.", "admin" )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültige Fraktions-ID!", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht\nonline/eingeloggt!", 5000, 150, 0, 0 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Super Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("setrank", setrank_func )

function adminMenueTrigger_func ( )

	if source == client then
		if isAdmin(source) then
			triggerClientEvent ( source, "PListFill", getRootElement() )
		else
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
		end
	end
end
addEvent ("adminMenueTrigger", true )
addEventHandler ("adminMenueTrigger", getRootElement(), adminMenueTrigger_func )

function spec_func ( player, command, spec )
local specy = getPlayerFromName(spec)
	if isAdmin(player) then
		if spec then
			if getElementData ( specy, "loggedin" ) == 1 then
				if isHigherAdmin (player, specy) then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUm den Spectate-Modus zu verlassen,\ntippe /spec [Eigener Name]", 5000, 0, 125, 125 )
					outputLog ( "[BEFEHL]: "..getPlayerName(player).." hat "..spec.." gespectet.", "admin" )
					fadeCamera( player, true)
					setCameraTarget( player, specy )
					for playeritem, key in pairs(adminsIngame) do
						outputChatBox ( getPlayerName(player).." hat "..spec.." gespectet.", playeritem, 200, 200, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht\nonline/eingeloggt!", 5000, 150, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\Verwende: /spec [Name]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("spec", spec_func)

function rkick_func(player, command, kplayer, ... )
	
	if getElementType(player) == "console" then
		laSetElementData(player, "adminlvl", 99 )
	end
	if isSupporter(player) and ( not client or client == player ) then
		local reason = {...}
		reason = table.concat( reason, " " )
		kpname = getPlayerFromName(kplayer)
		if kpname then
			if isHigherAdmin(player, kpname) then
				kickPlayer ( kpname, "Von: "..getPlayerName(player)..", Grund: "..tostring(reason) )
				outputChatBox ("Spieler "..kplayer.." wurde von "..getPlayerName(player).." gekickt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
				outputLog ( "[KICK]: "..getPlayerName ( player ).." hat "..kplayer.." gekickt.", "ban" )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht\nonline!", 5000, 150, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Supporter!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("rkick", rkick_func)
addEvent ("rkick", true )
addEventHandler ("rkick", getRootElement(), rkick_func )

function fick_func(player, command, kplayer, ... )
	
	if getElementType(player) == "console" then
		laSetElementData(player, "adminlvl", 99 )
	end
	if isServerleitung(player) and ( not client or client == player ) then
		local reason = {...}
		reason = table.concat( reason, " " )
		kpname = getPlayerFromName(kplayer)
		if kpname then
			if isHigherAdmin(player, kpname) then
				kickPlayer ( kpname, "Von: "..getPlayerName(player)..", Grund: "..tostring(reason) )
				outputChatBox ("Spieler "..kplayer.." wurde von "..getPlayerName(player).." gefickt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
				outputLog ( "[KICK]: "..getPlayerName ( player ).." hat "..kplayer.." gefickt.", "ban")
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht\nonline!", 5000, 150, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("fick", fick_func)
addEvent ("fick", true )
addEventHandler ("fick", getRootElement(), fick_func )


function rban_func(player,command,kplayer, ... )
	
	kplayer = MySQL_Save ( kplayer )
	local reason = {...}
	reason = table.concat( reason, " " )
	if getElementType(player) == "console" then
		laSetElementData(player, "adminlvl", 99 )
	end
	local kpname = getPlayerFromName(kplayer)
	local pname = getPlayerName(player)
	if isAdmin(player) and ( not client or client == player ) then
		if not kpname then
			if MySQL_DatasetExist("players", "Name LIKE '"..kplayer.."'") then
				outputChatBox ( "Der Spieler wurde (offline) gebannt!", player, 0, 0, 150 )
				outputChatBox ("Spieler "..kplayer.." wurde von "..pname.." gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
				outputLog ( "[BAN]: Spieler "..kplayer.." wurde von "..pname.." gebannt! (Grund: "..tostring(reason)..")", "ban" )
				-- mysql_query(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..kplayer.."', '"..pname.."', '"..reason.."', '"..timestamp().."', '0.0.0.0', '0')")
				dbQuery(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..kplayer.."', '"..pname.."', '"..reason.."', '"..timestamp().."', '0.0.0.0', '0')")
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
			end
		elseif kpname then
			if getElementData ( kpname, "loggedin" ) == 1 then
				if isHigherAdmin(player, kpname) then
					outputChatBox ("Spieler "..kplayer.." wurde von "..pname.." gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
					outputLog ( "[BAN]: Spieler "..kplayer.." wurde von "..pname.." gebannt! (Grund: "..tostring(reason)..")", "ban" )
					local ip = getPlayerIP ( kpname )
					local serial = getPlayerSerial ( kpname )
					-- mysql_query(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..kplayer.."', '"..pname.."', '"..reason.."', '"..timestamp().."', '"..ip.."', '"..serial.."')")
					dbQuery(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..kplayer.."', '"..pname.."', '"..reason.."', '"..timestamp().."', '"..ip.."', '"..serial.."')")
					kickPlayer ( kpname, "Von: "..pname..", Grund: "..tostring(reason).." gebannt!" )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
				end
			else
				outputChatBox ("Spieler "..kplayer.." wurde von "..pname.." gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
				outputLog ( "[BAN]: Spieler "..kplayer.." wurde von "..pname.." gebannt! (Grund: "..tostring(reason)..")", "ban" )
				local ip = getPlayerIP ( kpname )
				local serial = getPlayerSerial ( kpname )
				-- mysql_query(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..kplayer.."', '"..pname.."', '"..reason.."', '"..timestamp().."', '"..ip.."', '"..serial.."')")
				dbQuery(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..kplayer.."', '"..pname.."', '"..reason.."', '"..timestamp().."', '"..ip.."', '"..serial.."')")
				kickPlayer ( kpname, "Von: "..pname..", Grund: "..tostring(reason).." gebannt!" )			
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\Verwende: /rban [Name] [Grund]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("rban", rban_func)
addEvent ("rban", true )
addEventHandler ("rban", getRootElement(), rban_func )

function tban_func(player,command,kplayer,btime,...)
	
	if getElementType(player) == "console" then
		laSetElementData(player, "adminlvl", 99 )
	end
	local reason = {...}
	reason = table.concat( reason, " " )
	if isAdmin(player) and ( not client or client == player ) then
		local kpname = getPlayerFromName(kplayer)
		local pname = getPlayerName(player)
		if not kpname then
			if MySQL_DatasetExist("players", "Name LIKE '"..kplayer.."'") then
				local success = timebanPlayer ( kplayer, btime, pname, reason )
				if success == false then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /tban [Name] [Zeit] [Grund]", 5000, 0, 125, 255 )
				else
					outputChatBox ("Spieler "..kplayer.." wurde von "..pname.." für "..tonumber(btime).." Stunden gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
					outputLog ( "[TBAN]: Spieler "..kplayer.." wurde von "..pname.." für "..tonumber(btime).." Stunden gebannt! (Grund: "..tostring(reason)..")", "ban" )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
			end	
		elseif kpname then
			if tonumber ( btime ) then
				if getElementData ( kpname, "loggedin" ) == 1 then
					if isHigherAdmin(player, kpname) then
						local success = timebanPlayer ( kplayer, btime, pname, reason )
						if success == false then
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /tban [Name] [Zeit] [Grund]", 5000, 0, 125, 255 )
						else
							outputChatBox ("Spieler "..kplayer.." wurde von "..pname.." für "..tonumber(btime).." Stunden gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
							outputLog ( "[TBAN]: Spieler "..kplayer.." wurde von "..pname.." für "..tonumber(btime).." Stunden gebannt! (Grund: "..tostring(reason)..")", "ban" )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
					end
				else
					local success = timebanPlayer ( kplayer, btime, pname, reason )
					if success == false then
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /tban [Name] [Zeit] [Grund]", 5000, 0, 125, 255 )
					else
						outputChatBox ("Spieler "..kplayer.." wurde von "..pname.." für "..tonumber(btime).." Stunden gebannt! (Grund: "..tostring(reason)..")",getRootElement(),255,0,0)
						outputLog ( "[TBAN]: Spieler "..kplayer.." wurde von "..pname.." für "..tonumber(btime).." Stunden gebannt! (Grund: "..tostring(reason)..")", "ban" )
					end				
				end
			else
				outputChatBox ( "\n\nVerwende: /tban [Name] [Zeit] [Grund]", player, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\Verwende: /tban [Name][Zeit][Grund]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("tban", tban_func)
addEvent ("tban", true )
addEventHandler ("tban", getRootElement(), tban_func )

function warn_func(player,command,kpname,...)
	local kplayer = getPlayerFromName(kpname)
	local pname = getPlayerName(player)
	local reason = {...}
	reason = table.concat( reason, " " )
	if getElementType(player) == "console" then
		laSetElementData(player, "adminlvl", 99 )
	end
	if isSMod(player) and ( not client or client == player ) then
		if not kplayer then
			if MySQL_DatasetExist("players", "Name LIKE '"..kpname.."'") then
				local warns = tonumber ( MySQL_GetString("userdata", "Warns", "Name LIKE '" ..kpname.."'"))
				MySQL_SetString("userdata", "Warns", warns + 1, "Name LIKE '"..kpname.."'")
				outputChatBox ( "Du hast den Spieler verwarnt!", player, 0, 125, 0 )
				offlinemsg ( "Du wurdest von "..pname.." verwarnt; Grund: "..reason, "Server", kpname )
				outputLog ( "[WARN]: Spieler "..kpname.." wurde von "..pname.." verwarnt! Grund: "..tostring(reason).." ", "ban" )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( pname.." hat "..kpname.." verwarnt!", playeritem, 200, 200, 0 )
				end
				if warns >= 3 then
					-- mysql_query(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..kpname.."', '"..pname.."', '"..reason.." (3. Verwarnung)', '"..timestamp().."', '0.0.0.0', '0')")
					dbQuery(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..kpname.."', '"..pname.."', '"..reason.." (3. Verwarnung)', '"..timestamp().."', '0.0.0.0', '0')")
					outputChatBox ( "Der Spieler wurde aufgrund eines dritten Warns gebannt.", player, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
			end
		elseif kplayer then
			if isHigherAdmin (player, kplayer) then
				outputChatBox ( "Du hast dem Spieler "..getPlayerName(kplayer).." einen Warn gegeben, Grund: "..reason, player, 0, 125, 0 )
				outputChatBox ( "Du hast von "..pname.." einen Warn bekommen, Grund: "..reason, kplayer, 125, 0, 0 )
				laSetElementData ( kplayer, "warns", laGetElementData ( kplayer, "warns" ) + 1 )
				outputLog ( "[WARN]: Spieler "..kpname.." wurde von "..pname.." verwarnt! Grund: "..tostring(reason).." ", "ban" )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( pname.." hat "..kpname.." verwarnt!", playeritem, 200, 200, 0 )
				end
				outputChatBox ( "Du hast nun "..getElementData ( kplayer, "warns" ).." Warns, beim 3. wirst du automatisch gebannt!", kplayer, 125, 0, 0 )
				if getElementData ( kplayer, "warns" ) >= 3 then
					local ip = getPlayerIP ( kplayer )
					local serial = getPlayerSerial ( kplayer )
					outputChatBox ("Spieler "..kpname.." wurde von "..pname.." gebannt! (Grund: "..tostring(reason)..", 3 Verwarnungen)",getRootElement(),255,0,0)
					outputLog ( "[BAN]: Spieler "..kpname.." wurde von "..pname.." gebannt! (Grund: "..tostring(reason)..", 3 Verwarnungen)", "ban" )
					mysql_la_query("INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..MySQL_Save ( getPlayerName(kplayer)).."', '"..pname.."', '"..reason.." (3xWarn)".."', '"..timestamp().."', '"..ip.."', '"..serial.."')")
					kickPlayer ( kplayer, "Von: "..pname..", Grund: "..tostring(reason).." (Gebannt, 3 Verwarnungen)" )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\Verwende: /warn [Name] [Grund]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Super Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("warn", warn_func)
addEvent ("warn", true )
addEventHandler ("warn", getRootElement(), warn_func )

function rslap_func(player,command,target,bslap)
	
	if isSMod(player) then
		if target then
			local tplayer = getPlayerFromName ( target )
			if getElementData ( tplayer, "loggedin" ) == 1 then
				if isHigherAdmin (player, tplayer) then
					if tostring(bslap) == "Ja" or tostring(bslap) == "ja" then
						local x,y,z = getElementPosition(tplayer)
						setElementPosition ( tplayer, x, y, z + 5, false )
						setPedOnFire(tplayer,true)
						for playeritem, key in pairs(adminsIngame) do
							outputChatBox ( getPlayerName(player).." hat "..target.." geslapt und angezündet.", playeritem, 200, 200, 0 )
						end
					else
						local x,y,z = getElementPosition(tplayer)
						setElementPosition ( tplayer, x, y, z + 5, true )
						for playeritem, index in pairs(adminsIngame) do 
							outputChatBox ( getPlayerName(player).." hat "..target.." geslapt.", playeritem, 200, 200, 0 )
						end
					end
					outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat "..target.." geslapt.", "admin" )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler ist nicht eingeloggt!", 5000, 0, 125, 125 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /slap [Player]\n[Anzünden] Ja/Nein", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Super Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("rslap", rslap_func)
addEvent ("rslap", true )
addEventHandler ("rslap", getRootElement(), rslap_func )

function goto_func(player,command,tname)

	tplayer = getPlayerFromName ( tname )
	if isAdmin(player) then
		if tname then
			if getElementData ( tplayer, "loggedin" ) == 1 then
				local x,y,z = getElementPosition(tplayer)
				if getPedOccupiedVehicleSeat ( player ) == 0 then
					setElementInterior ( player, getElementInterior(tplayer) )
					setElementInterior ( getPedOccupiedVehicle(player), getElementInterior(tplayer) )
					setElementPosition ( getPedOccupiedVehicle ( player ), x+3, y+3, z )
					setElementDimension ( getPedOccupiedVehicle ( player ), getElementDimension ( tplayer ) )
					setElementDimension ( player, getElementDimension ( tplayer ) )
					setElementVelocity(getPedOccupiedVehicle(player),0,0,0)
					setElementFrozen ( getPedOccupiedVehicle(player), true )
					setTimer ( setElementFrozen, 500, 1, getPedOccupiedVehicle(player), false )
				else
					removePedFromVehicle ( player )
					setElementPosition ( player, x, y + 1, z )
					setElementInterior ( player, getElementInterior(tplayer) )
					setElementDimension ( player, getElementDimension ( tplayer ) )
				end
				outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat sich zu "..tname.." teleportiert.", "admin" )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( getPlayerName(player).." hat sich zu "..tname.." teleportiert.", playeritem, 200, 200, 0 )
				end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler ist nicht eingeloggt!", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /goto [Name]", 5000, 0, 125, 125 )
		end
end
addCommandHandler("goto", goto_func)
addEvent ("goto", true )
addEventHandler ("goto", getRootElement(), goto_func )

function gethere_func(player,command,tname)

	tplayer = getPlayerFromName ( tname )
	if isAdmin(player) and ( not client or client == player ) then
		if tname then
			if getElementData ( tplayer, "loggedin" ) == 1 then
				local x,y,z = getElementPosition(player)
				if getPedOccupiedVehicleSeat ( tplayer ) == 0 then
					setElementInterior ( tplayer, getElementInterior(player) )
					setElementInterior ( getPedOccupiedVehicle(tplayer), getElementInterior(player ) )
					setElementPosition ( getPedOccupiedVehicle(tplayer), x+3, y+3, z )
					setElementDimension ( tplayer, getElementDimension ( player ) )
					setElementDimension ( getPedOccupiedVehicle(tplayer), getElementDimension ( player ) )
					setElementVelocity(getPedOccupiedVehicle(tplayer),0,0,0)
					setElementFrozen ( getPedOccupiedVehicle(tplayer), true )
					setTimer ( setElementFrozen, 500, 1, getPedOccupiedVehicle(tplayer), false )
				else
					removePedFromVehicle ( tplayer )
					setElementPosition ( tplayer, x, y + 1, z )
					setElementInterior ( tplayer, getElementInterior(player) )
					setElementDimension ( tplayer, getElementDimension ( player ) )
				end
				outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat "..tname.." teleportiert.", "admin" )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( getPlayerName(player).." hat "..tname.." teleportiert.", playeritem, 200, 200, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler ist nicht eingeloggt!", 5000, 0, 125, 125 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /gethere [Name]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("gethere", gethere_func)
addEvent ("gethere", true )
addEventHandler ("gethere", getRootElement(), gethere_func )

function skydive_func(player,command,tname)

	local tplayer = getPlayerFromName ( tname )
	if isSMod(player) and ( not client or client == player ) then
		local weapon = 46
		local ammo = 1
		giveWeapon ( tplayer, weapon, ammo, true )
		triggerClientEvent ( tplayer, "sec_gun_give", getRootElement(), weapon, ammo )
		if tname then
			if getElementData ( tplayer, "loggedin" ) == 1 then
				local x,y,z = getElementPosition(tplayer)
				if getPedOccupiedVehicleSeat ( tplayer ) == 0 then
					setElementPosition ( getPedOccupiedVehicle(tplayer), x, y, z+2000 )
				else
					removePedFromVehicle ( tplayer )
					setElementPosition ( tplayer, x, y, z+2000 )
				end
				outputLog ( "[BEFEHL]: "..getPlayerName ( player ).." hat "..tname.." geskydived.", "admin" )
				for playeritem, key in pairs(adminsIngame) do 
					outputChatBox ( getPlayerName(player).." hat "..tname.." geskydived.", playeritem, 200, 200, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler ist nicht eingeloggt!", 5000, 0, 125, 125 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /skydive [Player]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Super Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("skydive", skydive_func)
addEvent ("skydive", true )
addEventHandler ("skydive", getRootElement(), skydive_func )

function mute_func(player,command,tplayer)

	local tplayer = getPlayerFromName ( tplayer )
	if isAdmin(player) and ( not client or client == player ) then
		if getElementType ( tplayer ) == "player" then
			if not laGetElementData ( tplayer, "muted" ) then
				laSetElementData ( tplayer, "muted", 0 )
			end
			if laGetElementData ( tplayer, "muted" ) == 1 then
				laSetElementData ( tplayer, "muted", 0 )
				for playeritem, index in pairs(adminsIngame) do 
					outputChatBox ( getPlayerName(player).." hat "..getPlayerName(tplayer).." entmuted!", playeritem, 255, 255, 0 )
				end
			else
				laSetElementData ( tplayer, "muted", 1 )
				for playeritem, index in pairs(adminsIngame) do 
					outputChatBox ( getPlayerName(player).." hat "..getPlayerName(tplayer).." gemuted!", playeritem, 255, 255, 0 )
				end
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /mute [Name]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("mute", mute_func)
addEvent ("mute", true )
addEventHandler ("mute", getRootElement(), mute_func )

function runban_func ( player, cmd, target )

	if isServerleitung(player) then
		if target then
			if MySQL_DatasetExist("ban", "Name LIKE '"..target.."'") then
				MySQL_DelRow( "ban", "Name LIKE '"..target.."'")
				outputChatBox ( getPlayerName(player).." hat "..target.." entbannt!", getRootElement(), 50, 0, 200 )
				outputLog ( "[UNBAN]: "..getPlayerName(player).." hat "..target.." entbannt.", "ban" )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\Verwende: /runban [Name]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "runban", runban_func )
addEvent ("runban", true )
addEventHandler ("runban", getRootElement(), runban_func )

--[[
function unban_func ( player, cmd, nick )

	nick = MySQL_Save ( nick )
	if getElementType ( player ) == "console" then
		laSetElementData ( player, "adminlvl", 999 )
	end
	if laGetElementData ( player, "adminlvl" ) >= 4 then
		name = MySQL_GetString("ban", "Name", "Name LIKE '"..nick.."'")
		if name then
			MySQL_DelRow("ban", "Name LIKE '"..name.."'")
			outputChatBox ( getPlayerName(player).." hat "..nick.." entbannt!", getRootElement(), 125, 0, 0 )
			outputAdminLog ( getPlayerName(player).." hat "..nick.." entbannt." )
		else
			outputChatBox ( "Der Spieler existiert nicht!", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "unban", unban_func )
addEvent ("unban", true )
addEventHandler ("unban", getRootElement(), unban_func )]]


function adminlevel_func ( player, cmd, target, adminlevel )

	if isServerleitung(player) then
		local tplayer = getPlayerFromName (target)
		if getElementData ( tplayer, "loggedin" ) == 1 then
			if isHigherAdmin(player, tplayer) then
				if tonumber(adminlevel) and target then
					if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
						local adminlevelnr = tonumber(adminlevel)
						MySQL_SetString( "userdata", "Adminlevel", adminlevelnr, "Name LIKE '" ..target.."'")
						laSetElementData(tplayer, "adminlvl", adminlevelnr)
						outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat den Adminrang von "..target.." auf "..adminlevel.." gesetzt.", "admin" )
						for playeritem, key in pairs(adminsIngame) do
							outputChatBox ( getPlayerName(player).." hat das Adminlevel von "..target.." auf "..adminlevel.." gesetzt.", playeritem, 200, 200, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /adminlevel [Name] [Level]", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
			end
		else
			if tonumber(adminlevel) and target then
				if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
					local adminlevelnr = tonumber(adminlevel)
					MySQL_SetString( "userdata", "Adminlevel", adminlevelnr, "Name LIKE '" ..target.."'")
					outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat den Adminrang von "..target.." auf "..adminlevel.." gesetzt.", "admin" )
					for playeritem, key in pairs(adminsIngame) do
						outputChatBox ( getPlayerName(player).." hat das Adminlevel von "..target.." auf "..adminlevel.." gesetzt.", playeritem, 200, 200, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /adminlevel [Name] [Level]", 5000, 0, 125, 125 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "adminlevel", adminlevel_func )


function telefonnr_func ( player, cmd, target, telefonnr )

	if isServerleitung(player) then
		local tplayer = getPlayerFromName (target)
		if getElementData ( tplayer, "loggedin" ) == 1 then
			if isHigherAdmin(player, tplayer) then
				if tonumber(telefonnr) and target then
					if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
						local telefonnummer = tonumber(telefonnr)
						MySQL_SetString( "userdata", "Telefonnr", telefonnummer, "Name LIKE '" ..target.."'")
						laSetElementData(tplayer, "telenr", telefonnummer)
						outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat die Nummer von "..target.." in "..telefonnr.." geaendert.", "admin" )
						for playeritem, key in pairs(adminsIngame) do
							outputChatBox ( getPlayerName(player).." hat die Nummer von "..target.." in "..telefonnr.." geändert.", playeritem, 200, 200, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /telefonnr [Name] [Nummer]", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
			end
		else
			if tonumber(telefonnr) and target then
				if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
					local telefonnummer = tonumber(telefonnr)
					MySQL_SetString( "userdata", "Telefonnr", telefonnummer, "Name LIKE '" ..target.."'")
					outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat die Nummer von "..target.." in "..telefonnr.." geaendert.", "admin" )
					for playeritem, key in pairs(adminsIngame) do
						outputChatBox ( getPlayerName(player).." hat die Nummer von "..target.." in "..telefonnr.." geändert.", playeritem, 200, 200, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /telefonnr [Name] [Nummer]", 5000, 0, 125, 125 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "telefonnr", telefonnr_func )

function stunden ( player , cmd , target, stunden )
	if isServerleitung(player) then
		local tplayer = getPlayerFromName (target)
		if getElementData ( tplayer, "loggedin" ) == 1 then
			if isHigherAdmin(player, tplayer) then
				if tonumber(stunden) and target then
					if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
						local stundennu = tonumber(stunden)
						MySQL_SetString( "userdata", "Spielzeit", stundennu, "Name LIKE '" ..target.."'")
						laSetElementData(tplayer, "playingtime", stundennu)
						outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat die Spielzeit von "..target.." in "..stunden.." geaendert.", "admin" )
						for playeritem, key in pairs(adminsIngame) do
							outputChatBox ( getPlayerName(player).." hat die Spielzeit von "..target.." in "..stunden.." geändert.", playeritem, 200, 200, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /stunden [Name] [Zeit]", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
			end
		else
			if tonumber(stunden) and target then
				if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
					local stundennu = tonumber(stunden)
					MySQL_SetString( "userdata", "Spielzeit", stundennu, "Name LIKE '" ..target.."'")
					outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat die Spielzeit von "..target.." in "..stunden.." geaendert.", "admin" )
					for playeritem, key in pairs(adminsIngame) do
						outputChatBox ( getPlayerName(player).." hat die Spielzeit von "..target.." in "..stunden.." geändert.", playeritem, 200, 200, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /stunden [Name] [Zeit]", 5000, 0, 125, 125 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("stunden" , stunden )


function socialstate_func ( player, cmd, target, socialstate )
	if isServerleitung(player) then
		local tplayer = getPlayerFromName (target)
		if getElementData ( tplayer, "loggedin" ) == 1 then
			if isHigherAdmin(player, tplayer) then
				if socialstate and target then
					if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
						MySQL_SetString( "userdata", "SocialState", socialstate, "Name LIKE '" ..target.."'")
						laSetElementData(tplayer, "socialState", socialstate)
						outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat den Status von "..target.." in "..socialstate.." geaendert.", "admin" )
						for playeritem, key in pairs(adminsIngame) do
							outputChatBox ( getPlayerName(player).." hat den Status von "..target.." in "..socialstate.." geändert.", playeritem, 200, 200, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /status [Name] [Status]", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
			end
		else
			if socialstate and target then
				if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
					MySQL_SetString( "userdata", "SocialState", socialstate, "Name LIKE '" ..target.."'")
						outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat den Status von "..target.." in "..socialstate.." geaendert.", "admin" )
						for playeritem, key in pairs(adminsIngame) do
							outputChatBox ( getPlayerName(player).." hat den Status von "..target.." in "..socialstate.." geändert.", playeritem, 200, 200, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /status [Name] [Status]", 5000, 0, 125, 125 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "status", socialstate_func )

function skin( player, cmd, skin )
	if isServerleitung(player) then
		if tonumber(skin) then
			local skinid = tonumber(skin)
			setElementModel ( player, skinid )
			laSetElementData ( player, "skinid", skinid )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /skin [ID]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("skin", skin)

function skinid_func ( player, cmd, target, skin )
	if isServerleitung(player) then
		local tplayer = getPlayerFromName (target)
		if getElementData ( tplayer, "loggedin" ) == 1 then
			if isHigherAdmin(player, tplayer) then
				if tonumber(skin) and target then
					if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
						local skinid = tonumber(skin)
						MySQL_SetString( "userdata", "Skinid", skinid, "Name LIKE '" ..target.."'")
						laSetElementData(tplayer, "skinid", skinid)
						setElementModel (tplayer, skinid)
						outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat den Skin von "..target.." in "..skin.." geaendert.", "admin" )
						for playeritem, key in pairs(adminsIngame) do
							outputChatBox ( getPlayerName(player).." hat den Skin von "..target.." in "..skin.." geändert.", playeritem, 200, 200, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /skin [Name] [ID]", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nHöherer Admin!", 5000, 255, 0, 0 )
			end
		else
			if tonumber(skin) and target then
				if MySQL_DatasetExist("userdata", "Name LIKE '"..target.."'") then
					local skinid = tonumber(skin)
					MySQL_SetString( "userdata", "Skinid", skinid, "Name LIKE '" ..target.."'")
						outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat den Status von "..target.." in "..skin.." geaendert.", "admin" )
						for playeritem, key in pairs(adminsIngame) do
							outputChatBox ( getPlayerName(player).." hat den Status von "..target.." in "..skin.." geändert.", playeritem, 200, 200, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler existiert nicht!", 5000, 255, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /skin [Name] [ID]", 5000, 0, 125, 125 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ( "skinid", skinid_func )

function changecar ( player , cmd , target, slot , id )
	local playername = getPlayerName( player )
	if isServerleitung(player) then
		if tonumber(slot) and tonumber(id) and target then
			if MySQL_DatasetExist("vehicles", "Besitzer LIKE '"..target.."' and Slot LIKE '"..slot.."'") then
				local slotid = tonumber(slot)
				local idid = tonumber(id)
				abfrage = "UPDATE  `vehicles` SET  `Typ` =  '"..idid.."' WHERE  `vehicles`.`Besitzer`LIKE '"..target.."' and Slot LIKE '"..slotid.."'"
				mysql_la_query ( abfrage )
				outputLog ( "[AENDERUNG]: "..getPlayerName ( player ).." hat das Fahrzeug von "..target.." in Slot "..slot.." in "..id.." geaendert.", "admin" )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( getPlayerName(player).." hat das Fahrzeug von "..target.." in Slot "..slot.." in "..id.." geändert.", playeritem, 200, 200, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\Fahrzeug existiert nicht!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /changecar [Name] [Slot] [ID]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler("changecar" , changecar )
--------

function maketerror_func ( player, cmd, target, fraktion )

	local target = getPlayerFromName ( target )
	local fraktion = tonumber(fraktion)
	if isAdmin(player) >= 2 then
		if getPlayerPing ( target ) == false then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /maketerror [Player] [Fraktion]", 5000, 0, 125, 125 )
		else
			if getElementData ( target, "loggedin" ) == 1 then
				if fraktion >= 0 then
					fraktionMembers[laGetElementData ( target, "fraktion")][target] = nil
					if fraktion == 12 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist jetzt unsichtbar in der Spielerliste!", target, 0, 125, 0 )
					elseif fraktion == 11 then
						laSetElementData ( target, "rang", 5 )
						outputChatBox ( "Du bist jetzt Terrorist, beeil dich und mach dich dannach wieder in die alte Fraktion!", target, 0, 125, 0 )
					end
					laSetElementData ( target, "fraktion", fraktion )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültige Fraktions-ID!", 5000, 0, 125, 125 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht\nonline/eingeloggt!", 5000, 150, 0, 0 )
			end
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("maketerror", maketerror_func )

function portToPlace_func (player, cmd, faction, ort)
if isServerleitung(player) then
	if faction then
		if faction == "bahnhof" then
			x, y, z = -1992.699, 110.165, 27.539
		elseif faction == "grove" then
			x, y, z = 2495.42, -1686.91, 13.51
		elseif faction == "fahrschule" then
			x, y, z = -2046.2838, -93.7088, 35.172
		elseif faction == "zero" then
			x, y, z = -2251.648, 126.1136, 35.172
		elseif faction == "jobcenter" then
			x, y, z = -2152.022, 250.247, 35.32
		elseif faction == "flugjob" then
			x, y, z = -1422.6966, -307.50, 6.2
		elseif faction == "ammunation" then
			x, y, z = -2625.685, 217.826, 4.4773		
		elseif faction == "army" then
			if ort == "sf" then
				x, y, z = -1530, 471.295, 7.1875
			elseif ort == "lv" then
				x, y, z = 134.7, 1925.248, 19.1752
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		elseif faction == "camorra" then
			if ort == "sf" then
				x, y, z = -705.07, 959.5633, 12.41
			elseif ort == "ls" then
				x, y, z = 708.0455, -1424.749, 13.539
			elseif ort == "lv" then
				x, y, z = 2297.252, 1748.105, 10.82
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		elseif faction == "compton" then
			if ort == "sf" then
				x, y, z = -2453.1955, -13.227, 28.226
			elseif ort == "ls" then
				x, y, z = 2424.096, -1230.081, 24.876
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		elseif faction == "fbi" then
			if ort == "sf" then
				x, y, z = -2436.471, 505.294, 29.932
			elseif ort == "ls" then
				x, y, z = 1261.411, -2026.78, 59.379
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		elseif faction == "lat" then
			if ort == "sf" then
				x, y, z = -2039.985, 475.6399, 35.1722
			--elseif ort == "ls" then
			--	x, y, z = 1261.411, -2026.78, 59.379
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		elseif faction == "lapd" then
			if ort == "sf" then
				x, y, z = -1627.94, 732.2522, 14.46
			elseif ort == "ls" then
				x, y, z = 1534.931, -1672.639, 13.3828
			elseif ort == "lv" then
				x, y, z = 2311.918, 2450.3564, 10.82
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		elseif faction == "surenos" then
			if ort == "sf" then
				x, y, z = -794.746, 2411.176, 156.822
			elseif ort == "ls" then
				x, y, z = 2225.198, -1329.256, 23.98
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		elseif faction == "terror" then
			if ort == "sf" then
				x, y, z = -1980.03, -1615.191, 87.6322
			--elseif ort == "ls" then
			--	x, y, z = 2225.198, -1329.256, 23.98
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		elseif faction == "watts" then
			if ort == "sf" then
				x, y, z = -2462.1875, -126.4244, 25.7238
			elseif ort == "ls" then
				x, y, z = 1105.8626, -1208.111, 17.804
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		elseif faction == "yakuza" then
			if ort == "sf" then
				x, y, z = -2206.168, 640.921, 49.4375
			elseif ort == "ls" then
				x, y, z = 2808.968, -1577.713, 10.929
			elseif ort == "lv" then
				x, y, z = 1904.026, 957.25128, 10.82
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n/port [Fraktion] [Stadt]", 5000, 255, 0, 0 )
			end
		end
			if x and y and z then
				local seat = getPedOccupiedVehicleSeat ( player )
				if seat == 0 then
					local veh = getPedOccupiedVehicle ( player )
					setElementPosition ( veh, x, y, z )
					setElementInterior ( veh, 0 )
					setElementDimension ( veh, 0 )
					setElementFrozen ( veh, true )
					setTimer ( setElementFrozen, 500, 1, veh, false )
				else
					removePedFromVehicle ( player )
					setElementPosition ( player, x, y, z )
					setElementInterior ( player, 0 )
					setElementDimension ( player, 0 )
				end
			end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende /port [Fraktion/Ort] [ev. Stadt]", 5000, 255, 0, 0 )
	end
else
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
end
end
addCommandHandler ( "port", portToPlace_func )

function terror( player, cmd, ... )

if getTeamName(getPlayerTeam(player)) == "Terror" then
	local text= {...}
	text = table.concat( text, " " )
	local pname = getPlayerName ( player )
	local posX, posY, posZ = getElementPosition ( player )
	local chatSphere = createColSphere( posX, posY, posZ, 20 )
	local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
	destroyElement( chatSphere )
	for index, nearbyPlayer in pairs ( nearbyPlayers ) do
		local pname = getPlayerName ( player )
		outputChatBox ( "Der Terrorist flüstert: "..text, nearbyPlayer, 255, 0, 0 )
	end
else
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Terrorist!", 5000, 255, 0, 0 )
end
end
addCommandHandler("terror", terror)

function passwort_func ( player, cmd, target, newPW )

	if target == getPlayerName ( player ) then
		if getElementData ( player, "loggedin" ) == 1 then
			if newPW and target then
				local target = MySQL_Save ( target )
				local newPW = MySQL_Save ( newPW )
				local salted = saltPassword ( target, newPW )
				--local empty = ""
				MySQL_SetString( "players", "Passwort", md5(salted), "Name LIKE '" ..target.."'")
				--MySQL_SetString( "players", "Salt", empty, "Name LIKE '" ..target.."'")
				--MySQL_SetString( "players", "Changed", 1, "Name LIKE '" ..target.."'")
				outputChatBox ( "Passwort geändert!", player, 0, 125, 0 )
				outputLog ( "[PASSWORT]: "..getPlayerName ( player ).." hat sein Passwort gewechselt!", "admin" )
			else
				outputChatBox ( "Verwende: /passwort [Name] [Neues Passwort]", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht eingeloggt!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Verwende: /passwort [DEINEN NAMEN] [Neues Passwort]", player, 125, 0, 0 )
	end
end
addCommandHandler ( "passwort", passwort_func )

function passwortgui_func ( player, target, newPW )

	if target == getPlayerName ( player ) then
		if getElementData ( player, "loggedin" ) == 1 then
			if newPW and target then
				local target = MySQL_Save ( target )
				local newPW = MySQL_Save ( newPW )
				local salted = saltPassword ( target, newPW )
				--local empty = ""
				MySQL_SetString( "players", "Passwort", md5(salted), "Name LIKE '" ..target.."'")
				--MySQL_SetString( "players", "Salt", empty, "Name LIKE '" ..target.."'")
				outputChatBox ( "Passwort geändert!", player, 0, 125, 0 )
				showCursor ( player, false )
				
				outputLog ( "[PASSWORT]: "..getPlayerName ( player ).." hat sein Passwort gewechselt!", "admin" )
			else
				outputChatBox ( "Verwende: /passwort [Name] [Neues Passwort]", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht eingeloggt!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Verwende: /passwort [DEINEN NAMEN] [Neues Passwort]", player, 125, 0, 0 )
	end
end
addEvent ( "passwort", true )
addEventHandler ( "passwort", getRootElement(), passwortgui_func )

function Changepasswortgui_func ( player, target, newPW )

	if target == getPlayerName ( player ) then
		if getElementData ( player, "loggedin" ) == 1 then
			if newPW and target then
				local target = MySQL_Save ( target )
				local newPW = MySQL_Save ( newPW )
				local salt = MySQL_GetString("players", "Salt", "Name LIKE '" ..target.."'")
				local salted = saltPassword ( target, newPW )
				--local empty = ""
				MySQL_SetString( "players", "Passwort", md5(salted), "Name LIKE '" ..target.."'")
				--MySQL_SetString( "players", "Salt", empty, "Name LIKE '" ..target.."'")
				outputChatBox ( "Passwort geändert!", player, 0, 125, 0 )
				
				outputLog ( "[PASSWORT]: "..getPlayerName ( player ).." hat sein Passwort gewechselt!", "admin" )
			else
				outputChatBox ( "Verwende: /passwort [Name] [Neues Passwort]", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht eingeloggt!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Verwende: /passwort [DEINEN NAMEN] [Neues Passwort]", player, 125, 0, 0 )
	end
end
addEvent ( "passwortChange", true )
addEventHandler ( "passwortChange", getRootElement(), Changepasswortgui_func )

TerrorSkins = {}
TerrorSkins = { [221]=true, [222]=true, [220]=true, [143]=true, [142]=true, [66]=true, [235]=true }

function terrorskin_func ( player )
	
	curskin = getElementModel ( player )
	suc = false
	if getPedOccupiedVehicle ( player ) then
		outputChatBox ( "Bitte nutze diesen Befehl nur ausserhalb von Fahrzeugen!", player, 125, 0, 0 )
	elseif getTeamName(getPlayerTeam(player)) == "Terror" then
		for i = curskin+1, 288 do
			if TerrorSkins[i] then
				suc = true
				setElementModel ( player, i )
				laSetElementData ( player, "skinid", i )
				break
			end
		end
		if suc == false then
			for i = 0, curskin do
				if TerrorSkins[i] then
					suc = true
					setElementModel ( player, i )
					laSetElementData ( player, "skinid", i )
					break
				end
			end
		end
	else
		outputChatBox ( "Du darfst diesen Befehl nicht benutzen!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "terrorskin", terrorskin_func )

function banedit_func ( player, cmd, target, ... )
	if isServerleitung(player) then
		if target then
			if MySQL_DatasetExist("ban", "Name LIKE '"..target.."'") then
				local reason = {...}
				reason = table.concat( reason, " " )
				MySQL_SetString( "ban", "Grund", reason, "Name LIKE '" ..target.."'")
				outputChatBox ( "Banngrund erfolgreich geändert: "..tostring(reason).."", player, 125, 0, 0 )
				outputLog ( "[BANCHANGE]: "..getPlayerName ( player ).." hat den Banngrund von "..target.." in "..tostring(reason).." geaendert.", "ban" )
				for playeritem, key in pairs(adminsIngame) do
					outputChatBox ( getPlayerName(player).." hat den Banngrund von "..target.." in "..tostring(reason).." geändert.", playeritem, 200, 200, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nSpieler ist nicht gebannt!", 5000, 255, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\Verwende: /banedit [Name] [Grund]", 5000, 0, 125, 125 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Administrator!", 5000, 255, 0, 0 )
	end	
end
addCommandHandler ( "banedit", banedit_func)


function adminduty_func ( player, cmd, ...)
	if isAdmin(player) then
		if laGetElementData (player, "adminduty") == true then
			laSetElementData (player, "adminduty", false)
			outputChatBox ( "Du bist jetzt nicht mehr im Admin-Dienst!", player, 150, 150, 0 )
		else
			laSetElementData (player, "adminduty", true)
			outputChatBox ( "Du bist jetzt im Admin-Dienst!", player, 150, 150, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Moderator!", 5000, 255, 0, 0 )
	end
end
addCommandHandler ("adminduty", adminduty_func)