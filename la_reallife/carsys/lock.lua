------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function announceCommands(nick,ip,username,serial,version)
end

addEventHandler("onPlayerConnect",getRootElement(),announceCommands)

function closeCommand(thePlayer,command)
    local playerVehicle = getPedOccupiedVehicle(thePlayer)
    if playerVehicle then
        local vehicleType = getVehicleType(playerVehicle)
        if isVehicleCloseable(playerVehicle) == true then
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
    outputChatBox ( "Du bist in keinem Fahrzeug!", thePlayer, 125, 125, 0 )
    end
end
addCommandHandler("close",closeCommand,false,false)

function showTextDisplay(player,...)
outputChatBox(table.concat(arg," "),player,0,255,0)
end
function isVehicleCloseable (vehicle)
    local CloseableVehicles = {427, 432, 433, 470, 490, 528, 596, 597, 598, 599, 601, 525, 420, 415}
	-- Table for not lockable vehicles, 100% from me :D
    -- Maybe I missed some vehicles, feel free to edit it.
    local itsCloseable = false -- At start, the vehicle is lockable.
    local myVehicle = getElementModel(vehicle) -- Get the model ID of the vehicle to work with it.
    for k, CloseableVehicle in pairs(CloseableVehicles) do -- Do for every notlockable vehicles
        if myVehicle == CloseableVehicle then -- If the vehicle inputted is a not lockable vehicle
            itsCloseable = true -- Then its not lockable
            return true -- So return false, it isn't lockable
        end
    end
    if itsCloseable == false then -- If we didn't set it to false before, then its lockable,
        return false -- So return true.
    end
    -- By Stryp
end