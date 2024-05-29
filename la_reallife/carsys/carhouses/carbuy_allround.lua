function carbuy ( player, carprice, vehid, spawnx, spawny, spawnz, rx, ry, rz, c1, c2, c3, c4, p, ec, Tuning )

	carprice = MySQL_Save ( carprice )
	vehid = MySQL_Save ( vehid )
	spawnx = MySQL_Save ( spawnx )
	spawny = MySQL_Save ( spawny )
	spawnz = MySQL_Save ( spawnz )
	rx = MySQL_Save ( rx )
	ry = MySQL_Save ( ry )
	rz = MySQL_Save ( rz )
	vehid = tonumber ( vehid )
	local pname = getPlayerName ( player )
	local differenz
	
	if not carprices[vehid] then
		--if aiCarPrices[vehid] then
			table.insert ( carprices, vehid, carprice )
		--end
	end
	hasCamper = false
	local id
	for i = 1, 10 do
		id = tonumber ( MySQL_GetString ( "vehicles", "Typ", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..i.."'" ) )
		if id then
			if camper[id] then
				hasCamper = true
				break
			end
		end
	end
	if camper[vehid] and hasCamper then
		outputChatBox ( "Du kannst nur einen Wohnwagen haben!", player, 125, 0, 0 )
	else
		if carprices[vehid] then
			if laGetElementData ( player, "maxcars" ) > laGetElementData ( player, "curcars" ) then
				local i = true
				laSetElementData ( player, "carbuyslot", 0 )
				carslotnr = 1
				sucesfull = false
				for i = 1, tonumber(laGetElementData ( player, "maxcars" )) do
					carslotzahl = "carslot"..carslotnr
					if tonumber(laGetElementData ( player, carslotzahl )) == 0 then
						laSetElementData ( player, "carbuyslot", carslotnr )
						sucesfull = true
						break
					else
						y = carslotnr
						carslotnr = ( y + 1 )
					end
				end
				if not sucesfull then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast bereits zu viele Fahrzeuge, verkaufe eines deiner alten Fahrzeuge!", 5000, 255, 0, 0 )
				else
					if carprices[tonumber(vehid)] then
						carprice = carprices[tonumber(vehid)]
					end
					if ec then
						differenz = laGetElementData ( player, "bankmoney" ) - carprice
					else
						differenz = laGetElementData ( player, "money" ) - carprice
					end
					local Autokaufkasse = tonumber ( MySQL_GetString("staat", "Menge", "Name LIKE 'Autokauf'") )
					local Autokaufkassenew = math.floor(Autokaufkasse + carprice)
					MySQL_SetString("staat", "Menge", Autokaufkassenew, "Name LIKE 'Autokauf'")
					if differenz >= 0 then
						if hasPlayerLicense ( player, tonumber(vehid) ) then
							setElementDimension ( player, 0 )
							setElementInterior ( player, 0 )
							fadeCamera( player, true)
							setCameraTarget( player, player )
							
							local x = pname
							local y = laGetElementData ( player, "carbuyslot" )
							xy = x..y
							
							spawnX = spawnx
							spawnY = spawny
							spawnZ = spawnz
							
							_G[getPrivVehString ( x, y )] = createVehicle ( vehid, spawnX, spawnY, spawnZ, 0, 0, 0, pname )
							laSetElementData ( _G[getPrivVehString ( x, y )], "owner", pname )
							laSetElementData ( _G[getPrivVehString ( x, y )], "name", "privVeh"..x..y )
							laSetElementData ( _G[getPrivVehString ( x, y )], "carslotnr_owner", y )
							laSetElementData ( _G[getPrivVehString ( x, y )], "locked", true )
							laSetElementData ( _G[getPrivVehString ( x, y )], "fuelstate", 100 )
							laSetElementData ( _G[getPrivVehString ( x, y )], "totalschaeden", 0 )	
							
							setVehicleLocked ( _G[getPrivVehString ( x, y )], true )
							local z = laGetElementData ( player, "carbuyslot" )
							laSetElementData ( player, "carslot"..z, 1 )
							laSetElementData ( player, "curcars", laGetElementData ( player, "curcars" )+1 )
							
							local Besitzer = laGetElementData ( _G[getPrivVehString ( x, y )], "owner" )
							if not Tuning then
								Tuning = "|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|"
							end
							local Spawnpos_X, Spawnpos_Y, Spawnpos_Z = getElementPosition ( _G[getPrivVehString ( x, y )] )
							local Slot = tonumber(laGetElementData ( _G[getPrivVehString ( x, y )], "carslotnr_owner" ))
							setVehicleRotation ( _G[getPrivVehString ( x, y )], rx, ry, rz )
							local Spawnrot_X, Spawnrot_Y, Spawnrot_Z = getVehicleRotation ( _G[getPrivVehString ( x, y )] )
							
							local Farbe1, Farbe2, Farbe3, Farbe11, Farbe12, Farbe13, Farbe21, Farbe22, Farbe23, Farbe31, Farbe32, Farbe33
							local Paintjob
							
							if not c1 or not c2 or not c3 or not c4 then
								Farbe1, Farbe2, Farbe3, Farbe11, Farbe12, Farbe13, Farbe21, Farbe22, Farbe23, Farbe31, Farbe32, Farbe33 = getVehicleColor ( _G[getPrivVehString ( x, y )], true )
							else
								--Farbe1, Farbe2, Farbe3, Farbe4 = c1, c2, c3, c4
								Farbe1, Farbe2, Farbe3, Farbe11, Farbe12, Farbe13, Farbe21, Farbe22, Farbe23, Farbe31, Farbe32, Farbe33 = getVehicleColor ( _G[getPrivVehString ( x, y )], true )
								--setVehicleColor ( _G[getPrivVehString ( x, y )], c1, c2, c3, c4 )
							end
							if not p then
								Paintjob = getVehiclePaintjob ( _G[getPrivVehString ( x, y )] )
							else
								Paintjob = p
								setVehiclePaintjob ( _G[getPrivVehString ( x, y )], p )
							end
							local Benzin = laGetElementData ( _G[getPrivVehString ( x, y )], "fuelstate" )
							laSetElementData ( _G[getPrivVehString ( x, y )], "stuning", "0|0|0|0|0|0|" )
							
							local color = "|"..Farbe1.."|"..Farbe2.."|"..Farbe3.."|"..Farbe11.."|"..Farbe12.."|"..Farbe13.."|"..Farbe21.."|"..Farbe22.."|"..Farbe23.."|"..Farbe31.."|"..Farbe32.."|"..Farbe33.."|"
							laSetElementData ( _G[getPrivVehString ( x, y )], "color", color )
							laSetElementData ( _G[getPrivVehString ( x, y )], "lcolor", "|255|255|255|" )
							setPrivVehCorrectLightColor2 ( _G[getPrivVehString ( x, y )] )
							
							specPimpVeh ( _G[getPrivVehString ( x, y )] )
							SaveCarData ( player )
							if getElementData ( player, "sprache" ) == "Deutsch" then
								outputChatBox ( "Glückwunsch, du hast das Fahrzeug gekauft! Tippe /fahrzeughilfe für mehr Infomationen oder rufe das Hilfemenü auf!", player, 0, 255, 0 )
							else
								outputChatBox ( "Congratulations, you've bought the car! Type /fahrzeughilfe for more infomation or look at the Help menu!", player, 0, 255, 0 )
							end
							checkCarWahnAchiev( player )
							
							if ec then
								laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" ) - carprice )
								triggerClientEvent ( player, "createNewStatementEntry", player, "Fahrzeugkauf\n", carprice * -1, getVehicleNameFromModel ( vehid ).."\n" )
							else
								laSetElementData ( player, "money", laGetElementData ( player, "money" ) - carprice )
								takePlayerMoney ( player, carprice )
								triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							end
							warpPedIntoVehicle ( player, _G[getPrivVehString ( x, y )], 0 )
							
							if getElementData ( player, "sprache" ) == "Deutsch" then
								outputChatBox ( "[WICHTIG]: Fahre an einen ANDEREN Ort und tippe /parken ein, um dein Fahrzeug dort zu parken!", player, 125, 125, 0 )
								outputChatBox ( "Du kannst es dort mit /respawnen [Slot] respawnen, dies ist 1x pro Tag kostenlos und sonst 200$.", player, 125, 125, 0 )
							else
								outputChatBox ( "IMPORTANT: Drive at a DIFFERENT location and type /park to park your car there", player, 125, 0, 0 )
								outputChatBox ( "You can respawn it with /respawnen [slot] - otherwise it will be deleted!", player, 125, 0, 0 )
							end
							

							local result = mysql_query(handler, "INSERT INTO vehicles (Besitzer, Typ, Tuning, Spawnpos_X, Spawnpos_Y, Spawnpos_Z, Spawnrot_X, Spawnrot_Y, Spawnrot_Z, Farbe, Paintjob, Benzin, Slot) VALUES ('"..Besitzer.."', "..vehid..", '"..Tuning.."', '"..Spawnpos_X.."', '"..Spawnpos_Y.."', '"..Spawnpos_Z.."', '"..Spawnrot_X.."', '"..Spawnrot_Y.."', '"..Spawnrot_Z.."', '"..color.."', '"..Paintjob.."', '"..Benzin.."', '"..Slot.."')")
							local id = MySQL_GetString("vehicles", "ID", "Besitzer LIKE '"..pname.."' AND Slot LIKE '"..tonumber(Slot).."'")
							outputLog ( "[HANDEL]: "..pname.." hat ein Fahrzeug ( Modell: "..vehid..", ID: "..id..") für "..carprice.."$ gekauft!", "car")
							if ( not result ) then
								--outputDebugString("Error executing the query: (" .. mysql_errno(handler) .. ") " .. mysql_error(handler))
								outputLog ( "Error executing the query: ("		.. mysql_errno(handler) .. ") " .. mysql_error(handler), "mysql" )
								destroyElement ( _G[getPrivVehString ( x, y )] )
							else
								mysql_free_result(result)
							end
							return true
						else
							if getElementData ( player, "sprache" ) == "Deutsch" then
								outputChatBox ( "Du hast nicht die erforderlichen Scheine / Boni!", player, 125, 0, 0 )
							else
								outputChatBox ( "You do not have the required certificates / bonus!", player, 125, 0, 0 )
							end
						end
					else
						if getElementData ( player, "sprache" ) == "Deutsch" then
							triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast nicht genug Geld!\nDas Fahrzeug kostet\n"..carprice.."$!", 5000, 125, 0, 0 )
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "You have not got enough money!\nThe vehicle costs "..carprice.."$!", 5000, 125, 0, 0 )
						end
					end
				end
			else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast keinen freien Fahrzeugslot!\nTippe /sellcar, um eines deiner\nFahrzeuge zu verkaufen.", 5000, 125, 0, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "You do not have a free slot car!\nType sellcar,to sell one\nof your vehicles.", 5000, 125, 0, 0 )
				end
			end
		end
	end
	return false
end

function setPrivVehCorrectLightColor2 ( veh )

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

function getFreeCarSlot ( player )

	if laGetElementData ( player, "maxcars" ) > laGetElementData ( player, "curcars" ) then
		local cars = 0
		for i = 1, 10 do
			if laGetElementData ( player, "carslot"..i ) == 0 then
				return i
			end
		end
	else
		return false
	end
end