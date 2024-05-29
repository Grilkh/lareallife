------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

NostraTahoma = createVehicle ( 566, 1198.1999511719, -1835.8000488281, 13.300000190735, 0, 0, 270, 0 )
setVehicleColor ( NostraTahoma, 1, 1, 0, 0 )
setVehiclePaintjob ( NostraTahoma, 3 )
toggleVehicleRespawn ( NostraTahoma, true )
setVehicleRespawnDelay ( NostraTahoma, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( NostraTahoma, FCarIdleRespawn*1000*60 )

NostraTahoma2 = createVehicle ( 566, 1198.5999755859, -1832, 13.300000190735, 0, 0, 270, 0 )
setVehicleColor ( NostraTahoma2, 1, 1, 0, 0 )
setVehiclePaintjob ( NostraTahoma2, 3 )
toggleVehicleRespawn ( NostraTahoma2, true )
setVehicleRespawnDelay ( NostraTahoma2, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( NostraTahoma2, FCarIdleRespawn*1000*60 )

NostraHuntley = createVehicle ( 579, 1199.9000244141, -1823.4000244141, 13.5, 0, 0, 218, 0 )
setVehicleColor ( NostraHuntley, 1, 1, 0, 0 )
setVehiclePaintjob ( NostraHuntley, 3 )
toggleVehicleRespawn ( NostraHuntley, true )
setVehicleRespawnDelay ( NostraHuntley, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( NostraHuntley, FCarIdleRespawn*1000*60 )

NostraHuntley2 = createVehicle ( 579, 1205, -1823.3000488281, 13.699999809265, 0, 0, 217.99621582031, 0 )
setVehicleColor ( NostraHuntley2, 1, 1, 0, 0 )
setVehiclePaintjob ( NostraHuntley2, 3 )
toggleVehicleRespawn ( NostraHuntley2, true )
setVehicleRespawnDelay ( NostraHuntley2, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( NostraHuntley2, FCarIdleRespawn*1000*60 )

Nostravehicles = { [NostraTahoma]=true, [NostraTahoma2]=true, [NostraHuntley]=true, [NostraHuntley2]=true }

function VehicleNostraEnter ( player, seat )

	local veh = source
	if getPedOccupiedVehicleSeat ( player ) == 0 then
		if Nostravehicles[veh] then
			if not isPlayerInTeam(player, "Nostra") then
				opticExitVehicle ( player )
				infobox ( player, "\n\n\nDu bist kein\nMitglied der\nCosa Nostra!", 5000, 125, 0, 0 )
			end
		end
	end
end
for key, index in pairs ( Nostravehicles ) do
	addEventHandler ( "onVehicleEnter", key, VehicleNostraEnter )
end