objects = {}
objectCount = 0

function finishObjectPlace_func ( x, y, z, rx, ry, rz )

	local player = client
	local model = laGetElementData ( player, "object" )
	if model > 0 then
		objectCount = objectCount + 1
		objects[objectCount] = createObject ( model, x, y, z, rx, ry, rz )
		laSetElementData ( objects[objectCount], "placeableObject", true )
		laSetElementData ( player, "object", 0 )
		if model == 841 or model == 842 then
			local fire = createObject ( 3461, x, y, z - 1.8 )
			setElementParent ( fire, objects[objectCount] )
		end
	end
end
addEvent ( "finishObjectPlace", true )
addEventHandler ( "finishObjectPlace", getRootElement(), finishObjectPlace_func )

function purchaseItem_func ( model )

	local player = client
	local price = placeablePrices[model]
	if laGetElementData ( player, "money" ) >= price then
		if laGetElementData ( player, "object" ) == 0 then
			takePlayerSaveMoney ( player, price )
			laSetElementData ( player, "object", model )
			infobox ( player, "\n\nDu hast das Objekt\nerworben!\nEs ist nun in\ndeinem Inventar.", 5000, 0, 2000, 0 )
		else
			infobox ( player, "\n\n\nDu hast bereits\nein Objekt!", 5000, 200, 0, 0 )
		end
	else
		infobox ( player, "\n\n\nDu hast nicht\ngenug Geld!", 5000, 200, 0, 0 )
	end
end
addEvent ( "purchaseItem", true )
addEventHandler ( "purchaseItem", getRootElement(), purchaseItem_func )