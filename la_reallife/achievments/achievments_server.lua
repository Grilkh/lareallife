function lookoutFound_func ( id )

	local player = client
	local pname = getPlayerName ( player )
	local dataString = MySQL_GetString ( "achievments", "LookoutsA", "Name LIKE '"..pname.."' " )
	if tonumber ( gettok ( dataString, id, string.byte ( '|' ) ) ) == 0 then
		local newstring = ""
		for i = 1, 10 do
			if i == id then
				newstring = newstring.."1".."|"
			else
				newstring = newstring..gettok ( dataString, i, string.byte ( '|' ) ).."|"
			end
		end
		local count = 0
		for i = 1, 10 do
			if tonumber ( gettok ( newstring, i, string.byte ( '|' ) ) ) == 1 then
				count = count + 1
			end
		end
		laSetElementData ( player, "bonuspoints", laGetElementData ( player, "bonuspoints" ) + 10 )
		laSetElementData ( player, "viewpoints", count )
		triggerClientEvent ( player, "showAchievmentBox", player, " Aussichts-\n punkt\n gefunden!", 10, 10000 )
		MySQL_SetString ( "achievments", "LookoutsA", newstring, "Name LIKE '"..pname.."' " )
	end
end
addEvent ( "lookoutFound", true )
addEventHandler ( "lookoutFound", getRootElement(), lookoutFound_func )

function casinoAchievCheck ( player, amount )

	local pname = getPlayerName ( player )
	if amount >= 100000 then
		if laGetElementData ( player, "chickendinner_achiev" ) == 0 then
			laSetElementData ( player, "bonuspoints", laGetElementData ( player, "bonuspoints" ) + 15 )
			triggerClientEvent ( player, "showAchievmentBox", player, " Chicken\n Dinner!", 15, 10000 )
			laSetElementData ( player, "chickendinner_achiev", 1 )
			MySQL_SetString ( "achievments", "ChickenDinner", 1, "Name LIKE '"..pname.."'" )
		end
	elseif amount <= -100000 then
		if laGetElementData ( player, "nichtsgehtmehr_achiev" ) == 0 then
			laSetElementData ( player, "bonuspoints", laGetElementData ( player, "bonuspoints" ) + 15 )
			triggerClientEvent ( player, "showAchievmentBox", player, " Nichts geht\n mehr!", 15, 10000 )
			laSetElementData ( player, "nichtsgehtmehr_achiev", 1 )
			MySQL_SetString ( "achievments", "NichtGehtMehr", 1, "Name LIKE '"..pname.."'" )
		end
	end
end

function ReallifeAchievCheck ( player )

	if tonumber ( laGetElementData ( player, "playingtime" ) ) >= 10000 and laGetElementData ( player, "rl_achiev" ) ~= "done" then							-- Achiev: Collector
		laSetElementData ( player, "rl_achiev", "done" )																									-- Achiev: Collector
		triggerClientEvent ( player, "showAchievmentBox", player, " Reallife -\n WTF?!", 50, 10000 )													-- Achiev: Collector
		laSetElementData ( player, "bonuspoints", tonumber(laGetElementData ( player, "bonuspoints" )) + 50 )												-- Achiev: Collector
		MySQL_SetString("achievments", "ReallifeWTF", laGetElementData ( player, "rl_achiev" ), "Name LIKE '"..getPlayerName(player).."'")
	end																																					-- Achiev: Collector
end

function OwnFootCheck ( player )

	if laGetElementData ( player, "own_foots" ) ~= "done" then
		laSetElementData ( player, "own_foots", "done" )																									-- Achiev: Own Foots
		triggerClientEvent ( player, "showAchievmentBox", player, " Eigene\n Füße!", 15, 10000 )														-- Achiev: Own Foots
		laSetElementData ( player, "bonuspoints", tonumber(laGetElementData ( player, "bonuspoints" )) + 15 )												-- Achiev: Own Foots
		MySQL_SetString("achievments", "EigeneFuesse", laGetElementData ( player, "own_foots" ), "Name LIKE '"..getPlayerName(player).."'")
	end
end

KingofTheHill = createMarker ( -2316.7216796875, -1661.7271728516, 483.32159423828, "corona", 200, 0, 0, 0, 0, getRootElement() )
function KingofTheHillCheck ( hitElement )

	if getElementType ( hitElement ) == "vehicle" then 
		player = getVehicleOccupant ( hitElement, 0 ) 
	else
		if getElementType ( hitElement ) == "player" then 
			player = hitElement
		else
			player = nil
		end
	end
	if player then
		if laGetElementData ( player, "kingofthehill_achiev" ) ~= "done" then
			laSetElementData ( player, "kingofthehill_achiev", "done" )																						-- Achiev: King of the Hill
			triggerClientEvent ( player, "showAchievmentBox", player, " King of\n the Hill!", 15, 10000 )													-- Achiev: King of the Hill
			laSetElementData ( player, "bonuspoints", tonumber(laGetElementData ( player, "bonuspoints" )) + 15 )												-- Achiev: King of the Hill
			MySQL_SetString("achievments", "KingOfTheHill", laGetElementData ( player, "kingofthehill_achiev" ), "Name LIKE '"..getPlayerName(player).."'")
		end
	end
end
addEventHandler ( "onMarkerHit", KingofTheHill, KingofTheHillCheck )

function checkCarWahnAchiev ()

	
end

function HighwayToHellCheck ( veh )

	local player = source
	if laGetElementData ( player, "highwaytohell_achiev" ) ~= "done" then
		if veh then
			if bikerskins[getElementModel(player)] and getElementModel ( veh ) == 463 then
				triggerClientEvent ( player, "showAchievmentBox", player, " Born to\n be Wild!", 10, 10000 )													-- Achiev: Born to be Wild!
				laSetElementData ( player, "bonuspoints", tonumber(laGetElementData ( player, "bonuspoints" )) + 10 )
				laSetElementData ( player, "highwaytohell_achiev", "done" )
				MySQL_SetString("achievments", "HighwayToHell", laGetElementData ( player, "highwaytohell_achiev" ), "Name LIKE '"..getPlayerName(player).."'")
			end
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), HighwayToHellCheck )