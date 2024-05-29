------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

AbschleppTowTruck1 = createVehicle ( 525, -2072.8479, -135.88, 35.531, 0, 0, 0, 0 )
setVehicleColor ( AbschleppTowTruck1, 0, 0, 0, 0 )
setVehiclePaintjob ( AbschleppTowTruck1, 3 )
toggleVehicleRespawn ( AbschleppTowTruck1, true )
setVehicleRespawnDelay ( AbschleppTowTruck1, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( AbschleppTowTruck1, FCarIdleRespawn*1000*60 )
setElementHealth ( AbschleppTowTruck1, 5000 )

AbschleppTowTruck2 = createVehicle ( 525, -2062.8479, -135.88, 35.531, 0, 0, 0, 0 )
setVehicleColor ( AbschleppTowTruck2, 0, 0, 0, 0 )
setVehiclePaintjob ( AbschleppTowTruck2, 3 )
toggleVehicleRespawn ( AbschleppTowTruck2, true )
setVehicleRespawnDelay ( AbschleppTowTruck2, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( AbschleppTowTruck2, FCarIdleRespawn*1000*60 )
setElementHealth ( AbschleppTowTruck2, 5000 )

AbschleppTowTruck3 = createVehicle ( 525, -2052.8479, -135.88, 35.531, 0, 0, 0, 0 )
setVehicleColor ( AbschleppTowTruck3, 0, 0, 0, 0 )
setVehiclePaintjob ( AbschleppTowTruck3, 3 )
toggleVehicleRespawn ( AbschleppTowTruck3, true )
setVehicleRespawnDelay ( AbschleppTowTruck3, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( AbschleppTowTruck3, FCarIdleRespawn*1000*60 )
setElementHealth ( AbschleppTowTruck3, 5000 )

AbschleppTowTruck4 = createVehicle ( 525, -2042.8479, -135.88, 35.531, 0, 0, 0, 0 )
setVehicleColor ( AbschleppTowTruck4, 0, 0, 0, 0 )
setVehiclePaintjob ( AbschleppTowTruck4, 3 )
toggleVehicleRespawn ( AbschleppTowTruck4, true )
setVehicleRespawnDelay ( AbschleppTowTruck4, FCarDestroyRespawn*1000*60 )
setVehicleIdleRespawnDelay ( AbschleppTowTruck4, FCarIdleRespawn*1000*60 )
setElementHealth ( AbschleppTowTruck4, 5000 )

abschleppvehicles = { [AbschleppTowTruck1]=true, [AbschleppTowTruck2]=true, [AbschleppTowTruck3]=true, [AbschleppTowTruck4]=true }

function VehicleAbschleppEnter ( player, seat )

	local veh = source
	if getPedOccupiedVehicleSeat ( player ) == 0 then
		if abschleppvehicles[veh] then
			if laGetElementData ( player, "adminlvl" ) == 0 then
				opticExitVehicle ( player )
				infobox ( player, "\n\n\nDu bist kein\nSupporter!", 5000, 125, 0, 0 )
			end
		end
	end
end
for key, index in pairs ( abschleppvehicles ) do
	addEventHandler ( "onVehicleEnter", key, VehicleAbschleppEnter )
end