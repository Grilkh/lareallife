function tazer_func ( attacker )
end

function tazery_func ( attacker )
local attackerplayer = getPlayerFromName ( attacker )
	--if player == client or not client then
		--if isOnStateDuty(attacker) then
			
			--if laGetElementData ( attackerplayer, "tazer" ) == 1 then else laSetElementData ( attackerplayer, "tazer", 0 ) end------
			--if laGetElementData ( attackerplayer, "tazer" ) == 0 then------
				--if not getPedOccupiedVehicle ( attacker ) then
					--[[local posX, posY, posZ = getElementPosition( attacker )
					local tazerSphere = createColSphere( posX, posY, posZ, 3 )
					local nearbyPlayers = getElementsWithinColShape( tazerSphere, "player" )
					destroyElement( tazerSphere )
					local bestDist = 999
					local px, py, pz = 0, 0, 0
					local cDist = 0
					for index, nearbyPlayer in ipairs( nearbyPlayers ) do
						if nearbyPlayer ~= attacker and not getPedOccupiedVehicle ( nearbyPlayer ) then
							px, py, pz = getElementPosition ( nearbyPlayer )
							cDist = getDistanceBetweenPoints3D ( posX, posY, posZ, px, py, pz )
							if cDist <= bestDist then
								curTazerVicitm = nearbyPlayer
								bestDist = cDist
							end
						end
					end
					if bestDist < 999 then]]--
					if laGetElementData ( source, "tazered") == false then
						if isOnStateDuty ( source ) then
							triggerClientEvent ( attackerplayer, "infobox_start", getRootElement(), "\n\nDas Ziel ist ein Verbündeter!", 5000, 125, 0, 0 )
						else
							setPedAnimation( source, "crack", "crckdeth2",-1,true,true,false)
							laSetElementData(source,"anim", 1)
							setTimer ( defreeze_tazer, 20000, 1, source )
							laSetElementData ( attackerplayer, "tazer", 1 )
							setTimer ( reuse_tazer, 25000, 1, attackerplayer )
							--[[local posX, posY, posZ = getElementPosition( attackerplayer )
							local chatSphere = createColSphere( posX, posY, posZ, 10 )
							local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
							destroyElement ( chatSphere )
							toggleAllControls ( source, false, true, false )
								for index, nearbyPlayer in ipairs( nearbyPlayers ) do]]--
									local pname = getPlayerName ( attacker )
									if getTeamName(getPlayerTeam(source)) == "Terror" then
										--outputChatBox ( pname.." hat einen Terroristen ausser Gefecht gesetzt!", nearbyPlayer, 100, 0, 200 )
									else
									outputChatBox ( pname.." hat dich ausser Gefecht gesetzt!", source, 200, 0, 0 )
									outputChatBox ( "Du hast "..getPlayerName(source).." ausser Gefecht gesetzt!", attacker, 0, 200, 0 )
										--outputChatBox ( pname.." hat "..getPlayerName(source).." ausser Gefecht gesetzt!", nearbyPlayer, 100, 0, 200 )
									end
								--end
								laSetElementData ( source, "tazered", true )
						end
					else
						triggerClientEvent ( attacker, "infobox_start", getRootElement(), "\n\nDer Spieler ist bereits ausser Gefecht!", 5000, 125, 0, 0 )	
					end
					--[[else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nEs ist kein Spieler in der Nähe!", 5000, 125, 0, 0 )
					end]]--
					--end
				--end
			--else-----
			--	triggerClientEvent ( attackerplayer, "infobox_start", getRootElement(), "\n\Du kannst nur alle 25 Sekunden\njemanden ausser Gefecht setzen!", 5000, 125, 0, 0 )-----
			--end------
		--else
		--	triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Staatsbeamter im Dienst!", 5000, 125, 0, 0 )
		--end
	--end
end
addEvent ( "tazer", true )
addEventHandler ( "tazer", getRootElement(), tazery_func )
--addCommandHandler ( "tazer", tazer_func )

function defreeze_tazer ( player )

	setPedAnimation ( player )
	laSetElementData ( player, "tazered", false )
	laSetElementData(player,"anim", 0)
	if laGetElementData ( player, "tied" ) then
		toggleAllControls ( player, true, true, false )
	end
end

function reuse_tazer ( player )

	laSetElementData ( player, "tazer", 0 )
end

--[[function accept_func ( player, cmd, add )

	if add == "test" then
		local cop = laGetElementData ( player, "tester" )
		if isElement ( cop ) then
			local alc = laGetElementData ( player, "alcoholFlushPoints" ) / 25
			local drogen = laGetElementData ( player, "drugFlushPoints" )
			infobox ( player, "\n\n\nDu hast dem\nTest zugestimmt.", 5000, 0, 125, 0 )
			local result = "Ergebnis:\nAlkoholgehalt im Blut: "..alc.." Promil,\nTHC-Gehalt im Blut: "..drogen
			outputChatBox ( result, cop, 200, 200, 0 )
			outputChatBox ( result, player, 200, 200, 0 )
		else
			infobox ( player, "\n\nNicht möglich.", 5000, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "accept", accept_func )]]

function cuff_func ( player, cmd, target )

	if player == client or not client then
		if copskins[getElementModel ( player )] or fbiSkins[getElementModel ( player )] or isArmy ( player ) then
			if getPlayerFromName ( target ) then
				local target = getPlayerFromName ( target )
				local x1, y1, z1 = getElementPosition ( player )
				local x2, y2, z2 = getElementPosition ( target )
				if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
					laSetElementData ( target, "sprint", 1 )
					setTimer ( reengage_sprint, 60000, 1, target )
					toggleControl ( target, "sprint", false )
					toggleControl ( target, "walk", false )
					setControlState ( target, "walk", true )
					outputChatBox ( getPlayerName(player).." hat deine Füsse gefesselt! Du kannst nicht mehr rennen!", target, 0, 125, 0 )
					outputChatBox ( "Du hast "..getPlayerName(target).." Fussfesseln angelegt!", player, 0, 125, 0 )
					takeAllWeapons ( target )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit entfernt!", 5000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültiger Spieler!", 5000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Polizist im Dienst!", 5000, 125, 0, 0 )
		end
	end
end
addEvent ( "cuffGUI", true )
addEventHandler ( "cuffGUI", getRootElement(), cuff_func )
addCommandHandler ( "cuff", cuff_func )

function reengage_sprint ( player )

	laSetElementData ( player, "sprint", 0 )
	toggleControl ( player, "sprint", true )
	toggleControl ( player, "walk", true )
	setControlState ( player, "walk", false )
	outputChatBox ( "Du hast deine Fussfesseln gelöst!", player, 0, 125, 0 )
end