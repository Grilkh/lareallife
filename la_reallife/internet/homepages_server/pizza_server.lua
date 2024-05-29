function deliverPizza_func ()

	if source == client and laGetElementData ( client, "money" ) >= 50 then
		if getElementInterior ( client ) == 0 and getElementDimension ( client ) == 0 then
			local player = source
			local x, y, z = getElementPosition ( player )
			outputChatBox ( "Deine Pizza wird geliefert!", player, 0, 125, 0 )
			outputUseLog ( getPlayerName ( player ).." hat eine Pizza bestellt!" )
			playSoundFrontEnd ( player, 40 )
			laSetElementData ( player, "money", laGetElementData ( player, "money" ) - 25 )
			triggerClientEvent ( player, "createNewStatementEntry", player, "Bestellung auf\nPizza.com", 50 * -1, "Mit extra\nKäse" )
			pizzaStackKasse = pizzaStackKasse + 10
			local pizzaboy = createVehicle ( 448, x + 2, y + 2, z )
			local pizzaboyDriver = createPed ( 155, x, y, z )
			warpPedIntoVehicle ( pizzaboyDriver, pizzaboy )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nHaben Sie bestellt\nmit extra Käse?\n", 7500, 125, 0, 0 )
			setTimer ( createPizzaPickup, 3500, 1, x, y, z )
			setTimer ( destroyElement, 5000, 1, pizzaboyDriver )
			setTimer ( destroyElement, 5000, 1, pizzaboy )
			setVehicleEngineState ( pizzaboy, true )
		else
			outputChatBox ( "Pizzabestellung ist nur im Freien möglich!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "deliverPizza", true )
addEventHandler ( "deliverPizza", getRootElement(), deliverPizza_func )

function createPizzaPickup ( x, y, z )

	local pickup = createPickup ( x+2, y+2, z, 3, 1582 )
	addEventHandler ( "onPickupHit", pickup, 
		function ( player )
			setElementHealth ( player, getElementHealth ( player ) + 10 )
			playSoundFrontEnd ( player, 40 )
			laSetElementData ( player, "hunger", 100 )
			setElementData ( player, "hunger", 100 )
			setElementData ( player, "urin", getElementData ( player, "urin" )+20 )
			destroyElement ( source )
		end
	)
end