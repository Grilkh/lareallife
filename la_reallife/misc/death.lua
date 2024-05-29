local m_pick = {}
local m_mark = {}
local m_blip = {}
 
 

function medicdeleteBlip_func()
local thePlayer = source
	setElementVisibleTo ( m_blip[thePlayer], getRootElement(), false )
	setElementVisibleTo ( m_mark[thePlayer], getRootElement(), false )
	setElementVisibleTo ( m_pick[thePlayer], getRootElement(), false )
	destroyElement(m_pick[thePlayer])
	destroyElement(m_mark[thePlayer])
	destroyElement(m_blip[thePlayer])
end

local deathReasons = {
	[19] = "Rakete",
	[37] = "Verbrannt",
	[49] = "Gerammt",
	[50] = "Rotorblätter",
	[51] = "Explosion",
	[52] = "Driveby",
	[53] = "Ertrunken",
	[54] = "Gestürzt",
	[55] = "Unbekannt",
	[56] = "Faust",
	[57] = "Waffe",
	[59] = "Panzer-Granate",
	[63] = "Fahrzeugexplosion"
}


local revivetimer = {}
function playerdeath ( ammo, killer, weapon, part )
        local player = source
        laSetElementData ( player, "alcoholFlushPoints", 0 )
        laSetElementData ( player, "weedFlushPoints", 0 )
        laSetElementData ( player, "koksFlushPoints", 0 )
        laSetElementData ( player, "cigarettFlushPoints", 0 )
        if part then
                if part == 9 then
                        setPedHeadless ( player, true )
                end
        end
        if getElementData ( player, "In_DMArena" ) == 1 then
               
        else
                if isKeyBound ( player, "enter_exit", "down", heliCoSeat ) then
                        heliCoSeat ( player )
                end
                if not laGetElementData ( player, "isInHighNoon" ) and ( not getElementData ( player, "In_DMArena" ) or getElementData ( player, "In_DMArena" ) == 0 ) then
                        laSetElementData ( player, "hunger", 40 )
                        hideTruckMarkers ( player )
                        if laGetElementData ( player, "callswith" ) then
                                if laGetElementData ( player, "callswith" ) ~= "none" then
                                        local caller = getPlayerFromName ( laGetElementData ( player, "callswith" ) )
                                        if caller then
                                                laSetElementData ( caller, "callswith", "none" )
                                                laSetElementData ( caller, "call", false )
                                                laSetElementData ( caller, "calls", "none" )
                                                laSetElementData ( caller, "callswith", "none" )
                                                laSetElementData ( caller, "calledby", "none" )
                                                outputChatBox ( "*BAM* - Die Leitung ist tod!", caller, 125, 0, 0 )
                                        end
                                        laSetElementData ( player, "callswith", "none" )
                                        laSetElementData ( player, "call", false )
                                        laSetElementData ( player, "calls", "none" )
                                        laSetElementData ( player, "callswith", "none" )
                                        laSetElementData ( player, "calledby", "none" )
                                end
                        end
                        if laGetElementData ( player, "isInDrivingSchool" ) then
                                cancelDrivingSchoolPlayer ( player )
                        end
                        if getPedOccupiedVehicle ( player ) then
                                removePedFromVehicle ( player )
                        end
						if isElement ( killer ) and killer ~= player and getPlayerName ( killer ) and weapon and not isOnStateDuty ( killer ) then
                                outputLog ( "[KILL]: "..getPlayerName ( killer ).." hat "..getPlayerName(player).." mit Waffe "..weapon.." erledigt!", "death" )
							if isZivi(player) or isEmergency(player) or isReporter(player) or isStateFaction(player) then
								local x, y, z = getElementPosition ( player )
								local killShape = createColSphere ( x, y, z, 10 )
								local elementsInKillSphere = getElementsWithinColShape ( killShape, "player" )
								destroyElement ( killShape )
								local x1, y1, z1 = getElementPosition ( player )
								local x2, y2, z2 = getElementPosition ( killer )
								local location = getZoneName ( x1, y1, z1 )
								local city = getZoneName ( x1, y1, z1, true )
								--[[for key, ShapePlayer in ipairs ( elementsInKillSphere ) do
									if laGetElementData ( ShapePlayer, "handsuped" ) or getElementData ( ShapePlayer, "tiedsecur") or isPedDead ( ShapePlayer) then
									elseif killer == ShapePlayer then
									else
										outputChatBox ( "In deiner Nähe ist ein Mord geschehen! Du kannst ihn mit /mord melden!", ShapePlayer, 225, 225, 0 )
										laSetElementData (ShapePlayer, "killedPlayer", getPlayerName(player))
										laSetElementData (ShapePlayer, "killerPlayer", attacker)
										laSetElementData (ShapePlayer, "killedLocation", location)
										laSetElementData (ShapePlayer, "killedCity", location)
										laSetElementData (ShapePlayer, "SawMord", true)
										mordablauftimer = setTimer (mordnichtgemeldet, 300000, 1, ShapePlayer)
										if laGetElementData (killer, "Mordgesehen") == true then
										else
											laSetElementData (killer, "Mordgesehen", true)
										end
										if isOnStateDuty(ShapePlayer) then
											laSetElementData (killer, "lastcrime", "mord" )
											moerdtimer = setTimer (moerdzuruck, 300000, 1, killer)
										end
									end
								end]]
							end
						elseif killer == false and weapon then
							local grund = deathReasons[weapon]
							outputLog ( "[TOD]: "..getPlayerName(player).." ist gestorben. Grund: "..grund..".", "death" )
                        end
                        laSetElementData ( player, "isinairportmission", false )
                        laSetElementData ( player, "readyequip", false )
                        setPlayerNametagColor ( player, 200, 200, 200 )
                        laSetElementData ( player, "isInRace", false )
                        unbindKey ( player, "mouse_wheel_up", "down", weaponsup )
                        unbindKey ( player, "mouse_wheel_down", "down", weaponsdown )
                        unbindKey ( player , "g", "down", rein )
                        unbindKey ( player, "enter", "down", eject )
                        unbindKey ( player, "rshift", "down", helidriveby )
                        unbindKey ( player, "1", "down", tazer_func )
                        laSetElementData ( player, "heaventime", 60 )
                        setTimer ( endfade, 5000, 1, player )
                        local hitmanbonustime = 0
                        laSetElementData ( player, "hitmandeath", false )
                        if isCamorra ( killer ) then
                                local contract = laGetElementData ( player, "contract" )
                                if contract > 0 then
                                        laSetElementData ( player, "hitmandeath", true )
                                        local hitmanbonustime = 30000
                                        laSetElementData ( player, "contract", 0 )
										local CamorraFamkasse = tonumber(MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE 'Mafia'"))
										local CamorraFamkasseNew = CamorraFamkasse + contract
										MySQL_SetString("fraktionen", "DepotGeld", CamorraFamkasseNew, "Name LIKE 'Mafia'")
                                        --laSetElementData ( killer, "money", tonumber ( laGetElementData ( killer, "money" ) ) + contract )
                                       -- givePlayerMoney ( killer, contract )
                                        triggerClientEvent ( killer, "HudEinblendenMoney", getRootElement() )
                                        playSoundFrontEnd ( killer, 40 )
                                        outputChatBox ( "Du wurdest Opfer eines Auftragmordes! Es waren "..contract.."$ Kopfgeld ausgesetzt!", player, 200, 0, 0 )
                                        outputChatBox ( "Ziel erledigt. Belohnung: "..contract.."$.", killer, 0, 200, 0 )
										outputLog ( "[HITMAN]: "..getPlayerName ( killer ).." hat "..getPlayerName(player).." erledigt! Belohnung: "..contract.."$", "bad" )
                                end
                        end
                        revivetimer[player] = setTimer ( revive, 65000+hitmanbonustime, 1, player )
                        if laGetElementData ( source, "isInArea51Mission" ) then
                                setPlayerOutOfArea51 ( source )
                                outputChatBox ( "Mission gescheitert!", source, 125, 0, 0 )
                        end
                        if killer and killer ~= player and getElementType ( killer ) == "player" then
                                local kills = tonumber ( laGetElementData ( killer, "kills" ) )
                                laSetElementData ( killer, "kills", kills + 1 )
                                blackListKillCheck ( player, killer, weapon )
								whiteListKillCheck ( player, killer )
                                if isOnDuty ( killer ) or isArmy ( killer ) then
                                        if laGetElementData ( player, "isinRob", true ) then
                                                local strafe = laGetElementData ( player, "money" )
                                                local wanteds = 6
                                                local time = math.floor((wanteds * jailtimeperwanted)/4*3)
                                                laSetElementData ( player, "wanteds", 0 )
                                                setPlayerWantedLevel ( player, 0 )
                                                takePlayerMoney ( player, laGetElementData ( player, "money" ) )
                                                triggerClientEvent ( player, "HudEinblendenMoney", getRootElement()     )
                                                laSetElementData ( player, "money", 0 )
                                                laSetElementData ( player, "jailtime", time )
                                                laSetElementData ( player, "bail", 0 )
                                                laSetElementData ( player, "isinRob", false )
                                                outputChatBox ( "Du wurdest vom Staatsbeamten "..getPlayerName(killer).." beim Casinoraub erledigt. "..strafe.."$ wurden beschlagnahmt und du für "..time.." Minuten eingesperrt!", player, 250, 0, 0 )
                                                laSetElementData ( killer, "boni", laGetElementData ( killer, "boni" )+wanteds*(wantedkill/6) )
                                                outputChatBox ( "Du hast "..getPlayerName ( player ).." beim Casinoraub erledigt und erhältst bei deinem nächsten Lohn "..wanteds*(wantedkill/6).."$ Bonus!", killer, 0, 250, 0 )
                                        else
                                                if laGetElementData ( player, "wanteds" ) == 0 then
                                                        laSetElementData ( killer, "boni", laGetElementData ( killer, "boni" )-wantedkill )
                                                        outputChatBox ( "Du hast einen Zivilisten erledigt! Dir werden "..wantedkill.."$ bei deinem nächsten Lohn abgezogen!", killer, 250, 0, 0 )
                                                else
														local wanteds = laGetElementData ( player, "wanteds" )
                                                        local strafe = wanteds * wantedprice * 10
                                                        local time = math.floor((wanteds * jailtimeperwanted * 1.2)/4*3)
                                                        laSetElementData ( player, "wanteds", 0 )
                                                        setPlayerWantedLevel ( player, 0 )
														laSetElementData ( player, "isCopKilled", true)
                                                        if tonumber(strafe) > laGetElementData ( player, "money" ) then        
                                                                takePlayerMoney ( player, laGetElementData ( player, "money" ) )
                                                                triggerClientEvent ( player, "HudEinblendenMoney", getRootElement()     )
                                                                laSetElementData ( player, "money", 0 )
                                                        else
                                                                laSetElementData ( player, "money", tonumber(laGetElementData ( player, "money" )) - tonumber(strafe) )
                                                                takePlayerMoney ( player, tonumber(strafe) )
                                                                triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
                                                        end
                                                        laSetElementData ( player, "jailtime", time )
                                                        laSetElementData ( player, "bail", 0 )
                                                        local grammafix  = " ohne Kaution "
                                                        outputChatBox ( "Du wurdest vom Staatsbeamten "..getPlayerName(killer).." erledigt und"..grammafix.."für "..strafe.." $ und "..time.." Minuten eingesperrt!", player, 250, 0, 0 )
                                                        laSetElementData ( killer, "boni", laGetElementData ( killer, "boni" )+wanteds*(wantedkill/6) )
                                                        outputChatBox ( "Du hast "..getPlayerName ( player ).." erledigt und erhältst bei deinem nächsten Lohn "..wanteds*(wantedkill/6).."$ Bonus!", killer, 0, 250, 0 )
                                                end
                                        end
                                end
                        end
                        if isKeyBound ( player, "mouse3", "up", explodeTerror, player ) then
                                explodeTerror ( player )
                        end
						laSetElementData ( player, "isinRob", false )
                        laSetElementData ( player, "deaths", laGetElementData ( player, "deaths" ) + 1 )
                        setPlayerNametagShowing ( player, true )
                        if not laGetElementData ( player, "isInHighNoon" ) then
                       
                                local curweed = laGetElementData ( player, "weed" )
                                if curweed > 0 then
                                        local amount = getDropAmount ( curweed, player )
                                        laSetElementData ( player, "weed", curweed - amount )
                                        local x, y, z = getElementPosition ( player )
                                        pickup = createPickup ( 0, 0, 0, 3, 1575, 1 )
                                        setElementPosition ( pickup, x, y, z )
                                        laSetElementData ( pickup, "amount", amount )
                                        setElementDimension ( pickup, getElementDimension ( player ) )
                                        setElementInterior ( pickup, getElementInterior ( player ) )
                                       
                                        addEventHandler ( "onPickupHit", pickup, weedDropHit )
                                end
                               
                                local curkoks = laGetElementData ( player, "koks" )
                                if curkoks > 0 then
                                        local amount = getDropAmount ( curkoks, player )
                                        laSetElementData ( player, "koks", curkoks - amount )
                                        local x, y, z = getElementPosition ( player )
                                        pickup = createPickup ( 0, 0, 0, 3, 1279, 1 )
                                        setElementPosition ( pickup, x, y, z )
                                        laSetElementData ( pickup, "amount", amount )
                                        setElementDimension ( pickup, getElementDimension ( player ) )
                                        setElementInterior ( pickup, getElementInterior ( player ) )
                                       
                                        addEventHandler ( "onPickupHit", pickup, koksDropHit )
                                end
                                local curmats = laGetElementData ( player, "mats" )
                                if curmats > 0 then
                                        local amount = getDropAmount ( curmats, player )
                                        laSetElementData ( player, "mats", curmats - amount )
                                        local x, y, z = getElementPosition ( player )
                                        pickup = createPickup ( 0, 0, 0, 3, 2358, 1 )
                                        setElementPosition ( pickup, x + 0.5, y, z )
                                        laSetElementData ( pickup, "amount", amount )
                                        setElementDimension ( pickup, getElementDimension ( player ) )
                                        setElementInterior ( pickup, getElementInterior ( player ) )
                                       
                                        addEventHandler ( "onPickupHit", pickup, matDropHit )
                                end
                               
                                local money = laGetElementData ( player, "money" )
                                loss = 5
                                if money > 0 then
                                        laSetElementData ( player, "money", math.abs(math.floor(money/100*(100-loss))) )
                                        takePlayerMoney ( player, math.floor(money/100*loss) )
                                        local x, y, z = getElementPosition ( player )
                                        pickup = createPickup ( 0, 0, 0, 3, 1212, 1 )
                                        setElementPosition ( pickup, x, y + 0.5, z )
                                        laSetElementData ( pickup, "money", math.floor(money/100*loss) )
                                        setElementDimension ( pickup, getElementDimension ( player ) )
                                        setElementInterior ( pickup, getElementInterior ( player ) )
                                       
                                        addEventHandler ( "onPickupHit", pickup, moneyDropHit )
                                end
                        end
                        setElementDimension ( player, 0 )
                        setElementInterior ( player, 0 )
                else
                        laSetElementData ( player, "isInHighNoon", false )
                        setTimer ( savespawn, 5000, 1, player, -2617.2189941406, 212, 4.4970808029175, 0, 0, 0, true )
                end
        end
        showChat ( player, true )
        showPlayerHudComponent ( player, "radar", true )
        setElementData( player, "gotMerchandise", false )
        setElementData( player, "merchandiseAmmount", 0 )
		laSetElementData (player, "wasted", true)
		--triggerClientEvent ( player, "showProgressBar", player )
			setTimer(function()
				if(isElement(m_pick[player])) then
					setElementVisibleTo ( m_blip[player], getRootElement(), false )
					setElementVisibleTo ( m_mark[player], getRootElement(), false )
					setElementVisibleTo ( m_pick[player], getRootElement(), false )
					destroyElement(m_pick[player])
					destroyElement(m_mark[player])
					destroyElement(m_blip[player])
				end
			end, 60000, 1)
        -- MEDIC --
        local thePlayer = player
        if(isElement(m_pick[thePlayer])) then
				setElementVisibleTo ( m_blip[thePlayer], getRootElement(), false )
				setElementVisibleTo ( m_mark[thePlayer], getRootElement(), false )
				setElementVisibleTo ( m_pick[thePlayer], getRootElement(), false )
                destroyElement(m_pick[thePlayer])
                destroyElement(m_mark[thePlayer])
				destroyElement(m_blip[thePlayer])
        end
        local x, y, z = getElementPosition(thePlayer)
        m_pick[thePlayer] = createPickup(x, y, z, 3, 1254, 1000)
        m_mark[thePlayer] = createMarker(x, y, z, "corona", 1.0, 0, 0, 0, 0)
		m_blip[thePlayer] = createBlip (x, y, z, 0, 2, 255, 0, 0, getRootElement() )
		setElementVisibleTo ( m_blip[thePlayer], getRootElement(), false )
		setElementVisibleTo ( m_mark[thePlayer], getRootElement(), false )
		setElementVisibleTo ( m_pick[thePlayer], getRootElement(), false )
        setElementData(m_mark[thePlayer], "player", thePlayer)
        for index, medic in pairs(getElementsByType("player")) do
                if(isMedic(medic)) and (isMedicDuty(medic)) then
					setElementVisibleTo ( m_blip[thePlayer], medic, true )
					setElementVisibleTo ( m_mark[thePlayer], medic, true )
					setElementVisibleTo ( m_pick[thePlayer], medic, true )
					outputChatBox("INFO: Toter in "..getZoneName(x, y, z, false)..", "..getZoneName(x, y, z, true).." gemeldet.", medic, 0, 255, 150)
					--triggerClientEvent(thePlayer, "onLAMedicToterMeld", thePlayer, thePlayer)
					--addEventHandler ( "onPlayerSpawn", thePlayer, medicdeleteBlip_func )
					--addEventHandler ( "onPlayerQuit", thePlayer, medicdeleteBlip_func )
                end
        end
        addEventHandler("onMarkerHit", m_mark[thePlayer], function(hitElement)
                if(thePlayer == hitElement) or (isPedDead(hitElement)) then return end
                if(getElementType(hitElement) == "player") and (isMedic(hitElement) == true) and (isMedicDuty(hitElement)) then
                        local thePlayer = getElementData(source, "player")
                        if(isElement(thePlayer)) then
                                toggleAllControls(hitElement, false)
                                setPedAnimation(hitElement, "MEDIC", "CPR", -1, true, false, false)
                                setTimer(function()
										wiederbelebe_player(hitElement, thePlayer)
										toggleAllControls(hitElement, true)
										setPedAnimation(hitElement)
								end, 7500, 1)
						end
						setElementVisibleTo ( m_blip[thePlayer], getRootElement(), false )
						setElementVisibleTo ( m_mark[thePlayer], getRootElement(), false )
						setElementVisibleTo ( m_pick[thePlayer], getRootElement(), false )
						destroyElement(m_pick[thePlayer])
						destroyElement(m_mark[thePlayer])
						destroyElement(m_blip[thePlayer])
                end
        end)
end
addEventHandler ( "onPlayerWasted", getRootElement(), playerdeath )

function moerdzuruck (killer)
laSetElementData (killer, "lastcrime", "" )
laSetElementData (killer, "Mordgesehen", false)
end

function mordnichtgemeldet (player)
laSetElementData (ShapePlayer, "killedPlayer", "")
laSetElementData (ShapePlayer, "killerPlayer", "")
laSetElementData (ShapePlayer, "killedLocation", "")
laSetElementData (ShapePlayer, "killedCity", "")
laSetElementData (ShapePlayer, "SawMord", false)
end

function mordMelden_func (player, cmd)
if laGetElementData (player, "SawMord") == true then
	local killedPlayer = laGetElementData (player, "killedPlayer")
	local killerPlayer = laGetElementData (player, "killerPlayer")
	local killerPP = getPlayerFromName(killerPlayer)
	local killedLocation = laGetElementData (player, "killedLocation")
	local killedCity = laGetElementData (player, "killedCity")

	if laGetElementData (killerPP, "Mordgemeldet") == true then
		outputChatBox ( "Der Mord wurde bereits gemeldet!", player, 150, 0, 0 )
	else
		--outputChatBox ( "Die Polizei wurde über deinen Mord informiert!", killerPP, 200, 0, 0 )
		outputChatBox ( "Mord gemeldet!", player, 200, 200, 0 )
		local msg = ""..killedPlayer.." wurde tot aufgefunden in: "..killedLocation.." ("..killedCity..")"
		sendMSGForFaction ( msg, 1, 200, 0, 0 )
		sendMSGForFaction ( msg, 6, 200, 0, 0 )
		sendMSGForFaction ( msg, 8, 200, 0, 0 )
		
		local msg = "Verdächtiger im Mordfall: "..killerPlayer..""
		sendMSGForFaction ( msg, 1, 180, 0, 0 )
		sendMSGForFaction ( msg, 6, 180, 0, 0 )
		sendMSGForFaction ( msg, 8, 180, 0, 0 )

		laSetElementData (killerPP, "lastcrime", "mord" )
		moerdtimer = setTimer (moerdzuruck, 1800000, 1, killerPP)
		laSetElementData (player, "killedPlayer", "")
		laSetElementData (player, "killerPlayer", "")
		laSetElementData (player, "killedLocation", "")
		laSetElementData (player, "killedCity", "")
		laSetElementData (player, "SawMord", false)
		laSetElementData (killerPP, "Mordgemeldet", true)
		gemeldettimer = setTimer (gemeldetzuruck, 300000, 1, killerPP)
		killTimer(mordablauftimer)
	end
end
end
addCommandHandler ( "mord", mordMelden_func )

function gemeldetzuruck (killer)
laSetElementData (killer, "Mordgemeldet", false)
end

function disableMedicBlip ( thePlayer )
local thePlayer = source
	if(isElement(m_pick[thePlayer])) then
		setElementVisibleTo ( m_blip[thePlayer], getRootElement(), false )
		setElementVisibleTo ( m_mark[thePlayer], getRootElement(), false )
		setElementVisibleTo ( m_pick[thePlayer], getRootElement(), false )
		destroyElement(m_pick[thePlayer])
		destroyElement(m_mark[thePlayer])
		destroyElement(m_blip[thePlayer])
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), disableMedicBlip)

function wiederbelebe_player(sanitaeter, thePlayer)
        if(isPedDead(thePlayer)) then
			if laGetElementData (thePlayer, "isCopKilled") == true then
				outputChatBox("Der Spieler "..getPlayerName(thePlayer).." wurde verhaftet und kann nicht gerettet werden!", sanitaeter, 150, 0, 0)
			else
                fadeCamera(thePlayer, false, -1, 255, 255, 255)
                local x, y, z = getElementPosition(thePlayer)
                setTimer(function()
						setElementData(thePlayer, "wereDead", true)
						setTimer (wereDead_func, 2500, 1, thePlayer)
                        spawnPlayer(thePlayer, x, y, z, 0, getElementModel(thePlayer), getElementInterior(thePlayer), getElementDimension(thePlayer))
                        fadeCamera(thePlayer, true)
                        triggerClientEvent ( thePlayer, "infobox_start", getRootElement(), "\nDu wurdest von Sanitäter\n"..getPlayerName(sanitaeter).." wiederbelebt!", 7500, 0, 125, 0 )
                        -- SICHERHEITSHINWEIS --
						local money = laGetElementData (thePlayer, "money")
						local mmoney = laGetElementData (sanitaeter, "money")
						if(money > 249) then
							laSetElementData (thePlayer, "money", money - 250)
							givePlayerMoney(thePlayer, -250)
						end
						laSetElementData (sanitaeter, "money", mmoney + 250)
						givePlayerMoney(sanitaeter, 250)
                        outputChatBox("Du hast "..getPlayerName(thePlayer).." wiederbelebt!", sanitaeter, 0, 255, 255)
                        killTimer(revivetimer[thePlayer])
						triggerClientEvent ( thePlayer, "showProgressBarFalse", thePlayer )
						fadeCamera(thePlayer, true)
						setCameraTarget( thePlayer, thePlayer )
                        triggerClientEvent ( thePlayer, "camfix", getRootElement() )
                        triggerClientEvent ( thePlayer, "showInfoText", getRootElement() )
                        triggerClientEvent ( thePlayer, "HudEinblendenMoney", getRootElement() )
                        showPlayerHudComponent ( thePlayer, "radar", true )
                        toggleAllControls ( thePlayer, true )
                        showChat(thePlayer, true)
						laSetElementData ( thePlayer, "heaventime", 0 )
                        bindKey ( thePlayer, "mouse_wheel_up", "down", weaponsup )
                        bindKey ( thePlayer, "mouse_wheel_down", "down", weaponsdown )
                        bindKey ( thePlayer, "g", "down", rein )
                        bindKey ( thePlayer, "enter", "down", eject )
                        bindKey ( thePlayer, "rshift", "down", helidriveby )
                end, 1000, 1)
			end
        end
end
 
function wereDead_func ( player)
 setElementData (player, "wereDead", false)
 end
 
function endfade ( player )
 
        if isElement ( player ) then
                removePedFromVehicle ( player )
                triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu wurdest erledigt und ins Krankenhaus gebracht,\ndu wirst es jedoch überleben!", 7500, 125, 0, 0 )
               
                local x1, y1, z1 = getElementPosition ( player )
                local x2, y2, z2 = 1605.4418945313, 1868.0090332031, 27.071100234985
                local x3, y3, z3 = -2537.9006347656, 618.84533691406, 33.35578918457
                local distToSF = getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 )
                local distToLV = getDistanceBetweenPoints3D ( x1, y1, z1, x3, y3, z3 )
                if distToSF > distToLV then
                        setCameraMatrix ( player, -2537.9006347656, 618.84533691406, 33.35578918457, -2616.6801757813, 619.22979736328, 39.688884735107 )
                else
                        setCameraMatrix ( player, 1605.4418945313, 1868.0090332031, 27.071100234985, 1606.3515625, 1819.0625, 22.315660476685 )
                end
               
                if tonumber ( laGetElementData ( player, "adminlvl" ) ) < 1 then
                        toggleAllControls ( player, false )
                end
                showPlayerHudComponent ( player, "radar", false )
                triggerClientEvent ( player, "showProgressBar", player )
                showChat ( player, true )
        end
end
 
function revive ( player )
 
        if isElement ( player ) then
                toggleAllControls ( player, true )
                triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast es überlebt!\nPass beim nächsten Mal besser auf!", 7500, 0, 125, 0 )
                laSetElementData ( player, "heaventime", 0 )
               
                if laGetElementData ( player, "money" ) >= hospitalcosts then
                        laSetElementData ( player, "money", laGetElementData ( player, "money" ) - hospitalcosts )
                        takePlayerMoney ( player, hospitalcosts )
                else
                        takePlayerMoney ( player, laGetElementData ( player, "money" ) )
                        laSetElementData ( player, "money", 0 )
                end
                triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
                playSoundFrontEnd ( player, 17 )
                RemoteSpawnPlayer ( player )
                showChat ( player, true )
        end
end

function headFixOnSpawn ()
local thePlayer = source
	if(isElement(m_pick[thePlayer])) then
		setElementVisibleTo ( m_blip[thePlayer], getRootElement(), false )
		setElementVisibleTo ( m_mark[thePlayer], getRootElement(), false )
		setElementVisibleTo ( m_pick[thePlayer], getRootElement(), false )
		destroyElement(m_pick[thePlayer])
		destroyElement(m_mark[thePlayer])
		destroyElement(m_blip[thePlayer])
	end
        setPedHeadless ( source, false )
end
addEventHandler ( "onPlayerSpawn", getRootElement(), headFixOnSpawn )
 
function botGekillt ()
 
        if laGetElementData ( source, "bot" ) then
                local x = laGetElementData ( source, "sx" )
                local y = laGetElementData ( source, "sy" )
                local z = laGetElementData ( source, "sz" )
                local dim = laGetElementData ( source, "dim" )
                local int = laGetElementData ( source, "int" )
                local rot = laGetElementData ( source, "rot" )
                local botname = laGetElementData ( source, "botname" )
                local model = getElementModel ( source )
               
                destroyElement ( source )
               
                _G[botname] = createPed ( model, x, y, z )
                setPedRotation ( _G[botname], rot )
                setElementInterior ( _G[botname], int )
                setElementDimension ( _G[botname], dim )
        end
end
addEventHandler ( "onPedWasted", getRootElement(), botGekillt )