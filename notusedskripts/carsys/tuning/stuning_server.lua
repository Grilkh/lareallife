function specPimpVeh ( veh )

	local stuning = laGetElementData ( veh, "stuning" )
	for i = 1, 6 do
		laSetElementData ( veh, "stuning"..i, tonumber ( gettok ( stuning, i, string.byte ( "|" ) ) ) )
	end
	
	-- 1 = Kofferraum
	if laGetElementData ( veh, "stuning1" ) >= 1 then
		
	else
		laSetElementData ( veh, "stuning1", false )
	end
	-- 2 = Panzerung
	if laGetElementData ( veh, "stuning2" ) >= 1 then
		setElementHealth ( veh, 1700 )
	else
		laSetElementData ( veh, "stuning2", false )
	end
	-- 3 = Benzinersparnis - s.h. fuel --
	if laGetElementData ( veh, "stuning3" ) >= 1 then
		laSetElementData ( veh, "fuelSaving", true )
	else
		laSetElementData ( veh, "stuning3", false )
	end
	-- 4 = GPS, s.h. /vehinfos --
	if laGetElementData ( veh, "stuning4" ) >= 1 then
		laSetElementData ( veh, "gps", true )
	else
		laSetElementData ( veh, "stuning4", false )
	end
	local event = false
	-- 5 = Doppelreifen, s.h. vehenter
	if laGetElementData ( veh, "stuning5" ) >= 1 then
		laSetElementData ( veh, "wheelrefreshable", true )
		event = true
	else
		laSetElementData ( veh, "stuning5", false )
	end
	-- 6 = Nebelwerfer, s.h. Doppelreifen
	if laGetElementData ( veh, "stuning6" ) >= 1 then
		laSetElementData ( veh, "smokeable", true )
		event = true
	else
		laSetElementData ( veh, "stuning6", false )
	end
	if event then
		addEventHandler ( "onVehicleEnter", veh, specialTuningVehEnter )
		addEventHandler ( "onVehicleExit", veh, specialTuningVehExit )
	end
end

function createSmokeBehindVehicle ( player )

	local veh = getPedOccupiedVehicle ( player )
	if laGetElementData ( veh, "smokeable" ) then
		laSetElementData ( veh, "smokeable", false )
		local x, y, z = getElementPosition ( veh )
		local smoker1 = createObject ( 2780, x, y-0.1, z )
		local smoker2 = createObject ( 2780, x, y, z )
		local smoker3 = createObject ( 2780, x, y+0.1, z )
		setElementAlpha ( smoker1, 0 )
		setElementAlpha ( smoker2, 0 )
		setElementAlpha ( smoker3, 0 )
		attachElementsInCorrectWay ( smoker1, veh )
		attachElementsInCorrectWay ( smoker2, veh )
		attachElementsInCorrectWay ( smoker3, veh )
		setTimer ( destroyElement, 7500, 1, smoker1 )
		setTimer ( destroyElement, 7500, 1, smoker2 )
		setTimer ( destroyElement, 7500, 1, smoker3 )
		if getElementData ( player, "sprache" ) == "Deutsch" then
			outputChatBox ( "Nebelwand aktiv - erst nach dem nächsten respawnen verfügbar!", player, 0, 125, 0 )
		else
			outputChatBox ( "Smokescreen active - After next respawn again available!", player, 0, 125, 0 )
		end
	else
		if getElementData ( player, "sprache" ) == "Deutsch" then
			outputChatBox ( "Nebelwand nicht verfügbar - bitte respawne dein Fahrzeug!", player, 125, 0, 0 )
		else
			outputChatBox ( "Smokescreen is not available - please respawn your vehicle!", player, 125, 0, 0 )
		end
	end
end

function refreshWheels ( player )

	local veh = getPedOccupiedVehicle ( player )
	if laGetElementData ( veh, "wheelrefreshable" ) then
		laSetElementData ( veh, "wheelrefreshable", false )
		setVehicleWheelStates ( veh, 0, 0, 0, 0 )
		if getElementData ( player, "sprache" ) == "Deutsch" then
			outputChatBox ( "Reifen aufgepumpt!", player, 125, 0, 0 )
		else
			outputChatBox ( "Tires inflated!", player, 125, 0, 0 )
		end
	else
		if getElementData ( player, "sprache" ) == "Deutsch" then
			outputChatBox ( "Du kannst deine Reifen nur einmal neu aufpumpen - bitte respawne dein Fahrzeug!", player, 125, 0, 0 )
		else
			outputChatBox ( "You can inflate your tires only once - please respawn your vehicle!", player, 125, 0, 0 )
		end
	end
end

function specialTuningVehEnter ( player, seat )

	local veh = getPedOccupiedVehicle ( player )
	if seat == 0 then
		if not isKeyBound ( player, "n", "down", createSmokeBehindVehicle ) then
			if laGetElementData ( veh, "smokeable" ) then
				if getElementData ( player, "sprache" ) == "Deutsch" then
					outputChatBox ( "Nebelwand bereit - drücke \"N\", um sie auszulösen!", player, 0, 125, 0 )
				else
					outputChatBox ( "Smokescreen ready - press \"N\", to trigger it!!", player, 0, 125, 0 )
				end
				bindKey ( player, "n", "down", createSmokeBehindVehicle )
			elseif laGetElementData ( veh, "stuning6" ) then
				if getElementData ( player, "sprache" ) == "Deutsch" then
					outputChatBox ( "Nebelwand nicht verfügbar - respawne dein Fahrzeug!", player, 125, 0, 0 )
				else
					outputChatBox ( "Smokescreen is not available - respawn your vehicle!", player, 125, 0, 0 )
				end
			end
		end
		if not isKeyBound ( player, "r", "down", refreshWheels ) then
			if laGetElementData ( veh, "wheelrefreshable" ) then
				if getElementData ( player, "sprache" ) == "Deutsch" then
					outputChatBox ( "Reifenpumpen bereit - drücke \"R\", um sie einzusetzen!", player, 0, 125, 0 )
				else
					outputChatBox ( "Tire pumps ready - press \"R\" to use them!", player, 0, 125, 0 )
				end
				bindKey ( player, "r", "down", refreshWheels )
			elseif laGetElementData ( veh, "stuning5" ) then
				if getElementData ( player, "sprache" ) == "Deutsch" then
					outputChatBox ( "Reifenpumpen nicht verfügbar - respawne dein Fahrzeug!", player, 125, 0, 0 )
				else
					outputChatBox ( "Tire pump is not available - respawn your vehicle!", player, 125, 0, 0 )
				end
			end
		end
	end
end

function specialTuningVehExit ( player, seat )

	local veh = getPedOccupiedVehicle ( player )
	if seat == 0 then
		if isKeyBound ( player, "n", "down", createSmokeBehindVehicle ) then
			unbindKey ( player, "n", "down", createSmokeBehindVehicle )
		end
		if isKeyBound ( player, "r", "down", refreshWheels ) then
			unbindKey ( player, "r", "down", refreshWheels )
		end
	end
end


-- TRUNK --
function trunkStorageServer_func ( element, value, take )
	
	if source == client then
		if tostring ( element ) == MySQL_Save ( element ) and tostring ( value ) == MySQL_Save ( value ) then
			local player = source
			local veh = laGetElementData ( player, "clickedVehicle" )
			
			local data = MySQL_GetString( "vehicles", "Kofferraum", "Besitzer LIKE '"..laGetElementData ( veh, "owner" ).."' AND Slot LIKE '"..laGetElementData ( veh, "carslotnr_owner" ).."'" )
			local weed = tonumber ( gettok ( data, 1, string.byte ( '|' ) ) )
			local mats = tonumber ( gettok ( data, 2, string.byte ( '|' ) ) )
			local gun = tonumber ( gettok ( data, 3, string.byte ( '|' ) ) )
			local ammo = tonumber ( gettok ( data, 4, string.byte ( '|' ) ) )
			local koks = tonumber ( MySQL_GetString( "vehicles", "Kokain", "Besitzer LIKE '"..laGetElementData ( veh, "owner" ).."' AND Slot LIKE '"..laGetElementData ( veh, "carslotnr_owner" ).."'" ) )
			
			if element == "weed" or element == "mats" or element == "koks" then
				value = math.abs ( math.floor ( tonumber ( value ) ) )
			end
			local curskin = getElementModel ( player )
				if copskins[getElementModel ( player )] then
					outputChatBox ( "Du bist noch im Dienst!", player, 125, 0, 0 )
				elseif isPedDead ( player ) then
					outputChatBox ( "Du kannst nichts entnehmen/einlagern wenn du tot bist!", player, 125, 0, 0 )			
				end
					if take then
						if element == "weed" then
							if weed >= value then
								weed = weed - value
								laSetElementData ( player, "weed", laGetElementData ( player, "weed" ) + value )
							end
						elseif element == "mats" then
							if mats >= value then
								mats = mats - value
								laSetElementData ( player, "mats", laGetElementData ( player, "mats" ) + value )
							end
						elseif element == "koks" then
							if koks >= value then
								koks = koks - value
								laSetElementData ( player, "koks", laGetElementData ( player, "koks" ) + value )
							end
						else
							giveWeapon ( player, gun, ammo )
							setPedWeaponSlot ( player, getSlotFromWeapon ( gun ) )
							gun = 0
							ammo = 0
						end
					else
						if element == "weed" then
							if laGetElementData ( player, "weed" ) >= value then
								weed = weed + value
								laSetElementData ( player, "weed", laGetElementData ( player, "weed" ) - value )
							end
						elseif element == "mats" then
							if laGetElementData ( player, "mats" ) >= value then
								mats = mats + value
								laSetElementData ( player, "mats", laGetElementData ( player, "mats" ) - value )
							end
						elseif element == "koks" then
							if laGetElementData ( player, "koks" ) >= value then
								koks = koks + value
								laSetElementData ( player, "koks", laGetElementData ( player, "koks" ) - value )
							end
						else
							gun = getPedWeapon ( player )
							ammo = getPedTotalAmmo ( player )
							takeWeapon ( player, gun )
							setPedWeaponSlot ( player, 0 )
						end
					end
					--local string = tostring ( weed.."|"..mats.."|"..gun.."|"..ammo.."|"..koks.."|" )
					local string = tostring ( weed.."|"..mats.."|"..gun.."|"..ammo.."|" )
					local Besitzer = laGetElementData ( veh, "owner" )
					local slot = tonumber ( laGetElementData ( veh, "carslotnr_owner" ) )
					playSoundFrontEnd ( player, 40 )
					
					MySQL_SetString ( "vehicles", "Kofferraum", string, "Besitzer LIKE '"..Besitzer.."' AND Slot LIKE '" ..slot.. "' ")
					MySQL_SetString ( "vehicles", "Kokain", koks, "Besitzer LIKE '"..Besitzer.."' AND Slot LIKE '" ..slot.. "' ")
		end
	end
end
addEvent ( "trunkStorageServer", true )
addEventHandler ( "trunkStorageServer", getRootElement(), trunkStorageServer_func )