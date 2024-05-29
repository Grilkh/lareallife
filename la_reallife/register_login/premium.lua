function checkPremium ( player )

	local pname = MySQL_Save ( getPlayerName ( player ) )
	local curtime = getRealTime()
	local year = curtime.year + 1900
	local month = curtime.month + 1
	local day = curtime.monthday
	local hour = curtime.hour
	local minute = curtime.minute
	local yearday  = curtime.yearday+1
	local PremDay = tonumber ( MySQL_GetString("bonustable", "PremiumUntilDay", "Name LIKE '" ..pname.."'") )
	local PremYear = tonumber ( MySQL_GetString("bonustable", "PremiumUntilYear", "Name LIKE '" ..pname.."'") )
	if PremDay and PremYear then
		if PremDay >= yearday and PremYear >= year then
			local restdays = (PremYear-year)*365+(PremDay-yearday)
			if restdays <= 3 then
				outputChatBox ( "Premium-Status: Nur noch "..restdays.." Tage aktiv!", player, 200, 150, 0 )
			else
				outputChatBox ( "Premium-Status: Noch "..restdays.." Tage aktiv!", player, 150, 200, 0 )
			end
			laSetElementData ( player, "premium", true )
		elseif PremYear > year then
			local restdays = (PremYear-year)*365+(PremDay-yearday)
			if restdays <= 3 then
				outputChatBox ( "Premium-Status: Nur noch "..restdays.." Tage aktiv!", player, 200, 150, 0 )
			else
				outputChatBox ( "Premium-Status: Noch "..restdays.." Tage aktiv!", player, 150, 200, 0 )
			end
			laSetElementData ( player, "premium", true )
		elseif tonumber ( laGetElementData ( player, "adminlvl" ) ) >= 2 then
			outputChatBox ( "Premium-Status: Aktiv (Du bist ein Teammitglied)", player, 200, 200, 0 )
			laSetElementData ( player, "premium", true )
		else
			if laGetElementData ( player, "premiumabfrage") == true then
				outputChatBox ( "Premium-Status: Nicht aktiv!", player, 200, 0, 0 )
			else
				laSetElementData ( player, "premiumabfrage", true )
			end
			laSetElementData ( player, "premium", false )
		end
	end
	--laSetElementData ( player, "premium", true )
end
addCommandHandler ( "premium", checkPremium )
addCommandHandler ( "prem", checkPremium )

function isPremium ( player)
	if laGetElementData ( player, "premium") == true then
		return true
	else
		return false
	end
end
addEvent ( "isPremium", true )
addEventHandler ( "isPremium", getRootElement(), isPremium )


function setPremiumData ( player )

	if isPremium(player) then
		laSetElementData ( player, "maxcars", 15 )
		triggerClientEvent ( player, "loadFriendlist", getRootElement() )
	else
		if laGetElementData ( player, "maxcars" ) then
			if tonumber ( laGetElementData ( player, "maxcars" ) ) > 10 then
				--if laGetElementData ( player, "carslotupgrade" ) == "buyed" then
					laSetElementData ( player, "maxcars", 10 )
				--[[else
					laSetElementData ( player, "maxcars", 3 )
				end]]
			end
		end
	end
	--[[if laGetElementData ( player, "adminlvl" ) >= 1 then
	elseif laGetElementData ( player, "carslotupgrade" ) == "buyed" then
		laSetElementData ( player, "maxcars", 5 )
	else
		laSetElementData ( player, "maxcars", 3 )
	end]]
end
--[[
Aktuelle Premium Funktionen:

10 Carslots

Gratis PMs

Beim Tod 50% weniger Geld verlieren

Spawn mit Schlagring

Friendlist

Premium Autohaus mit:
Oceanic, Euros, Stunflugzeug, Burrito, Phoenix, Sabre, Hotknife
]]