wdealerjobicon2 = createPickup ( -2445.599609375, -46.69921875, 34.099998474121, 3, 1239, 100, 0 )

--[[function wdealerjobicon2Hit ( player )
	
	if isCompton ( player ) then
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTippe /mats [10/25/50/100], um dir Materialien zu kaufen!", 7000, 200, 200, 0 )
		outputChatBox ( "10 = 150$, 25 = 300$, 50 = 500$, 100 = 800$", player, 200, 200, 0 )
	else
		outputChatBox ( "Nur für Mitglieder der Compton Families!", player, 200, 0, 0 )
	end
end
addEventHandler ( "onPickupHit", wdealerjobicon2, wdealerjobicon2Hit )]]--

function sellgun_func ( player, cmd, target, ggst, ammo )
	if target then
		local target = getPlayerFromName ( target )
		if target then
				local tx, ty, tz = getElementPosition ( target )
				local x, y, z = getElementPosition ( player )
				if getDistanceBetweenPoints3D ( tx, ty, tz, x, y, z ) < 10 then
					mats = tonumber ( laGetElementData ( player, "mats" ) )
					laSetElementData ( player, "lastcrime", "mats" )
					if isCompton ( player ) then
						if ggst == "schlagring" then
							if mats >= 2 then
								laSetElementData ( player, "mats", mats - 2 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 1
								local ammo = 1
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "9mmsd" then
							if mats >= 8 then
								laSetElementData ( player, "mats", mats - 8 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 23
								local ammo = 85
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "9mm" then
							if mats >= 6 then
								laSetElementData ( player, "mats", mats - 6 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 22
								local ammo = 85
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "eagle" then
							if mats >= 15 then
								laSetElementData ( player, "mats", mats - 15 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 24
								local ammo = 21
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "shotgun" then
							if mats >= 10 then
								laSetElementData ( player, "mats", mats - 10 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 25
								local ammo = 25
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "mp5" then
							if mats >= 15 then
								laSetElementData ( player, "mats", mats - 15 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 29
								local ammo = 150
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "messer" then
							if mats >= 3 then
								laSetElementData ( player, "mats", mats - 3 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 4
								local ammo = 1
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "gewehr" then
							if mats >= 10 then
								laSetElementData ( player, "mats", mats - 10 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 33
								local ammo = 25
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "ak47" then
							if mats >= 20 then
								laSetElementData ( player, "mats", mats - 20 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 30
								local ammo = 150
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "uzi" then
							if mats >= 25 then
								laSetElementData ( player, "mats", mats - 25 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 28
								local ammo = 100
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "tec9" then
							if mats >= 25 then
								laSetElementData ( player, "mats", mats - 25 )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 32
								local ammo = 100
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end

						--[[elseif ggst == "mats" then
							if not ammo then ammo = 5 else ammo = tonumber ( ammo ) end
							if mats >= ammo then
								laSetElementData ( player, "mats", mats - ammo )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								laSetElementData ( target, "mats", tonumber ( laGetElementData ( target, "mats" ) ) + ammo )
								outputChatBox ( "Du hast soeben "..ammo.." Materialien erhalten!", target, 0, 125, 0 )
								outputChatBox ( "Du hast soeben "..ammo.." Materialien an "..getPlayerName(target).." gegeben!", player, 0, 125, 0 )
							else
								outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 )
							end]]
						else
							outputChatBox ( "Tippe /sellgun [Name] [Ware], um zu verkaufen.", player, 100, 100, 200 )
							outputChatBox ( "Waffen: messer | 3 Mats, schlagring | 2 Mats", player, 200, 200, 0 )
							outputChatBox ( "9mm | 6 Mats, 9mmsd | 8 Mats, eagle | 15 Mats", player, 200, 200, 0 )
							outputChatBox ( "shotgun | 10 Mats, gewehr | 10 Mats", player, 200, 200, 0 )
							outputChatBox ( "mp5 | 15 Mats, ak47 | 25 Mats", player, 200, 200, 0 )
							outputChatBox ( "uzi | 20 Mats, tec9 | 20 Mats", player, 150, 200, 0 )
						end
					else
						if ggst == "schlagring" then
							if mats >= 2 then
								laSetElementData ( player, "mats", mats - 2 )
								if math.random ( 1, 2 ) == 1 then
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 1
								local ammo = 1
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								else outputChatBox ( "Fehlgeschlagen!", player, 200, 0, 0 ) end
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "9mmsd" then
							if mats >= 8 then
								laSetElementData ( player, "mats", mats - 8 )
								if math.random ( 1, 2 ) == 1 then
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 23
								local ammo = 85
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								else outputChatBox ( "Fehlgeschlagen!", player, 200, 0, 0 ) end
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "9mm" then
							if mats >= 6 then
								laSetElementData ( player, "mats", mats - 6 )
								if math.random ( 1, 2 ) == 1 then
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 22
								local ammo = 85
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								else outputChatBox ( "Fehlgeschlagen!", player, 200, 0, 0 ) end
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "eagle" then
							if mats >= 15 then
								laSetElementData ( player, "mats", mats - 15 )
								if math.random ( 1, 2 ) == 1 then
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 24
								local ammo = 21
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								else outputChatBox ( "Fehlgeschlagen!", player, 200, 0, 0 ) end
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "shotgun" then
							if mats >= 10 then
								laSetElementData ( player, "mats", mats - 10 )
								if math.random ( 1, 2 ) == 1 then
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 25
								local ammo = 25
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								else outputChatBox ( "Fehlgeschlagen!", player, 200, 0, 0 ) end
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "mp5" then
							if mats >= 15 then
								laSetElementData ( player, "mats", mats - 15 )
								if math.random ( 1, 2 ) == 1 then
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 29
								local ammo = 150
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								else outputChatBox ( "Fehlgeschlagen!", player, 200, 0, 0 ) end
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "messer" then
							if mats >= 3 then
								laSetElementData ( player, "mats", mats - 3 )
								if math.random ( 1, 2 ) == 1 then
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 4
								local ammo = 1
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								else outputChatBox ( "Fehlgeschlagen!", player, 200, 0, 0 ) end
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						elseif ggst == "gewehr" then
							if mats >= 10 then
								laSetElementData ( player, "mats", mats - 10 )
								if math.random ( 1, 2 ) == 1 then
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 33
								local ammo = 25
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								else outputChatBox ( "Fehlgeschlagen!", player, 200, 0, 0 ) end
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end
						--[[elseif ggst == "ak47" then
							if mats >= 20 then
								laSetElementData ( player, "mats", mats - 20 )
								if math.random ( 1, 2 ) == 1 then
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								local weapon = 30
								local ammo = 150
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								giveWeapon ( target, weapon, ammo, true )
								triggerClientEvent ( target, "sec_gun_give", getRootElement(), weapon, ammo )
								else outputChatBox ( "Fehlgeschlagen!", player, 200, 0, 0 ) end
							else outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 ) end]]--
						--[[elseif ggst == "mats" then
							if not ammo then ammo = 5 else ammo = tonumber ( ammo ) end
							if mats >= ammo then
								laSetElementData ( player, "mats", mats - ammo )
								playSoundFrontEnd ( player, 40 )
								playSoundFrontEnd ( target, 40 )
								
								laSetElementData ( target, "mats", tonumber ( laGetElementData ( target, "mats" ) ) + ammo )
								outputChatBox ( "Du hast soeben "..ammo.." Materialien erhalten!", target, 0, 125, 0 )
								outputChatBox ( "Du hast soeben "..ammo.." Materialien an "..getPlayerName(target).." gegeben!", player, 0, 125, 0 )
							else
								outputChatBox ( "Du hast nicht genug Mats!", player, 200, 200, 0 )
							end]]
						else
							outputChatBox ( "Tippe /sellgun [Name] [Ware], um zu verkaufen.", player, 100, 100, 200 )
							outputChatBox ( "Da du keine Erfahrung hast, brauchst du eventuell mehrere Versuche!", player, 100, 100, 200 )
							outputChatBox ( "Waffen: messer | 3 Mats, schlagring | 2 Mats", player, 200, 200, 0 )
							outputChatBox ( "9mm | 6 Mats, 9mmsd | 8 Mats", player, 200, 200, 0 )
							outputChatBox ( "shotgun | 10 Mats, gewehr | 10 Mats", player, 200, 200, 0 )
							outputChatBox ( "eagle | 15 Mats, mp5 | 15 Mats", player, 200, 200, 0 )
						end
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 7000, 125, 0, 0 )
				end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Spieler ist nicht online!", 7000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nVerwende: /sellgun [Ziel] [Waffe]", 7000, 125, 0, 0 )
	end
end
addEvent ( "sellgun", true )
addEventHandler ( "sellgun", getRootElement(), sellgun_func )
addCommandHandler ( "sellgun", sellgun_func )

function gunhelp_func ( player )
	
if isCompton ( player ) then
	outputChatBox ( "Tippe /sellgun [Name] [Ware], um zu verkaufen.", player, 100, 100, 200 )
	outputChatBox ( "Waffen: messer | 3 Mats, schlagring | 2 Mats", player, 200, 200, 0 )
	outputChatBox ( "9mm | 6 Mats, 9mmsd | 8 Mats, eagle | 15 Mats", player, 200, 200, 0 )
	outputChatBox ( "shotgun | 10 Mats, gewehr | 10 Mats", player, 200, 200, 0 )
	outputChatBox ( "mp5 | 15 Mats, ak47 | 25 Mats", player, 200, 200, 0 )
	outputChatBox ( "uzi | 20 Mats, tec9 | 20 Mats", player, 150, 200, 0 )
else
	outputChatBox ( "Tippe /sellgun [Name] [Ware], um zu verkaufen.", player, 100, 100, 200 )
	outputChatBox ( "Da du keine Erfahrung hast, brauchst du eventuell mehrere Versuche!", player, 100, 100, 200 )
	outputChatBox ( "Waffen: messer | 3 Mats, schlagring | 2 Mats", player, 200, 200, 0 )
	outputChatBox ( "9mm | 6 Mats, 9mmsd | 8 Mats", player, 200, 200, 0 )
	outputChatBox ( "shotgun | 10 Mats, gewehr | 10 Mats", player, 200, 200, 0 )
	outputChatBox ( "eagle | 15 Mats, mp5 | 15 Mats", player, 200, 200, 0 )
end
end
addCommandHandler ( "gunhelp", gunhelp_func )

--Brass Knuckles 1
--Knife 4
--Pistol 22
--SD 23
--Deagle 24
--Shotgun 25
--MP5 29


--Uzi 28
--TEC-9 32

--AK 30
--Rifle 33

--Sniper 34
--Rocket Launcher 35
--

function givemats_func ( player, cmd, target, summe )
	
	if player == client or not client then
		if isCompton (player) then
			local target = getPlayerFromName ( target )
			local summe = math.abs(math.floor(tonumber(summe)))
			if laGetElementData ( player, "mats" ) >= summe then
				playSoundFrontEnd ( player, 40 )
				laSetElementData ( player, "lastcrime", matsdealing )
				playSoundFrontEnd ( target, 40 )
				laSetElementData ( player, "mats", laGetElementData ( player, "mats" ) - summe )
				laSetElementData ( target, "mats", laGetElementData ( target, "mats" ) + summe )
				outputChatBox ( "Du hast "..getPlayerName(target).." "..summe.." Materialien gegeben!", player, 0, 125, 0 )
				outputChatBox ( "Du hast von "..getPlayerName(player).." "..summe.." Materialien bekommen!", target, 0, 125, 0 )
				meCMD_func ( player, "cmd", "tauscht einige Waren mit "..getPlayerName(target).."!" )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Materialien dabei!", 7000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Compton!", 7000, 125, 0, 0 )
		end
	end
end
addEvent ( "givemats", true )
addEventHandler ( "givemats", getRootElement(), givemats_func )
addCommandHandler ( "givemats", givemats_func )


function sellmatstoplayer_func ( player, cmd, target, summe, price )

	if isCompton (player) then
		local target = getPlayerFromName ( target )
		if tonumber ( summe ) and tonumber ( price ) and target then
			local summe = math.abs(math.floor(tonumber(summe)))
			local price = math.abs(math.floor(tonumber(price)))
			local x1, y1, z1 = getElementPosition ( target )
			local x2, y2, z2 = getElementPosition ( player )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
				if laGetElementData ( player, "mats" ) >= summe then
					outputChatBox ( "Compton "..getPlayerName ( player ).." hat dir "..summe.." Materialien für "..price.."$ angeboten. Tippe /acceptmats zum annehmen.", target, 0, 100, 200 )
					outputChatBox ( "Du hast "..getPlayerName(target).." "..summe.." Materialien für "..price.."$ angeboten.", player, 0, 100, 200 )
					laSetElementData ( target, "matsseller", getPlayerName ( player ) )
					laSetElementData ( target, "matsmenge", summe )
					laSetElementData ( target, "matspreis", price )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genügend Materialien!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültige Angaben!\nTippe /sellmats [Name] [Menge] [Preis]!", 7500, 200, 200, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Compton!", 7000, 125, 0, 0 )
	end
end
addCommandHandler ( "sellmats", sellmatstoplayer_func )

function acceptmatssell_func ( player )
	
	local tname = laGetElementData ( player, "matsseller" )
	local target = getPlayerFromName ( tname )
	if isElement ( target ) and isElement ( player ) then
		local summeneu = laGetElementData ( player, "matsmenge" )
		local priceneu = laGetElementData ( player, "matspreis" )
		local x1, y1, z1 = getElementPosition ( target )
		local x2, y2, z2 = getElementPosition ( player )
		local money = laGetElementData ( player, "money" )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
				if money >= priceneu then
					if laGetElementData ( target, "mats" ) >= summeneu then
						laSetElementData ( player, "money", money - priceneu )
						takePlayerMoney ( player, priceneu )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						playSoundFrontEnd ( player, 40 )
						laSetElementData ( target, "money", laGetElementData ( target, "money" ) + priceneu )
						givePlayerMoney ( target, priceneu )
						triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
						playSoundFrontEnd ( target, 40 )
						setElementData ( target, "mats", laGetElementData ( target, "mats" ) - summeneu )
						setElementData ( player, "mats", laGetElementData ( player, "mats" ) + summeneu )
						--laSetElementData ( player, "jobtime", jobtime + 3 )
						laSetElementData ( player, "matsseller", "" )
						laSetElementData ( player, "matsmenge", "" )
						laSetElementData ( player, "matspreis", "" )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast das Materialien gekauft!", 7500, 125, 0, 0 )
						triggerClientEvent ( target, "infobox_start", getRootElement(), "\n\nDu hast das Materialien verkauft!", 7500, 125, 0, 0 )
						meCMD_func ( player, "cmd", "tauscht einige Waren mit "..getPlayerName(target).."!" )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Compton hat zu wenig Materialien!", 7500, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7500, 125, 0, 0 )
				end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "acceptmats", acceptmatssell_func )


--[[function buymats_func ( player )
	
	if laGetElementData ( player, "job" ) == "wdealer" then
		if laGetElementData ( player, "money" ) >= 500 then
			if tonumber ( laGetElementData ( player, "jobtime" ) ) == 0 then
				local x, y, z = getElementPosition ( player )
				if getDistanceBetweenPoints3D ( -2627.5083007813, 209.36631774902, 4.1959328651428, x, y, z ) < 10 then
					laSetElementData ( player, "lastcrime", "mats" )
					laSetElementData ( player, "mats", tonumber ( laGetElementData ( player, "mats" ) ) + 20 )
					laSetElementData ( player, "jobtime", 5 )
					laSetElementData ( player, "money", laGetElementData(player,"money")-500 )
					takePlayerMoney ( player, 500 )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 7000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst noch "..laGetElementData(player,"jobtime").." Minuten warten!", 7000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7000, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Waffendealer!", 7000, 125, 0, 0 )
	end
end
addCommandHandler ( "buymats", buymats_func )]]--


--[[function mats_func ( player, cmd, add )

if not add then
	infobox ( player, "\n\nVerwende: /mats [10/25/50/100]!", 5000, 125, 0, 0 )
else
	if isCompton ( player ) then
			if tonumber ( laGetElementData ( player, "jobtime" ) ) == 0 then
				local x, y, z = getElementPosition ( player )
				if getDistanceBetweenPoints3D ( -2445.599609375, -46.69921875, 34.099998474121, x, y, z ) < 10 then
					if add == "10" then
						if laGetElementData ( player, "money" ) >= 150 then
							laSetElementData ( player, "lastcrime", "mats" )
							laSetElementData ( player, "mats", tonumber ( laGetElementData ( player, "mats" ) ) + 10 )
							laSetElementData ( player, "jobtime", 1 )
							laSetElementData ( player, "money", laGetElementData(player,"money")-150 )
							takePlayerMoney ( player, 150 )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7000, 125, 0, 0 )
						end
					elseif add == "25" then
						if laGetElementData ( player, "money" ) >= 300 then
							laSetElementData ( player, "lastcrime", "mats" )
							laSetElementData ( player, "mats", tonumber ( laGetElementData ( player, "mats" ) ) + 25 )
							laSetElementData ( player, "jobtime", 2 )
							laSetElementData ( player, "money", laGetElementData(player,"money")-300 )
							takePlayerMoney ( player, 300 )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7000, 125, 0, 0 )
						end
					elseif add == "50" then
						if laGetElementData ( player, "money" ) >= 500 then
							laSetElementData ( player, "lastcrime", "mats" )
							laSetElementData ( player, "mats", tonumber ( laGetElementData ( player, "mats" ) ) + 50 )
							laSetElementData ( player, "jobtime", 5 )
							laSetElementData ( player, "money", laGetElementData(player,"money")-500 )
							takePlayerMoney ( player, 500 )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7000, 125, 0, 0 )
						end
					elseif add == "100" then
						if laGetElementData ( player, "money" ) >= 800 then
							laSetElementData ( player, "lastcrime", "mats" )
							laSetElementData ( player, "mats", tonumber ( laGetElementData ( player, "mats" ) ) + 100 )
							laSetElementData ( player, "jobtime", 10 )
							laSetElementData ( player, "money", laGetElementData(player,"money")-800 )
							takePlayerMoney ( player, 800 )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7000, 125, 0, 0 )
						end
					else
						infobox ( player, "\n\nVerwende: /mats [10/25/50/100]!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7000, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst noch\n"..laGetElementData(player,"jobtime").." Minuten warten!", 7000, 125, 0, 0 )
			end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Mitglied der Compton Families!", 7000, 125, 0, 0 )
	end
end
end
addCommandHandler ( "mats", mats_func )]]--