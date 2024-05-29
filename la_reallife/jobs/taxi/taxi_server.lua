local taxihouse = createObject ( 5837, -2548.5, 673.59997558594, 28.5, 0, 0, 126)

taxiDrivers = {}
taxiCustomer = {}
 
taxi1 = createVehicle ( 420, -2552.8999023438, 627.40002441406, 27.700000762939, 0, 0, 0, "TAXI" )
toggleVehicleRespawn ( taxi1, true )
setVehicleRespawnDelay ( taxi1, 1000*10 )
setVehicleIdleRespawnDelay ( taxi1, 1000*60 )

taxi2 = createVehicle ( 420, -2558.1999511719, 627.40002441406, 27.700000762939, 0, 0, 0, "TAXI" )
toggleVehicleRespawn ( taxi2, true )
setVehicleRespawnDelay ( taxi2, 1000*10 )
setVehicleIdleRespawnDelay ( taxi2, 1000*60 )

taxi3 = createVehicle ( 420, -2563.1000976563, 627.40002441406, 27.700000762939, 0, 0, 0, "TAXI" )
toggleVehicleRespawn ( taxi3, true )
setVehicleRespawnDelay ( taxi3, 1000*10 )
setVehicleIdleRespawnDelay ( taxi3, 1000*60 )

taxi4 = createVehicle ( 420, -2568.1999511719, 627.40002441406, 27.700000762939, 0, 0, 0, "TAXI" )
toggleVehicleRespawn ( taxi4, true )
setVehicleRespawnDelay ( taxi4, 1000*10 )
setVehicleIdleRespawnDelay ( taxi4, 1000*60 )

taxi5 = createVehicle ( 420, -2573.1000976563, 627.40002441406, 27.700000762939, 0, 0, 0, "TAXI" )
toggleVehicleRespawn ( taxi5, true )
setVehicleRespawnDelay ( taxi5, 1000*10 )
setVehicleIdleRespawnDelay ( taxi5, 1000*60 )

taxi6 = createVehicle ( 420, -2578.1999511719, 627.40002441406, 27.700000762939, 0, 0, 0, "TAXI" )
toggleVehicleRespawn ( taxi6, true )
setVehicleRespawnDelay ( taxi6, 1000*10 )
setVehicleIdleRespawnDelay ( taxi6, 1000*60 )

taxi7 = createVehicle ( 420, -2583.8999023438, 627.40002441406, 27.700000762939, 0, 0, 0, "TAXI" )
toggleVehicleRespawn ( taxi7, true )
setVehicleRespawnDelay ( taxi7, 1000*10 )
setVehicleIdleRespawnDelay ( taxi7, 1000*60 )



taxi8 = createVehicle ( 438, -2545.5, 633.20001220703, 28, 0, 0, 90, "TAXI" )
toggleVehicleRespawn ( taxi8, true )
setVehicleRespawnDelay ( taxi8, 1000*10 )
setVehicleIdleRespawnDelay ( taxi8, 1000*60 )

taxi9 = createVehicle ( 438, -2545.5, 638.59997558594, 28, 0, 0, 90, "TAXI" )
toggleVehicleRespawn ( taxi9, true )
setVehicleRespawnDelay ( taxi9, 1000*10 )
setVehicleIdleRespawnDelay ( taxi9, 1000*60 )

taxi10 = createVehicle ( 438, -2545.5, 643.59997558594, 28, 0, 0, 90, "TAXI" )
toggleVehicleRespawn ( taxi10, true )
setVehicleRespawnDelay ( taxi10, 1000*10 )
setVehicleIdleRespawnDelay ( taxi10, 1000*60 )

taxi11 = createVehicle ( 438, -2545.5, 648.90002441406, 28, 0, 0, 90, "TAXI" )
toggleVehicleRespawn ( taxi11, true )
setVehicleRespawnDelay ( taxi11, 1000*10 )
setVehicleIdleRespawnDelay ( taxi11, 1000*60 )

taxi12 = createVehicle ( 438, -2545.5, 653.79998779297, 28, 0, 0, 90, "TAXI" )
toggleVehicleRespawn ( taxi12, true )
setVehicleRespawnDelay ( taxi12, 1000*10 )
setVehicleIdleRespawnDelay ( taxi12, 1000*60 )

taxi13 = createVehicle ( 438, -2545.5, 658.70001220703, 28, 0, 0, 90, "TAXI" )
toggleVehicleRespawn ( taxi13, true )
setVehicleRespawnDelay ( taxi13, 1000*10 )
setVehicleIdleRespawnDelay ( taxi13, 1000*60 )

taxiVehs = { [taxi1]=true, [taxi2]=true, [taxi3]=true, [taxi4]=true, [taxi5]=true, [taxi6]=true, [taxi7]=true, [taxi8]=true,
[taxi9]=true, [taxi10]=true, [taxi11]=true, [taxi12]=true, [taxi13]=true
 }
 
function VehicleTaxiEnter ( player, seat, jacked )

	if seat == 0 then
		if laGetElementData ( player, "job" ) == "taxifahrer" then
			setVehicleTaxiLightOn ( source, false )
			bindKey ( player, "sub_mission", "down", changeTaxiLight )
			infobox ( player, "\n\nDrücke die Spezialmissionen-Taste,\num in den Dienst zu gehen! (2)", 5000, 200, 200, 0 )
			addEventHandler ( "onPlayerVehicleExit", player,
				function ( veh )
					unbindKey ( source, "sub_mission", "down", changeTaxiLight )
					if isVehicleTaxiLightOn ( veh ) then
						endTaxiDuty ( player, veh )
					end
				end
			)
		else
			opticExitVehicle ( player )
			infobox ( player, "\n\nDu bist kein Taxifahrer!", 5000, 200, 0, 0 )
		end
	else
		if isVehicleTaxiLightOn ( source ) then
			local driver = getVehicleOccupant ( source, 0 )
			if driver then
				triggerClientEvent ( player, "startTaxameter", player )
			end
		end
	end
end

for key, index in pairs ( taxiVehs ) do
	addEventHandler ( "onVehicleEnter", key, VehicleTaxiEnter )
end

jobTaxis = {}

function changeTaxiLight ( player, key, state )

	if state == "down" then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			local veh = getPedOccupiedVehicle ( player )
			local state = isVehicleTaxiLightOn ( veh )
			setVehicleTaxiLightOn ( veh, not state )
			if not state then
				taxiDrivers[player] = true
				infobox ( player, "\n\nDu bist im Dienst!\nWenn jemand ein Taxi ruft,\nbekommst du eine Meldung!", 5000, 200, 200, 0 )
			else
				taxiDrivers[player] = nil
				infobox ( player, "\n\nDienst beendet!", 5000, 200, 200, 0 )
			end
		end
	end
end

function taxiPayCheck_func ()

	local player = client
	local veh = getPedOccupiedVehicle ( player )
	local driver = getVehicleOccupant ( veh, 0 )
	if isElement ( player ) and isElement ( driver ) then
		if laGetElementData ( player, "money" ) >= taxiPricePerInterval then
			takePlayerSaveMoney ( player, taxiPricePerInterval )
			givePlayerSaveMoney ( driver, taxiPricePerInterval )
		else
			opticExitVehicle ( player )
			setTimer ( removePedFromVehicle, 2500, 1, player )
			infobox ( driver, "\n\nDein Kunde hat kein Geld mehr!", 5000, 200, 200, 0 )
			infobox ( player, "\n\nDu hast kein Geld mehr!", 5000, 200, 0, 0 )
		end
	end
end
addEvent ( "taxiPayCheck", true )
addEventHandler ( "taxiPayCheck", getRootElement(), taxiPayCheck_func )

function endTaxiDuty ( player, veh )

	setVehicleTaxiLightOn ( veh, false )
	taxiDrivers[player] = nil
	infobox ( player, "\n\nDienst beendet!", 5000, 200, 200, 0 )
	triggerClientEvent ( player, "cancelTaxi", player, "cmd", "taxi" )
end

function service_taxi ( player, cmd, arg )

	if arg == "taxi" then
		executeCommandHandler ( "call", player, "400" )
	end
end
addCommandHandler ( "service", service_taxi )


function orderTaxi ( player )

	if not taxiCustomer[player] then
		local driversOnline = 0
		for key, index in pairs ( taxiDrivers ) do
			if isElement ( key ) then
				driversOnline = driversOnline + 1
				outputChatBox ( getPlayerName ( player ).." braucht ein Taxi! Tippe /accept taxi, um anzunehmen!", key, 0, 125, 0 )
			else
				taxiDrivers[key] = nil
			end
		end
		if driversOnline > 0 then
			taxiCustomer[player] = true
			infobox ( player, "\n\nDeine Anfrage ist in Bearbeitung!", 5000, 200, 200, 0 )
		else
			infobox ( player, "\n\nEs ist momentan leider\nkein Taxifahrer online!", 5000, 200, 200, 0 )
		end
	else
		infobox ( player, "\n\nDu hast bereits ein Taxi angefordert!", 5000, 200, 200, 0 )
	end
end

function accept_taxi ( player, cmd, arg )

	if arg == "taxi" then
		local veh = getPedOccupiedVehicle ( player )
		if veh and isVehicleTaxiLightOn ( veh ) and laGetElementData ( player, "job" ) == "taxifahrer" then
			for key, index in pairs ( taxiCustomer ) do
				if not isElement ( key ) then
					taxiCustomer[key] = nil
				else
					taxiCustomer[key] = nil
					triggerClientEvent ( player, "showTaxiCustomerBlip", player, key )
					infobox ( key, "\n\nTaxifahrer "..getPlayerName(player).."\nist auf dem Weg zu dir!", 7500, 200, 200, 0 )
					outputChatBox ( "Tippe /cancel taxi, um den Marker zu löschen!", player, 125, 0, 0 )
					return
				end
			end
			infobox ( player, "\n\nIm Moment braucht niemand ein Taxi!", 5000, 200, 200, 0 )
		else
			infobox ( player, "\n\nDu bist nicht im Dienst!", 5000, 200, 200, 0 )
		end
	end
end
addCommandHandler ( "accept", accept_taxi )

function cancelTaxi_func ( player )

	if isElement ( player ) then
		infobox ( player, "\n\nDein Fahrer hat den Dienst quittiert!", 5000, 200, 200, 0 )
	end
end
addEvent ( "cancelTaxi", true )
addEventHandler ( "cancelTaxi", getRootElement(), cancelTaxi_func )