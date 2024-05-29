vehBlipColor = {}
	vehBlipColor["r"] = {}
	vehBlipColor["g"] = {}
	vehBlipColor["b"] = {}
		color = 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 0
		vehBlipColor["b"][color] = 0
		color = color + 1
		vehBlipColor["r"][color] = 0
		vehBlipColor["g"][color] = 255
		vehBlipColor["b"][color] = 0
		color = color + 1
		vehBlipColor["r"][color] = 0
		vehBlipColor["g"][color] = 0
		vehBlipColor["b"][color] = 255
		color = color + 1
		vehBlipColor["r"][color] = 0
		vehBlipColor["g"][color] = 0
		vehBlipColor["b"][color] = 0
		color = color + 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 255
		vehBlipColor["b"][color] = 255
		color = color + 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 255
		vehBlipColor["b"][color] = 0
		color = color + 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 0
		vehBlipColor["b"][color] = 255
		color = color + 1
		vehBlipColor["r"][color] = 0
		vehBlipColor["g"][color] = 255
		vehBlipColor["b"][color] = 255
		color = color + 1
		vehBlipColor["r"][color] = 125
		vehBlipColor["g"][color] = 125
		vehBlipColor["b"][color] = 125
		color = color + 1
		vehBlipColor["r"][color] = 255
		vehBlipColor["g"][color] = 150
		vehBlipColor["b"][color] = 0
		color = color + 1
		color = nil

function towveh_func ( player, command, towcar )

	if towcar == nil then
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGebrauch:/respawnen [Fahrzeugnummer]", 5000, 125, 0, 0 )
	else
		if tonumber(laGetElementData ( player, "carslot"..towcar )) >= 1 then
			local pname = MySQL_Save ( getPlayerName ( player ) )
			local carslot = towcar
			--local Car = _G[getPrivVehString ( pname, carslot )]
			local Car = MySQL_GetString("vehicles", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..carslot.."'")
			--MySQL_GetString("vehicles", "id", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..carslot.."'")
			local Totalschaeden = MySQL_GetString("vehicles", "Totalschaden", "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..tonumber(carslot).. "' ")
			--SICHERHEITSHINWEIS--
			--if (tonumber(Totalschaeden) < 5) then
				if laGetElementData (Car, "onServerStartSpawned") == true then
					if laGetElementData ( player, "money" ) >= 200 then
						if respawnPrivVeh ( towcar, pname ) then
							laSetElementData ( player, "money", tonumber(laGetElementData ( player, "money" )) - 200 )
							takePlayerMoney ( player, 200 )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast dein Fahrzeug respawnt!", 5000, 0, 255, 0 )
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDas Fahrzeug ist nicht leer!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!", 5000, 125, 0, 0 )
					end
				else
					if respawnPrivVeh ( towcar, pname ) then
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast dein Fahrzeug respawnt!", 5000, 0, 255, 0 )
						laSetElementData (Car, "onServerStartSpawned", true)
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDas Fahrzeug ist nicht leer!", 5000, 125, 0, 0 )
					end
				end
			--[[else
                laSetElementData ( player, "curcars", laGetElementData ( player, "curcars" )-1 )
				MySQL_DelRow("vehicles", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..carslot.."'")
                SaveCarData ( player )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDas Fahrzeug ist schrottreif\nund wird entsorgt.", 5000, 125, 0, 0 )
			end]]
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein Fahrzeug mit dieser Nummer!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "respawnPrivVehClick", true )
addEventHandler ( "respawnPrivVehClick", getRootElement(), towveh_func )
addCommandHandler ( "towveh", towveh_func )
addCommandHandler ( "respawnen", towveh_func )


function towvehall_func ( player, command )

	for i=1, 10, 1 do
		if tonumber(laGetElementData ( player, "carslot"..i )) >= 1 then
			local pname = MySQL_Save ( getPlayerName ( player ) )
			local towcar = i
			local Car = MySQL_GetString("vehicles", "id", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..towcar.."'")
			local Totalschaeden = MySQL_GetString("vehicles", "Totalschaden", "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..tonumber(towcar).. "' ")
			--SICHERHEITSHINWEIS--
			--if (tonumber(Totalschaeden) < 5) then
				if laGetElementData (Car, "onServerStartSpawned") == true then
					if laGetElementData ( player, "money" ) >= 200 then
						if respawnPrivVeh ( towcar, pname ) then
							laSetElementData ( player, "money", tonumber(laGetElementData ( player, "money" )) - 200 )
							takePlayerMoney ( player, 200 )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							--triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast dein Fahrzeug respawnt!", 5000, 0, 255, 0 )
						else
							--triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDas Fahrzeug ist nicht leer!", 5000, 125, 0, 0 )
						end
					else
						--triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!", 5000, 125, 0, 0 )
					end
				else
					if respawnPrivVeh ( towcar, pname ) then
						--triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast dein Fahrzeug respawnt!", 5000, 0, 255, 0 )
						laSetElementData (Car, "onServerStartSpawned", true)
					else
						--triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDas Fahrzeug ist nicht leer!", 5000, 125, 0, 0 )
					end
				end
		end
		if i == 10 then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast deine Fahrzeuge respawnt!", 5000, 0, 255, 0 )
		end
	end
end
addCommandHandler ( "towvehall", towvehall_func )
addCommandHandler ( "respawnenalle", towvehall_func )

function givecar_func ( player, cmd, target, pSlot )

	if target and pSlot and getPlayerFromName ( target ) and tonumber ( pSlot ) then
		pSlot = MySQL_Save ( pSlot )
		tSlot = getFreeCarSlot ( getPlayerFromName ( target ) )
		local pname = getPlayerName ( player )
		local target = getPlayerFromName ( target )
		if tonumber ( MySQL_GetString("vehicles", "AuktionsID", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..tonumber(pSlot).."'") ) == 0 then
			if laGetElementData ( target, "carslot"..tSlot ) == 0 and laGetElementData ( player, "carslot"..pSlot ) > 0 then
				local veh = _G[getPrivVehString ( pname, pSlot )]
				local vehname = getVehicleName ( veh )
				if isElement ( veh ) then
					if ( premiumBuyCars[getElementModel(veh)] and isAdmin(player) ) or not premiumBuyCars[getElementModel(veh)] then
						if laGetElementData ( target, "curcars" ) < laGetElementData ( target, "maxcars" ) then
							local id = MySQL_GetString("vehicles", "ID", "Besitzer LIKE '"..getPlayerName(player).."' AND Slot LIKE '"..tonumber(pSlot).."'")
							
							outputChatBox ( "Du hast dein Fahrzeug an "..getPlayerName ( target ).." gegeben!", player, 0, 125, 0 )
							outputChatBox ( "Fahrzeug: "..vehname..", Slot: "..pSlot..".", player, 0, 125, 0 )
							outputChatBox ( "Du hast ein Fahrzeug von "..pname.." erhalten!", target, 0, 125, 0 )
							outputChatBox ( "Fahrzeug: "..vehname..", Slot: "..tSlot..".", target, 0, 125, 0 )
							
							outputLog ( "[HANDEL]: "..pname.." hat sein Fahrzeug ( Modell: "..getElementModel(veh)..", ID: "..id.." ) an "..getPlayerName(target).." gegeben!", "car" )
							MySQL_SetString("vehicles", "Besitzer", getPlayerName(target), "ID LIKE '"..id.."'")
							MySQL_SetString("vehicles", "Slot", tonumber ( tSlot ), "ID LIKE '"..id.."'")
						
							laSetElementData ( target, "carslot"..tSlot, laGetElementData ( player, "carslot"..pSlot ) )
							laSetElementData ( player, "carslot"..pSlot, 0 )
							laSetElementData ( target, "curcars", laGetElementData ( target, "curcars" ) + 1 )
							laSetElementData ( player, "curcars", laGetElementData ( player, "curcars" ) - 1 )
							laSetElementData ( veh, "lcolor", "|255|255|255|" )
							MySQL_SetString("vehicles", "Lights", "|255|255|255|", "ID LIKE '"..id.."'")
							setPrivVehCorrectLightColor ( veh )
							laSetElementData ( veh, "owner", getPlayerName ( target ) )
							laSetElementData ( veh, "name", "privVeh"..getPlayerName(target)..tSlot )
							laSetElementData ( veh, "carslotnr_owner", tSlot )
							_G[getPrivVehString ( getPlayerName(target), tSlot )] = veh
							_G[getPrivVehString ( pname, pSlot )] = nil
							SaveCarData ( player )
							SaveCarData ( target )
						else
							outputChatBox ( "Der Spieler hat keinen freien Fahrzeugslot mehr!", player, 150, 0, 0 )
						end
					else
						outputChatBox ( "Du kannst keine Klasse Y/X/Z Fahrzeuge weitergeben!", player, 150, 0, 0 )
					end
				else
					outputChatBox ( "Ungültiges Fahrzeug!", player, 150, 0, 0 )
				end
			else
				outputChatBox ( "Ungültiger Fahrzeugslot!", player, 150, 0, 0 )
			end
		else
			outputChatBox ( "Dieses Fahrzeuge wird momentan versteigert!", player, 150, 0, 0 )
		end
	else
		outputChatBox ( "Gebrauch: /givecar [Spieler] [Eigener Slot]", player, 150, 0, 0 )
	end
end
addCommandHandler ( "givecar", givecar_func )

function respawnPrivVeh ( carslot, pname )

	if not isElement ( _G[getPrivVehString ( pname, carslot )] ) or ( not getVehicleOccupant ( _G[getPrivVehString ( pname, carslot )] ) and not getVehicleOccupant ( _G[getPrivVehString ( pname, carslot )], 1 ) and not getVehicleOccupant ( _G[getPrivVehString ( pname, carslot )], 2 ) and not getVehicleOccupant ( _G[getPrivVehString ( pname, carslot )], 3 ) ) then
		if tonumber ( MySQL_GetString("vehicles", "AuktionsID", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..carslot.."'") ) == 0 then
			local dsatz
			local result = mysql_query ( handler, "SELECT * from vehicles WHERE Besitzer LIKE '"..pname.."' AND Slot LIKE '"..carslot.."'" )
			if result then
				if ( mysql_num_rows ( result ) > 0 ) then
					dsatz = mysql_fetch_assoc ( result )
				end
				mysql_free_result ( result )
			end
			
			destroyMagnet ( _G[getPrivVehString ( pname, carslot )] )
			local Besitzer = pname
			local Slot = carslot
			if isElement ( _G[getPrivVehString ( pname, carslot )] ) then
				MySQL_SetString("vehicles", "Benzin", laGetElementData(_G[getPrivVehString ( pname, carslot )],"fuelstate"), "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..carslot.."'")
				MySQL_SetString("vehicles", "Distance", laGetElementData(_G[getPrivVehString ( pname, carslot )],"distance"), "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..carslot.. "' ")
				destroyElement ( _G[getPrivVehString ( pname, carslot )] )
			end
			if laGetElementData ( _G[getPrivVehString ( pname, carslot )], "special" ) == 2 then 
				detachElements ( _G["ObjYacht"..Besitzer..Slot], _G[getPrivVehString ( pname, carslot )] )
				destroyElement ( _G["ObjYacht"..Besitzer..Slot] )
				special = 2
			end
			
			local Typ = dsatz["Typ"]
			local Last_Login_Besitzer_Tag = MySQL_GetString("players", "Last_login", "Name LIKE '" ..pname.."'")
			local Tuning = dsatz["Tuning"]
			local Spawnpos_X = dsatz["Spawnpos_X"]
			local Spawnpos_Y = dsatz["Spawnpos_Y"]
			local Spawnpos_Z = dsatz["Spawnpos_Z"]
			local Spawnrot_X = dsatz["Spawnrot_X"]
			local Spawnrot_Y = dsatz["Spawnrot_Y"]
			local Spawnrot_Z = dsatz["Spawnrot_Z"]
			local Farbe = dsatz["Farbe"]
			local LFarbe = dsatz["Lights"]
			local Paintjob = dsatz["Paintjob"]
			local Benzin = dsatz["Benzin"]
			local Distanz = dsatz["Distance"]
			local STuning = dsatz["STuning"]
			local Car = MySQL_GetString("vehicles", "id", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..carslot.."'")
			local Totalschaeden = MySQL_GetString("vehicles", "Totalschaden", "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..tonumber(carslot).. "' ")
			local Zerstoert = MySQL_GetString("vehicles", "Zerstoert", "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..tonumber(carslot).. "' ")
			_G[getPrivVehString ( pname, carslot )] = createVehicle ( Typ, Spawnpos_X, Spawnpos_Y, Spawnpos_Z, 0, 0, 0, Besitzer )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "owner", Besitzer )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "name", _G[getPrivVehString ( pname, carslot )] )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "carslotnr_owner", Slot )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "locked", true )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "color", Farbe )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "lcolor", LFarbe )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "spawnpos_x", Spawnpos_X )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "spawnpos_y", Spawnpos_Y )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "spawnpos_z", Spawnpos_Z )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "spawnrot_x", Spawnrot_X )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "spawnrot_y", Spawnrot_Y )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "spawnrot_z", Spawnrot_Z )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "distance", Distanz )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "stuning", STuning )
			setVehicleLocked ( _G[getPrivVehString ( pname, carslot )], true )
			--setElementFrozen ( _G[getPrivVehString ( pname, carslot )], true )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "fuelstate", Benzin )
			setPrivVehCorrectColor ( _G[getPrivVehString ( pname, carslot )] )
			setPrivVehCorrectLightColor ( _G[getPrivVehString ( pname, carslot )] )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "totalschaeden", tonumber(Totalschaeden) )
			laSetElementData ( _G[getPrivVehString ( pname, carslot )], "zerstoert", tonumber(Zerstoert) )
			setVehiclePaintjob ( _G[getPrivVehString ( pname, carslot )], Paintjob )
			--Slot und Besitzer von weiter oben
			--[[local Sportmotor = MySQL_GetString("vehicles", "Sportmotor", "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..Slot.. "' ")
			if Sportmotor == 1 then
				setElementData(_G[getPrivVehString ( pname, carslot )], "tuning.motor", true)
				giveVehicleBetterEngine(_G[getPrivVehString ( pname, carslot )])
			end]]
			if special == 2 then
				local both = Besitzer..Slot
				_G["ObjYacht"..both] = createObject ( 1337, 0, 0, 0 )
				attachElements ( _G["ObjYacht"..Besitzer..Slot], _G[getPrivVehString ( pname, carslot )], 0, 2, 1.55 )
				setElementDimension ( _G["ObjYacht"..both], 1 )
			end
			setVehicleRotation ( _G[getPrivVehString ( pname, carslot )], Spawnrot_X, Spawnrot_Y, Spawnrot_Z )
			pimpVeh ( _G[getPrivVehString ( pname, carslot )], Tuning )
			setVehicleAsMagnetHelicopter ( _G[getPrivVehString ( pname, carslot )] )
			

			return true
		end
	end
	return false
end

function setPrivVehCorrectColor ( veh )

	local colors = laGetElementData ( veh, "color" )
	local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
	local c2 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
	local c3 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
	
	local c11 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
	local c12 = tonumber ( gettok ( colors, 5, string.byte( '|' ) ))
	local c13 = tonumber ( gettok ( colors, 6, string.byte( '|' ) ))
	
	local c21 = tonumber ( gettok ( colors, 7, string.byte( '|' ) ))
	local c22 = tonumber ( gettok ( colors, 8, string.byte( '|' ) ))
	local c23 = tonumber ( gettok ( colors, 9, string.byte( '|' ) ))

	local c31 = tonumber ( gettok ( colors, 10, string.byte( '|' ) ))
	local c32 = tonumber ( gettok ( colors, 11, string.byte( '|' ) ))
	local c33 = tonumber ( gettok ( colors, 12, string.byte( '|' ) ))
	setVehicleColor ( veh, c1, c2, c3, c11, c12, c13, c21, c22, c23, c31, c32, c33 )
	setTimer ( setVehicleColor, 100, 1, veh, c1, c2, c3, c11, c12, c13, c21, c22, c23, c31, c32, c33 )
end

function setPrivVehCorrectLightColor ( veh )

	if veh then
		local colors = laGetElementData ( veh, "lcolor" )
		if colors then
			local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
			local c2 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
			local c3 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
			laSetElementData ( veh, "lc1", c1 )
			laSetElementData ( veh, "lc2", c2 )
			laSetElementData ( veh, "lc3", c3 )
			setVehicleHeadLightColor ( veh, c1, c2, c3 )
		end
	end
end

function respawnVeh_func ( towcar, pname, veh )
	
	if towcar then
		respawnPrivVeh ( towcar, pname )
	else
		if not getVehicleOccupant ( veh ) then
			respawnVehicle ( veh )
			setElementDimension ( veh, 0 )
			setElementInterior ( veh, 0 )
		end
	end
end
addEvent ( "respawnVeh", true )
addEventHandler ( "respawnVeh", getRootElement(), respawnVeh_func )

function deleteVeh_func ( towcar, pname, veh, reason )

	local admin = getPlayerName ( source )
	if laGetElementData ( source, "adminlvl" ) >= 1 then
		local player = getPlayerFromName ( pname )
		if player then
			outputChatBox ( "Dein Fahrzeug in Slot Nr. "..towcar.." wurde von "..admin.." gelöscht ("..reason..")!", player, 125, 0, 0 )
			laSetElementData ( player, "carslot"..towcar, 0 )
			outputChatBox ( "Der User hat die Nachricht erhalten.", source, 0, 125, 0 )
		else
			offlinemsg ( "Dein Fahrzeug in Slot Nr. "..towcar.." wurde von "..admin.." geloescht ("..reason..")!", "Server", pname )
			outputChatBox ( "Der User ist offline.", source, 125, 0, 0 )
		end
		outputLog ( "[ENTFERNT]: Fahrzeug von "..pname.." ( Modell: "..getElementModel(veh)..", Slot "..towcar.." ) wurde von "..admin.." geloescht.", "car" )
		destroyElement ( veh )
		MySQL_DelRow("vehicles", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..towcar.."'")
	end
end
addEvent ( "deleteVeh", true )
addEventHandler ( "deleteVeh", getRootElement(), deleteVeh_func )

function park_func ( player, command )

	if getPedOccupiedVehicleSeat ( player ) == 0 then
		local veh = getPedOccupiedVehicle ( player )
		if laGetElementData ( veh, "owner" ) == getPlayerName ( player ) or (laGetElementData ( player, "adminlvl" ) >= 1) then
			if isTrailerInParkingZone ( veh ) then
				local x, y, z = getElementPosition ( veh )
				local rx, ry, rz = getVehicleRotation ( veh )
				local c1, c2, c3, c4 = getVehicleColor ( veh )
				laSetElementData ( veh, "spawnposx", x )
				laSetElementData ( veh, "spawnposy", y )
				laSetElementData ( veh, "spawnposz", z )
				laSetElementData ( veh, "spawnrotx", rx )
				laSetElementData ( veh, "spawnroty", ry )
				laSetElementData ( veh, "spawnrotz", rz )
				laSetElementData ( veh, "color1", c1 )
				laSetElementData ( veh, "color2", c2 )
				laSetElementData ( veh, "color3", c3 )
				laSetElementData ( veh, "color4", c4 )
				outputChatBox ( "Fahrzeug geparkt!", player, 0, 255, 0 )
			
				local Spawnpos_X, Spawnpos_Y, Spawnpos_Z = getElementPosition ( veh )
				local Spawnrot_X, Spawnrot_Y, Spawnrot_Z = getVehicleRotation ( veh )
				local Farbe1, Farbe2, Farbe3, Farbe4 =  getVehicleColor ( veh )
				local color = "|"..Farbe1.."|"..Farbe2.."|"..Farbe3.."|"..Farbe4.."|"
				local Paintjob = getVehiclePaintjob ( veh )
				local Benzin = laGetElementData ( veh, "fuelstate" )
				local pname = laGetElementData ( veh, "owner" )
				local Distance = laGetElementData ( veh, "distance" )
				local slot = laGetElementData ( veh, "carslotnr_owner" )

				MySQL_SetString("vehicles", "Spawnpos_X", Spawnpos_X, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
				MySQL_SetString("vehicles", "Spawnpos_Y", Spawnpos_Y, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
				MySQL_SetString("vehicles", "Spawnpos_Z", Spawnpos_Z, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
				MySQL_SetString("vehicles", "Spawnrot_X", Spawnrot_X, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
				MySQL_SetString("vehicles", "Spawnrot_Y", Spawnrot_Y, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
				MySQL_SetString("vehicles", "Spawnrot_Z", Spawnrot_Z, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
				MySQL_SetString("vehicles", "Farbe", color, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
				MySQL_SetString("vehicles", "Paintjob", Paintjob, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
				MySQL_SetString("vehicles", "Benzin", Benzin, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
				MySQL_SetString("vehicles", "Distance", Distance, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
			else
				outputChatBox ( "Dieses Fahrzeug kannst du nicht in der Stadt parken!", player, 150, 0, 0 )
			end
		else
			outputChatBox ( "Dieses Fahrzeug gehört dir nicht!", player, 175, 0, 0 )
		end
	else
		outputChatBox ( "Du musst in einem Fahrzeug sitzen!", player, 150, 0, 0 )
	end
end
addCommandHandler ( "park", park_func )
addCommandHandler ( "parken", park_func )

function lock_func ( player, command, locknr )

	if locknr == nil then
		outputChatBox ( "Gebrauch: /lock [Fahrzeugnummer]", player, 150, 0, 0 )
	else
		if tonumber(laGetElementData ( player, "carslot"..locknr )) >= 1 then
			local pname = getPlayerName ( player )
			local veh = _G[getPrivVehString ( pname, locknr )]
			if isElement ( veh ) then
				if laGetElementData ( veh, "locked" ) then
					laSetElementData ( veh, "locked", false )
					setVehicleLocked ( veh, false )
					outputChatBox ( "Fahrzeug aufgeschlossen!", player, 0, 200, 0 )
				elseif not laGetElementData ( veh, "locked" ) then
					laSetElementData ( veh, "locked", true )
					setVehicleLocked ( veh, true )
					outputChatBox ( "Fahrzeug abgeschlossen!", player, 200, 0, 0 )
				end
			else
				outputChatBox ( "Bitte respawne dein Fahrzeug zuerst!", player, 150, 0, 0 )
			end
		else
			outputChatBox ( "Du hast kein Fahrzeug mit diesem Namen!", player, 175, 0, 0 )
		end
	end
end
addEvent ( "lockPrivVehClick", true )
addEventHandler ( "lockPrivVehClick", getRootElement(), lock_func )
addCommandHandler ( "lock", lock_func )
addCommandHandler ( "schliessen", lock_func )
addCommandHandler ( "oeffnen", lock_func )

function vehinfos_func ( player )

	local curcars = laGetElementData ( player, "curcars" )
	local maxcars = laGetElementData ( player, "maxcars" )
	outputChatBox ( "Du hast zurzeit "..curcars.." Fahrzeuge von maximal "..maxcars, player, 200, 200, 0  )
	local pname = getPlayerName ( player )
	color = 0
	local zahl = 0
	if isPremium(player) then
		zahl = 15
	else
		zahl = 10
	end
	for i = 1, zahl do
		carslotname = "carslot"..i
		if laGetElementData ( player, carslotname ) ~= 0 then
			local veh = _G[getPrivVehString ( pname, i )]
			if isElement ( veh ) then
				local x, y, z = getElementPosition( veh )
				if laGetElementData ( veh, "gps" ) then
					color = color + 1
					local blip = createBlip ( x, y, z, 0, 2, vehBlipColor["r"][color], vehBlipColor["g"][color], vehBlipColor["b"][color], 255, 0, 99999.0, player )
					setTimer ( destroyElement, 10000, 1, blip )
					outputChatBox ( "Fahrzeug Nummer "..i..": "..getVehicleName ( veh )..", steht momentan in "..getZoneName( x,y,z )..", "..getZoneName( x,y,z, true ), player, vehBlipColor["r"][color], vehBlipColor["g"][color], vehBlipColor["b"][color] )
				else
					outputChatBox ( "Fahrzeug Nummer "..i..": "..getVehicleName ( veh )..", steht momentan in "..getZoneName( x,y,z )..", "..getZoneName( x,y,z, true ), player, 0, 0, 200 )
				end
			else
				if tonumber ( MySQL_GetString("vehicles", "AuktionsID", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..i.."'") ) == 0 then
					outputChatBox ( "Dein Fahrzeug in Slot NR "..i.." muss zuerst mit /towveh "..i.." respawnt werden!", player, 125, 0, 0 )
				else
					outputChatBox ( "Dein Fahrzeug wurde komplett zerstört. Beim nächsten Einloggen ist der Slot wieder frei.", player, 125, 0, 0 )
					--outputChatBox ( "Dein Fahrzeug in Slot NR "..i.." steht momentan zum Verkauf!", player, 125, 0, 0 )
					--outputLog ( "[ENTFERNT]: Fahrzeug von "..pname.." ( Modell: "..getElementModel(veh)..", Slot "..i.." ) wurde vom Server entfernt.", "car" )
					outputLog ( "[ENTFERNT]: Fahrzeug von "..pname.." ( Slot "..i.." ) wurde vom Server entfernt.", "car" )
				end
			end
		end
	end
end
addCommandHandler ( "fahrzeuge", vehinfos_func )

function vehinfosold_func ( player )
	outputChatBox ( "Verwende /fahrzeuge", player, 200, 0, 0 )
end
addCommandHandler ( "vehinfos", vehinfosold_func )

function vehhelp_func ( player )
	outputChatBox ( "--- Fahrzeughilfe ---", player, 200, 200, 0 )
	outputChatBox ( "/fahrzeuge, um die Übersicht über deine Fahrzeuge zu erhalten.", player, 250, 50, 0 )
	outputChatBox ( "/schliessen [SLOT], um dein Fahrzeug abzuschliessen/zu öffnen.", player, 250, 150, 0 )
	outputChatBox ( "/respawnen, um dein Fahrzeug zu respawnen. Kosten: 200$", player, 250, 50, 0 )
	outputChatBox ( "/parken, um dein Fahrzeug zu parkieren. Dies ist auch der Respawnort.", player, 250, 150, 0 )
	outputChatBox ( "/sellcarto [NAME] [PREIS] [SLOT], um dein Fahrzeug einem Spieler anzubieten.", player, 250, 50, 0 )
	outputChatBox ( "/givecar [NAME] [SLOT], um das Fahrzeug weiterzugeben.", player, 250, 150, 0 )
	outputChatBox ( "/sellcar [SLOT], um dein Fahrzeug zu recyclen (50% des Kaufpreises).", player, 250, 50, 0 )
	outputChatBox ("")
	outputChatBox ( "Mehr Infos über zerstörte oder abgeschleppte Fahrzeuge? Verwende /fahrzeuginfos !", player, 200, 200, 0 )
end
addCommandHandler ( "fahrzeughilfe", vehhelp_func )

function vehhelpold_func ( player )
	outputChatBox ( "Verwende /fahrzeughilfe", player, 200, 0, 0 )
end
addCommandHandler ( "vehhelp", vehhelpold_func )

function fahrzeuginfos_func ( player )
	outputChatBox ( "--- Zerstörte und abgeschleppte Fahrzeuge ---", player, 200, 200, 0 )
	outputChatBox ( "Wenn du deine Fahrzeuge falsch parkierst, werden diese abgeschleppt.", player, 250, 50, 0 )
	outputChatBox ( "Abgeschleppte Fahrzeuge findest du bei der Fahrschule, beim weissen S im Süden von SF.", player, 250, 150, 0 )
	outputChatBox ( "Wenn dein Fahrzeug einen Totalschaden hat, respawnt es immer am Unfallort.", player, 250, 50, 0 )
	outputChatBox ( "Um dein Fahrzeug zu reparieren, bring es zur Werkstatt oder melde dich bei einem Mechaniker.", player, 250, 150, 0 )
	outputChatBox ( "Die Werkstatt befindet sich im Westen von SF, diese wird von den Mechanikern verwaltet.", player, 250, 50, 0 )
	outputChatBox ( "Die Mechaniker befinden gehören zur \"Los Angeles Emergency\"-Fraktion, ihr Farbe ist grau.", player, 250, 150, 0 )
	outputChatBox ( "Beim 5. Mal Totalschaden können die Fahrzeuge nicht mehr repariert werden und sind schrottreif.", player, 250, 50, 0 )
end
addCommandHandler ( "fahrzeuginfos", fahrzeuginfos_func )

function sellcar_func ( player, cmd, slot, bestaetigung )

	local slot = tonumber(slot)
	if laGetElementData ( player, "carslot"..slot ) > 0 then
		local pname = MySQL_Save ( getPlayerName(player) )
		--if tonumber ( MySQL_GetString("vehicles", "AuktionsID", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..slot.."'") ) == 0 then
			local veh = _G[getPrivVehString ( pname, slot )]
			local model = getElementModel ( veh )
			local cary = getVehicleName(veh)
			local price = carprices[model]
			local newprice = price/100*60
			if veh then
				if (bestaetigung == "JA") or (bestaetigung == "Ja") or (bestaetigung == "ja") then
					destroyMagnet ( veh )
					laSetElementData ( player, "carslot"..slot, 0 )
					local spawnx = laGetElementData ( player, "spawnpos_x" )
					if spawnx == "marquis" or spawnx == "tropic" then
						laSetElementData ( player, "spawnpos_x", -1971.466796875 )
						laSetElementData ( player, "spawnpos_y", 137.821890625 )
						laSetElementData ( player, "spawnpos_z", 27.6875 )
						laSetElementData ( player, "spawnrot_x", 90 )
						laSetElementData ( player, "spawnint", 0 )
						laSetElementData ( player, "spawndim", 0 )
					end
					outputChatBox ( "Fahrzeug "..cary.." für "..newprice.."$ an den Server verkauft!", player, 0, 150, 0 )
					local id = MySQL_GetString("vehicles", "ID", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..laGetElementData(veh, "carslotnr_owner" ).."'")
					outputLog ( "[HANDEL]: "..pname.." hat sein Fahrzeug ( Modell: "..getElementModel(veh)..", ID: "..id.." ) fuer "..newprice.." verkauft!", "car" )
					MySQL_DelRow("vehicles", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..laGetElementData(veh, "carslotnr_owner" ).."'")
					laSetElementData(player,"curcars",tonumber(laGetElementData ( player, "curcars" ))-1)
					destroyElement ( veh )
					laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" )+newprice )
					--givePlayerMoney ( player, newprice )
					--triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					SaveCarData ( player )
					
					local Autoverkaufkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Autoverkauf'") )
					local Autoverkaufkassenew = math.floor(Autoverkaufkasse + newprice)
					MySQL_SetString("staat", "Menge", Autoverkaufkassenew, "Name LIKE 'Autoverkauf'")

					local Autoverkaufsteuernkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Autoverkaufsteuern'") )
					local Autoverkaufsteuernkassenew = math.floor(Autoverkaufsteuernkasse + (price/100*40))
					MySQL_SetString("staat", "Menge", Autoverkaufsteuernkassenew, "Name LIKE 'Autoverkaufsteuern'")							
					
				else
					outputChatBox ( "Bist du dir sicher, dass du dein Fahrzeug "..cary.." an den Server verkaufen möchtest?", player, 125, 0, 0 )
					outputChatBox ( "Diese Aktion kann nicht rückgängig gemacht werden. Du kriegst "..newprice.."$ erstattet.", player, 0, 0, 150 )
					outputChatBox ( "Verwende /sellcar [SLOT] 'Ja', um dein Fahrzeug an den Server zu verkaufen!", player, 225, 225, 0 )
				end
			else
				outputChatBox ( "Bitte respawne dein Fahrzeug vorher!", player, 125, 0, 0 )
			end
		--else
		--	outputChatBox ( "Dieses Fahrzeug kannst du nicht verkaufen, da es zum Verkauf steht.", player, 125, 0, 0 )
		--end
	else
		outputChatBox ( "Ungültiger Slot!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "sellcar", sellcar_func )

function sellcarto_func ( player, cmd, target, pSlot, price )
	if target and pSlot and getPlayerFromName ( target ) and tonumber ( pSlot ) then
		pSlot = MySQL_Save ( pSlot )
		tSlot = getFreeCarSlot ( getPlayerFromName ( target ) )
		local pname = getPlayerName ( player )
		local target = getPlayerFromName ( target )
		--if tonumber ( MySQL_GetString("vehicles", "AuktionsID", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..tonumber(pSlot).."'") ) == 0 then
			if tSlot and laGetElementData ( target, "carslot"..tSlot ) == 0 and laGetElementData ( player, "carslot"..pSlot ) > 0 then
				local veh = _G[getPrivVehString ( pname, pSlot )]
				if tonumber ( price ) then
					price = math.abs ( math.floor ( tonumber ( price ) ) )
					if isElement ( veh ) then
						if ( premiumBuyCars[getElementModel(veh)] and isAdmin(player) ) or not premiumBuyCars[getElementModel(veh)] then
							if laGetElementData ( target, "curcars" ) < laGetElementData ( target, "maxcars" ) then
								local model = getElementModel ( veh )
								local vehname = getVehicleName ( veh )
								local stringw = false
								for i = 1, specialUpgrades do
									local fix = laGetElementData ( veh, "stuning"..i )
									if fix then 
										if not stringw then
											stringw = specialUpgrade[i]
										else
											stringw = stringw..", "..specialUpgrade[i]
										end
									end
								end
								if not stringw then
									stringw = "Keine"
								end
								local totalschaeden = laGetElementData ( veh, "totalschaeden" )						
								outputChatBox ( pname.." bietet dir folgendes Fahrzeug für "..price.."$ an: "..vehname, target, 0, 0, 150 )
								outputChatBox ( "Tunings: #969600"..stringw, target, 0, 0, 150, true )
								outputChatBox ( "Totalschäden: #969600"..totalschaeden, target, 0, 0, 150, true )
								outputChatBox ( "Tippe /buycar, um das Fahrzeug zu kaufen.", target, 225, 225, 0 )
								outputChatBox ( "Du hast "..getPlayerName ( target ).." dein Fahrzeug in Slot "..pSlot.." angeboten.", player, 200, 200, 0 )
								outputChatBox ( "Fahrzeug: "..vehname..", Preis: "..price.."$.", player, 200, 200, 0 )							
								laSetElementData ( target, "carToBuyFrom", player )
								laSetElementData ( target, "carToBuySlot", tonumber ( pSlot ) )
								laSetElementData ( target, "carToBuyPrice", price )
								laSetElementData ( target, "carToBuyModel", model )
							else
								outputChatBox ( "Der Spieler hat keinen freien Fahrzeugslot!", player, 175, 0, 0 )
							end
						else
							outputChatBox ( "Du kannst keine Klasse Y/X/Z Fahrzeuge weitergeben!", player, 150, 0, 0 )
						end
					else
						outputChatBox ( "Ungültiges Fahrzeug! Verwende: /sellcarto [Name] [Eigener Slot] [Preis]", player, 150, 0, 0 )
					end
				else
					outputChatBox ( "Ungültiger Preis! Verwende: /sellcarto [Name] [Eigener Slot] [Preis]", player, 150, 0, 0 )
				end
			else
				outputChatBox ( "Ungültiger Fahrzeugslot! Verwende: /sellcarto [Name] [Eigener Slot] [Preis]", player, 150, 0, 0 )
			end
		--else
		--	outputChatBox ( "Dieses Fahrzeug wird momentan versteigert!", player, 150, 0, 0 )
		--end
	else
		outputChatBox ( "Verwende: /sellcarto [Name] [Eigener Slot] [Preis]", player, 150, 0, 0 )
	end
end
addCommandHandler ( "sellcarto", sellcarto_func )

function accept_sellcarto ( accepter, cmd)
		local target = accepter
		local pSlot = laGetElementData ( accepter, "carToBuySlot" )
		player = laGetElementData ( accepter, "carToBuyFrom" )
		price = laGetElementData ( accepter, "carToBuyPrice" )
		model = laGetElementData ( accepter, "carToBuyModel" )
		if isElement ( player ) then
			local money = laGetElementData ( target, "bankmoney" )
			local tSlot = getFreeCarSlot ( target )
			if price <= money then
				if tonumber ( pSlot ) and tSlot then
					pSlot = tonumber ( pSlot )
					local pname = getPlayerName ( player )
					if tonumber ( MySQL_GetString("vehicles", "AuktionsID", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..tonumber(pSlot).."'") ) == 0 then
						if laGetElementData ( player, "carslot"..pSlot ) > 0 then
							local veh = _G[getPrivVehString ( pname, pSlot )]
							local vehname = getVehicleName ( veh )
							if isElement ( veh ) then
								if model == getElementModel ( veh ) then
										if laGetElementData ( target, "curcars" ) < laGetElementData ( target, "maxcars" ) then
											local id = MySQL_GetString("vehicles", "ID", "Besitzer LIKE '"..getPlayerName(player).."' AND Slot LIKE '"..tonumber(pSlot).."'")
											outputLog ( "[HANDEL]: "..getPlayerName ( accepter ).." hat von "..getPlayerName ( player ).." das Fahrzeug ( Modell: "..model..", ID: "..id.." ) fuer "..price.."$ gekauft.", "car")
											
											outputChatBox ( "Du hast dein Fahrzeug "..vehname.." in Slot "..pSlot.." verkauft.", player, 0, 150, 0 )
											outputChatBox ( "Käufer: "..getPlayerName ( target )..", Preis: "..price.."$.", player, 0, 150, 0 )
											outputChatBox ( "Du hast das Fahrzeug "..vehname.." in Slot "..tSlot.." erhalten.", target, 0, 150, 0 )
											outputChatBox ( "Verkäufer: "..pname..", Preis: "..price.."$.", target, 0, 150, 0 )
											
											MySQL_SetString("vehicles", "Besitzer", getPlayerName(target), "ID LIKE '"..id.."'")
											MySQL_SetString("vehicles", "Slot", tonumber ( tSlot ), "ID LIKE '"..id.."'")
										
											laSetElementData ( target, "carslot"..tSlot, laGetElementData ( player, "carslot"..pSlot ) )
											laSetElementData ( player, "carslot"..pSlot, 0 )
											laSetElementData ( target, "curcars", laGetElementData ( target, "curcars" ) + 1 )
											laSetElementData ( player, "curcars", laGetElementData ( player, "curcars" ) - 1 )
											laSetElementData ( veh, "lcolor", "|255|255|255|" )
											
											MySQL_SetString("vehicles", "Lights", "|255|255|255|", "ID LIKE '"..id.."'")
											setPrivVehCorrectLightColor ( veh )
											
											laSetElementData ( veh, "owner", getPlayerName ( target ) )
											laSetElementData ( veh, "name", "privVeh"..getPlayerName(target)..tSlot )
											laSetElementData ( veh, "carslotnr_owner", tSlot )
											
											_G[getPrivVehString ( getPlayerName(target), tSlot )] = veh
											_G[getPrivVehString ( pname, pSlot )] = nil
											
											SaveCarData ( player )
											SaveCarData ( target )
											
											laSetElementData ( target, "bankmoney", money - price )
											laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" ) + price )
											
											casinoMoneySave ( target )
											casinoMoneySave ( player )
										else
											infobox ( accepter, "\n\nDu hast keinen freien\nFahrzeugslot mehr!", 5000, 125, 0, 0 )
										end
								else
									infobox ( accepter, "\n\nFehler.\nLass dir das Angebot erneut machen!", 5000, 125, 0, 0 )
								end
							else
								infobox ( accepter, "\n\nFehler.\nLass dir das Angebot erneut machen!", 5000, 125, 0, 0 )
							end
						else
							infobox ( accepter, "\n\nDer Verkäufer besitzt\ndas Fahrzeug nicht mehr!", 5000, 125, 0, 0 )
						end
					end
				else
					infobox ( accepter, "\n\nFehler.\nLass dir das Angebot erneut machen!", 5000, 125, 0, 0 )
				end
			else
				infobox ( accepter, "\n\nDu hast nicht genügend\nGeld auf der Bank!", 5000, 125, 0, 0 )
			end
		else
			infobox ( accepter, "\n\nDer Verkäufer ist offline!", 5000, 125, 0, 0 )
		end
end
addCommandHandler ( "buycar", accept_sellcarto )

function getPrivVehString ( pname, carslot )

	return string.lower ( "privVeh"..pname..carslot )
end

function pimpVeh ( veh, tuning )

	for i = 0, 16 do
		local x = i + 1
		_G["tunepart"..i] = tonumber(gettok ( tuning, x, string.byte('|') ))
	end
	for i = 0, 16 do
		if _G["tunepart"..i] > 0 then
			addVehicleUpgrade ( veh, _G["tunepart"..i] )
		end
	end
	specPimpVeh ( veh )
end



--[[
function handbremse ( player )
	local vehicle = getPedOccupiedVehicle ( player )
	if vehicle then
		local sitz = getPedOccupiedVehicleSeat ( player )
		if sitz == 0 then
			local vx, vy, vz = getElementVelocity ( getPedOccupiedVehicle ( player ) )
			local speed = math.sqrt ( vx ^ 2 + vy ^ 2 + vz ^ 2 )
			local kmh = speed * 180
			if kmh > 20 then
				return
			end
			if laGetElementData ( vehicle, "owner" ) then
				if (laGetElementData ( vehicle, "owner" ) == getPlayerName ( player )) or isSupporter(player) then
					if isElementFrozen ( vehicle ) then
						setElementFrozen ( vehicle, false )
						outputChatBox ( "Du hast die Handbremse gelöst!", player, 225, 225, 0 )
					else
						setElementFrozen ( vehicle, true )
						outputChatBox ( "Du hast die Handbremse angezogen!", player, 225, 225, 0 )
					end
				end
			else
				outputChatBox ( "Du sitzt nicht in einem Privatfahrzeug!", player, 150, 0, 0 )
			end
		end
	end
end
addCommandHandler ( "bremse", handbremse )]]