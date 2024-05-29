------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2013 ------------
------------------------------

local carrentblip = createBlip (-2121.3000488281,409.79998779297,34, 12, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
local carrent1 = createVehicle( 462, -2120.5, 418.60000610352, 34.799999237061, 0, 0, 0, "VERLEIH")
local carrent2 = createVehicle( 549, -2125.5, 418.79998779297, 35, 0, 0, 0, "VERLEIH")
local carrent3 = createVehicle( 507, -2131.1999511719, 419.20001220703, 35.099998474121, 0, 0, 0, "VERLEIH")
setElementFrozen (carrent1, true)
setElementFrozen (carrent2, true)
setElementFrozen (carrent3, true)
setVehicleLocked (carrent1, true)
setVehicleLocked (carrent2, true)
setVehicleLocked (carrent3, true)
setVehicleDamageProof (carrent1, true)
setVehicleDamageProof (carrent2, true)
setVehicleDamageProof (carrent3, true)
setVehicleColor( carrent1, 255, 255, 0, 0, 0, 0, 0, 0, 0)
setVehicleColor( carrent2, 255, 255, 0, 0, 0, 0, 0, 0, 0)
setVehicleColor( carrent3, 255, 255, 0, 0, 0, 0, 0, 0, 0)

local carrentMarker = createMarker(-2121.3000488281,409.79998779297,34, "cylinder", 1.5, 0, 0, 125, 255)

function carrenthit_func ( hitElement, dim )
	if(getElementType(hitElement) == "player") and (isPedInVehicle(hitElement) == false) then
		outputChatBox("Willkommen beim Fahrzeugverleih!", hitElement, 250, 200, 0)
		outputChatBox("Um dir ein Fahrzeug für 30 Minuten zu mieten, tippe /mieten!", hitElement, 200, 250, 0)
		outputChatBox("Dann erscheint eine Liste der verfügbaren Fahrzeuge.", hitElement, 250, 200, 0)
	end
end
addEventHandler("onMarkerHit", carrentMarker, carrenthit_func)
 
local carrentCars = {}
local carrentTimer = {}
 
function carrent_func( player, cmd, veh )
	if isElementWithinMarker(player, carrentMarker) then
		if (isPedInVehicle(player) == false) then
			if tonumber(veh) then
				local veh = tonumber(veh)
				if (veh > 0) and (veh < 4) then
					local money = laGetElementData (player, "money")
					if veh == 1 then
						local car = 462
						local preis = 50
						if money >= preis then
							rentCar_func(player, car, preis)
							laSetElementData(player, "money", money - preis )
							takePlayerMoney(player, preis)
						else
							outputChatBox("Du hast zu wenig Geld. Dieses Fahrzeug kostet "..preis.."$!", player, 150, 0, 0)
						end
					elseif veh == 2 then
						local car = 549
						local preis = 100
						if money >= preis then
							rentCar_func(player, car, preis)
							laSetElementData(player, "money", money - preis )
							takePlayerMoney(player, preis)
						else
							outputChatBox("Du hast zu wenig Geld. Dieses Fahrzeug kostet "..preis.."$!", player, 150, 0, 0)
						end
					elseif veh == 3 then
						local car = 507
						local preis = 250
						if money >= preis then
							rentCar_func(player, car, preis)
							laSetElementData(player, "money", money - preis )
							takePlayerMoney(player, preis)
						else
							outputChatBox("Du hast zu wenig Geld. Dieses Fahrzeug kostet "..preis.."$!", player, 150, 0, 0)
						end
					else
						outputChatBox("Es existieren nur die Fahrzeuge 1-3!", player, 150, 0, 0)
					end
				else
					outputChatBox("Verwende /mieten [1-3]", player, 150, 0, 0)
				end
			else
				outputChatBox("Folgende Fahrzeuge sind verfügbar:", player, 200, 200, 0)
				outputChatBox("Fahrzeug 1: Faggio; kostet 50$ für 30 Minuten", player, 150, 200, 0)
				outputChatBox("Fahrzeug 2: Tampa; kostet 100$ für 30 Minuten", player, 200, 150, 0)
				outputChatBox("Fahrzeug 3: Elegant; kostet 250$ für 30 Minuten", player, 150, 200, 0)
				outputChatBox("Verwende: /mieten [1-3], Beispiel: /mieten 2; Du kriegst einen Tampa!", player, 150, 200, 0)
			end
		else
			outputChatBox("Steige zuerst aus deinem Fahrzeug aus!", player, 255, 0, 0)
		end
	else
		outputChatBox("Du musst im Marker des Fahrzeugverleihs stehen!", player, 255, 0, 0)
	end
end
addCommandHandler( "mieten", carrent_func )
 
function explode_rent_car( )
        if laGetElementData (source, "rentcar") == true then
			local pname = laGetElementData (source, "carrenter")
			local player = getPlayerFromName(pname)
			if player then
				setElementPosition ( source, 0, 0, -500 )
				destroyElement ( source )
                killTimer( carrentTimer[player] )
				laSetElementData (player, "rentedacar", false)
			end
        end
end

function destroy_rentcar (player)
	if isElement(carrentCars[player]) then
		if getVehicleOccupant(carrentCars[player]) then
			removePedFromVehicle(getVehicleOccupant(carrentCars[player]))
			setElementPosition ( carrentCars[player], 0, 0, -500 )
			destroyElement ( carrentCars[player] )
			laSetElementData (player, "rentedacar", false)
		else
			setElementPosition ( carrentCars[player], 0, 0, -500 )
			destroyElement ( carrentCars[player] )
			laSetElementData (player, "rentedacar", false)
		end
	end
end

function rentCar_func ( player, car, preis )
	if laGetElementData (player, "rentedacar") then
		destroy_rentcar (player)
	end
        local pname = getPlayerName(player)
		if car == 462 then
			carrentCars[player] = createVehicle( car, -2124.6000976563, 429.39999389648, 35.099998474121, 0, 0, 90, "VERLEIH")
			outputChatBox("Du hast "..preis.."$ für 30 Minuten mit der Faggio bezahlt!", player, 0, 150, 0)
		elseif car == 549 then
			carrentCars[player] = createVehicle( car, -2124.5, 438.89999389648, 35, 0, 0, 90, "VERLEIH")
			outputChatBox("Du hast "..preis.."$ für 30 Minuten mit dem Tampa bezahlt!", player, 0, 150, 0)
		elseif car == 507 then
			carrentCars[player] = createVehicle( car, -2124.6999511719, 447.10000610352, 34.799999237061, 0, 0, 90, "VERLEIH")
			outputChatBox("Du hast "..preis.."$ für 30 Minuten mit dem Elegant bezahlt!", player, 0, 150, 0)
		end
		setVehicleColor( carrentCars[player], 255, 255, 0, 0, 0, 0, 0, 0, 0)
		carrentTimer[player] = setTimer ( destroy_rentcar, 1800000, 1, player)
		laSetElementData (carrentCars[player], "carrenter", pname)
		laSetElementData (carrentCars[player], "rentcar", true)
		laSetElementData (player, "rentedacar", true)
        warpPedIntoVehicle( player, carrentCars[player] )
        addEventHandler("onVehicleExplode",carrentCars[player],explode_rent_car)
		verleihKasse = verleihKasse + math.floor(preis/10)
end
