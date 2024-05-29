placingBarricade = false
barrikadencount = 0
sandbagcount = 0
function sandbag_func ()

	if getElementData ( lp, "job" ) == "pionier" and getElementData ( lp, "fraktion" ) == 8 then
		if not placingBarricade then
			if not getElementData ( lp, "barricadeTimer" ) then
				if sandbagcount < 5 then
					setElementData ( lp, "object", 2060 )
					startObjectDrop ()
					placingBarricade = true
					
					setElementData ( lp, "barricadeTimer", true )
					setTimer ( setElementData, 10000, 1, lp, "barricadeTimer", false )
					setTimer ( resetSandBagCount, 600000, 1, lp)
					sandbagcount = sandbagcount + 1
				else
					outputChatBox ( "Du hast bereits 5 Sandbags platziert!", 125, 0, 0 )
				end
			else
				outputChatBox ( "Du kannst nur alle 10 Sekunden ein Sandbag platzieren!", 125, 0, 0 )
			end
		end
	else
		outputChatBox ( "Du bist nicht befugt!", 125, 0, 0 )
	end
end
addCommandHandler ( "sandbag", sandbag_func )

function resetSandBagCount (player)
sandbagcount = (sandbagcount - 1)
end

barricadeFactions = { [1]=true, [6]=true, [8]=true }

function barricade_func ()

	if barricadeFactions[getElementData ( lp, "fraktion" )] then
		if not placingBarricade then
			if not getElementData ( lp, "barricadeTimer" ) then
				if barrikadencount < 5 then
					setElementData ( lp, "object", 1422 )
					startObjectDrop ()
					placingBarricade = true
					
					setElementData ( lp, "barricadeTimer", true )
					setTimer ( setElementData, 10000, 1, lp, "barricadeTimer", false )
					setTimer ( resetBarrikadenCount, 1200000, 1, lp)
					barrikadencount = barrikadencount + 1
				else
					outputChatBox ( "Du hast bereits 5 Barrikaden platziert!", 125, 0, 0 )
				end
			else
				outputChatBox ( "Du kannst nur alle 10 Sekunden eine Barrikade platzieren!", 125, 0, 0 )
			end
		end
	else
		outputChatBox ( "Du bist nicht befugt!", 125, 0, 0 )
	end
end
addCommandHandler ( "barricade", barricade_func )

function resetBarrikadenCount (player)
barrikadencount = (barrikadencount - 1)
end

function createSandbagStack ()

	motherBag = createObject ( 2060, 2496.7041015625, -1668.75390625, 12.492603302002, 0, 0, 0 )
	
	local bag = createObject ( 2060, 2495.7702636719, -1668.7458496094, 12.492603302002, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2494.8322753906, -1668.7738037109, 12.492603302002, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2494.1926269531, -1668.8299560547, 12.500406265259, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2494.2319335938, -1668.8308105469, 12.717599868774, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2495.2297363281, -1668.8103027344, 12.717599868774, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2496.1931152344, -1668.8334960938, 12.717599868774, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2496.6818847656, -1668.8083496094, 12.667600631714, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2496.5300292969, -1668.8012695313, 12.892597198486, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2495.5554199219, -1668.8256835938, 12.892597198486, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2494.5422363281, -1668.791015625, 12.892597198486, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2494.603515625, -1668.7868652344, 13.117593765259, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2495.4057617188, -1668.8317871094, 13.117593765259, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2496.3583984375, -1668.8572998047, 13.117593765259, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2496.3583984375, -1668.8564453125, 13.117593765259, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2496.28515625, -1668.8714599609, 13.317590713501, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2495.3916015625, -1668.8935546875, 13.317590713501, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2494.71484375, -1668.8049316406, 13.317590713501, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2494.8161621094, -1668.7650146484, 13.492588043213, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	local bag = createObject ( 2060, 2496.375, -1668.845703125, 13.492588043213, 0, 0, 0 )
	setElementCollisionsEnabled ( bag, false )
	setElementParent ( bag, motherBag )
	attachElementsInCorrectWay ( bag, motherBag )
	
	setElementPosition ( motherBag, x, y-1, z )
	setElementRotation ( motherBag, 0, 0, rot )
	return motherBag
end