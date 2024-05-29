------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function announceCommands(nick,ip,username,serial,version)
end

addEventHandler("onPlayerConnect",getRootElement(),announceCommands)

function openCommand(thePlayer,command)
    local playerVehicle = getPedOccupiedVehicle(thePlayer)
    if playerVehicle then
		if laGetElementData ( thePlayer, "adminlvl" ) >= 1 then
			local vehicleType = getVehicleType(playerVehicle)
			if isVehicleLockable(playerVehicle) == true then
				local lockedState = isVehicleLocked(playerVehicle)
				setVehicleLocked(playerVehicle,not lockedState)
				if lockedState == true then 
					outputChatBox ( "Fahrzeug aufgeschlossen.", thePlayer, 0, 255, 0 )
				elseif lockedState == false then 
					outputChatBox ( "Fahrzeug abgeschlossen.", thePlayer, 255, 0, 0 )
				end
			else
			outputChatBox ( "Das Fahrzeug kann nicht abgeschlossen werden!", thePlayer, 125, 125, 0 )
			end
		else
			outputChatBox ( "Du bist kein Supporter!", thePlayer, 125, 125, 0 )
		end
	else
		outputChatBox ( "Du bist in keinem Fahrzeug!", thePlayer, 125, 125, 0 )
	end
end
addCommandHandler("open",openCommand,false,false)

function showTextDisplay(player,...)
outputChatBox(table.concat(arg," "),player,0,255,0)
end
function isVehicleLockable (vehicle)
    local notLockableVehicles = {}
    -- Table for not lockable vehicles, 100% from me :D
    -- Maybe I missed some vehicles, feel free to edit it.
    local itsLockable = true -- At start, the vehicle is lockable.
    local myVehicle = getElementModel(vehicle) -- Get the model ID of the vehicle to work with it.
    for k, notLockableVehicle in pairs(notLockableVehicles) do -- Do for every notlockable vehicles
        if myVehicle == notLockableVehicle then -- If the vehicle inputted is a not lockable vehicle
            itsLockable = false -- Then its not lockable
            return false -- So return false, it isn't lockable
        end
    end
    if itsLockable == true then -- If we didn't set it to false before, then its lockable,
        return true -- So return true.
    end
    -- By Stryp
end