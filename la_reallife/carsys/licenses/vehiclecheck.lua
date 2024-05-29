bonusVehicles = {
 [460]=true, -- Wasserflugzeug
 [539]=true, -- Vortex
 [471]=true, -- Quad
 [442]=true, -- Leichenwagen
 [457]=true  -- Golfwagen
}

function hasPlayerLicense ( player, id )

	if bonusVehicles[id] then
		if id == 460 then
			if laGetElementData ( player, "skimmer" ) == 1 then
				if tonumber ( laGetElementData ( player, "planelicensea" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
					return true
				else
					if getElementData ( player, "sprache" ) == "Deutsch" then
						outputChatBox ( "Du hast keinen Flugschein der Klasse A!", player, 125, 0, 0 )
					else
						outputChatBox ( "You haven't got a pilotlicense Class A!", player, 125, 0, 0 )
					end
				end
			else
				outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				return false
			end
		elseif id == 539 then
			if laGetElementData ( player, "vortex" ) == 1 then
				if tonumber ( laGetElementData ( player, "carlicense" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
					return true
				else
				    if getElementData ( player, "sprache" ) == "Deutsch" then
					    outputChatBox ( "Du hast keinen Führerschein!", player, 125, 0, 0 )
					else 
					    outputChatBox ( "You haven't got a Driving License",player,125,0,0 )
					end	
				end
			else
				outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				return false
			end
		elseif id == 471 then
			if laGetElementData ( player, "quad" ) == "buyed" then
				if tonumber ( laGetElementData ( player, "bikelicense" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
					return true
				else
						if getElementData ( player, "sprache" ) == "Deutsch" then
							outputChatBox ( "Du hast keinen Motorrad-Führerschein!", player, 125, 0, 0 )
						else 	
							outputChatBox ( "You haven't got a Bike License",player,125,0,0 )
						end	
				end
			else
				outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				return false
			end
		elseif id == 442 then
			if laGetElementData ( player, "romero" ) == 1 then
				if tonumber ( laGetElementData ( player, "carlicense" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
					return true
				else
				    if getElementData ( player, "sprache" ) == "Deutsch" then
					    outputChatBox ( "Du hast keinen Führerschein!", player, 125, 0, 0 )
					else
					    outputChatBox ( "You haven't got a Driving-License", player, 125, 0, 0 )
					end	
				end
			else
				outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				return false
			end
		elseif id == 457 then
			if laGetElementData ( player, "golfcart" ) == 1 then
				return true
			else
			    if getElementData ( player, "sprache" ) == "Deutsch" then
				    outputChatBox ( "Du hast den Bonus nicht erworben!", player, 125, 0, 0 )
				else
  				    outputChatBox ( "You haven't got the Bonus.", player, 125, 0, 0 )
				end
				return false
			end
		end
		return false
	elseif cars[id] then
		if tonumber ( laGetElementData ( player, "carlicense" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
			return true
		else
		    if getElementData ( player, "sprache" ) == "Deutsch" then
			    outputChatBox ( "Du hast keinen Führerschein!", player, 125, 0, 0 )
			else 
			    outputChatBox ( "You haven't got a Driving-License", player, 125, 0, 0 )
			end
			return false
		end
	elseif lkws[id] then
		if tonumber ( laGetElementData ( player, "lkwlicense" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
			return true
		else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					outputChatBox ( "Du hast keinen LKW-Führerschein!", player, 125, 0, 0 )
				else 
					outputChatBox ( "You haven't got a Truck License", player, 125, 0, 0 )
				end
			return false
		end
	elseif bikes[id] then
		if tonumber ( laGetElementData ( player, "bikelicense" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
			HighwayToHellCheck ( getPedOccupiedVehicle ( player ) )
			return true
		else
		    if getElementData ( player, "sprache" ) == "Deutsch" then
			    outputChatBox ( "Du hast keinen Motorrad-Führerschein!", player, 125, 0, 0 )
		    else 	
			    outputChatBox ( "You haven't got the Bike-License", player, 125, 0, 0 )
			end
			return false
		end
	elseif helicopters[id] then
		if tonumber ( laGetElementData ( player, "helilicense" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
			return true
		else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					outputChatBox ( "Du hast keinen Helikopter-Führerschein", player, 125, 0, 0 )
				else 
					outputChatBox ( "You haven't got the Helicopter-License", player, 125, 0, 0 )
				end
			return false
		end
	elseif planea[id] then
		if tonumber ( laGetElementData ( player, "planelicensea" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
			return true
		else
		    if getElementData ( player, "sprache" ) == "Deutsch" then
			    outputChatBox ( "Du hast keinen Flugschein Klasse A!", player, 125, 0, 0 )
			else
                outputChatBox ( "You haven't got Plane License A", player, 125, 0, 0 )	
			end					
			return false
		end
	elseif planeb[id] then
		if tonumber ( laGetElementData ( player, "planelicenseb" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
			return true
		else
		    if getElementData ( player, "sprache" ) == "Deutsch" then
			    outputChatBox ( "Du hast keinen Flugschein Klasse B!", player, 125, 0, 0 )
			else
                outputChatBox ( "You haven't got Plane License B", player, 125, 0, 0 )		
			end					
			return false
		end
	elseif motorboats[id] then
		if tonumber ( laGetElementData ( player, "motorbootlicense" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
			return true
		else
		    if getElementData ( player, "sprache" ) == "Deutsch" then
			    outputChatBox ( "Du hast keinen Motorbootschein!", player, 125, 0, 0 )
			else
			    outputChatBox ( "You haven't got the Motorboatlicense", player, 125, 0, 0 )
			end	
			return false
		end
	elseif raftboats[id] then
		if tonumber ( laGetElementData ( player, "segellicense" ) ) == 1 or laGetElementData ( player, "isInDrivingSchool" ) then
			return true
		else
		    if getElementData ( player, "sprache" ) == "Deutsch" then    
			    outputChatBox ( "Du hast keinen Segelschein!", player, 125, 0, 0 )
			else
                outputChatBox ( "You haven't got Sailinglicense", player, 125, 0, 0 )		
			end					
			return false
		end
	elseif nolicense[id] then
		return true
	else
		return true
	end
end

function VehicleEnter ( veh, seat )

	if getPedOccupiedVehicleSeat ( source ) == 0 then
		if lkws[getElementModel ( veh )] == true then
			if tonumber(laGetElementData ( source, "lkwlicense" )) == 1 or laGetElementData ( source, "isInDrivingSchool" ) then
			else
				opticExitVehicle ( source )
				if getElementData ( source, "sprache" ) == "Deutsch" then
					outputChatBox ( "Du hast noch keinen LKW-Führerschein!", source, 255, 0, 0 )
				else
				outputChatBox ( "You haven't got the Truck License", source, 255, 0, 0 )
				end
			end
		end
		if helicopters[getElementModel ( veh )] == true then
			if tonumber(laGetElementData ( source, "helilicense" )) == 1 or laGetElementData ( source, "isInDrivingSchool" ) then
			else
				opticExitVehicle ( source )
				if getElementData ( source, "sprache" ) == "Deutsch" then
					outputChatBox ( "Du hast noch keinen Helikopterführerschein!", source, 255, 0, 0 )
				else 
					outputChatBox ( "You haven't got the Helicopter-License", source, 255, 0, 0 )
				end
			end
		end
		if cars[getElementModel ( veh )] == true then
			if tonumber(laGetElementData ( source, "carlicense" )) == 1 or laGetElementData ( source, "isInDrivingSchool" ) then
			else
			    if getElementData ( source, "sprache" ) == "Deutsch" then
				    outputChatBox ( "Du hast noch keinen Führerschein! Lass dich nicht erwischen!", source, 255, 0, 0 )
				else 
				    outputChatBox ( "You haven't got a Driving-License - Do not get caught", source, 255, 0, 0 )
				end	
			end
		end
		if planea[getElementModel ( veh )] == true then
			if tonumber(laGetElementData ( source, "planelicensea" )) == 1 or laGetElementData ( source, "isInDrivingSchool" ) then
			else
				opticExitVehicle ( source )
				if getElementData ( source, "sprache" ) == "Deutsch" then
				    outputChatBox ( "Du hast noch keinen Flugschein der Klasse A!", source, 255, 0, 0 )
				else 
				    outputChatBox ( "You haven't got Plane License A", source, 255, 0, 0 )
				end	
			end
		end
		if planeb[getElementModel ( veh )] == true then
			if tonumber(laGetElementData ( source, "planelicenseb" )) == 1 or laGetElementData ( source, "isInDrivingSchool" ) then
			else
				opticExitVehicle ( source )
				if getElementData ( source, "sprache" ) == "Deutsch" then
				    outputChatBox ( "Du hast noch keinen Flugschein der Klasse B!", source, 255, 0, 0 )	
				else
				    outputChatBox ( "You haven't got Plane License B", source, 255, 0, 0 )
				end	
			end
		end
		if bikes[getElementModel ( veh )] == true then
			if tonumber(laGetElementData ( source, "bikelicense" )) == 1 or laGetElementData ( source, "isInDrivingSchool" ) then
			else
				opticExitVehicle ( source )
				if getElementData ( source, "sprache" ) == "Deutsch" then
				    outputChatBox ( "Du hast noch keinen Motorradführerschein!", source, 255, 0, 0 )
				else
 				    outputChatBox ( "You haven't got Bike-License", source, 255, 0, 0 )
				end	
			end
		end
		if raftboats[getElementModel ( veh )] == true then
			if tonumber(laGetElementData ( source, "segellicense" )) == 1 or laGetElementData ( source, "isInDrivingSchool" ) then
			else
				opticExitVehicle ( source )
				if getElementData ( source, "sprache" ) == "Deutsch" then
				    outputChatBox ( "Du hast noch keinen Segelschein!", source, 255, 0, 0 )
				else
                    outputChatBox ( "You haven't got Sailing-License", source, 255, 0, 0 )	
                end					
			end
		end
		if motorboats[getElementModel ( veh )] == true then
			if tonumber(laGetElementData ( source, "motorbootlicense" )) == 1 or laGetElementData ( source, "isInDrivingSchool" ) then
			else
				opticExitVehicle ( source )
				if getElementData ( source, "sprache" ) == "Deutsch" then
				    outputChatBox ( "Du hast noch keinen Motorboot Führerschein!", source, 255, 0, 0 )
				else 
                    outputChatBox ( "You haven't got Motorboatlicense", source, 255, 0, 0 ) 
                end					
			end
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), VehicleEnter )

function opticExitVehicle ( player )

	local veh = getPedOccupiedVehicle ( player )
	if isElement ( veh ) then
		if getPedOccupiedVehicleSeat ( player ) == 0 then
			setElementVelocity ( veh, 0, 0, 0 )
		end
		if getElementType(player) == "player" then
			setControlState ( player, "enter_exit", false )
			setTimer ( removePedFromVehicle, 750, 1, player )
			setTimer ( setControlState, 150, 1, player, "enter_exit", false )
			setTimer ( setControlState, 200, 1, player, "enter_exit", true )
			setTimer ( setControlState, 700, 1, player, "enter_exit", false )
		end
	end
end