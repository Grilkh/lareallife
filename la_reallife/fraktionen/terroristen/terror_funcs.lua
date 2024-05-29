--[[terrorpackage_price = 250

function equip_func ( player )

	local money = tonumber ( laGetElementData ( player, "money" ) )
	if money >= terrorpackage_price then
		local x, y, z = getElementPosition ( player )
		if getDistanceBetweenPoints3D ( x, y, z, -1998.3441162109, -1537.8443603516, 84.67 ) <= 5 then
			if isTerror ( player ) then
				if laGetElementData ( player, "rang" ) >= 2 then
					laSetElementData ( player, "money", money - terrorpackage_price )
					takePlayerMoney ( player, terrorpackage_price )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					
					laSetElementData ( player, "hasBomb", true )
					
					local weapon = 30
					local ammo = 90
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					
					local weapon = 24
					local ammo = 28
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					
					local weapon = 39
					local ammo = 1
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
					
					local weapon = 35
					local ammo = 3
					giveWeapon ( player, weapon, ammo, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
				end
			else
				outputChatBox ( "Du bist kein Terrorist!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht beim Lager!", player, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast zu\nwenig Geld!\nDas Paket kostet\n"..terrorpackage_price.." $!", 5000, 125, 0, 0 )
	end
end
addCommandHandler ( "equip", equip_func )]]--

function arm_func ( player )

	if isTerror ( player ) then
		if isKeyBound ( player, "mouse3", "up", explodeTerror ) then
			outputChatBox ( "Bombe entschärft!", player, 0, 125, 0 )
			laSetElementData ( player, "hasBomb", true )
			setPlayerNametagColor ( player, 200, 200, 200 )
			unbindKey ( player, "mouse3", "up", explodeTerror )
		elseif laGetElementData ( player, "armingBomb" ) then
			outputChatBox ( "Du machst die Bombe bereits scharf!", player, 125, 0, 0 )
		elseif laGetElementData ( player, "hasBomb" ) then
			setTimer ( arm_bomb, 7500, 1, player )
			outputChatBox ( "Bombe wird scharfgemacht...", player, 125, 125, 0 )
			laSetElementData ( player, "armingBomb", true )
		else
			outputChatBox ( "Du hast keine Bombe!", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "arm", arm_func )

function arm_bomb ( player )

	if not isPedDead ( player ) and laGetElementData ( player, "hasBomb" ) then
		bindKey ( player, "mouse3", "up", explodeTerror, player )
		outputChatBox ( "Bombe ist scharf!", player, 0, 125, 0 )
		setPlayerNametagColor ( player, 200, 0, 0 )
		laSetElementData ( player, "hasBomb", false )
	else
		outputChatBox ( "Du hast keine Bombe/bist Tod!", player, 125, 0, 0 )
	end
	laSetElementData ( player, "armingBomb", false )
end

function explodeTerror ( keyPresser )

	local x, y, z = getElementPosition ( keyPresser )
	local rnd = math.random ( 7, 12 )
	createExplosion ( x, y, z, rnd, keyPresser )
	setTimer ( reExplode, 100, 1, keyPresser )
	setPlayerNametagColor ( keyPresser, 200, 200, 200 )
	unbindKey ( keyPresser, "mouse3", "up", explodeTerror )
end

function reExplode ( player )

	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
	setTimer ( reReExplode, math.floor(math.random(200,1000)), 1, player )
end

function reReExplode ( player )

	local veh = getPedOccupiedVehicle ( player )
	local x, y, z = getElementPosition ( player )
	if veh then
		local x, y, z = getElementPosition ( veh )
	end
	local rnd = math.random ( 7, 12 )
	createExplosion ( x, y, z, rnd, player )
end