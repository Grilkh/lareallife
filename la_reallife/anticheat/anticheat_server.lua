badWeapons = { 
[9]=true, [27]=false, [28]=false, [32]=false, [37]=true,
[28]=false, [38]=true, [41]=false, [42]=false }

function anticheatbot_guns ( player, cheat, gun )

	local cheat = MySQL_Save ( cheat )
	if not testmode and player == client then
		setElementData ( player, "cheatingtrys", getElementData ( player, "cheatingtrys" ) + 1 )
		if badWeapons[gun] then
			local pname = MySQL_Save ( getPlayerName(player) )
			outputChatBox ( pname.." wurde wegen Waffencheat vom Anticheatbot gebannt.", getRootElement(), 255, 0, 0 )
			local ip = getPlayerIP ( player )
			local serial = getPlayerSerial ( player )
			mysql_query(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..pname.."', 'Anticheat', '"..cheat.."', '"..timestamp().."', '"..ip.."', '"..serial.."')")
			kickPlayer ( player, "Vom Anticheatbot gebannt!" )
		end
	end
end
addEvent( "guncheater_ban", true )
addEventHandler( "guncheater_ban", getRootElement(), anticheatbot_guns )

function anticheatbot_health ()

	local player = source
	if not testmode and player == client then
		if not isPedDead ( player ) then
			banPlayer ( player, true, true, false, getRootElement(), "Healthcheat ( 5 Minuten Timeban )", 60*5 )
		end
	end
end
addEvent( "healthcheater_ban", true )
addEventHandler( "healthcheater_ban", getRootElement(), anticheatbot_health )

function speedhackcheater_ban_func ( player )

	if not testmode and player == client then
		setElementData ( player, "cheatingtrys", getElementData ( player, "cheatingtrys" ) + 1 )
		if getElementData ( player, "cheatingtrys" ) >= 5 then
			local pname = MySQL_Save ( getPlayerName(player) )
			outputChatBox ( pname.." wurde wegen Speedhack vom Anticheatbot gebannt.", getRootElement(), 255, 0, 0 )
			local ip = getPlayerIP ( player )
			local serial = getPlayerSerial ( player )
			mysql_query(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..pname.."', 'Anticheat', 'Speedhack', '"..timestamp().."', '"..ip.."', '"..serial.."')")
			kickPlayer ( player, "Vom Anticheatbot gebannt! (Speedhack)" )
		end
	end
end
addEvent( "speedhackcheater_ban", true )
addEventHandler( "speedhackcheater_ban", getRootElement(), speedhackcheater_ban_func )

function anticheatbot_armor ( player )

	if not testmode and player == client then
		setElementData ( player, "cheatingtrys", getElementData ( player, "cheatingtrys" ) + 1 )
		--[[if getElementData ( player, "cheatingtrys" ) >= 0 then
			setElementData ( player, "cheatingtrys", getElementData ( player, "cheatingtrys" ) + 1 )
			outputChatBox ( getPlayerName(player).. " wurde wegen Armorcheat vom Anticheatbot gebannt.", getRootElement(), 255, 0, 0 )
			banPlayer ( player, true, true, false, getRootElement(), "Healthcheat", 0 )
		end]]
	end
end
addEvent( "armorcheater_ban", true )
addEventHandler( "armorcheater_ban", getRootElement(), anticheatbot_armor )

function anticheatbot_jetpack ( player )

	if not testmode and player == client then
		outputChatBox ( getPlayerName(player).. " wurde wegen Jetpackcheat vom Anticheatbot gebannt.", getRootElement(), 255, 0, 0 )
		banPlayer ( player, true, true, false, getRootElement(), "Jetpackcheat", 0 )
	end
end
addEvent ( "jetpackcheater_ban", true )
addEventHandler ( "jetpackcheater_ban", getRootElement(), anticheatbot_jetpack )