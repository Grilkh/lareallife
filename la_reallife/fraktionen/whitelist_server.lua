whitelistPlayers = {}
 whitelistPlayers[2] = {}
 whitelistPlayers[3] = {}
 whitelistPlayers[7] = {}
 whitelistPlayers[9] = {}
 whitelistPlayers[10] = {}

validWhiteListFactions = {
 [2]=true,
 [3]=true,
 [7]=true,
 [9]=true,
 [10]=true
 }

function whitelistLogin ( pname )
local playerr = getPlayerFromName(pname)
	if isOnWhitelist ( pname, 2 ) then
		whitelistPlayers[2][pname] = true
		laSetElementData (playerr, "isOnWhiteList2", true)
	else
		laSetElementData (playerr, "isOnWhiteList2", false)
	end
	if isOnWhitelist ( pname, 3 ) then
		whitelistPlayers[3][pname] = true
		laSetElementData (playerr, "isOnWhiteList3", true)
	else
		laSetElementData (playerr, "isOnWhiteList3", false)
	end
	if isOnWhitelist ( pname, 7 ) then
		whitelistPlayers[7][pname] = true
		laSetElementData (playerr, "isOnWhiteList7", true)
	else
		laSetElementData (playerr, "isOnWhiteList7", false)
	end
	if isOnWhitelist ( pname, 9 ) then
		whitelistPlayers[9][pname] = true
		laSetElementData (playerr, "isOnWhiteList9", true)
	else
		laSetElementData (playerr, "isOnWhiteList9", false)
	end
	if isOnWhitelist ( pname, 10 ) then
		whitelistPlayers[10][pname] = true
		laSetElementData (playerr, "isOnWhiteList10", true)
	else
		laSetElementData (playerr, "isOnWhiteList10", false)
	end
end

function whiteListKillCheck ( player, killer )
	local killerFaction = laGetElementData ( killer, "fraktion" )
	local fraktionsname = fraktionNames[killerFaction]
	local name = getPlayerName ( player )
	if validWhiteListFactions[killerFaction] then
		if isOnWhitelist ( name, killerFaction ) then
			local Raten = tonumber(MySQL_GetString( "whitelist", "Anzahl", "Name LIKE '"..name.."'" ))
			local RatenMengeDoppelt = Raten*1000*2
			whitelistPlayers[killerFaction][name] = nil
			--Eventuell tonumber(killerFaction)--
			MySQL_DelRow ( "whitelist", "Name LIKE '"..name.."' AND Fraktion LIKE '"..killerFaction.."'" )
			if isCamorra ( killer ) then
				fraktion = "Camorra"
			elseif isYakuza ( killer ) then
				fraktion = "Yakuza"	
			elseif isSurenos ( killer ) then
				fraktion = "Suenos"
			elseif isCompton ( killer ) then
				fraktion = "Compton"
			elseif isWatts ( killer ) then
				fraktion = "Watts"
			end
			local Fraktionskasse = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE '"..fraktion.."'") )
			local KillerMoney = tonumber(laGetElementData (killer, "bankmoney"))
			outputChatBox ( "Du wurdest durch die "..fraktionsname.." erledigt, trotz Whitelist!", player, 200, 0, 0 )
			if KillerMoney >= RatenMengeDoppelt then
				local NewKillerMoney = laSetElementData (killer, "bankmoney", KillerMoney - RatenMengeDoppelt)
				local FraktionskasseNew = (Fraktionskasse + RatenMengeDoppelt)
				outputChatBox ( "Der Spieler musste "..RatenMengeDoppelt.."$ in die Fraktionskasse zahlen. Wende dich an den Leader um weiteres zu klären.", player, 0, 150, 0 )
				outputChatBox ( "Du hast jemanden von der Whitelist erledigt und musst daher "..RatenMengeDoppelt.."$ in die Fraktionskasse einzahlen!", killer, 150, 0, 0 )
			else
				local NewKillerMoney = laSetElementData (killer, "bankmoney", 0)
				local FraktionskasseNew = (Fraktionskasse + KillerMoney)
				MySQL_SetString("fraktionen", "DepotGeld", WattsFamkasseNew, "Name LIKE '"..fraktion.."'")
				outputChatBox ( "Der Spieler musste "..NewKillerMoney.."$ in die Fraktionskasse zahlen. Wende dich an den Leader um weiteres zu klären.", player, 0, 150, 0 )
				outputChatBox ( "Du hast jemanden von der Whitelist erledigt und musst daher "..NewKillerMoney.."$ in die Fraktionskasse einzahlen!", killer, 150, 0, 0 )
			end
				sendMSGForFaction ( "[FR]: "..getPlayerName(killer).." hat "..name.." aus der Whitelist getötet.", killerFaction, 150, 0, 0 )
				outputLog( "[WHITELIST]: "..getPlayerName(killer).." hat "..name.." aus der Whitelist der "..fraktionsname.." erledigt.", "bad")
		end
	end
end

-- Delete old entrys --
local whiteListCurTime = getSecTime ( 0 )
function checkWhiteListEntrys()

	-- result = mysql_query ( handler, "SELECT * FROM whitelist" )
	result = dbQuery ( handler, "SELECT * FROM whitelist" )
	-- if result then
	-- 	if ( mysql_num_rows ( result ) > 0 ) then
	-- 		whiteListData = mysql_fetch_assoc ( result )
	-- 		mySQLWhiteList ()
	-- 	else
	-- 		mysql_free_result ( result )
	-- 	end
	-- end

	if result then
		local re, num_rows = dbPoll(result, -1)
        if re and num_rows > 0 then
            whiteListData = re[1]
			mySQLWhiteList ()
        else
            dbFree(result)
        end
	end

end
setTimer ( privVeh_spawning, 5000, 1 )

function mySQLWhiteList ()

	local Name = whiteListData["Name"]
	local Eintraeger = whiteListData["Eintraeger"]
	local Fraktion = whiteListData["Fraktion"]
	local Eintragungsdatum = whiteListData["Eintragungsdatum"]
	local Anzahl = whiteListData["Anzahl"]
	
	-- whiteListData = mysql_fetch_assoc ( result )
	whiteListData = dbPoll(result, -1)
	if whiteListData then
		mySQLWhiteList ()
	else
		-- mysql_free_result ( result )
		dbFree ( result )
	end
end
checkWhiteListEntrys()
-- Old entrys deleted --

function whitelist_func ( player, cmd, add, target)

	if not add then
		infobox ( player, "\n\nGebrauch: /whitelist [add/delete/show]!", 5000, 125, 0, 0 )
	else
		if validWhiteListFactions[laGetElementData ( player, "fraktion" )] then
			if add == "add" then
				if target then
					addWhitelist_func ( player, target)
				else
					infobox ( player, "\n\nGebrauch: /whitelist add [NAME]!", 5000, 125, 0, 0 )
				end
			elseif add == "delete" then
				whitelistdelete_func ( player, target )
			elseif add == "show" then
				showwhitelist_func ( player )
			else
				infobox ( player, "\n\nGebrauch: /whitelist [add/delete/show]!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\nDu bist in einer ungültigen Fraktion!", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "whitelist", whitelist_func )

function whitelistdelete_func ( player, name )
	local fname
	local target = getPlayerFromName( name )
	local name = getPlayerName ( target )
	local fraktion = laGetElementData ( player, "fraktion" )
	local fraktionsname = fraktionNames[fraktion]
if name then
	if MySQL_DatasetExist ( "whitelist", "Name LIKE '"..name.."' AND Fraktion LIKE '"..fraktion.."'" ) then
		if laGetElementData ( player, "rang" ) >= 3 then
			whitelistPlayers[fraktion][name] = nil
			--Eventuell tonumber(fraktion)--
			MySQL_DelRow ( "whitelist", "Name LIKE '"..name.."' AND Fraktion LIKE '"..fraktion.."'" )
			outputChatBox ( "Du hast den Spieler "..name.." aus der Whitelist entfernt!", player, 0, 150, 0 )
			sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat "..name.." aus der Whitelist entfernt.", fraktion, 150, 0, 0 )
			outputLog( "[WHITELIST]: "..getPlayerName(player).." hat "..name.." aus der Whitelist der "..fraktionsname.." entfernt.", "bad")
			if fraktion == 2 then
				fname = "Camorra"
				laSetElementData (target, "isOnWhiteList2", false)
			elseif fraktion == 3 then
				fname = "Yakuza"
				laSetElementData (target, "isOnWhiteList3", false)
			elseif fraktion == 7 then
				fname = "Surenos"
				laSetElementData (target, "isOnWhiteList7", false)
			elseif fraktion == 9 then
				fname = "Comptons"
				laSetElementData (target, "isOnWhiteList9", false)
			elseif fraktion == 10 then
				fname = "Watts"
				laSetElementData (target, "isOnWhiteList10", false)
			end
			outputChatBox ( "Du wurdest aus der Whitelist der "..fname.." entfernt.", target, 150, 0, 0 )
		else
			outputChatBox ( "Erst ab Rang 3!", player, 150, 0, 0 )
		end
	else
		outputChatBox ( "Der Spieler ist nicht auf der Whitelist!", player, 150, 0, 0 )
	end
else
	outputChatBox ( "Der Spieler ist nicht online!", player, 150, 0, 0 )
end
end
--addCommandHandler ( "whitelist delete", whitelist_func )


function showwhitelist_func ( player )

	local fraktion = laGetElementData ( player, "fraktion" )
	if whitelistPlayers[fraktion] then
		outputChatBox ( "Spieler auf der Whitelist:", player, 200, 200, 0 )
		outputChatBox ( "__________________________", player, 0, 0, 200 )
		for key, index in pairs ( whitelistPlayers[fraktion] ) do
			if getPlayerName ( getPlayerFromName ( key ) ) then
				local anzahl = MySQL_GetString( "whitelist", "Anzahl", "Name LIKE '"..key.."' AND Fraktion LIKE '"..fraktion.."'"  )
				local eintraeger = MySQL_GetString( "whitelist", "Eintraeger", "Name LIKE '"..key.."' AND Fraktion LIKE '"..fraktion.."'"  )
				--Ev. anstatt tonumber >> tostring--
				outputChatBox ( "#00FF00"..tostring ( key ).."; #009600Einträger: "..tostring ( eintraeger ).."; #00C800Raten: "..tonumber ( anzahl ).."", player, 0, 200, 0, true )
			else
				whitelistPlayers[fraktion][key] = nil
			end
		end
	else
		outputChatBox ( "Du bist in einer ungültigen Fraktion!", player, 125, 0, 0 )
	end
end
--addCommandHandler ( "whitelist show", whitelist_func )

function addWhitelist_func ( player, member)
	local pname = getPlayerName ( player )
	local target = getPlayerFromName ( member )
	local targetname = getPlayerName ( target )
	local fraktion = laGetElementData ( player, "fraktion" )
	if target then
		--if not isEvil(target) then
			if laGetElementData ( player, "rang" ) >= 3 then
				--Ev. tonumber i-was--
				--if (isOnWhiteList ( member, fraktion )) then
				--if (isOnWhitelist ( member, 2 )) or (isOnWhitelist ( member, 3 )) or (isOnWhitelist ( member, 7 )) or (isOnWhitelist ( member, 9 )) or (isOnWhitelist ( member, 10 )) then
				--	infobox ( player, "\n\nDer Spieler ist bereits auf der Whitelist!", 5000, 125, 0, 0 )
				--else
					outputChatBox ( ""..pname.." möchte dich auf die Whitelist der "..fraktionNames[fraktion].." setzen.", target, 0, 100, 200 )
					outputChatBox ( "Dies kostet dich jede Stunde 1000$.", target, 0, 100, 200 )
					outputChatBox ( "Mit /acceptwhitelist nimmst du an. Wenn du den Vertrag auflösen möchtest, verwende /stopwhitelist [Fraktionszahl].", target, 0, 100, 200 )
					outputChatBox ( "Du hast "..targetname.." die Whitelist angeboten.", player, 0, 100, 200 )
					laSetElementData ( target, "whitelistseller", pname )
				--end
			else
				outputChatBox ( "Erst ab Rang 3!", player, 125, 0, 0 )
			end
		--else
		--	outputChatBox ( "Der Spieler ist in einer bösen Fraktion!", player, 125, 0, 0 )
		--end
	else
		infobox ( player, "\n\nDer Spieler ist nicht online!", 5000, 125, 0, 0 )
	end
end
--addCommandHandler ( "whitelist add", whitelist_func )

function acceptwhitelist_func ( player )
	
	local tname = laGetElementData ( player, "whitelistseller" )
	local target = getPlayerFromName ( tname )
	local pname = getPlayerName(player)
	local fraktion = laGetElementData ( target, "fraktion" )
	local fraktionsname = fraktionNames[fraktion]
	if isElement ( target ) and isElement ( player ) then
		local rate = 1000
		local money = laGetElementData ( player, "bankmoney" )
		if money >= rate then
				laSetElementData ( player, "bankmoney", money - rate )
				triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
				playSoundFrontEnd ( player, 40 )
				laSetElementData ( target, "bankmoney", laGetElementData ( target, "bankmoney" ) + rate )
				triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
				playSoundFrontEnd ( target, 40 )
				laSetElementData ( player, "whitelistseller", "" )
				outputChatBox ( ""..pname.." ist jetzt auf der Whitelist, die 1. Rate wurde dir gutgeschrieben.", target, 0, 200, 0 )
				outputChatBox ( "Du bist nun auf der Whitelist. /stopwhitelist "..fraktion.." um den Vertrag aufzulösen.", player, 0, 200, 0 )
				sendMSGForFaction ( "[FR]: "..getPlayerName(target).." hat "..pname.." auf die Whitelist gesetzt.", fraktion, 0, 200, 0 )
				outputLog( "[WHITELIST]: "..tname.." hat "..pname.." auf die Whitelist der "..fraktionsname.." gesetzt.", "bad")
					local regtime = getRealTime()
					local year = regtime.year + 1900
					local month = regtime.month + 1
					local day = regtime.monthday
					local hour = regtime.hour
					local minute = regtime.minute
					local registerdatum = tostring(day.."."..month.."."..year..", "..hour..":"..minute)
					local lastlogin = registerdatum
					--Ev '1'--
					-- local result = mysql_query ( handler, "INSERT INTO whitelist ( Name, Eintraeger, Fraktion, Eintragungsdatum, Anzahl ) VALUES ( '"..pname.."', '"..tname.."', '"..fraktion.."', '"..lastlogin.."', 1 ) " )
					local result = dbQuery ( handler, "INSERT INTO whitelist ( Name, Eintraeger, Fraktion, Eintragungsdatum, Anzahl ) VALUES ( '"..pname.."', '"..tname.."', '"..fraktion.."', '"..lastlogin.."', 1 ) " )
					-- mysql_free_result ( result )
					dbFree ( result )
					whitelistPlayers[fraktion][pname] = true
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld auf der Bank, es kostet "..rate.."$!", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "acceptwhitelist", acceptwhitelist_func )


function stopwhitelist_func ( player, cmd, fraktion )
	local name = getPlayerName ( player )
	local fraktion = tonumber(fraktion)
	local fname
	if fraktion then
		if MySQL_DatasetExist ( "whitelist", "Name LIKE '"..name.."' AND Fraktion LIKE '"..fraktion.."'" ) then
			whitelistPlayers[fraktion][name] = nil
			--Eventuell tonumber(fraktion)--
			MySQL_DelRow ( "whitelist", "Name LIKE '"..name.."' AND Fraktion LIKE '"..fraktion.."'" )
			if fraktion == 2 then
				--fname = "Camorra"
				laSetElementData (player, "isOnWhiteList2", false)
			elseif fraktion == 3 then
				--fname = "Yakuza"
				laSetElementData (player, "isOnWhiteList3", false)
			elseif fraktion == 7 then
				--fname = "Surenos"
				laSetElementData (player, "isOnWhiteList7", false)
			elseif fraktion == 9 then
				--fname = "Comptons"
				laSetElementData (player, "isOnWhiteList9", false)
			elseif fraktion == 10 then
				--fname = "Watts"
				laSetElementData (player, "isOnWhiteList10", false)
			end
			outputChatBox ( "Du bist nun nicht mehr auf der Whitelist der "..fraktionNames[fraktion]..".", player, 0, 125, 0 )
		else
			outputChatBox ( "Du bist nicht auf der Whitelist dieser Fraktion!", player, 125, 0, 0 )
			outputChatBox ( "2 = Camorra, 3 = Yakuza, 7 = Surenos, 9 = Compton Families, 10 = Watts Soldiers", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Verwende /stopwhitelist [Fraktionszahl] (2,3,7,9 oder 10).", player, 125, 0, 0 )
		outputChatBox ( "2 = Camorra, 3 = Yakuza, 7 = Surenos, 9 = Compton Families, 10 = Watts Soldiers", player, 125, 0, 0 )
	end
end
addCommandHandler ( "stopwhitelist", stopwhitelist_func )

function isOnWhitelist ( pname, fraktion )

	--Ev. die untere Zeile entfernen--
	local fraktion = tonumber(fraktion)
	if MySQL_DatasetExist ( "whitelist", "Name LIKE '"..pname.."' AND Fraktion LIKE '"..fraktion.."'" ) then
		return true
	end
	return false
end