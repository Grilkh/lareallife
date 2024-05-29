function repair_func ( player, cmd, target, price )

	if laGetElementData ( player, "job" ) == "mechaniker" then
		if tonumber ( price ) and getPlayerFromName ( target ) then
			local jobtime = tonumber ( laGetElementData ( player, "jobtime" ) )
			if jobtime == 0 then
				local price = math.abs ( math.floor ( tonumber ( price ) ) )
				local target = getPlayerFromName ( target )
				outputChatBox ( "Mechaniker "..getPlayerName ( player ).." hat dir angeboten, dein Auto für "..price.." $ zu reparieren. Tippe /acceptrepair zum annehmen.", target, 0, 100, 200 )
				outputChatBox ( "Du hast "..getPlayerName(target).." angeboten, sein Auto für "..price.." $ zu reparieren.", player, 0, 100, 200 )
				laSetElementData ( target, "mechaniker", getPlayerName ( player ) )
				laSetElementData ( target, "mechanikerpreis", price )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu musst noch\n"..jobtime.." Minuten warten,\nbis du wieder\nreparieren kannst!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngültige Angaben!\nTippe /repaircar [Name]\n[Preis], um ein\nFahrzeug zu re-\nparieren.", 7500, 200, 200, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein\nMechaniker!", 7500, 125, 0, 0 )
	end
end
--addCommandHandler ( "repaircar", repair_func )

function acceptrepair_func ( player )
	
	local tname = laGetElementData ( player, "mechaniker" )
	local target = getPlayerFromName ( tname )
	if isElement ( target ) and isElement ( player ) then
		local price = laGetElementData ( player, "mechanikerpreis" )
		local x1, y1, z1 = getElementPosition ( target )
		local x2, y2, z2 = getElementPosition ( player )
		local money = laGetElementData ( player, "money" )
		local jobtime = tonumber ( laGetElementData ( target, "jobtime" ) )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
			if getPedOccupiedVehicle ( player ) then
				if money >= price then
					if jobtime == 0 then
						laSetElementData ( player, "money", money - price )
						takePlayerMoney ( player, price )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						playSoundFrontEnd ( player, 46 )
						laSetElementData ( target, "money", laGetElementData ( target, "money" ) + price )
						givePlayerMoney ( target, price )
						triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
						playSoundFrontEnd ( target, 40 )
						local veh = getPedOccupiedVehicle ( player )
						local carhealth = getElementHealth ( veh )
						fixVehicle ( veh )
						setElementHealth ( veh, carhealth + 200 )
						if getElementHealth ( veh ) > 1000 then
							setElementHealth ( veh, 1000 )
						end
						laSetElementData ( player, "jobtime", jobtime + 3 )
						laSetElementData ( player, "mechaniker", "" )
						laSetElementData ( player, "mechanikerpreis", "" )
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Mechaniker kann\nnoch nicht wieder\nreparieren!", 7500, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu\nwenig Geld!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist in\nkeinem Fahrzeug!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7500, 125, 0, 0 )
		end
	end
end
--addCommandHandler ( "acceptrepair", acceptrepair_func )

function tunen_func ( player, cmd, target, price )

	if laGetElementData ( player, "job" ) == "mechaniker" then
		if tonumber ( price ) and getPlayerFromName ( target ) then
			local price = math.abs ( math.floor ( tonumber ( price ) ) )
			local target = getPlayerFromName ( target )
			outputChatBox ( "Mechaniker "..getPlayerName ( player ).." hat dir angeboten, dein Auto für "..price.." $ zu tunen. Tippe /accepttune zum annehmen.", target, 0, 100, 200 )
			outputChatBox ( "Du hast "..getPlayerName(target).." angeboten, sein Auto für "..price.." $ zu tunen.", player, 0, 100, 200 )
			laSetElementData ( target, "mechanikert", getPlayerName ( player ) )
			laSetElementData ( target, "mechanikertpreis", price )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nUngültige Angaben!\nTippe /tunen [Name]\n[Preis], um ein\nFahrzeug zu tun-\nen", 7500, 200, 200, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist kein\nMechaniker!", 7500, 125, 0, 0 )
	end
end
--addCommandHandler ( "tunen", tunen_func )

function accepttune_func ( player )
	
	local tname = laGetElementData ( player, "mechanikert" )
	local target = getPlayerFromName ( tname )
	local price = tonumber ( laGetElementData ( player, "mechanikertpreis" ) )
	local x1, y1, z1 = getElementPosition ( target )
	local x2, y2, z2 = getElementPosition ( player )
	local money = laGetElementData ( player, "money" )
	local jobtime = tonumber ( laGetElementData ( target, "jobtime" ) )
	local veh = getPedOccupiedVehicle ( player )
	if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
		if getPedOccupiedVehicle ( player ) then
			if money >= price then
				if jobtime == 0 then
					laSetElementData ( player, "money", money - price )
					takePlayerMoney ( player, price )
					triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
					playSoundFrontEnd ( player, 46 )
					laSetElementData ( target, "money", laGetElementData ( target, "money" ) + price )
					givePlayerMoney ( target, price )
					triggerClientEvent ( target, "HudEinblendenMoney", getRootElement() )
					playSoundFrontEnd ( target, 40 )
					laSetElementData ( player, "jobtime", jobtime + 5 )
					addVehicleUpgrade ( veh, 1010 )
					laSetElementData ( player, "mechanikert", "" )
					laSetElementData ( player, "mechanikertpreis", "" )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDer Mechaniker kann\nnoch nicht wieder\nreparieren!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast zu\nwenig Geld!", 7500, 125, 0, 0 )
			end
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist in\nkeinem Auto!", 7500, 125, 0, 0 )
		end
	else
		triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu bist zu\nweit weg!", 7500, 125, 0, 0 )
	end
end
--addCommandHandler ( "accepttune", accepttune_func )