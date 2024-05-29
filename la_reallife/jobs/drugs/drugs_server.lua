drugjobicon = createPickup ( -2976, 505, -10, 3, 1239, 1000, 0 )
drugfarmicon = createPickup (-2115.60, 0.44, 35.32, 3, 1239, 1000, 0 )

drugsjobiconblip = createBlip (-2112.8369, 0, 34.5, 59, 1, 255, 0, 0, 255, 0, 99999 )
setElementVisibleTo ( drugsjobiconblip, getRootElement(), false )

drugcar1 = createVehicle ( 422, -1854.0776367188, -1678.4970703125, 21.836410522461, 0, 0, 0, "DRUGS" )
toggleVehicleRespawn ( drugcar1, true )
setVehicleRespawnDelay ( drugcar1, 1000*10 )
setVehicleIdleRespawnDelay ( drugcar1, 1000*60 )
setVehicleLocked ( drugcar1, true )
setElementFrozen ( drugcar1, true )
setVehicleDamageProof ( drugcar1, true )

drugboat = createVehicle ( 472, -1854.8267822266, -1490.4476318359, -8.1978225708008, 357.5, 0, 0, "DRUGS" )
setVehicleLocked ( drugboat, true )
setElementFrozen ( drugboat, true )
setVehicleDamageProof ( drugboat, true )

function jobicon_dealer ( player )
	
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nTippe /job, um Dealer zu werden\nDazu brauchst du nichts, aber es ist illegal!", 7500, 200, 200, 0 )
end
addEventHandler ( "onPickupHit", drugjobicon, jobicon_dealer )

function jobicon_drugs ( player )

	triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n  /smokeweed um zu konsumieren,\n  /sellweed um Weed zu verkaufen!", 7500, 200, 200, 0 )
end
addEventHandler ( "onPickupHit", drugfarmicon, jobicon_drugs )

function buydrugs_func ( player, zahl )

	if tonumber ( zahl ) then
		local zahl = math.abs ( tonumber ( zahl ) )
		if laGetElementData ( player, "job" ) == "dealer" then
			if zahl <= 100 then
				if laGetElementData ( player, "money" ) >= zahl*drugprice then
					local jobtime = tonumber ( laGetElementData ( player, "jobtime" ) )
					if jobtime == 0 then
						laSetElementData ( player, "weed", laGetElementData ( player, "weed" ) + zahl )
						laSetElementData ( player, "lastcrime", "drugdealing" )
						laSetElementData ( player, "jobtime", tonumber ( laGetElementData ( player, "jobtime" ) ) + 10 )
						laSetElementData ( player, "money", laGetElementData ( player, "money" ) - zahl*drugprice )
						takePlayerMoney ( player, zahl*drugprice )
						playSoundFrontEnd ( player, 40 )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nun "..laGetElementData ( player, "weed" ).." Gramm Weed dabei!", 7500, 125, 0, 0 )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu musst noch "..jobtime.." Minuten warten,\nbis du wieder Weed kaufen kannst.", 7500, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\n"..zahl.." Gramm Weed kostet "..drugprice*zahl.." $!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu kannst max. 100 Gramm pro 10 Minuten erwerben!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Dealer!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültige Zahl!", 7500, 125, 0, 0 )
	end
end
addEvent ( "buydrugs", true )
addEventHandler ( "buydrugs", getRootElement(), buydrugs_func )

function drugRecieve_func ( weed )

	if source == client then
		if weed == "boom" then
			setTimer ( Boomplane, 3000, 1 )
			setTimer ( Boomplane2, 3500, 1 )
		elseif weed == "boomauto" then
			setTimer ( Boomauto, 3000, 1 )
			setTimer ( Boomauto2, 3500, 1 )
		elseif weed == "cops" then
			if laGetElementData ( source, "wanteds" ) >= 5 then
				laSetElementData ( source, "wanteds", 6 )
			else
				laSetElementData ( source, "wanteds", laGetElementData ( source, "wanteds" ) + 2 )
			end
			setPlayerWantedLevel ( source, laGetElementData ( source, "wanteds" ) )
		else
			laSetElementData ( source, "weed", laGetElementData ( source, "weed" ) + tonumber(weed) )
		end
		setElementVisibleTo ( drugsjobiconblip, source, true )
		--laSetElementData ( source, "jobtime", tonumber ( laGetElementData ( source, "jobtime" ) ) + 20 )
	end
end
addEvent ( "drugRecieve", true )
addEventHandler ( "drugRecieve", getRootElement(), drugRecieve_func )

function Boomplane ()

	createExplosion ( -2301.7600097656+math.random ( -1, 1 ), -2804.5095214844+math.random ( -1, 1 ), 14+math.random ( -.3, .3 ), math.random ( 4, 7 ) )
end

function Boomplane2 ()

	setTimer ( Boomplane, 400, 4 )
end

function Boomauto ()

	createExplosion ( -1854.169+math.random ( -1, 1 ), -1677.076+math.random ( -1, 1 ), 22+math.random ( -.3, .3 ), math.random ( 4, 7 ) )
end

function Boomauto2 ()

	setTimer ( Boomauto, 400, 4 )
end

function giveweed_func ( player, cmd, target, summe )
	
	if player == client or not client then
		if laGetElementData ( player, "job" ) == "dealer" then
			local target = getPlayerFromName ( target )
			local summe = math.abs(math.floor(tonumber(summe)))
			if laGetElementData ( player, "weed" ) >= summe then
				playSoundFrontEnd ( player, 40 )
				laSetElementData ( player, "lastcrime", drugdealing )
				playSoundFrontEnd ( target, 40 )
				laSetElementData ( player, "weed", laGetElementData ( player, "weed" ) - summe )
				laSetElementData ( target, "weed", laGetElementData ( target, "weed" ) + summe )
				outputChatBox ( "Du hast "..getPlayerName(target).." "..summe.." Gramm Weed gegeben!", player, 0, 125, 0 )
				outputChatBox ( "Du hast von "..getPlayerName(player).." "..summe.." Gramm Weed bekommen!", target, 0, 125, 0 )
				meCMD_func ( player, "cmd", "tauscht einige Waren mit "..getPlayerName(target).."!" )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Weed dabei!", 7000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Drogendealer!", 7000, 125, 0, 0 )
		end
	end
end
addEvent ( "giveweed", true )
addEventHandler ( "giveweed", getRootElement(), giveweed_func )
addCommandHandler ( "giveweed", giveweed_func )

function sellweedtoplayer_func ( player, cmd, target, summe, price )

	if laGetElementData ( player, "job" ) == "dealer" then
		local target = getPlayerFromName ( target )
		if tonumber ( summe ) and tonumber ( price ) and target then
			local summe = math.abs(math.floor(tonumber(summe)))
			local price = math.abs(math.floor(tonumber(price)))
			local x1, y1, z1 = getElementPosition ( target )
			local x2, y2, z2 = getElementPosition ( player )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
				if laGetElementData ( player, "weed" )>= summe then
					outputChatBox ( "Dealer "..getPlayerName ( player ).." hat dir "..summe.." Gramm Weed für "..price.."$ angeboten. Tippe /acceptweed zum annehmen.", target, 0, 100, 200 )
					outputChatBox ( "Du hast "..getPlayerName(target).." "..summe.." Gramm Weed für "..price.."$ angeboten.", player, 0, 100, 200 )
					laSetElementData ( target, "weedseller", getPlayerName ( player ) )
					laSetElementData ( target, "weedmenge", summe )
					laSetElementData ( target, "weedpreis", price )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genügend Weed!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültige Angaben!\nTippe /sellweed [Name] [Menge] [Preis]!", 7500, 200, 200, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Dealer!", 7500, 125, 0, 0 )
	end
end
addCommandHandler ( "sellweed", sellweedtoplayer_func )

function acceptweedsell_func ( player )
	
	local tname = laGetElementData ( player, "weedseller" )
	local target = getPlayerFromName ( tname )
	if isElement ( target ) and isElement ( player ) then
		local summeneu = laGetElementData ( player, "weedmenge" )
		local priceneu = laGetElementData ( player, "weedpreis" )
		local x1, y1, z1 = getElementPosition ( target )
		local x2, y2, z2 = getElementPosition ( player )
		local money = laGetElementData ( player, "money" )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
				if money >= priceneu then
					if laGetElementData ( target, "weed" ) >= summeneu then
						laSetElementData ( player, "money", money - priceneu )
						takePlayerMoney ( player, priceneu )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						playSoundFrontEnd ( player, 40 )
						laSetElementData ( target, "money", laGetElementData ( target, "money" ) + priceneu )
						givePlayerMoney ( target, priceneu )
						triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
						playSoundFrontEnd ( target, 40 )
						setElementData ( target, "weed", laGetElementData ( target, "weed" ) - summeneu )
						setElementData ( player, "weed", laGetElementData ( player, "weed" ) + summeneu )
						--laSetElementData ( player, "jobtime", jobtime + 3 )
						laSetElementData ( player, "weedseller", "" )
						laSetElementData ( player, "weedmenge", "" )
						laSetElementData ( player, "weedpreis", "" )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast das Weed gekauft!", 7500, 125, 0, 0 )
						triggerClientEvent ( target, "infobox_start", getRootElement(), "\n\nDu hast das Weed verkauft!", 7500, 125, 0, 0 )
						meCMD_func ( player, "cmd", "tauscht einige Waren mit "..getPlayerName(target).."!" )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Dealer hat zu wenig Weed!", 7500, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7500, 125, 0, 0 )
				end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "acceptweed", acceptweedsell_func )


function givekoks_func ( player, cmd, target, summe )
	
	if player == client or not client then
		if isWatts (player) then
			local target = getPlayerFromName ( target )
			local summe = math.abs(math.floor(tonumber(summe)))
			if laGetElementData ( player, "koks" ) >= summe then
				playSoundFrontEnd ( player, 40 )
				laSetElementData ( player, "lastcrime", drugdealing )
				playSoundFrontEnd ( target, 40 )
				laSetElementData ( player, "koks", laGetElementData ( player, "koks" ) - summe )
				laSetElementData ( target, "koks", laGetElementData ( target, "koks" ) + summe )
				outputChatBox ( "Du hast "..getPlayerName(target).." "..summe.." Gramm Kokain gegeben!", player, 0, 125, 0 )
				outputChatBox ( "Du hast von "..getPlayerName(player).." "..summe.." Gramm Kokain bekommen!", target, 0, 125, 0 )
				meCMD_func ( player, "cmd", "tauscht einige Waren mit "..getPlayerName(target).."!" )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Kokain dabei!", 7000, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Watts Soldiers!", 7000, 125, 0, 0 )
		end
	end
end
addEvent ( "givekoks", true )
addEventHandler ( "givekoks", getRootElement(), givekoks_func )
addCommandHandler ( "givekoks", givekoks_func )


function sellkokstoplayer_func ( player, cmd, target, summe, price )

	if isWatts (player) then
		local target = getPlayerFromName ( target )
		if tonumber ( summe ) and tonumber ( price ) and target then
			local summe = math.abs(math.floor(tonumber(summe)))
			local price = math.abs(math.floor(tonumber(price)))
			local x1, y1, z1 = getElementPosition ( target )
			local x2, y2, z2 = getElementPosition ( player )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
				if laGetElementData ( player, "koks" ) >= summe then
					outputChatBox ( "Watts Soldier "..getPlayerName ( player ).." hat dir "..summe.." Gramm Kokain für "..price.."$ angeboten. Tippe /acceptkoks zum annehmen.", target, 0, 100, 200 )
					outputChatBox ( "Du hast "..getPlayerName(target).." "..summe.." Gramm Kokain für "..price.."$ angeboten.", player, 0, 100, 200 )
					laSetElementData ( target, "koksseller", getPlayerName ( player ) )
					laSetElementData ( target, "koksmenge", summe )
					laSetElementData ( target, "kokspreis", price )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genügend Kokain!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nUngültige Angaben!\nTippe /sellkoks [Name] [Menge] [Preis]!", 7500, 200, 200, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein Watts Soldiers!", 7000, 125, 0, 0 )
	end
end
addCommandHandler ( "sellkoks", sellkokstoplayer_func )

function acceptkokssell_func ( player )
	
	local tname = laGetElementData ( player, "koksseller" )
	local target = getPlayerFromName ( tname )
	if isElement ( target ) and isElement ( player ) then
		local summeneu = laGetElementData ( player, "koksmenge" )
		local priceneu = laGetElementData ( player, "kokspreis" )
		local x1, y1, z1 = getElementPosition ( target )
		local x2, y2, z2 = getElementPosition ( player )
		local money = laGetElementData ( player, "money" )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
				if money >= priceneu then
					if laGetElementData ( target, "koks" ) >= summeneu then
						laSetElementData ( player, "money", money - priceneu )
						takePlayerMoney ( player, priceneu )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						playSoundFrontEnd ( player, 40 )
						laSetElementData ( target, "money", laGetElementData ( target, "money" ) + priceneu )
						givePlayerMoney ( target, priceneu )
						triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
						playSoundFrontEnd ( target, 40 )
						setElementData ( target, "koks", laGetElementData ( target, "koks" ) - summeneu )
						setElementData ( player, "koks", laGetElementData ( player, "koks" ) + summeneu )
						--laSetElementData ( player, "jobtime", jobtime + 3 )
						laSetElementData ( player, "koksseller", "" )
						laSetElementData ( player, "koksmenge", "" )
						laSetElementData ( player, "kokspreis", "" )
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast das Kokain gekauft!", 7500, 125, 0, 0 )
						triggerClientEvent ( target, "infobox_start", getRootElement(), "\n\nDu hast das Kokain verkauft!", 7500, 125, 0, 0 )
						meCMD_func ( player, "cmd", "tauscht einige Waren mit "..getPlayerName(target).."!" )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDer Watts Soldier hat zu wenig Kokain!", 7500, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu wenig Geld!", 7500, 125, 0, 0 )
				end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu weit weg!", 7500, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "acceptkoks", acceptkokssell_func )

local koksamount = 250
local firstrelease = false
function koksSellDealerJob_func ( player, cmd, amount )
local x, y, z = getElementPosition(player)
	if getDistanceBetweenPoints3D (x, y, z, -1088.948, -1613.681, 76.367) <= 10 then
		if tonumber(amount) then
			local amount = math.abs ( tonumber ( amount ) )
			local koks = laGetElementData ( player, "koks" )
			if koks >= amount then
				if amount <= koksamount then
					laSetElementData ( player, "koks", koks - amount )
					givePlayerMoney ( player, "money", amount * 100 )
					laSetElementData ( player, "money", laGetElementData ( player, "money" ) + amount * 100 )
					outputChatBox ( "Du hast für "..amount.." Gramm Kokain "..(amount*100).."$ bekommen!", player, 0, 150, 0 )
					koksamount = koksamount - amount
					if firstrelease == false then
						firstrelease = true
						setTimer (firstreleasereset, 1800000, 1)
					end
				else
					if koksamount > 0 then
						outputChatBox ( "Diese Stunde kaufe ich nur noch "..koksamount.."g.", player, 150, 0, 0 )
					else
						outputChatBox ( "Diese Stunde kaufe ich kein Kokain mehr.", player, 150, 0, 0 )
					end
				end
			else
				outputChatBox ( "Du hast nicht so viel Kokain.", player, 150, 0, 0 )
			end
		else
			outputChatBox ( "Verwende /koksverkauf [Anzahl]", player, 150, 0, 0 )
		end
	else
		outputChatBox ( "Du bist zu weit entfernt!", player, 150, 0, 0 )
	end
end
addCommandHandler ( "koksverkauf", koksSellDealerJob_func)

function firstreleasereset()
firstrelease = false
koksamount = 100
end

function BuyMowerDrugServer_func ( player )

	if player == client then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		if money >= 1000 then
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			carbuy ( player, 1000, 572, -2122.803, 0.0, 35.20, 0, 0, 180 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld.\nEin Rasenmäher kostet 1000$!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "BuyMowerDrugServer", true )
addEventHandler ( "BuyMowerDrugServer", getRootElement(), BuyMowerDrugServer_func )

function BuyShovelDrugServer_func ( player )
	if player == client then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		if money >= 25 then
			laSetElementData ( player, "money", money - 25 )
			takePlayerMoney ( player, 25 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			local weapon = 6
			local ammo = 1
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld.\nEine Schaufel kostet 25 $!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "BuyShovelDrugServer", true )
addEventHandler ( "BuyShovelDrugServer", getRootElement(), BuyShovelDrugServer_func )

function Buy2SamenServer_func ( player )

	if player == client then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		local seeds = tonumber ( laGetElementData ( player, "flowerseeds" ) )
		if money >= 100 then
			laSetElementData ( player, "money", money - 100 )
			takePlayerMoney ( player, 100 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			
			laSetElementData ( player, "flowerseeds", seeds + 2 )
			
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n2 Samen gekauft.\nTippe /grow weedum sie anzupflanzen!", 7500, 0, 200, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld.\nHanfsamen kosten 100$!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "Buy2SamenServer", true )
addEventHandler ( "Buy2SamenServer", getRootElement(), Buy2SamenServer_func )

function Buy20SamenServer_func ( player )

	if player == client then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		local seeds = tonumber ( laGetElementData ( player, "flowerseeds" ) )
		if money >= 1000 then
			laSetElementData ( player, "money", money - 1000 )
			takePlayerMoney ( player, 1000 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			
			laSetElementData ( player, "flowerseeds", seeds + 20 )
			
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\n20 Samen gekauft.\nTippe /grow weed um sie anzupflanzen!", 7500, 0, 200, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld.\nDie Hanfsamen kosten 1000$!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "Buy20SamenServer", true )
addEventHandler ( "Buy20SamenServer", getRootElement(), Buy20SamenServer_func )


function drugsSellDealerJob_func ( player, amount )

	if player == client then
		local amount = math.abs ( tonumber ( amount ) )
		local weed = laGetElementData ( player, "weed" )
		if weed >= amount then
			laSetElementData ( player, "weed", weed - amount )
			givePlayerMoney ( player, "money", amount * 7 )
			laSetElementData ( player, "money", laGetElementData ( player, "money" ) + amount * 7 )
			outputChatBox ( "Du hast für "..amount.." Gramm Weed "..(amount*7).."$ bekommen!", player, 0, 125, 0 )
		else
			outputChatBox ( "Du hast nicht soviel Weed", player, 125, 0, 0 )
		end
	end
end
addEvent ( "drugsSellDealerJob", true )
addEventHandler ( "drugsSellDealerJob", getRootElement(), drugsSellDealerJob_func )