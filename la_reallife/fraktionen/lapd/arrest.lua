lvJailArea = createColCuboid ( 2278.166015625, 2424.8486328125, 3.0, 6.799804685, 10.05, 4.08400478363 )

function isInLVJailArea ( player )

	local x1, y1, z1 = getElementPosition ( player )
	if getDistanceBetweenPoints3D ( x1, y1, z1, 198.08735656738, 174.32916259766, 1002.672668457 ) < 10 then
		return true
	else
		return false
	end
end

function isInLSJailArea ( player )

	local x1, y1, z1 = getElementPosition ( player )
	if getDistanceBetweenPoints3D ( x1, y1, z1, 270, 80, 1002 ) < 10 then
		return true
	else
		return false
	end
end

function isInLSCarArea ( player )

	local x1, y1, z1 = getElementPosition ( player )
	if getDistanceBetweenPoints3D ( x1, y1, z1, 1568, -1693, 5 ) < 10 then
		return true
	else
		return false
	end
end

function arrest_func ( player, cmd, target )
	
	if target ~= nil then
		local target = getPlayerFromName(target)
		local x, y, z = getElementPosition ( player )
		local tx, ty, tz = getElementPosition ( target )
		local x2, y2, z2 = 222.224, 120.993, 999.04
		local wanteds = laGetElementData ( target, "wanteds" )
		local strafe = wanteds * wanteds * arreststrafe
		local bail = wanteds * wanteds * arrestkaution2
		local time = math.floor((wanteds * arrestzeit)/4*3)
		if isOnDuty ( player ) or isArmy(player) then
			local bool = isInLVJailArea ( player )
			if isInLVJailArea ( target ) and bool then
				bool = true
			else
				bool = false
			end
			local bool2 = isInLSJailArea ( player )
			if isInLSJailArea ( target ) and bool2 then
				bool2 = true
			else
				bool2 = false
			end
			if (getDistanceBetweenPoints3D ( x, y, z, x2, y2, z2 ) < 10) or bool or bool2 then
				if (getDistanceBetweenPoints3D ( tx, ty, tz, x2, y2, z2 ) < 10) or bool or bool2 then
					if wanteds >= 1 then
						if (laGetElementData ( target, "jailtime" ) == 0) or (laGetElementData ( player, "adminlvl" ) >= 2) then
							if strafe > laGetElementData ( target, "money" ) then		
								takePlayerMoney ( target, laGetElementData ( target, "money" ) )
								triggerClientEvent ( target, "HudEinblendenMoney", getRootElement()	)
								laSetElementData ( target, "money", 0 )
							else
								laSetElementData ( target, "money", tonumber(laGetElementData ( target, "money" )) - strafe )
								takePlayerMoney ( target, strafe )
								triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
							end
							laSetElementData ( target, "jailtime", time )
							--laSetElementData ( player, "boni", laGetElementData ( player, "boni" ) + wanteds * (wantedprice * 2) )
							fadeCamera ( target, false, 0.5, 0, 0, 0 )
							setTimer ( shortaway_func, 5000, 1, target)
								laSetElementData ( target, "bail", bail )
								if getTeamName(getPlayerTeam(target)) == "Terror" then
								outputChatBox ( "Du wurdest von Staatsbeamten "..getPlayerName(player).." mit "..bail.."$ Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", target, 125, 0, 0 )
								outputChatBox ( "Du hast einen Terrorist mit "..bail.."$ Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", player, 0, 125, 0 )
								else
								outputChatBox ( "Du wurdest von Staatsbeamten "..getPlayerName(player).." mit "..bail.."$ Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", target, 125, 0, 0 )
								outputChatBox ( "Du hast den Spieler "..getPlayerName(target).." mit "..bail.."$ Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", player, 0, 125, 0 )
								end
								outputChatBox ( "Du kriegst beim nächsten Lohn "..wanteds*(wantedkill/12).."$ Bonus!", player, 0, 150, 0 )
								laSetElementData ( player, "boni", laGetElementData ( player, "boni" )+wanteds*(wantedkill/12) )
							outputChatBox ( "Verwende /knastzeit um zu sehen, wie lange du noch hinter Gittern bist!", target, 0, 0, 250 )
							if isCop (player) then
								local msg = ""..getPlayerName(target).." wurde von Polizist "..getPlayerName(player).." eingesperrt!"
								sendMSGForFaction 		( msg, 1, 0, 50, 0)
								sendMSGForFaction 		( msg, 6, 0, 50, 0)
								sendMSGForFaction 		( msg, 8, 0, 50, 0)
							elseif isFBI (player) then
								local msg = ""..getPlayerName(target).." wurde von Agent "..getPlayerName(player).." eingesperrt!"
								sendMSGForFaction 		( msg, 1, 0, 50, 0)
								sendMSGForFaction 		( msg, 6, 0, 50, 0)
								sendMSGForFaction 		( msg, 8, 0, 50, 0)
							elseif isArmy (player) then
								local msg = ""..getPlayerName(target).." wurde von Soldat "..getPlayerName(player).." eingesperrt!"
								sendMSGForFaction 		( msg, 1, 0, 50, 0)
								sendMSGForFaction 		( msg, 6, 0, 50, 0)
								sendMSGForFaction 		( msg, 8, 0, 50, 0)
							end
							outputLog( "[ARREST]: "..getPlayerName(player).." hat "..getPlayerName(target).." eingesperrt! (Kaution: "..bail.."$, Strafe: "..strafe..", Dauer "..time..")", "pd")
							takeAllWeapons ( target )
							laSetElementData ( target, "weed", 0 )
							laSetElementData ( target, "koks", 0 )
							laSetElementData ( target, "mats", 0 )
							laSetElementData ( target, "wanteds", 0 )

							setPlayerWantedLevel ( target, 0 )
							toggleControl ( target, "fire", false )
		
							if bool then
								local x, y, z, r, int = getRandomCellKoordinates ( false )
								setElementPosition ( target, x, y, z )
								setElementInterior ( target, int )
								setPedRotation ( target, r )
								setElementData ( target, "jail", "lv" )
							elseif bool2 then
								setElementData ( target, "jail", "ls" )
								local rnd = math.floor(math.random ( 1, 4 ))
								if rnd == 1 then
									setElementPosition ( target, 263.83, 77.82, 1001 )
								elseif rnd == 2 then
									setElementPosition ( target, 264.76, 78.76, 1001 )
								elseif rnd == 3 then
									setElementPosition ( target, 264.21, 76.48, 1001 )
								else
									setElementPosition ( target, 263.25, 78.71, 1001 )
								end
							else
								setElementData ( target, "jail", "sf" )
								local rnd = math.floor(math.random ( 1, 4 ))
								if rnd == 1 then
									setElementPosition ( target, 215.61360168457, 110.61786651611, 998.66485595703 )
								elseif rnd == 2 then
									setElementPosition ( target, 219.60717773438, 110.39416503906, 998.66485595703 )
								elseif rnd == 3 then
									setElementPosition ( target, 223.60034179688, 110.17053222656, 998.66485595703 )
								else
									setElementPosition ( target, 227.34938049316, 110.19967651367, 998.66485595703 )
								end
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Verbrecher sitzt bereits!\nUm auszuknasten, verwende /ausknasten.", 5000, 125, 0, 0 )						
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer User hat kein Verbrechen begangen!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerbrecher ist nicht im Büro!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht im Büro!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Beamter im Dienst!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGebrauch: /arrest [Name]", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "arrest", arrest_func )

function carrest_func ( player, cmd, target )

	if target ~= nil then
		local target = getPlayerFromName(target)
		local x, y, z = getElementPosition ( player )
		local tx, ty, tz = getElementPosition ( target )
		local wanteds = laGetElementData ( target, "wanteds" )
		local strafe = wanteds * wanteds * carreststrafe
		local bail = carrestkaution
		local time = math.floor((wanteds * carrestzeit)/4*3)
		if isOnDuty ( player ) or isArmy(player) then
			local bool = ( isElementWithinColShape ( player, lvJailArea ) and isElementWithinColShape ( target, lvJailArea ) )
			local bool2 = isInLSCarArea ( player ) and isInLSCarArea ( target )
			if getDistanceBetweenPoints3D ( -1590, 716, 0, x, y, 0 ) < 6.5 or bool or bool2 then
				if getDistanceBetweenPoints3D ( -1590, 716, 0, tx, ty, 0 ) < 6.5 or bool or bool2 then
					if wanteds >= 1 then
						removePedFromVehicle ( target )
						if strafe > laGetElementData ( target, "money" ) then		
							takePlayerMoney ( target, laGetElementData ( target, "money" ) )
							triggerClientEvent ( target, "HudEinblendenMoney", getRootElement()	)
							laSetElementData ( target, "money", 0 )
						else
							laSetElementData ( target, "money", tonumber(laGetElementData ( target, "money" )) - strafe )
							takePlayerMoney ( target, strafe )
							triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
						end
						laSetElementData ( target, "jailtime", time )
						--laSetElementData ( player, "boni", laGetElementData ( player, "boni" ) + wanteds * wantedprice )
						fadeCamera ( target, false, 0.5, 0, 0, 0 )
						setTimer ( shortaway_func, 5000, 1, target)
						if bail == nil then bail = 0 end
						if bail < 1 then
							laSetElementData ( target, "bail", bail )
							outputChatBox ( "Du hast den Spieler "..getPlayerName(target).." ohne Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", player, 0, 125, 0 )
							outputChatBox ( "Du wurdest von Staatsbeamten "..getPlayerName(player).." ohne Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", target, 125, 0, 0 )
							outputChatBox ( "Du kriegst beim nächsten Lohn "..wanteds*(wantedkill/3).."$ Bonus!", player, 0, 150, 0 )
							laSetElementData ( player, "boni", laGetElementData ( player, "boni" )+wanteds*(wantedkill/3) )
						end
						outputChatBox ( "Verwende /knastzeit um zu sehen, wie lange du noch hinter Gittern bist!", target, 0, 0, 250 )
						if isCop (player) then
							local msg = ""..getPlayerName(target).." wurde von Polizist "..getPlayerName(player).." eingesperrt!"
							sendMSGForFaction 		( msg, 1, 0, 50, 0)
							sendMSGForFaction 		( msg, 6, 0, 50, 0)
							sendMSGForFaction 		( msg, 8, 0, 50, 0)
						elseif isFBI (player) then
							local msg = ""..getPlayerName(target).." wurde von Agent "..getPlayerName(player).." eingesperrt!"
							sendMSGForFaction 		( msg, 1, 0, 50, 0)
							sendMSGForFaction 		( msg, 6, 0, 50, 0)
							sendMSGForFaction 		( msg, 8, 0, 50, 0)
						elseif isArmy (player) then
							local msg = ""..getPlayerName(target).." wurde von Soldat "..getPlayerName(player).." eingesperrt!"
							sendMSGForFaction 		( msg, 1, 0, 50, 0)
							sendMSGForFaction 		( msg, 6, 0, 50, 0)
							sendMSGForFaction 		( msg, 8, 0, 50, 0)
						end
							outputLog( "[CARREST]: "..getPlayerName(player).." hat "..getPlayerName(target).." eingesperrt! (ohne Kaution, Strafe: "..strafe..", Dauer "..time..")", "pd")
							takeAllWeapons ( target )
							laSetElementData ( target, "weed", 0 )
							laSetElementData ( target, "koks", 0 )
							laSetElementData ( target, "mats", 0 )
							laSetElementData ( target, "wanteds", 0 )
							setPlayerWantedLevel ( target, 0 )
							toggleAllControls ( target, true )
							setTimer ( toggleControlsTied, 2000, 1, target )
							setElementData ( target, "tiedsecur", 0)

						if bool then
							local x, y, z, r, int = getRandomCellKoordinates ( false )
							setElementPosition ( target, x, y, z )
							setElementInterior ( target, int )
							setPedRotation ( target, r )
							setElementData ( target, "jail", "lv" )

						elseif bool2 then
							setElementData ( target, "jail", "ls" )
							local rnd = math.floor(math.random ( 1, 4 ))
							if rnd == 1 then
								setElementPosition ( target, 263.83, 77.82, 1001 )
							elseif rnd == 2 then
								setElementPosition ( target, 264.76, 78.76, 1001 )
							elseif rnd == 3 then
								setElementPosition ( target, 264.21, 76.48, 1001 )
							else
								setElementPosition ( target, 263.25, 78.71, 1001 )
							end
							setElementInterior ( target, 6 )
						else
							setElementData ( target, "jail", "sf" )
							local rnd = math.floor(math.random ( 1, 4 ))
							if rnd == 1 then
								setElementPosition ( target, 215.61360168457, 110.61786651611, 998.66485595703 )
							elseif rnd == 2 then
								setElementPosition ( target, 219.60717773438, 110.39416503906, 998.66485595703 )
							elseif rnd == 3 then
								setElementPosition ( target, 223.60034179688, 110.17053222656, 998.66485595703 )
							else
								setElementPosition ( target, 227.34938049316, 110.19967651367, 998.66485595703 )
							end
							setElementInterior ( target, 10 )
						end
						setElementDimension ( target, 0 )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer User hat kein Verbrechen begangen!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerbrecher ist nicht in der Garage!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht in der Garage!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Beamter im Dienst!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGebrauch: /carrest [Name]", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "carrest", carrest_func )

function einknasten_func ( player, cmd, target )
	
	if target ~= nil then
		local target = getPlayerFromName(target)
		local x, y, z = getElementPosition ( player )
		local tx, ty, tz = getElementPosition ( target )
		local wanteds = laGetElementData ( target, "wanteds" )
		local strafe = wanteds * wanteds * carreststrafe
		local bail = carrestkaution
		local time = math.floor((wanteds * carrestzeit)/4*3)
		if isOnDuty ( player ) or isArmy(player) then
			if (getDistanceBetweenPoints3D ( x, y, z, tx, ty, tz ) < 10) then
				if isPedDead(target) then
					if wanteds >= 1 then
						if (laGetElementData ( target, "jailtime" ) == 0) or (laGetElementData ( player, "adminlvl" ) >= 2) then
							if strafe > laGetElementData ( target, "money" ) then		
								takePlayerMoney ( target, laGetElementData ( target, "money" ) )
								triggerClientEvent ( target, "HudEinblendenMoney", getRootElement()	)
								laSetElementData ( target, "money", 0 )
							else
								laSetElementData ( target, "money", tonumber(laGetElementData ( target, "money" )) - strafe )
								takePlayerMoney ( target, strafe )
								triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
							end
							laSetElementData ( target, "jailtime", time )
							--laSetElementData ( player, "boni", laGetElementData ( player, "boni" ) + wanteds * (wantedprice * 2) )
							fadeCamera ( target, false, 0.5, 0, 0, 0 )
							setTimer ( shortaway_func, 5000, 1, target)
							if bail == nil then bail = 0 end
							if bail < 1 then
								laSetElementData ( target, "bail", bail )
								if getTeamName(getPlayerTeam(target)) == "Terror" then
								outputChatBox ( "Du hast einen Terrorist ohne Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", player, 0, 125, 0 )
								outputChatBox ( "Du wurdest von Staatsbeamten "..getPlayerName(player).." ohne Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", target, 125, 0, 0 )
								else
								outputChatBox ( "Du hast den Spieler "..getPlayerName(target).." ohne Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", player, 0, 125, 0 )
								outputChatBox ( "Du kriegst beim nächsten Lohn "..wanteds*(wantedkill/7.5).."$ Bonus!", player, 0, 150, 0 )
								laSetElementData ( player, "boni", laGetElementData ( player, "boni" )+wanteds*(wantedkill/7.5) )
								outputChatBox ( "Du wurdest von Staatsbeamten "..getPlayerName(player).." ohne Kaution für "..strafe.."$ und "..time.." Minuten eingesperrt!", target, 125, 0, 0 )
								end
							end
							outputChatBox ( "Verwende /knastzeit um zu sehen, wie lange du noch hinter Gittern bist!", target, 0, 0, 250 )
							if isCop (player) then
								local msg = ""..getPlayerName(target).." wurde von Polizist "..getPlayerName(player).." eingesperrt!"
								sendMSGForFaction 		( msg, 1, 0, 50, 0)
								sendMSGForFaction 		( msg, 6, 0, 50, 0)
								sendMSGForFaction 		( msg, 8, 0, 50, 0)
							elseif isFBI (player) then
								local msg = ""..getPlayerName(target).." wurde von Agent "..getPlayerName(player).." eingesperrt!"
								sendMSGForFaction 		( msg, 1, 0, 50, 0)
								sendMSGForFaction 		( msg, 6, 0, 50, 0)
								sendMSGForFaction 		( msg, 8, 0, 50, 0)
							elseif isArmy (player) then
								local msg = ""..getPlayerName(target).." wurde von Soldat "..getPlayerName(player).." eingesperrt!"
								sendMSGForFaction 		( msg, 1, 0, 50, 0)
								sendMSGForFaction 		( msg, 6, 0, 50, 0)
								sendMSGForFaction 		( msg, 8, 0, 50, 0)
							end
							outputLog( "[EINKNASTEN]: "..getPlayerName(player).." hat "..getPlayerName(target).." eingesperrt! (ohne Kaution, Strafe: "..strafe..", Dauer "..time..")", "pd")
							takeAllWeapons ( target )
							laSetElementData ( target, "weed", 0 )
							laSetElementData ( target, "koks", 0 )
							laSetElementData ( target, "mats", 0 )
							laSetElementData ( target, "wanteds", 0 )

							setPlayerWantedLevel ( target, 0 )
							toggleControl ( target, "fire", false )
		
							if bool then
								local x, y, z, r, int = getRandomCellKoordinates ( false )
								setElementPosition ( target, x, y, z )
								setElementInterior ( target, int )
								setPedRotation ( target, r )
								setElementData ( target, "jail", "lv" )
							elseif bool2 then
								setElementData ( target, "jail", "ls" )
								local rnd = math.floor(math.random ( 1, 4 ))
								if rnd == 1 then
									setElementPosition ( target, 263.83, 77.82, 1001 )
								elseif rnd == 2 then
									setElementPosition ( target, 264.76, 78.76, 1001 )
								elseif rnd == 3 then
									setElementPosition ( target, 264.21, 76.48, 1001 )
								else
									setElementPosition ( target, 263.25, 78.71, 1001 )
								end
							else
								setElementData ( target, "jail", "sf" )
								local rnd = math.floor(math.random ( 1, 4 ))
								if rnd == 1 then
									setElementPosition ( target, 215.61360168457, 110.61786651611, 998.66485595703 )
								elseif rnd == 2 then
									setElementPosition ( target, 219.60717773438, 110.39416503906, 998.66485595703 )
								elseif rnd == 3 then
									setElementPosition ( target, 223.60034179688, 110.17053222656, 998.66485595703 )
								else
									setElementPosition ( target, 227.34938049316, 110.19967651367, 998.66485595703 )
								end
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Verbrecher sitzt bereits!\nUm auszuknasten, verwende /ausknasten.", 5000, 125, 0, 0 )						
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer User hat kein Verbrechen begangen!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerbrecher ist nicht tot!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Verbrecher ist nicht\nin der Nähe!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Beamter im Dienst!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGebrauch: /einknasten [Name]", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "einknasten", einknasten_func )

function ausknasten_func ( player, cmd, target )
	
	if target ~= nil then
		local target = getPlayerFromName(target)
		local x, y, z = getElementPosition ( player )
		local tx, ty, tz = getElementPosition ( target )
		local x2, y2, z2 = 221.471, 113.181, 999.015
		if isOnDuty ( player ) or isArmy(player) then
			if (laGetElementData ( player, "adminlvl" ) >= 2) or (laGetElementData ( player, "rang" ) >= 4) then
				if (getDistanceBetweenPoints3D ( x, y, z, x2, y2, z2 ) < 10) then
					if (getDistanceBetweenPoints3D ( tx, ty, tz, x2, y2, z2 ) < 10) then
						if laGetElementData ( target, "wanteds" ) == 0 then
							if (laGetElementData ( target, "jailtime" ) >= 1) then
								laSetElementData ( target, "jailtime", 0 )
								fadeCamera ( target, false, 0.5, 0, 0, 0 )
								setTimer ( shortaway_func, 5000, 1, target)
								laSetElementData ( target, "bail", 0 )
								outputChatBox ( "Du wurdest von Staatsbeamten "..getPlayerName(player).." vorzeitig aus der Haft entlassen!", target, 0, 250, 0 )
								outputChatBox ( "Du hast den Spieler "..getPlayerName(target).." vorzeitig aus der Haft entlassen!", player, 0, 250, 0 )
								if isCop (player) then
									local msg = ""..getPlayerName(target).." wurde von Polizist "..getPlayerName(player).." vorzeitig aus der Haft entlassen!"
									sendMSGForFaction 		( msg, 1, 0, 0, 200)
									sendMSGForFaction 		( msg, 6, 0, 0, 200)
									sendMSGForFaction 		( msg, 8, 0, 0, 200)
								elseif isFBI (player) then
									local msg = ""..getPlayerName(target).." wurde von Agent "..getPlayerName(player).." vorzeitig aus der Haft entlassen!"
									sendMSGForFaction 		( msg, 1, 0, 0, 200)
									sendMSGForFaction 		( msg, 6, 0, 0, 200)
									sendMSGForFaction 		( msg, 8, 0, 0, 200)
								elseif isArmy (player) then
									local msg = ""..getPlayerName(target).." wurde von Soldat "..getPlayerName(player).." vorzeitig aus der Haft entlassen!"
									sendMSGForFaction 		( msg, 1, 0, 0, 200)
									sendMSGForFaction 		( msg, 6, 0, 0, 200)
									sendMSGForFaction 		( msg, 8, 0, 0, 200)
								end
								outputLog( "[ENTLASSEN]: "..getPlayerName(player).." hat "..getPlayerName(target).." entlassen!", "pd")
								laSetElementData ( target, "wanteds", 0 )
								setPlayerWantedLevel ( target, 0 )
								toggleControl ( target, "fire", true )
								toggleControl ( target, "jump", true )
								fadeElementInterior ( target, 10, 225.6222, 112.561, 1003.2258, 180, 0)
								fadeElementInterior ( player, 10, 225.59, 109.611, 1003.21875, 0, 0)
							else
								triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Verbrecher ist nicht eingesperrt!", 5000, 125, 0, 0 )						
							end
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Verbrecher hat Wanteds!", 5000, 125, 0, 0 )
						end
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerbrecher ist nicht hinter Gitter!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht bei den Zellen!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht befugt!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Beamter im Dienst!", 5000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGebrauch: /ausknasten [Name]", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "ausknasten", ausknasten_func )

function shortaway_func (player)
fadeCamera ( player, true, 0.5, 0, 0, 0 )
end

function toggleControlsTied ( target )
toggleControl ( target, "fire", false )
toggleControl ( target, "jump", false )
end


function bail_func ( player )

	if laGetElementData ( player, "jailtime" ) == 0 then
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nicht\nim Gefängnis!", 5000, 125, 0, 0 )
	else
		if laGetElementData ( player, "bail" ) == 0 then
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast\nkeine Kaution!", 5000, 125, 0, 0 )
		else
			if tonumber(laGetElementData ( player, "bail" )) <= laGetElementData ( player, "money" ) then
				local bail = laGetElementData ( player, "bail" )
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - bail )
				laSetElementData ( player, "bail", 0 )
				laSetElementData ( player, "jailtime", 0 )
				toggleControl ( target, "fire", true )
				outputChatBox ("Du wurdest entlassen! Lass dich nächstes Mal nicht erwischen!", player, 0, 125, 0 )
				outputLog( "[KAUTION]: "..getPlayerName(player).." hat seine Kaution ("..bail.."$) bezahlt!", "pd")
				setElementInterior ( player, 0 )
				if getElementData ( player, "jail" ) == "lv" then
					setElementPosition ( player, 2340.1567382813, 2451.8452148438, 14.62340164 )
					setPedRotation ( player, 180 )
				elseif getElementData ( player, "jail" ) == "ls" then
					setElementInterior ( player, 0 )
					setElementPosition ( player, 1546.4892578125, -1675.625, 13.562417984009 )

				else
					setElementPosition ( player, -1605.675, 717.516, 12.006 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast\nzu wenig Geld!\nKosten:\n"..tonumber(bail).."", 5000, 125, 0, 0 )
			end
		end
	end
end
addCommandHandler ("bail", bail_func )

function jailtime_func ( player )

	local jailtime = laGetElementData ( player, "jailtime" )
	if jailtime == 0 then
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist nicht im Gefängnis!", 5000, 125, 0, 0 )
	else
		outputChatBox ("Du bist noch "..jailtime.." Minuten im Gefängnis!", player, 200, 200, 0 )
	end
end
addCommandHandler ("jailtime", jailtime_func )
addCommandHandler ("knastzeit", jailtime_func )


function toggleControlsTied ( target )
toggleControl ( target, "fire", false )
toggleControl ( target, "jump", false )
end



function fesseln_func ( player, cmd )

    local veh = getPedOccupiedVehicle(player) -- Get the vehicle the player is in
    if veh then -- If he is actually in a vehicle...
        local occupants = getVehicleOccupants(veh) -- Get all vehicle occupants
        local seats = getVehicleMaxPassengers(veh) -- Get the amount of passenger seats

        for seat = 0, seats do -- Repeat with seat = 0, incrementing until it reaches the amount of passenger seats the vehicle has
            local occupant = occupants[seat] -- Get the occupant
        end
		local target2 = occupant[2]
		local target3 = occupant[3]
		if isOnStateDuty(player) then
			if laGetElementData ( occupant[1], "wanteds" ) >= 1 then
				local target = occupant[1]
				if getVehicleOccupant ( getPedOccupiedVehicle ( player ) ) ~= target and getPedOccupiedVehicleSeat ( target ) > 0 then
					local x1, y1, z1 = getElementPosition ( player )
					local x2, y2, z2 = getElementPosition ( target )
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
						local boolean = not laGetElementData ( target, "tied" )
						laSetElementData ( target, "tied", boolean )
						toggleAllControls ( target, boolean )
						if boolean then fix = "ent" else fix = "ge" end
						
						if fix == "ent" then
							fadeCamera ( target, true, 0.5, 0, 0, 0 )
						elseif isEvil ( player ) then
							fadeCamera ( target, false, 0.5, 0, 0, 0 )
						end
						outputChatBox ( "Du hast einen Terroristen "..fix.."fesselt!", player, 0, 125, 0 )
						outputChatBox ( "Du wurdest von "..getPlayerName(player).." "..fix.."fesselt!", target, 200, 200, 0 )
					else
						outputChatBox ( "Du bist zu weit weg!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Ungültiges Ziel!", player, 125, 0, 0 )
				end
			elseif getTeamName(getPlayerTeam(occupant[2])) == "Terror" then
				if getVehicleOccupant ( getPedOccupiedVehicle ( player ) ) ~= target2 and getPedOccupiedVehicleSeat ( target2 ) > 0 then
					local x1, y1, z1 = getElementPosition ( player )
					local x2, y2, z2 = getElementPosition ( target2 )
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
						local boolean = not laGetElementData ( target2, "tied" )
						laSetElementData ( target2, "tied", boolean )
						toggleAllControls ( target2, boolean )
						if boolean then fix = "ent" else fix = "ge" end
						
						if fix == "ent" then
							fadeCamera ( target2, true, 0.5, 0, 0, 0 )
						elseif isEvil ( player ) then
							fadeCamera ( target2, false, 0.5, 0, 0, 0 )
						end
						outputChatBox ( "Du hast einen Terroristen "..fix.."fesselt!", player, 0, 125, 0 )
						outputChatBox ( "Du wurdest von "..getPlayerName(player).." "..fix.."fesselt!", target2, 200, 200, 0 )
					else
						outputChatBox ( "Du bist zu weit weg!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Ungültiges Ziel!", player, 125, 0, 0 )
				end
			elseif getTeamName(getPlayerTeam(occupant[3])) == "Terror" then
				if getVehicleOccupant ( getPedOccupiedVehicle ( player ) ) ~= target3 and getPedOccupiedVehicleSeat ( target3 ) > 0 then
					local x1, y1, z1 = getElementPosition ( player )
					local x2, y2, z2 = getElementPosition ( target3 )
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 5 then
						local boolean = not laGetElementData ( target3, "tied" )
						laSetElementData ( target3, "tied", boolean )
						toggleAllControls ( target3, boolean )
						if boolean then fix = "ent" else fix = "ge" end
						
						if fix == "ent" then
							fadeCamera ( target3, true, 0.5, 0, 0, 0 )
						elseif isEvil ( player ) then
							fadeCamera ( target3, false, 0.5, 0, 0, 0 )
						end
						outputChatBox ( "Du hast einen Terroristen "..fix.."fesselt!", player, 0, 125, 0 )
						outputChatBox ( "Du wurdest von "..getPlayerName(player).." "..fix.."fesselt!", target3, 200, 200, 0 )
					else
						outputChatBox ( "Du bist zu weit weg!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Ungültiges Ziel!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Niemand hat Wanteds!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist kein Polizist!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Ungültiges Ziel!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "fesseln", fesseln_func )