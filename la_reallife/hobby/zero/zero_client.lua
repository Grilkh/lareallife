------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function rcVehicleEnter ( veh )

	if source == lp then
		if getElementModel ( veh ) == 464 then
			toggleControl ( "vehicle_fire", false )
			toggleControl ( "vehicle_secondary_fire", false )
			
			addEventHandler ( "onClientPlayerVehicleExit", lp, rcVehicleExit )
		end
	end
end
addEventHandler ( "onClientPlayerVehicleEnter", getRootElement(), rcVehicleEnter )

function rcVehicleExit ()

	toggleControl ( "vehicle_fire", true )
	toggleControl ( "vehicle_secondary_fire", true )
	setElementAlpha ( player, 255 )
end


RCVehicles = {
 [441]=true,
 [464]=true,
 [465]=true,
 [501]=true,
 [564]=true
 }

--[[function RC ( player )

	if player == lp then
		local veh = source
		if RCVehicles[getElementModel ( veh )] then
			setElementPosition ( lp, getElementPosition ( lp ) )
			setElementAlpha ( player, 0 )
		end
	end
end
addEventHandler ( "onClientVehicleStartEnter", getRootElement (), RC )
]]--