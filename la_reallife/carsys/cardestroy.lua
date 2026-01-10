------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

function setVehicleToTotalschaden(theVehicle)
        if(isElement(theVehicle)) and (laGetElementData(theVehicle, "owner")) then
			local Besitzer = laGetElementData (theVehicle, "owner")
			local Slot = laGetElementData ( theVehicle, "carslotnr_owner" )
            setElementHealth(theVehicle, 300)
            setVehicleDamageProof(theVehicle, true)
			setVehicleEngineState ( theVehicle, false )
			laSetElementData ( theVehicle, "engine", false )
			laSetElementData(theVehicle, "zerstoert", 1)
			MySQL_SetString("vehicles", "Zerstoert", 1, "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' ")
			local Totalschaeden = tonumber(MySQL_GetString("vehicles", "Totalschaden", "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' "))
			MySQL_SetString("vehicles", "Totalschaden", tonumber(Totalschaeden)+1, "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' ")
			laSetElementData ( theVehicle, "totalschaeden", (laGetElementData ( theVehicle, "totalschaeden") +1))
                -- MYSQL SETTINGS MIT DEM HASTENICHTGESEHEN   
			local id = MySQL_GetString("vehicles", "ID", "Besitzer LIKE '"..Besitzer.."' AND Slot LIKE '"..tonumber(Slot).."'")
			outputLog ( "[SCHADEN]: Das Fahrzeug ( Modell: "..getElementModel(theVehicle)..", ID: "..id.." ) von "..Besitzer.." hat einen Totalschaden!", "car" )				
        end
end
 
function removeVehicleTotalschaden(theVehicle)
        if(isElement(theVehicle)) and (laGetElementData(theVehicle, "owner")) then
			local Besitzer = laGetElementData (theVehicle, "owner")
			local Slot = laGetElementData ( theVehicle, "carslotnr_owner" )
            setElementHealth(theVehicle, 1000)
            setVehicleDamageProof(theVehicle, false)
			laSetElementData (theVehicle, "isNotRespawnable", false)
			laSetElementData(theVehicle, "zerstoert", 0)
			MySQL_SetString("vehicles", "Zerstoert", 0, "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' ")
                -- MYSQL SETTINGS MIT DEM HASTENICHTGESEHEN
                -- ANZAHL TOTALSCHADEN +1
			local id = MySQL_GetString("vehicles", "ID", "Besitzer LIKE '"..Besitzer.."' AND Slot LIKE '"..tonumber(Slot).."'")
			outputLog ( "[SCHADEN]: Der Totalschaden des Fahrzeugs ( Modell: "..getElementModel(theVehicle)..", ID: "..id.." ) von "..Besitzer.." wurde repariert!", "car" )		
        end
end
 

	
addEventHandler("onVehicleDamage", getRootElement(), function(loss)
local player = getVehicleOccupant(source)
	if not getVehicleOccupant ( source, 0 ) then
		setElementHealth ( source, getElementHealth ( source ) + loss )
		--setVehicleDamageProof(source, true)
	else
		local pname = getPlayerName(player)
        local health = getElementHealth(source)
		local Besitzer = laGetElementData (source, "owner")
        if(health < 300) and (isVehicleDamageProof(source) == false) then
			if Besitzer then
				if Besitzer == pname then
					local Slot = laGetElementData (source, "carslotnr_owner" )
					local Totalschaeden = tonumber(MySQL_GetString("vehicles", "Totalschaden", "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' "))
					laSetElementData (source, "isNotRespawnable", true)
					--SICHERHEITSHINWEIS--
					--if (tonumber(Totalschaeden) < 5) then
						setVehicleToTotalschaden(source)
						setVehicleEngineState ( source, false )
						laSetElementData ( source, "engine", false )
						if getPlayerFromName(pname) then
							outputChatBox("Dein Fahrzeug hat einen Totalschaden! Du musst es erst von einem Mechaniker reparieren lassen.", player, 255, 0, 0)
							outputChatBox("Verwende /mechaniker um einen Mechaniker zu rufen.", player, 200, 0, 0)
							local veh = source
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
							local Spawnpos_X, Spawnpos_Y, Spawnpos_Z = getElementPosition ( veh )
							local Spawnrot_X, Spawnrot_Y, Spawnrot_Z = getVehicleRotation ( veh )
							local c1, c2, c3, c11, c12, c13, c21, c22, c23, c31, c32, c33 = getVehicleColor ( veh, true )
							local color = "|"..c1.."|"..c2.."|"..c3.."|"..c11.."|"..c12.."|"..c13.."|"..c21.."|"..c22.."|"..c23.."|"..c31.."|"..c32.."|"..c33.."|"
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
						end
					--end
				else
					if getVehicleEngineState(source) then
						if getPlayerFromName(Besitzer) then
							local Slot = laGetElementData (source, "carslotnr_owner" )
							local Totalschaeden = tonumber(MySQL_GetString("vehicles", "Totalschaden", "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' "))
							laSetElementData (source, "isNotRespawnable", true)
							--SICHERHEITSHINWEIS--
							--if (tonumber(Totalschaeden) < 5) then
								setVehicleToTotalschaden(source)
								setVehicleEngineState ( source, false )
								laSetElementData ( source, "engine", false )
								if getPlayerFromName(pname) then
									outputChatBox("Das Fahrzeug hat einen Totalschaden! Du musst es erst von einem Mechaniker reparieren lassen.", player, 255, 0, 0)
									outputChatBox("Verwende /mechaniker um einen Mechaniker zu rufen.", player, 200, 0, 0)
								end
									local veh = source
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
									local Spawnpos_X, Spawnpos_Y, Spawnpos_Z = getElementPosition ( veh )
									local Spawnrot_X, Spawnrot_Y, Spawnrot_Z = getVehicleRotation ( veh )
									local c1, c2, c3, c11, c12, c13, c21, c22, c23, c31, c32, c33 = getVehicleColor ( veh, true )
									local color = "|"..c1.."|"..c2.."|"..c3.."|"..c11.."|"..c12.."|"..c13.."|"..c21.."|"..c22.."|"..c23.."|"..c31.."|"..c32.."|"..c33.."|"
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
							--end
						else
							setVehicleEngineState ( source, false )
							laSetElementData ( source, "engine", false )
						end
					else
						setElementHealth ( source, getElementHealth ( source ) + loss )
					end
				end
			end
		end
	end
end)
 
function privVehExplode ()
                destroyMagnet ( source )
                if not laGetElementData ( source, "owner" ) then       
                else
					local Besitzer = laGetElementData (source, "owner")
					local Slot = laGetElementData ( source, "carslotnr_owner" )
					local Totalschaeden = MySQL_GetString("vehicles", "Totalschaden", "Besitzer LIKE '" ..Besitzer.."' AND Slot LIKE '" ..tonumber(Slot).. "' ")
					--if (tonumber(Totalschaeden) > 5) then
                        local owner = getPlayerFromName ( Besitzer )
                        if owner then
                                local x1, y1, z1 = getElementPosition ( owner )
                                local x2, y2, z2 = getElementPosition ( source )
                                if laGetElementData ( owner, "loggedin" ) == 1 and getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 7.5 then
										local id = MySQL_GetString("vehicles", "ID", "Besitzer LIKE '"..Besitzer.."' AND Slot LIKE '"..tonumber(Slot).."'")
										outputLog ( "[ENTFERNT]: Das Fahrzeug ( Modell: "..getElementModel(source)..", ID: "..id.." ) von "..Besitzer.." ist explodiert!", "car" )		
                                        laSetElementData ( owner, "carslot"..laGetElementData(source, "carslotnr_owner" ), 0 )
                                        laSetElementData ( owner, "curcars", laGetElementData ( owner, "curcars" )-1 )
                                        if tonumber(laGetElementData ( source, "special" )) ~= 2 then outputChatBox ( "Dein/e "..getVehicleNameFromModel(getElementModel(source)).." in Slot "..laGetElementData(source, "carslotnr_owner" ).." wurde zerstört!", owner, 200, 0, 0 ) end
                                        MySQL_DelRow("vehicles", "Besitzer LIKE '"..Besitzer.."' AND Slot LIKE '"..laGetElementData(source, "carslotnr_owner" ).."'")
                                        SaveCarData ( owner )
                                end
                                if tonumber(laGetElementData ( source, "special" )) == 2 then
                                        laSetElementData ( owner, "yachtImBesitz", false )
                                        laSetElementData ( owner, "spawnpos_x", -1971.466796875 )
                                        laSetElementData ( owner, "spawnpos_y", 137.821890625 )
                                        laSetElementData ( owner, "spawnpos_z", 27.6875 )
                                        laSetElementData ( owner, "spawnrot_x", 90 )
                                        laSetElementData ( owner, "spawnint", 0 )
                                        laSetElementData ( owner, "spawndim", 0 )
                                        outputChatBox ( "Deine Yacht in Slot "..laGetElementData ( source, "carslotnr_owner" ).." wurde zerstört! Du spawnst wieder auf der Strasse!", owner, 200, 0, 0 )
                                        SaveCarData ( owner )
                                end
                        end
                        local car = source
                        setTimer(function() destroyElement ( car ) end, 1000, 1)
					--[[else
						setVehicleEngineState ( source, false )
						laSetElementData ( source, "engine", false )
						local x, y, z = getElementPosition(source)
						local x2, y2, z2 = getElementRotation(source)
						respawnVehicle(source)
						setElementPosition(source, x, y, z)
						setElementRotation(source, x2, y2, z2)
					end]]
					
                end
                setTimer ( killRests, 3000, 1, source )
end
addEventHandler ( "onVehicleExplode", getRootElement(), privVehExplode )
 
function killRests ( veh )
 
        setElementPosition ( veh, 999999, 999999, -50 )
end
 
function armoredRespawn ()
 
        if source == FederalSWATTank or source == MafiaStretch or source == TriadPony or AztecasPony1 then
                setElementHealth ( source, 5000 )
        elseif getElementModel ( source ) == 432 then
                setElementHealth ( source, 8000 )
        end
end
addEventHandler ( "onVehicleRespawn", getRootElement(), armoredRespawn )