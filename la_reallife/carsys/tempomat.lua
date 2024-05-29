curMaxSpeed = false

function limit_func ( cmd, amount )

	local amount = tonumber ( amount )
	if amount then
		local amount = math.abs ( amount )
		curMaxSpeed = amount
		--curMaxSpeed = curMaxSpeed*0.00464
		if not isTimer ( curMaxSpeedTimer ) then
			curMaxSpeedTimer = setTimer ( fixSpeed, 50, -1 )
		end
		outputChatBox ( "Maximale Geschwindigkeit auf "..amount.." Km/h gesetzt. Verwende /stoplimit, um den Tempomat zu entfernen.", 150, 150, 0 )
	else
		outputChatBox ( "Bitte gib eine gültige Km/h Zahl an!", 125, 0, 0 )
	end
end
addCommandHandler ( "limit", limit_func )

function stoplimit_func ()

	if not curMaxSpeed then
		outputChatBox ( "Du hast momentan den Tempomat nicht aktiviert. Verwende /limit [Km/h], um ihn zu aktivieren!", 150, 0, 0 )
	else
		curMaxSpeed = false
		killTimer ( curMaxSpeedTimer )
		outputChatBox ( "Tempomat wurde entfernt!", 0, 150, 0 )
	end
end
addCommandHandler ( "stoplimit", stoplimit_func )

function fixSpeed ()

	local veh = getPedOccupiedVehicle(lp)
	if veh then
		if isVehicleOnGround ( veh ) and getPedOccupiedVehicleSeat ( lp ) == 0 then
			local vx, vy, vz = getElementVelocity(veh)
			local speed = math.sqrt(vx^2 + vy^2 + vz^2)
			local kmh = speed * 180
			if kmh > curMaxSpeed then
				setElementVelocity ( veh, vx*0.97, vy*0.97, vz*0.97 )
			end
		end
	end
end