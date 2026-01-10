mlkws = { [515]=true, [514]=true, [403]=true }

truckCount = 0

truckerMarker = {}
 truckerMarker[1] = createMarker ( -1476.386, 2689.423, 55.84, "checkpoint", 7, 255, 255, 255, 150, getRootElement() )
 truckerMarker[2] = createMarker ( -2212.1804199219, -2329.2917480469, 30.62, "checkpoint", 7, 255, 255, 255, 150, getRootElement() )
 truckerMarker[3] = createMarker ( -1087.8612060547, -1645.2569580078, 76.36, "checkpoint", 7, 255, 255, 255, 150, getRootElement() )
 truckerMarker[4] = createMarker ( -71.322486877441, -1113.4566650391, 1.078, "checkpoint", 7, 255, 255, 255, 150, getRootElement() )
 truckerMarker[5] = createMarker ( -514.51898193359, -85.45874786377, 61.77, "checkpoint", 7, 255, 255, 255, 150, getRootElement() )

truckerBlip = {}
 truckerBlip[1] = createBlip ( -1476.386, 2689.423, 56.84, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
 truckerBlip[2] = createBlip ( -2212.1804199219, -2329.2917480469, 30.62, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
 truckerBlip[3] = createBlip ( -1087.8612060547, -1645.2569580078, 76.36, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
 truckerBlip[4] = createBlip ( -71.322486877441, -1113.4566650391, 1.078, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )
 truckerBlip[5] = createBlip ( -514.51898193359, -85.45874786377, 61.77, 19, 2, 255, 0, 0, 255, 0, 99999.0, getRootElement() )

for key, index in pairs ( truckerMarker ) do
	setElementVisibleTo ( index, getRootElement(), false )
end
for key, index in pairs ( truckerBlip ) do
	setElementVisibleTo ( index, getRootElement(), false )
end


function TruckerWantedAccept ( player, x, y, z )
local nx, ny, nz = getElementPosition (player)
	if getDistanceBetweenPoints3D(x, y, z, nx, ny, nz) <= 5 then
		laSetElementData ( player, "TruckerWanted", true )
		outputChatBox ( "Du darfst dich nun bewegen und den Job erneut auswählen.", player, 0, 150, 0 )
	else
		laSetElementData ( player, "TruckerWanted", false )
		outputChatBox ( "Du hast dich vor Ablauf der Zeit bewegt!", player, 150, 0, 0 )
	end
end

function truckTour_func ( player, truckModel, tour )
	
	if player == client then
		local money = laGetElementData ( player, "money" )
		local wanteds = laGetElementData ( player, "wanteds" )
		
		if wanteds > 0 then
			if (laGetElementData ( player, "TruckerWanted" ) == false) or (laGetElementData ( player, "TruckerWanted" ) == nil) then
				local time = wanteds * 10000
				local timetext = time / 1000
				local x, y, z = getElementPosition (player)
				setTimer(TruckerWantedAccept, time, 1, player, x, y, z)
				laSetElementData ( player, "TruckerWanted", 1 )
				outputChatBox ( "Bleib hier "..timetext.." Sekunden stehen und verhalte dich unauffällig.", player, 150, 0, 0 )
				outputChatBox ( "Sobald die Zeit abgelaufen ist und du dich nicht zu fest bewegt hast, kannst du den Job starten.", player, 150, 0, 0 )
				return
			elseif laGetElementData ( player, "TruckerWanted" ) == 1 then
				outputChatBox ( "Du musst noch warten!", player, 150, 0, 0 )
				return
			else
				outputChatBox ( "Deine Tour wird gestartet!", player, 0, 150, 0 )
				laSetElementData ( player, "TruckerWanted", false )
			end
		end
		local WantedAnzahlung = 0
		if wanteds > 0 then
			WantedAnzahlung = (_G["tour"..tour.."Price"] / 5) * wanteds
		end
			local GesamtAnzahlung = _G["tour"..tour.."Price"] + WantedAnzahlung
		if GesamtAnzahlung <= money then
			local anzahlungmoney = money - GesamtAnzahlung
			laSetElementData( player, "money", anzahlungmoney)
			triggerClientEvent ( player, "HudEinblendenMoney", player )
			laSetElementData ( player, "TruckerWantedAnzahlung", WantedAnzahlung)
			
			truckCount = truckCount + 1
			
			local rnd = math.random ( 1,3 )
			if rnd == 1 then model = 450 elseif rnd == 2 then model = 591 else model = 435 end
			if not truckModel then
				model = 515
			end
			local rnd = math.random ( 1, 4 )
			if rnd == 1 then
				truck = createVehicle ( truckModel, -1865.98, 136.316, 16.56 )
				trailer = createVehicle ( model, -1865.98, 136.316-6.4, 16.56 )
			elseif rnd == 2 then
				truck = createVehicle ( truckModel, -1855.98, 136.316, 16.56 )
				trailer = createVehicle ( model, -1855.98, 136.316-6.4, 16.56 )
			elseif rnd == 3 then
				truck = createVehicle ( truckModel, -1845.98, 136.316, 16.56 )
				trailer = createVehicle ( model, -1845.98, 136.316-6.4, 16.56 )
			elseif rnd == 4 then
				truck = createVehicle ( truckModel, -1825.98, 136.316, 16.56 )
				trailer = createVehicle ( model, -1825.98, 136.316-6.4, 16.56 )
			end
			attachTrailerToVehicle ( truck, trailer )
			setElementVelocity ( trailer, 0, 0, 0 )
			setTimer ( attachTrailerToVehicle, 50, 1, truck, trailer )
			setTimer ( setElementVelocity, 50, 1, trailer, 0, 0, 0 )
			setElementParent ( trailer, truck )
			setVehicleLocked ( truck, true )
			--warpPedIntoVehicle ( player, truck )
			setTimer(warpPedIntoVehicle, 500, 1, player, truck)
			setTimer(TruckerMissionAccept, 1000, 1, player)
			
			laSetElementData ( trailer, "cargo", tour )
			laSetElementData ( truck, "cargo", tour )
			
			local rnd = math.random ( 1, 5 )
			setElementVisibleTo ( truckerMarker[rnd], player, true )
			setElementVisibleTo ( truckerBlip[rnd], player, true )
			
			if rnd == 1 then											-- Bayside weiter oben
				minutes = 2
				seconds = 45
			elseif rnd == 2 then										-- Angle Pine
				minutes = 2
				seconds = 30
			elseif rnd == 3 then										-- Farm
				minutes = 3
				seconds = 0
			elseif rnd == 4 then										-- _G["truck"..truckCount]stop
				minutes = 3
				seconds = 0
			else														-- Holzfabrik
				minutes = 3
				seconds = 0
			end

			if tour == 1 then
				outputChatBox ( "[AUFGABE]: Bringe die Ware zum Ziel. Verlässt du das Fahrzeug, ist die Mission gescheitert.", player, 0, 100, 200 )
			elseif tour == 2 then
				outputChatBox ( "[AUFGABE]: Bringe die Ware zum Ziel. Halte dich dabei an das gegebene Zeitlimit!", player, 0, 100, 200 )
				triggerClientEvent ( player, "showTime", getRootElement(), minutes, seconds )
			elseif tour == 3 then
				outputChatBox ( "[AUFGABE]: Bringe die Ware zum Ziel, aber pass auf, sie ist hochexplosiv!", player, 0, 100, 200 )
				triggerClientEvent ( player, "showDamageBar", getRootElement() )
			elseif tour == 4 then
				outputChatBox ( "[AUFGABE]: Bringe die Ware im Zeitrahmen zum Ziel. Jedoch ist sie hochexplosiv und die Cops sind dir auf den Fersen!", player, 0, 100, 200 )
				triggerClientEvent ( player, "showDamageBar", getRootElement() )
				triggerClientEvent ( player, "showTime", getRootElement(), minutes, seconds )
			end
			
			setTimer ( trailerDetatchEvent, 2500, 1, trailer )
			addEventHandler ( "onVehicleExit", truck, leaveTruck )
		else
			outputChatBox ( "Du hast nicht genug Geld um die Anzahlung zu bezahlen!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "truckTour", true )
addEventHandler ( "truckTour", getRootElement(), truckTour_func )

function TruckerMissionAccept ( player )
setElementData ( player, "isintruckermission", true )
end

function trailerDetatchEvent ( trailer )

	addEventHandler ( "onTrailerDetatch", trailer, trailerDetatch )
end

function removePedFromTruck_func ( player )

	if player == client then
		removePedFromVehicle ( player )
		setElementData ( player, "isintruckermission", false )
	end
end
addEvent ( "removePedFromTruck", true )
addEventHandler ( "removePedFromTruck", getRootElement(), removePedFromTruck_func )

function truckExplode_func ( player )
	local veh = getPedOccupiedVehicle ( player )
	if laGetElementData ( player, "job" ) == "trucker" and lkws[getElementModel (veh)] then
		if getElementData ( player, "isintruckermission" ) then
			setElementHealth ( getPedOccupiedVehicle ( player ), 50 )
			--laSetElementData ( player, "wanteds", laGetElementData ( player, "oldwanteds" ) )
			hideTruckMarkers ( player )
			setTimer ( spawnAtTruckbase, 3000, 1, player )
			setElementData ( player, "isintruckermission", false )
			setTimer( destroyvehtrucker, 10000, 1, veh )
		end
	end
end
addEvent ( "truckExplode", true )
addEventHandler ( "truckExplode", getRootElement(), truckExplode_func )

function destroyvehtrucker ( veh)
destroyElement ( veh )
end

function trailerDetatch ( truck )

	local truck = getPedOccupiedVehicle ( source )
	local player = getVehicleOccupant ( truck )
	if player then
		if lkws[getElementModel ( truck )] then
			teleportTruckKill ( player, truck, source )
			outputChatBox ( "Du hast den Anhänger verloren!", player, 125, 0, 0 )
			setElementData ( player, "isintruckermission", false )
		end
	end
end

function quitTruck ()

	local veh = getPedOccupiedVehicle ( source )
	if veh then
		if laGetElementData ( veh, "cargo" ) then
			destroyElement ( truck )
			destroyElement ( trailer )
			setElementData ( player, "isintruckermission", false )
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), quitTruck )

function leaveTruck ( player )

	local veh = source
	if laGetElementData ( player, "job" ) == "trucker" and lkws[getElementModel (veh)] then
		if getElementData ( player, "isintruckermission" ) then
		destroyElement ( veh )
		--laSetElementData ( player, "wanteds", laGetElementData ( player, "oldwanteds" ) )
		hideTruckMarkers ( player )
		setTimer ( spawnAtTruckbase, 1000, 1, player )
		setElementData ( player, "isintruckermission", false )
		outputChatBox ( "Auftrag abgebrochen - Du hast das Fahrzeug verlassen!", player, 125, 0, 0 )
		end
	end
end

function spawnAtTruckbase ( player )

	setElementPosition ( player, -1842.02, 111.164, 15.11 )
end

function teleportTruckKill ( player, truck, trailer )

	if player then
		removePedFromVehicle ( player )
		destroyElement ( truck )
		if trailer then
			destroyElement ( trailer )
		end
		hideTruckMarkers ( player )
		setElementPosition ( player, -1842.02, 111.164, 15.11 )
		--outputChatBox ( "Mission gescheitert!", player, 125, 0, 0 )
	end
end

function hideTruckMarkers ( player )
	
	for i = 1, 5 do
		setElementVisibleTo ( truckerMarker[i], player, false )
		setElementVisibleTo ( truckerBlip[i], player, false )
	end
end

function hitTruckMarker ( veh )

	if isTruckMarker ( source ) then
		local player = getVehicleOccupant ( veh )
		if player then
			if isElementVisibleTo ( source, player ) then
				local trailer = getVehicleTowedByVehicle ( veh )
				local cargo = laGetElementData ( veh, "cargo" )
				local WantedAnzahlung = laGetElementData ( player, "TruckerWantedAnzahlung")
				local einnahmen = (_G["tour"..cargo.."Price"]*4) + WantedAnzahlung
				laSetElementData ( player, "TruckerWantedAnzahlung", 0)
				setElementData ( player, "isintruckermission", false )
				teleportTruckKill ( player, veh, trailer )
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) + einnahmen )
				givePlayerMoney ( player, einnahmen )
				triggerClientEvent ( player, "HudEinblendenMoney", player )
				laSetElementData ( player, "TruckerWanted", false )
				
				triggerClientEvent ( player, "achievsound", player )
				local trucklvl = tonumber ( laGetElementData ( player, "truckerlvl" ) )
				
				if trucklvl == 19 then
					triggerClientEvent ( player, "showAchievmentBox", player, "  Road-\n runner", 15, 10000 )
					laSetElementData ( player, "bonuspoints", tonumber(laGetElementData ( player, "bonuspoints" )) + 15 )
				elseif trucklvl == 2 then
					outputChatBox ( "[INFO]: Eillieferung freigeschaltet!", player, 200, 200, 0 )
					infobox ( player, "\n\nAuftrag abgeschlossen!\nDu erhältst "..einnahmen.."$ dafür!", 15000, 0, 125, 0 )
				elseif trucklvl == 9 then
					outputChatBox ( "[INFO]: Explosive Lieferung freigeschaltet!", player, 200, 200, 0 )
					infobox ( player, "\n\nAuftrag abgeschlossen!\nDu erhältst "..einnahmen.."$ dafür!", 15000, 0, 125, 0 )
				elseif trucklvl == 14 then
					outputChatBox ( "[INFO]: Neues Zugfahrzeug freigeschaltet: Tanker!", player, 200, 200, 0 )
					infobox ( player, "\n\nAuftrag abgeschlossen!\nDu erhältst "..einnahmen.."$ dafür!", 15000, 0, 125, 0 )
				elseif trucklvl == 19 then
					outputChatBox ( "[INFO]: Speziallieferung freigeschaltet!", player, 200, 200, 0 )
					infobox ( player, "\n\nAuftrag abgeschlossen!\nDu erhältst "..einnahmen.."$ dafür!", 15000, 0, 125, 0 )
				elseif trucklvl == 4 then
					outputChatBox ( "[INFO]: Neues Zugfahrzeug freigeschaltet: Linerunner!", player, 200, 200, 0 )
					infobox ( player, "\n\nAuftrag abgeschlossen!\nDu erhältst "..einnahmen.."$ dafür!", 15000, 0, 125, 0 )
				else
					infobox ( player, "\n\nAuftrag abgeschlossen!\nDu erhältst "..einnahmen.."$ dafür!", 15000, 0, 125, 0 )
				end
				
				if trucklvl < 20 then
					increaseTruckerLevel ( player, 1 )
				end
			end
		end
	end
end
addEventHandler ( "onMarkerHit", getRootElement(), hitTruckMarker )

function isTruckMarker ( marker )

	for i = 1, 5 do
		if truckerMarker[i] == marker then
			return true
		end
	end
	return false
end

function increaseTruckerLevel ( player, lvl )

	local trucklvl = tonumber ( laGetElementData ( player, "truckerlvl" ) )
	if trucklvl < 20 then
		if trucklvl + lvl >= 20 then
			laSetElementData ( player, "truckerlvl", 20 )
			outputChatBox ( "[INFO]: Dein Truckerlevel ist nun auf Maximum.", player, 200, 200, 0 )
		else
			laSetElementData ( player, "truckerlvl", trucklvl + lvl )
			outputChatBox ( "[INFO]: Dein Truckerlevel wurde erhöht und liegt jetzt bei "..trucklvl+lvl.."/20", player, 200, 200, 0 )
		end
	end
end

-- Info:
-- Tour 1 = Warentransport, Tour 2 = Warentransport mit Zeitlimit, Tour 3 = Explosive Ware, Tour 4 = Spezial