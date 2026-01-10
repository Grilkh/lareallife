function radioenter ( player )

	if player == getLocalPlayer() then
		if getElementData ( player, "favchannel" ) == nil then
			setRadioChannel ( 12 )
		else
			setRadioChannel ( tonumber ( getElementData ( player, "favchannel" ) ) )
		end
	end
end
addEventHandler ( "onClientVehicleEnter", getRootElement(), radioenter )