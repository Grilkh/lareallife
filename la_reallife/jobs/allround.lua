--Koordinaten--

fischerx, fischery, fischerz = -1724.9904785156, 1461.3231201172, 7
taxix, taxiy, taxiz = -2548.064, 672.6994, 27.973125
drugsx, drugsy, drugsz = -2109.357, 1.0, 35.32
mechanikerx, mechanikery, mechanikerz = -2032.45, 161.38, 28.74
truckerx, truckery, truckerz = -1838.64, 111.21, 15.117
hitmanx, hitmany, hitmanz = -1830.7301025391, 572.65557861328, 34.81
hotdogx, hotdogy, hotdogz = -1706.1116943359, 13.159648895264, 3.2039132118225
trashx, trashy, trashz = -1897.1510009766, -1671.5749511719, 22.664850234985
anwaltx, anwalty, anwaltz = 2462.6357421875, 2243.0849609375, 10.8203125
lieferantx, lieferanty, lieferantz = -1569.897, 131.55, 3.554
busx, busy, busz = -1974.239, 478.692, 29.016
gabelstaplerx, gabelstaplery, gabelstaplerz = -2968.8000488281, 1231.5999755859, 5
airportx, airporty, airportz = -1421.776, -288.33, 14.148

--Blips--

fischerblip = createBlip ( fischerx, fischery, fischerz, 9, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( fischerblip, getRootElement(), false )

taxiblip = createBlip ( taxix, taxiy, taxiz, 52, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( taxiblip, getRootElement(), false )

drugsblip = createBlip ( drugsx, drugsy, drugsz, 62, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( drugsblip, getRootElement(), false )

--[[mechanikerblip = createBlip ( mechanikerx, mechanikery, mechanikerz, 59, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( mechanikerblip, getRootElement(), false )]]

truckerblip = createBlip ( truckerx, truckery, truckerz, 51, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( truckerblip, getRootElement(), false )

--[[hitmanblip = createBlip ( hitmanx, hitmany, hitmanz, 43, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( hitmanblip, getRootElement(), false )]]

hotdogblip = createBlip ( hotdogx, hotdogy, hotdogz, 50, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( hotdogblip, getRootElement(), false )

trashblip = createBlip ( trashx, trashy, trashz, 42, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( trashblip, getRootElement(), false )

--[[anwaltblip = createBlip ( anwaltx, anwalty, anwaltz, 52, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( anwaltblip, getRootElement(), false )]]

lieferantblip = createBlip ( lieferantx, lieferanty, lieferantz, 51, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( lieferantblip, getRootElement(), false )

busblip = createBlip ( busx, busy, busz, 51, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( busblip, getRootElement(), false )

gabelstaplerblip = createBlip ( gabelstaplerx, gabelstaplery, gabelstaplerz, 51, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( gabelstaplerblip, getRootElement(), false )

--Pickups--

local jobIcons = {}

--jobIcons["fischer"] = createPickup ( fischerx, fischery, fischerz, 3, 1239, 1000, 0 )

--jobIcons["taxi"] = createPickup ( taxix, taxiy, taxiz, 3, 1239, 1000, 0 )

--jobIcons["drug"] = createPickup ( drugsx, drugsy, drugsz, 3, 1239, 1000, 0 )

--jobIcons["mechaniker"] = createPickup ( mechanikerx, mechanikery, mechanikerz, 3, 1239, 1000, 0 )

--jobIcons["wdealer"] = createPickup ( -2627.5083007813, 209.36631774902, 4.1959328651428, 3, 1239, 100, 0 )

--jobIcons["trucker"] = createPickup ( truckerx, truckery, truckerz, 3, 1239, 1000, 0 )

--jobIcons["airport"] = createPickup ( airportx, airporty, airportz, 3, 1239, 1, 99 )

--jobIcons["hitman"] = createPickup ( hitmanx, hitmany, hitmanz, 3, 1239, 1000, 0 )
--setElementAlpha ( hitmanjobicon, 0 )

--jobIcons["hotdog"] = createPickup ( hotdogx, hotdogy, hotdogz, 3, 1239, 1000, 0 )

--jobIcons["trash"] = createPickup ( trashx, trashy, trashz, 3, 1239, 1, 99 )

--jobIcons["anwalt"] = createPickup ( anwaltx, anwalty, anwaltz, 3, 1239, 1000, 0 )

jobIcons["lieferant"] = createPickup ( lieferantx, lieferanty, lieferantz, 3, 1239, 50, 0 )

--jobIcons["bus"] = createPickup ( busx, busy, busz, 3, 1239, 50, 0 )

--jobIcons["gabelstapler"] = createPickup ( gabelstaplerx, gabelstaplery, gabelstaplerz, 3, 1239, 50, 0 )
 
--Pickup-Hit--

function JobIconHit ( player )

	if source == jobIcons["lieferant"] then
		if laGetElementData ( player, "job" ) == "lieferant" then
			infobox ( "\n\nTippe /auftrag, um einen\nAuftrag anzunehmen!", 1000, 200, 200, 0 )
		else
			infobox ( "\n\nTippe /job, um Lieferant zu werden.\nDazu brauchst du einen Führerschein!", 1000, 200, 200, 0 )
		end
	end
end

for index, job in pairs(jobIcons) do
	addEventHandler ( "onPickupHit", job, JobIconHit )
end


function isHitman ( player )
	if laGetElementData ( player, "job" ) == "hitman" then return true else return false end
end

function werbung_func ( player, cmd, ... )
	
	local parametersTable = {...}
	local stringWithAllParameters = table.concat( parametersTable, " " )
	local length = #stringWithAllParameters
	local costs = length*adcosts+adbasiscosts
if laGetElementData ( player, "handystate" ) == "on" then
	if laGetElementData ( player, "money" ) >= costs then
		if #stringWithAllParameters <= 50 then
			if laGetElementData ( player, "playingtime" ) >= 180 then
				local time = getRealTime()
				local curtime = time.second+time.minute*60+time.hour*60*60
				if lastadtime-curtime < -30 or lastadtime > curtime then
					lastadtime = curtime
					outputChatBox ( "#339900[WERBUNG] #FA6432"..stringWithAllParameters.."", getRootElement(), 250, 100, 50, true )
					outputChatBox ( "#339900von: #FA6432"..getPlayerName ( player ).." #339900Tel: #FA6432"..laGetElementData(player,"telenr").."", getRootElement(), 250, 100, 50, true )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) - costs )
					takePlayerMoney ( player, costs )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					playSoundFrontEnd ( player, 40 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs kann nur alle 30 Sekunden\neine Werbung geschaltet werden!", 7500, 125, 0, 0 )
				end	
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst mindestens schon\n180 Minuten gespielt haben!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDeine Werbung darf maximal 35 Zeichen beinhalten!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld! Werbung kostet\n"..adcosts.."$ pro Zeichen und\n"..adbasiscosts.."$ Grundkosten!", 7500, 125, 0, 0 )
	end
else
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDein Handy ist aus!", 7500, 125, 0, 0 )
end
end
addCommandHandler ( "werbung", werbung_func )

function ad_func ( player, cmd, ... )
outputChatBox ( "Verwende bitte /werbung anstatt /ad!", player, 255, 0, 0 )
end
addCommandHandler ( "ad", ad_func )

function job_func ( player )

	triggerClientEvent ( player, "killcityhallmarker", getRootElement() )
	local x1, y1, z1 = getElementPosition ( player ) --Spieler
	--local x2, y2, z2 = getElementPosition ( jobIcons["fischer"] ) --Fischer
	--local x3, y3, z3 = getElementPosition ( jobIcons["taxi"] ) --Taxi
	--local x4, y4, z4 = getElementPosition ( jobIcons["drug"] ) --WeedDealer
	--local x5, y5, z5 = getElementPosition ( jobIcons["mechaniker"] ) --Mechaniker
	--local x6, y6, z6 = getElementPosition ( jobIcons["wdealer"] ) --Waffendealer
	local x7, y7, z7 = getElementPosition ( jobIcons["trucker"] ) --Trucker
	--local x8, y8, z8 = getElementPosition ( jobIcons["airport"] ) --Flugjob
	--local x9, y9, z9 = getElementPosition ( jobIcons["hitman"] ) --Hitman
	--local x10, y10, z10 = getElementPosition ( jobIcons["hotdog"] ) --Hotdog
	local x11, y11, z11 = getElementPosition ( jobIcons["trash"] ) --Mülljob
	--local x12, y12, z12 = getElementPosition ( jobIcons["anwalt"] ) --Anwalt
	local x13, y13, z13 = getElementPosition ( jobIcons["lieferant"] ) --Lieferant
	--local x14, y14, z14 = getElementPosition ( jobIcons["bus"] ) --Busjob
	--local x15, y15, z15 = getElementPosition ( jobIcons["gabelstapler"] ) -- Gabelstapler
	if tonumber ( laGetElementData ( player, "jobtime" ) ) == 0 then
		if laGetElementData ( player, "job" ) == "none" then
			if getDistanceBetweenPoints3D ( x1, y1, z1, x13, y13, z13 ) < 5 then
				laSetElementData ( player, "job", "lieferant" )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nun Lieferant!\nÖffne das Hilfemenü für mehr Informationen!", 7500, 0, 125, 0 )
				setElementVisibleTo ( lieferantblip, player, true )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist bei keinem Arbeitgeber!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Job!\nTippe /quitjob, um zu kündigen.", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst noch "..laGetElementData ( player, "jobtime" ).." Minuten warten,\nbis du einen Job annehmen kannst.", 5000, 125, 0, 0 )
	end
	showFittingBlipForPlayer ( player )
end
addCommandHandler ( "job", job_func )

function quitjob_func ( player )

	if laGetElementData ( player, "job" ) == "none" or getElementModel ( getPedOccupiedVehicle ( player ) ) == 453 then
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keinen Job!", 5000, 125, 0, 0 )
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nun arbeitslos!", 7500, 0, 125, 0 )
		setElementVisibleTo ( fischerblip, player, false )
		laSetElementData ( player, "job", "none" )
		hideblips ( player )
		triggerClientEvent ( player, "destroyDrugJobMarker", player )
	end
end
addCommandHandler ( "quitjob", quitjob_func )

function hideblips ( player )
	setElementVisibleTo ( fischerblip, player, false )
	setElementVisibleTo ( taxiblip, player, false )
	setElementVisibleTo ( drugsblip, player, false )
	--setElementVisibleTo ( mechanikerblip, player, false )
	setElementVisibleTo ( truckerblip, player, false )
	--setElementVisibleTo ( hitmanblip, player, false )
	setElementVisibleTo ( hotdogblip, player, false )
	setElementVisibleTo ( trashblip, player, false )
	--setElementVisibleTo ( anwaltblip, player, false )
	setElementVisibleTo ( lieferantblip, player, false )
	setElementVisibleTo ( busblip, player, false )
	setElementVisibleTo ( gabelstaplerblip, player, false )
end

function showFittingBlipForPlayer ( player )
	setElementVisibleTo ( fischerblip, player, false )
	setElementVisibleTo ( taxiblip, player, false )
	setElementVisibleTo ( drugsblip, player, false )
	--setElementVisibleTo ( mechanikerblip, player, false )
	setElementVisibleTo ( truckerblip, player, false )
	--setElementVisibleTo ( hitmanblip, player, false )
	setElementVisibleTo ( hotdogblip, player, false )
	setElementVisibleTo ( trashblip, player, false )
	--setElementVisibleTo ( anwaltblip, player, false )
	setElementVisibleTo ( lieferantblip, player, false )
	setElementVisibleTo ( busblip, player, false )
	setElementVisibleTo ( gabelstaplerblip, player, false )
	
	local job = laGetElementData ( player, "job" )
	if job == "fischer" then
		setElementVisibleTo ( fischerblip, player, true )
	elseif job == "taxifahrer" then
		setElementVisibleTo ( taxiblip, player, true )
	elseif job == "dealer" then
		setElementVisibleTo ( drugsblip, player, true )
	--[[elseif job == "mechaniker" then
		setElementVisibleTo ( mechanikerblip, player, true )]]
	elseif job == "trucker" then
		setElementVisibleTo ( truckerblip, player, true )
	--[[elseif job == "hitman" then
		setElementVisibleTo ( hitmanblip, player, true )]]
	elseif job == "hotdog" then
		setElementVisibleTo ( hotdogblip, player, true )
	elseif job == "streetclean" then
		setElementVisibleTo ( trashblip, player, true )
	--[[elseif job == "anwalt" then
		setElementVisibleTo ( anwaltblip, player, true )]]
	elseif job == "lieferant" then
		setElementVisibleTo ( lieferantblip, player, true )
	elseif job == "bus" then
		setElementVisibleTo ( busblip, player, true )
	elseif job == "gabelstapler" then
		setElementVisibleTo ( gabelstaplerblip, player, true )
	else
		hideblips ( player )
	end
end

function eject_func ( player, cmd, nick )

	if getPedOccupiedVehicleSeat ( player ) == 0 then
		local target = getPlayerFromName ( nick )
		local veh = getPedOccupiedVehicle ( player )
		if target and target ~= player then
			if getPedOccupiedVehicle ( target ) == veh then
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast "..nick.."\naus deinem Fahrzeug geworfen!", 7500, 0, 125, 0 )
				triggerClientEvent ( target, "infobox_start", getRootElement(), "\n\nDu wurdest aus dem Fahrzeug geworfen!", 7500, 0, 125, 0 )
				opticExitVehicle ( target )
				--setPedAnimation ( target, "ped", "CAR_fallout_LHS", -1, false, true, false )
				--setTimer ( carEject, 1000, 1, player )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler sitzt nicht in deinem Fahrzeug!", 7500, 0, 125, 0 )
			end
		elseif nick == "all" then
			for i = 1, 4 do
				_G["seat"..i] = getVehicleOccupant ( veh, i )
				if _G["seat"..i] then 
					opticExitVehicle ( _G["seat"..i] )
					--setPedAnimation ( _G["seat"..i], "ped", "CAR_fallout_LHS", -1, false, true, false )
					--setTimer ( carEject, 1000, 1, _G["seat"..i] )
				end
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Name!", 7500, 0, 125, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Fahrer!", 7500, 0, 125, 0 )
	end
end
addCommandHandler ( "eject", eject_func )

function carEject ( player )

	setPedAnimation ( player )
end