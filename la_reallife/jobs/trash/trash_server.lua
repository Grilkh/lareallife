-- Hit-Events

function foundRubbish_func ()

	local player = client
	if not laGetElementData ( player, "rubbishJob" ) then
		laSetElementData ( player, "rubbishJob", true )
		laSetElementData ( player, "streetCleanPoints", laGetElementData ( player, "streetCleanPoints" ) + 1 )
		setTimer ( laSetElementData, 1000, 1, player, "rubbishJob", false )
		laSetElementData ( player, "money", laGetElementData ( player, "money" ) + 3 )
		givePlayerMoney ( player, 3 )
	end
end
addEvent ( "foundRubbish", true )
addEventHandler ( "foundRubbish", getRootElement(), foundRubbish_func )

function foundSweeperRubbish_func ()

	local player = client
	if not laGetElementData ( player, "rubbishJob" ) then
		laSetElementData ( player, "rubbishJob", true )
		laSetElementData ( player, "streetCleanPoints", laGetElementData ( player, "streetCleanPoints" ) + 5 )
		setTimer ( laSetElementData, 3000, 1, player, "rubbishJob", false )
		laSetElementData ( player, "money", laGetElementData ( player, "money" ) + 40 )
		givePlayerMoney ( player, 40 )
	end
end
addEvent ( "foundSweeperRubbish", true )
addEventHandler ( "foundSweeperRubbish", getRootElement(), foundSweeperRubbish_func )

function foundTrashmasterRubbish_func ()

	local player = client
	if not laGetElementData ( player, "rubbishJob" ) then
		laSetElementData ( player, "rubbishJob", true )
		laSetElementData ( player, "streetCleanPoints", laGetElementData ( player, "streetCleanPoints" ) + 5 )
		setTimer ( laSetElementData, 3000, 1, player, "rubbishJob", false )
		laSetElementData ( player, "money", laGetElementData ( player, "money" ) + 80 )
		givePlayerMoney ( player, 80 )
	end
end
addEvent ( "foundTrashmasterRubbish", true )
addEventHandler ( "foundTrashmasterRubbish", getRootElement(), foundTrashmasterRubbish_func )

function createStreetCleanVeh_func ( veh )

	local player = client
	if veh == 574 or veh == 408 then
		veh = createVehicle ( veh, -1857.1, -1623.0, 22.7, 0, 0, 180, "TRASH" )
		setElementHealth ( veh, 650 )
		addEventHandler ( "onPlayerQuit", player, trashVehDestroy_func )
		addEventHandler ( "onPlayerWasted", player, trashVehDestroy_func )
		addEventHandler ( "onPlayerVehicleExit", player, trashVehDestroy_func )
		warpPedIntoVehicle ( player, veh )
	end
end
addEvent ( "createStreetCleanVeh", true )
addEventHandler ( "createStreetCleanVeh", getRootElement(), createStreetCleanVeh_func )

function trashVehDestroy_func ( veh )
	
	if eventName == "onPlayerVehicleExit" then
		local player = source
	elseif client then
		local player = client
		veh = getPedOccupiedVehicle ( player )
	else
		local player = source
		veh = getPedOccupiedVehicle ( player )
	end
	if isElement ( veh ) then
		local model = getElementModel ( veh )
		if model == 574 or model == 408 then
			removeEventHandler ( "onPlayerQuit", player, trashVehDestroy_func )
			removeEventHandler ( "onPlayerWasted", player, trashVehDestroy_func )
			removeEventHandler ( "onPlayerVehicleExit", player, trashVehDestroy_func )
			destroyElement ( veh )
			if isElement ( player ) then
				triggerClientEvent ( player, "endTrashJob", player )
			end
		end
	end
end
addEvent ( "trashVehDestroy", true )
addEventHandler ( "trashVehDestroy", getRootElement(), trashVehDestroy_func )