------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

mediDropCount = 1

function mediOnlineDeliver_func ( totalCost, mediOrder )
	local player = source
	if player == client then
		if getElementInterior ( player ) == 0 then
			local totalCost = 50
			triggerClientEvent ( player, "createNewStatementEntry", player, "Bestellung auf\nMedi.com", totalCost * -1 )
			if totalCost <= laGetElementData ( player, "bankmoney" ) then
				laSetElementData ( player, "bankmoney", laGetElementData ( player, "bankmoney" ) - totalCost )
				outputChatBox ( "Deine Lieferung ist unterwegs!", player, 0, 125, 0 )
				outputUseLog ( getPlayerName ( player ).." hat beim Medic Center bestellt!" )
				local x, y, z = getElementPosition ( player )
				y = y - 2
				x = x - 2
				dropObject = createObject ( 2903, x, y, z+6.3+15 )
				moveObject ( dropObject, 9000, x, y, z+6.3 )
				setTimer ( destroyElement, 10000, 1, dropObject )
				setTimer ( createMediDeliveryPickup, 10000, 1, x, y, z, mediOrder)
			else
				outputChatBox ( "Du hast nicht genug Geld - deine Sendung würde "..totalCost.." $ kosten!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Das kannst du hier nicht bestellen.", player, 125, 0, 0 )
		end
	end
end
addEvent ( "mediOnlineDeliver", true )
addEventHandler ( "mediOnlineDeliver", getRootElement(), mediOnlineDeliver_func )

function createMediDeliveryPickup ( x, y, z, mediOrder )

	local colSphereMedi = createColSphere ( x, y, z, 2 )
	local players = getElementsWithinColShape ( colSphereMedi, "player" )
	destroyElement ( colSphereMedi )
	for key, player in pairs ( players ) do
		laSetElementData ( player, "medikit", 1 )
		return
	end
	_G["healthPickup"..mediDropCount] = createPickup ( x, y, z, 3, 1240 )
	local pickup = _G["healthPickup"..mediDropCount]
	
	laSetElementData ( pickup, "mediOrder", mediOrder )
	
	addEventHandler ( "onPickupHit", pickup,
		function ( player )
				playSoundFrontEnd ( player, 40 )
				
				mediOrder = laGetElementData ( source, "mediOrder" )
				laSetElementData ( player, "medikit", 1 )
				destroyElement ( source )
		end
	)
	mediDropCount = mediDropCount + 1
end

function givePlayerMediFromDelivery ( player, mediOrder )
	
		laSetElementData ( player, "medikit", 1 )
		outputChatBox ( "Lieferung erhalten!", player, 0, 125, 0 )
end