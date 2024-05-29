noengine = { [509]=true, [481]=true, [510]=true, [462]=true }

function toggleVehicleLights ( player, key, state )
	if ( getPedOccupiedVehicleSeat ( player ) == 0 ) then
		local veh = getPedOccupiedVehicle ( player )
		if getElementModel ( veh ) ~= 438 then
			if ( getVehicleOverrideLights ( veh ) ~= 2 ) then
				setVehicleOverrideLights ( veh, 2 )
				laSetElementData ( veh, "light", true)
			else
				setVehicleOverrideLights ( veh, 1 )
				laSetElementData ( veh, "light", false)
			end
		end
	end
end

function toggleVehicleTrunkBind ( player, key, state )

	local veh = getPedOccupiedVehicle ( player )
	if getPedOccupiedVehicleSeat ( player ) == 0 and laGetElementData ( veh, "engine" ) then
		if laGetElementData ( veh, "owner" ) then
			if laGetElementData ( veh, "stuning1" ) then
				if laGetElementData ( veh, "engine" ) then
					toggleVehicleTrunk ( veh )
					unbindKey ( player, "sub_mission", "down", toggleVehicleTrunkBind, "Kofferraum auf/zu" )
					setTimer ( rebindTrunk, 750, 1, player )
				else
					outputChatBox ( "Der Motor muss laufen!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Dieses Fahrzeug hat keinen Kofferraum!", player, 125, 0, 0 )
			end
		end
	end
end

function rebindTrunk ( player )

	bindKey ( player, "sub_mission", "down", toggleVehicleTrunkBind, "Kofferraum auf/zu" )
end

function toggleVehicleEngine ( player, key, state )
	local veh = getPedOccupiedVehicle ( player )
	--[[local Besitzer = laGetElementData (veh, "owner")
	if Besitzer then
		local Slot = laGetElementData ( veh, "carslotnr_owner" )
		local Zerstoert = tonumber(MySQL_GetString("vehicles", "Zerstoert", "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' "))
	end]]
	
	
	if getElementModel ( veh ) ~= 438 then
		if ( getPedOccupiedVehicleSeat ( player ) == 0 ) then	
			--[[local Besitzer = laGetElementData (veh, "owner")
						local Slot = laGetElementData ( veh, "carslotnr_owner" )
						local Sportmotor = MySQL_GetString("vehicles", "Sportmotor", "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' ")
						if Sportmotor == 1 then
							setElementData(veh, "tuning.motor", true)
							giveVehicleBetterEngine(veh)
						end]]
			-- Falls das Fahrzeug neu gespawnt ist und noch keinen Benzinwert hat
			if not getElementData ( veh, "fuelstate" ) then
				laSetElementData ( veh, "fuelstate", 100 )
				laSetElementData ( veh, "engine", false )
				setVehicleOverrideLights ( veh, 1 )
				laSetElementData ( veh, "light", false)
				setVehicleEngineState ( veh, false )
			end
				local Besitzer = laGetElementData (veh, "owner")
				if Besitzer then
					local Slot = laGetElementData ( veh, "carslotnr_owner" )
					--local Zerstoert = tonumber(MySQL_GetString("vehicles", "Zerstoert", "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' "))
					if laGetElementData(veh, "zerstoert") == 1 then
						outputChatBox("Das Fahrzeug hat einen Totalschaden! Du musst es erst von einem Mechaniker reparieren lassen.", player, 255, 0, 0)
						outputChatBox("Verwende /call 7676, um einen Mechaniker anzurufen!", player, 200, 0, 0)
						setVehicleEngineState ( veh, false )
						laSetElementData ( veh, "engine", false )
						return
					end
				end
			-- Falls der Motor läuft -> immer abschalten
			if getVehicleEngineState ( veh ) then
				setVehicleEngineState ( veh, false )
				laSetElementData ( veh, "engine", false )
			-- Falls der Motor NICHT läuft, dem Spieler das Fahrzeug jedoch gehört
			elseif laGetElementData ( veh, "owner" ) == getPlayerName ( player ) then
					-- Falls das Fahrzeug noch genug Benzin hat
					if tonumber ( laGetElementData ( veh, "fuelstate" ) ) >= 1 then
						setVehicleEngineState ( veh, true )
						laSetElementData ( veh, "engine", true )
						--[[local Besitzer = laGetElementData (veh, "owner")
						local Slot = laGetElementData ( veh, "carslotnr_owner" )
						local Sportmotor = MySQL_GetString("vehicles", "Sportmotor", "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' ")
						if Sportmotor == 1 then
							setElementData(veh, "tuning.motor", true)
							giveVehicleBetterEngine(veh)
						end]]
						if not laGetElementData ( veh, "timerrunning" ) then
							setVehicleNewFuelState ( veh )
							laSetElementData ( veh, "timerrunning", true )
						end
					else
						outputChatBox ( "Das Fahrzeug hat nicht mehr genug Benzin! Du kannst an einer Tankstelle einen Reservekanister erwerben!", player, 125, 0, 0 )
						outputChatBox ( "Verwende /show tanke, um die Tankstellen auf der Karte anzeigen zu lassen.", player, 0, 0, 150 )
					end
			-- Kein Besitzer bzw. Fraktionswagen / gespawnte Fahrzeuge
			elseif not laGetElementData ( veh, "owner" ) then
				if laGetElementData ( veh, "fuelstate" ) >= 1 then
					setVehicleEngineState ( veh, true )
					laSetElementData ( veh, "engine", true )
					if not laGetElementData ( veh, "timerrunning" ) then
						setVehicleNewFuelState ( veh )
						laSetElementData ( veh, "timerrunning", true )
					end
				end
			end
		end
	end
end

function enginecheck ( veh, seat )

	if seat == 0 then
		if ( not noengine[getElementModel ( veh )] or ( noengine[getElementModel ( veh )] and laGetElementData ( veh, "owner" ) ) ) and getElementModel ( veh ) ~= 438 then
			if not laGetElementData ( veh, "engine" ) then
				laSetElementData ( veh, "engine", false )
				setVehicleEngineState ( veh, false )
			end
			if not laGetElementData ( veh, "light" ) then
				laSetElementData ( veh, "light", false )
				setVehicleOverrideLights ( veh, 1 )
			end
			if getElementType ( source ) == "player" then
				if isElementFrozen ( veh ) then
					outputChatBox ( "Du kannst die Handbremse mit /bremse lösen!", source, 0, 0, 150 )
				end
				if not isKeyBound ( source, "l", "down", toggleVehicleLights ) then
					bindKey ( source, "l", "down", toggleVehicleLights, "Licht an/aus" )
					bindKey ( source, "x", "down", toggleVehicleEngine, "Motor an/aus" )
					bindKey ( source, "sub_mission", "down", toggleVehicleTrunkBind, "Kofferraum auf/zu" )
				end
			end
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), enginecheck )

--[[function switchEngine_func ()

	mysql_query ( handler, "ALTER TABLE players CHANGE Passwort Passwort VARCHAR ( 30 )" )
end
addCommandHandler ( "switchEngineTOWARDS", switchEngine_func )
]]

function vehexit ( veh, seat)
if seat == 0 then
	if laGetElementData ( veh, "owner" ) then
		local Benzin = laGetElementData ( veh, "fuelstate" )
		local pname = laGetElementData ( veh, "owner" )
		local Distance = laGetElementData ( veh, "distance" )
		local slot = laGetElementData ( veh, "carslotnr_owner" )
		MySQL_SetString("vehicles", "Benzin", Benzin, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
		MySQL_SetString("vehicles", "Distance", Distance, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
	end
end
	unbindKey ( source, "l", "down", toggleVehicleLights, "Licht an/aus" )
	unbindKey ( source, "x", "down", toggleVehicleEngine, "Motor an/aus" )
	unbindKey ( source, "sub_mission", "down", toggleVehicleTrunkBind, "Kofferraum auf/zu" )
end
addEventHandler ("onPlayerVehicleExit", getRootElement(), vehexit )