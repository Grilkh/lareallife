blacklistPlayers = {}
 blacklistPlayers[2] = {}
 blacklistPlayers[3] = {}
 blacklistPlayers[7] = {}
 blacklistPlayers[9] = {}
 blacklistPlayers[10] = {}

validBlackListFactions = {
 [2]=true,
 [3]=true,
 [7]=true,
 [9]=true,
 [10]=true
 }

factionBlackListGuns = {
 [2]=26,
 [3]=8,
 [7]=18,
 [9]=29,
 [10]=29
 }

function blacklistLogin ( pname )

	if isOnBlacklist ( pname, 2 ) then
		blacklistPlayers[2][pname] = true
	end
	if isOnBlacklist ( pname, 3 ) then
		blacklistPlayers[3][pname] = true
	end
	if isOnBlacklist ( pname, 7 ) then
		blacklistPlayers[7][pname] = true
	end
	if isOnBlacklist ( pname, 9 ) then
		blacklistPlayers[9][pname] = true
	end
	if isOnBlacklist ( pname, 10 ) then
		blacklistPlayers[10][pname] = true
	end
end

function blackListKillCheck ( player, killer, weapon )

	local killerFaction = laGetElementData ( killer, "fraktion" )
	local fraktionsname = fraktionNames[killerFaction]
	local name = getPlayerName ( player )
	if validBlackListFactions[killerFaction] then
		if isOnBlacklist ( name, killerFaction ) then
			local prizeMoney = 200
			local prizeText = "Du bekommst 200 $"
			if factionBlackListGuns[killerFaction] == weapon then
				prizeText = prizeText.." + 100 $ wegen der verwendeten Waffe."
				prizeMoney = prizeMoney + 100
			else
				prizeText = prizeText.."."
			end
			blacklistPlayers[killerFaction][name] = nil
			MySQL_DelRow ( "blacklist", "Name LIKE '"..name.."' AND Fraktion LIKE '"..killerFaction.."'" )
			givePlayerSaveMoney ( killer, prizeMoney )
			outputChatBox ( "Du wurdest durch die "..fraktionsname.." erledigt, weil du auf der Blacklist warst.", player, 200, 0, 0 )
			outputChatBox ( "Du hast "..name.." von der Blacklist erledigt!", killer, 0, 200, 0 )
			outputChatBox ( prizeText, killer, 0, 200, 0 )	
			sendMSGForFaction ( "[FR]: "..getPlayerName(killer).." hat "..name.." aus der Blacklist getötet.", killerFaction, 0, 150, 0 )
			outputLog( "[BLACKLIST]: "..getPlayerName(killer).." hat "..name.." aus der Blacklist der "..fraktionsname.." erledigt.", "bad")
		end
	end
end

-- Delete old entrys --
local blackListCurTime = getSecTime ( 0 )
function checkBlackListEntrys()

	result = mysql_query ( handler, "SELECT * FROM blacklist" )
	if result then
		if ( mysql_num_rows ( result ) > 0 ) then
			blackListData = mysql_fetch_assoc ( result )
			mySQLBlackList ()
		else
			mysql_free_result ( result )
		end
	end
end
setTimer ( privVeh_spawning, 5000, 1 )

function mySQLBlackList ()

	local Name = blackListData["Name"]
	local Eintraeger = blackListData["Eintraeger"]
	local Fraktion = blackListData["Fraktion"]
	local Eintragungsdatum = blackListData["Eintragungsdatum"]
	
	blackListData = mysql_fetch_assoc ( result )
	if blackListData then
		mySQLBlackList ()
	else
		mysql_free_result ( result )
	end
end
checkBlackListEntrys()
-- Old entrys deleted --

function blacklist_func ( player, cmd, add, target, reason )

	if not add then
		infobox ( player, "\n\nGebrauch: /blacklist [add/delete/show]!", 5000, 125, 0, 0 )
	else
		if validBlackListFactions[laGetElementData ( player, "fraktion" )] then
			if add == "add" then
				if target then
					if reason then
						addBlacklist_func ( player, target, reason )
					else
						infobox ( player, "\n\nGebrauch: /blacklist add [NAME] [GRUND]!", 5000, 125, 0, 0 )
					end
				else
					infobox ( player, "\n\nGebrauch: /blacklist add [NAME]!", 5000, 125, 0, 0 )
				end
			elseif add == "delete" then
				blacklistdelete_func ( player, target )
			elseif add == "show" then
				showblacklist_func ( player )
			else
				infobox ( player, "\n\nGebrauch: /blacklist [add/delete/show]!", 5000, 125, 0, 0 )
			end
		else
			infobox ( player, "\n\nDu bist in einer ungültigen Fraktion!", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "blacklist", blacklist_func )

function blacklistdelete_func ( player, name )

	local target = getPlayerFromName( name )
	local name = getPlayerName ( target )
	local fraktion = laGetElementData ( player, "fraktion" )
	local fraktionsname = fraktionNames[fraktion]
if name then
	if MySQL_DatasetExist ( "blacklist", "Name LIKE '"..name.."' AND Fraktion LIKE '"..fraktion.."'" ) then
		if laGetElementData ( player, "rang" ) >= 3 then
			local fraktion = laGetElementData ( player, "fraktion" )
			blacklistPlayers[fraktion][name] = nil
			MySQL_DelRow ( "blacklist", "Name LIKE '"..name.."' AND Fraktion LIKE '"..fraktion.."'" )
			outputChatBox ( "Der Spieler "..name.." wurde von der Blacklist gelöscht!", player, 0, 125, 0 )
			sendMSGForFaction ( "[FR]: "..getPlayerName(player).." hat "..name.." aus der Blacklist entfernt.", fraktion, 150, 0, 0 )
			outputLog( "[BLACKLIST]: "..getPlayerName(player).." hat "..name.." aus der Blacklist der "..fraktionsname.." entfernt.", "bad")
		else
			outputChatBox ( "Erst ab Rang 3!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Der Spieler ist nicht auf der Blacklist!", player, 125, 0, 0 )
	end
else
	outputChatBox ( "Der Spieler ist nicht online!", player, 125, 0, 0 )
end
end
--addCommandHandler ( "blacklist delete", blacklist_func )


function showblacklist_func ( player )

	local fraktion = laGetElementData ( player, "fraktion" )
	if blacklistPlayers[fraktion] then
		outputChatBox ( "Spieler auf der Blacklist:", player, 0, 200, 0 )
		outputChatBox ( "__________________________", player, 0, 0, 200 )
		for key, index in pairs ( blacklistPlayers[fraktion] ) do
			if getPlayerName ( getPlayerFromName ( key ) ) then
				local reason = MySQL_GetString( "blacklist", "Grund", "Name LIKE '"..key.."' AND Fraktion LIKE '"..fraktion.."'"  )
				local eintraeger = MySQL_GetString( "blacklist", "Eintraeger", "Name LIKE '"..key.."' AND Fraktion LIKE '"..fraktion.."'"  )
				outputChatBox ( "#FF0000"..tostring ( key ).."; #C80000Grund: "..tostring ( reason ).."; #960000Einträger: "..tostring ( eintraeger ).."", player, 200, 0, 0, true )
			else
				blacklistPlayers[fraktion][key] = nil
			end
		end
	else
		outputChatBox ( "Du bist in einer ungültigen Fraktion!", player, 125, 0, 0 )
	end
end
--addCommandHandler ( "blacklist show", blacklist_func )

function addBlacklist_func ( player, member, ... )
	local reason = {...}
	reason = table.concat( reason, " " )
	local pname = getPlayerName ( player )
	local target = getPlayerFromName ( member )
	local targetname = getPlayerName ( target )
	local fraktion = laGetElementData ( player, "fraktion" )
	local fraktionsname = fraktionNames[fraktion]
	if target then
		if isZivi(target) then
			if laGetElementData ( player, "rang" ) >= 3 then
				if isOnBlacklist ( member, fraktion ) then
					infobox ( player, "\n\nDer Spieler ist bereits auf der Blacklist!", 5000, 125, 0, 0 )
				else
					local regtime = getRealTime()
					local year = regtime.year + 1900
					local month = regtime.month + 1
					local day = regtime.monthday
					local hour = regtime.hour
					local minute = regtime.minute
					local registerdatum = tostring(day.."."..month.."."..year..", "..hour..":"..minute)
					local lastlogin = registerdatum
					
					local result = mysql_query ( handler, "INSERT INTO blacklist ( Name, Eintraeger, Fraktion, Eintragungsdatum, Grund ) VALUES ( '"..member.."', '"..pname.."', '"..fraktion.."', '"..lastlogin.."', '"..reason.."' ) " )
					mysql_free_result ( result )
					infobox ( player, "\n\nDu hast "..targetname.." auf die Blacklist gesetzt!\n(Grund: "..tostring(reason)..")", 5000, 125, 0, 0 )
					blacklistPlayers[fraktion][getPlayerName(getPlayerFromName(member))] = true
					sendMSGForFaction ( "[FR]: "..pname.." hat "..targetname.." auf die Blacklist gesetzt.", fraktion, 0, 150, 0 )
					sendMSGForFaction ( "[FR]: Folgender Grund wurde angegeben: "..tostring(reason).."", fraktion, 0, 150, 0 )
					outputLog( "[BLACKLIST]: "..pname.." hat "..targetname.." auf der Blacklist der "..fraktionsname.." gesetzt. ("..tostring(reason)..")", "bad")
				end
			else
				outputChatBox ( "Erst ab Rang 3!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Das Ziel ist in einer Fraktion!", player, 125, 0, 0 )
		end
	else
		infobox ( player, "\n\nDer Spieler ist nicht online!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "blacklist add", blacklist_func )

function isOnBlacklist ( pname, fraktion )

	if MySQL_DatasetExist ( "blacklist", "Name LIKE '"..pname.."' AND Fraktion LIKE '"..fraktion.."'" ) then
		return true
	end
	return false
end