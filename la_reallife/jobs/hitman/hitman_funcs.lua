mincontract = 500

function arm_func ( player )

	if laGetElementData ( player, "job" ) == "hitman" then
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = getElementPosition ( hitmanjobicon )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
			if laGetElementData ( player, "money" ) >= 300 then
				takePlayerSaveMoney ( player, 300 )
				giveWeapon ( player, 24, 56, true )
				triggerClientEvent ( player, "sec_gun_give", getRootElement(), 24, 56 )
				giveWeapon ( player, 25, 25, true )
				triggerClientEvent ( player, "sec_gun_give", getRootElement(), 25, 25)
				giveWeapon ( player, 34, 10, true )
				triggerClientEvent ( player, "sec_gun_give", getRootElement(), 34, 10 )
			else
				outputChatBox ( "Du hast nicht genug Geld - ein Paket kostet 100$!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist an einer ungültigen Stelle!", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "arm", arm_func )

function contract_func ( player, cmd, name, geld )

	local target = getPlayerFromName ( name )
	if target and laGetElementData ( target, "loggedin" ) then
		local geld = tonumber ( geld )
		if geld then
			local pmoney = tonumber ( laGetElementData ( player, "money" ) )
			if pmoney >= geld then
				if geld >= mincontract then
					laSetElementData ( player, "money", pmoney - geld )
					takePlayerMoney ( player, geld )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					laSetElementData ( target, "contract", tonumber ( laGetElementData ( target, "contract" ) ) + geld )
					outputChatBox ( "Du hast "..geld.." $ Kopfgeld auf "..name.." ausgesetzt - ein Hitman wird sich bald um ihn kümmern...", player, 0, 125, 0 )
				else
					outputChatBox ( "Bitte setze mindestens "..mincontract.." $ als Belohnung aus!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du hast nicht genug Geld, um einen Mord in Auftrag zu geben.", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Ungültige Summe!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Der Spieler existiert nicht / ist offline!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "contract", contract_func )

function contracts_func ( player )

	if isHitman ( player ) then
		outputChatBox ( "Auftraege ( Die ersten 3 werden angezeigt ):", player, 200, 200, 20 )
		for id, playeritem in ipairs(getElementsByType("player")) do
			if laGetElementData ( player, "loggedin" ) == 1 then
				local contract = tonumber ( laGetElementData ( playeritem, "contract" ) )
				local i = 0
				if contract >= mincontract then
					local i = i + 1
					outputChatBox ( getPlayerName ( playeritem )..", Belohnung: "..contract, player, 200, 200, 20 )
					if i == 3 then
						break
					end
				end
			end
		end
	else
		outputChatBox ( "Du bist kein Hitman!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "contracts", contracts_func )