ammunationDropCount = 1

function emailCheck_func ( version )

	if version == "Custom" and source == client then
		counter = 0
		for key, player in pairs ( getElementsByType ( "player" ) ) do
			if laGetElementData ( player, "adminlvl" ) >= 1 then
				outputChatBox ( getPlayerName(client).." verwendet modifizierte Files!", player, 125, 0, 0 )
				counter = counter + 1
			end
		end
		if counter == 0 then
			local pname = getPlayerName(source)
			outputChatBox ( pname.." wurde vom Anticheatsystem gebannt.", getRootElement(), 255, 0, 0 )
			local ip = getPlayerIP ( source )
			local serial = getPlayerSerial ( source )
			reason = "Modifizierte Files"
			mysql_la_query(handler, "INSERT INTO ban (Name, Admin, Grund, Datum, IP, Serial) VALUES ('"..getPlayerName(source).."', 'Anticheat', '"..reason.."', '"..timestamp().."', '"..ip.."', '"..serial.."')")
			kickPlayer ( source, "Vom Anticheat gebannt!" )
		end
	end
end
addEvent ( "emailCheck", true )
addEventHandler ( "emailCheck", getRootElement(), emailCheck_func )

function ammunationOnlineDeliver_func ( totalCost, ammunationOrderPistol, ammunationOrderDeagle, ammunationOrderShotty,ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderNVG, ammunationOrderWVG, ammunationOrderArmor, ammunationOrderPistolAmmo, ammunationOrderDeagleAmmo, ammunationOrderShottyAmmo, ammunationOrderMPAmmo, ammunationOrderAKAmmo, ammunationOrderMAmmo, ammunationOrderGAmmo )

	local player = source
	if player == client then
		if getElementInterior ( player ) == 0 then
			totalCost = math.abs ( totalCost )
			local totalCost = totalCost + 500
			triggerClientEvent ( player, "createNewStatementEntry", player, "Bestellung auf\nAmmunation.com", totalCost * -1, "Incl. 500 $\nLieferkosten" )
			if totalCost <= laGetElementData ( player, "bankmoney" ) then
				laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" ) - totalCost )
				outputChatBox ( "Deine Lieferung ist unterwegs!", player, 0, 125, 0 )
				outputUseLog ( getPlayerName ( player ).." hat bei Ammunation bestellt!" )
				local x, y, z = getElementPosition ( player )
				y = y - 2
				x = x - 2
				dropObject = createObject ( 2903, x, y, z+6.3+15 )
				moveObject ( dropObject, 9000, x, y, z+6.3 )
				setTimer ( destroyElement, 10000, 1, dropObject )
				setTimer ( createGunDeliveryPickup, 10000, 1, x, y, z, ammunationOrderPistol, ammunationOrderDeagle, ammunationOrderShotty,ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderNVG, ammunationOrderWVG, ammunationOrderArmor, ammunationOrderPistolAmmo, ammunationOrderDeagleAmmo, ammunationOrderShottyAmmo, ammunationOrderMPAmmo, ammunationOrderAKAmmo, ammunationOrderMAmmo, ammunationOrderGAmmo )
			else
				outputChatBox ( "Du hast nicht genug Geld - deine Sendung würde "..totalCost.." $ kosten!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Das kannst du hier nicht bestellen.", player, 125, 0, 0 )
		end
	end
end
addEvent ( "ammunationOnlineDeliver", true )
addEventHandler ( "ammunationOnlineDeliver", getRootElement(), ammunationOnlineDeliver_func )

function createGunDeliveryPickup ( x, y, z, ammunationOrderPistol, ammunationOrderDeagle, ammunationOrderShotty,ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderNVG, ammunationOrderWVG, ammunationOrderArmor, ammunationOrderPistolAmmo, ammunationOrderDeagleAmmo, ammunationOrderShottyAmmo, ammunationOrderMPAmmo, ammunationOrderAKAmmo, ammunationOrderMAmmo, ammunationOrderGAmmo )

	local colSphereAmmunation = createColSphere ( x, y, z, 2 )
	local players = getElementsWithinColShape ( colSphereAmmunation, "player" )
	destroyElement ( colSphereAmmunation )
	for key, player in pairs ( players ) do
		givePlayerWeaponsFromDelivery ( player, ammunationOrderPistol, ammunationOrderDeagle, ammunationOrderShotty,ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderNVG, ammunationOrderWVG, ammunationOrderArmor, ammunationOrderPistolAmmo, ammunationOrderDeagleAmmo, ammunationOrderShottyAmmo, ammunationOrderMPAmmo, ammunationOrderAKAmmo, ammunationOrderMAmmo, ammunationOrderGAmmo )
		return
	end
	_G["gunPickup"..ammunationDropCount] = createPickup ( x, y, z, 3, 1210 )
	local pickup = _G["gunPickup"..ammunationDropCount]
	
	laSetElementData ( pickup, "ammunationOrderPistol", ammunationOrderPistol + ammunationOrderPistolAmmo )
	laSetElementData ( pickup, "ammunationOrderDeagle", ammunationOrderDeagle + ammunationOrderDeagleAmmo )
	laSetElementData ( pickup, "ammunationOrderShotty", ammunationOrderShotty + ammunationOrderShottyAmmo )
	laSetElementData ( pickup, "ammunationOrderMP", ammunationOrderMP + ammunationOrderMPAmmo )
	laSetElementData ( pickup, "ammunationOrderAK", ammunationOrderAK + ammunationOrderAKAmmo )
	laSetElementData ( pickup, "ammunationOrderM", ammunationOrderM + ammunationOrderMAmmo )
	laSetElementData ( pickup, "ammunationOrderG", ammunationOrderG + ammunationOrderGAmmo )
	laSetElementData ( pickup, "ammunationOrderNVG", ammunationOrderNVG )
	laSetElementData ( pickup, "ammunationOrderWVG", ammunationOrderWVG )
	laSetElementData ( pickup, "ammunationOrderArmor", ammunationOrderArmor )
	
	addEventHandler ( "onPickupHit", pickup,
		function ( player )
			if laGetElementData ( player, "gunlicense" ) == 1 then
				playSoundFrontEnd ( player, 40 )
				
				ammunationOrderPistol = laGetElementData ( source, "ammunationOrderPistol" )
				ammunationOrderDeagle = laGetElementData ( source, "ammunationOrderDeagle" )
				ammunationOrderShotty = laGetElementData ( source, "ammunationOrderShotty" )
				ammunationOrderMP = laGetElementData ( source, "ammunationOrderMP" )
				ammunationOrderAK = laGetElementData ( source, "ammunationOrderAK" )
				ammunationOrderM = laGetElementData ( source, "ammunationOrderM" )
				ammunationOrderG = laGetElementData ( source, "ammunationOrderG" )
				ammunationOrderNVG = laGetElementData ( source, "ammunationOrderNVG" )
				ammunationOrderWVG = laGetElementData ( source, "ammunationOrderWVG" )
				ammunationOrderArmor = laGetElementData ( source, "ammunationOrderArmor" )
				givePlayerWeaponsFromDelivery ( player, ammunationOrderPistol, ammunationOrderDeagle, ammunationOrderShotty,ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderNVG, ammunationOrderWVG, ammunationOrderArmor )
				destroyElement ( source )
			else
				outputChatBox ( "Du hast keinen Waffenschein!", player, 125, 0, 0 )
			end
		end
	)
	ammunationDropCount = ammunationDropCount + 1
end

function givePlayerWeaponsFromDelivery ( player, ammunationOrderPistol, ammunationOrderDeagle, ammunationOrderShotty, ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderMP, ammunationOrderAK, ammunationOrderM, ammunationOrderG, ammunationOrderNVG, ammunationOrderWVG, ammunationOrderArmor )
	
	if laGetElementData ( player, "gunlicense" ) == 1 then
		if (ammunationOrderPistol)*17 > 0 then
			giveWeapon ( player, 22, (ammunationOrderPistol)*17 )
		elseif ammunationOrderDeagle*7 > 0 then
			giveWeapon ( player, 24, (ammunationOrderDeagle)*7 )
		end
		if (ammunationOrderAK)*30 > 0 then
			giveWeapon ( player, 30, (ammunationOrderAK)*30 )
		elseif ammunationOrderM * 50 > 0 then
			giveWeapon ( player, 31, (ammunationOrderM)*50 )
		end
		if ammunationOrderShotty > 0 then
			giveWeapon ( player, 25, (ammunationOrderShotty)*5 )
		end
		if ammunationOrderMP > 0 then
			giveWeapon ( player, 29, (ammunationOrderMP)*30 )
		end
		if ammunationOrderG > 0 then
			giveWeapon ( player, 33, (ammunationOrderG) )
		end
		if ammunationOrderNVG then
			if ammunationOrderNVG > 0 then
				giveWeapon ( player, 44, ammunationOrderNVG )
			end
		end
		if ammunationOrderWVG then
			if ammunationOrderWVG > 0 then
				giveWeapon ( player, 45, ammunationOrderWVG )
			end
		end
		if ammunationOrderArmor > 0 then
			setPedArmor ( player, 100*ammunationOrderArmor )
		end
		outputChatBox ( "Lieferung erhalten!", player, 0, 125, 0 )
	else
		outputChatBox ( "Du hast keinen Waffenschein!", player, 125, 0, 0 )
	end
end