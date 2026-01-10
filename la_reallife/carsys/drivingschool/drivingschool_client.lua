--[[function checkSpeed_func ()

	if laGetElementData ( getLocalPlayer(), "isInDrivingSchool" ) then
		local vx, vy, vz = getElementVelocity(getPedOccupiedVehicle(getLocalPlayer()))
		local speed = math.sqrt(vx^2 + vy^2 + vz^2)		
		toggleControl ( "enter_exit", false )
		if getKmhBySpeed ( speed ) >= 85 then
			toggleControl ( "enter_exit", true )
			outputChatBox ( "Du bist zu schnell gefahren!", 125, 0, 0 )
			triggerServerEvent ( "drivenToFast", getRootElement(), getLocalPlayer() )
		else
			setTimer ( checkSpeed_func, 500, 1 )
		end
	end
end
addEvent ( "checkSpeed", true )
addEventHandler ( "checkSpeed", getRootElement(), checkSpeed_func )
]]

function checkSpeed_func ( )

	if laGetElementData ( getLocalPlayer(), "isInDrivingSchool" ) then
        local target = getPedOccupiedVehicle(getLocalPlayer())
			if ( target ) then
					if ( getElementType ( target ) == "vehicle" ) then
						toggleControl ( "enter_exit", false )					
						local driver = getVehicleOccupant ( target )
						local targetname = getPlayerName(driver)
						speedxschool, speedyschool, speedzschool = getElementVelocity ( target )
						local actualspeedschool = (speedxschool^2 + speedyschool^2 + speedzschool^2)^(0.5) 
						local mps = actualspeedschool * 50
						local kmh = actualspeedschool * 180
						local mph = actualspeedschool * 111.847
						if kmh >= 85 then
							if getElementData ( player, "helitest", true ) then
							elseif getElementData ( player, "schifftest", true ) then
							elseif getElementData ( player, "segeltest", true ) then
							elseif getElementData ( player, "flugatest", true ) then
							elseif getElementData ( player, "flugbtest", true ) then
							else
								toggleControl ( "enter_exit", true )
								outputChatBox ( "Du bist zu schnell gefahren!", 125, 0, 0 )
								triggerServerEvent ( "drivenToFast", getRootElement(), getLocalPlayer() )
								setElementPosition ( getLocalPlayer(), -2026.598, -97.1442, 35.164 )
							end
						else
							setTimer ( checkSpeed_func, 500, 1 )
						end
					end
			end
    end
end
--setTimer ( checkSpeed_func, 1000, 0 )
addEvent ( "checkSpeed", true )
addEventHandler ( "checkSpeed", getRootElement(), checkSpeed_func )

function hideFahrschuleWindow_func ()

	guiSetVisible ( gWindow["rathausbg"], false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
end
addEvent ( "hideFahrschuleWindow", true )
addEventHandler ( "hideFahrschuleWindow", getRootElement(), hideFahrschuleWindow_func )