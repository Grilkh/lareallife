tutData = {}

function playerRoute1 ( element1, element2 )

	setPedControlState ( element1, "sprint", true )
	setPedControlState ( element1, "forwards", true )
	
	local col1 = createColSphere ( -764.85 + 0.5, 504.64 - 1, 1376.21, 1 )
	tutData[col1] = {}
	tutData[col1][1] = element1
	tutData[col1][2] = element2
	addEventHandler ( "onClientColShapeHit", col1,
		function ( hit )
			if hit == tutData[source][1] then
				playerRoute1Step1 ( tutData[source][1],tutData[source][2] )
				destroyElement ( source )
			end
		end
	)
end

function playerRoute1Step1 ( element1, element2 )

	setPedControlState ( element1, "forwards", false )
	setPedControlState ( element1, "jump", true )
	setTimer ( setPedControlState, 250, 1, element1, "jump", false )

	setTimer ( setPedControlState, 500, 1, element1, "forwards", true )
end

function guardRoute1Step1 ( element )

	setPedControlState ( element, "forwards", true )
	local col2 = createColSphere ( -764.85 + 0.5, 504.64 - 1, 1376.2, 1 )
	tutData[col2] = {}
	tutData[col2][1] = element
	addEventHandler ( "onClientColShapeHit", col2,
		function ( hit )
			if hit == tutData[source][1] then
				guardRoute1Step2 ( tutData[source][1] )
				destroyElement ( source )
			end
		end
	)
end

function guardRoute1Step2 ( element )

	local x, y, z = getElementPosition ( element )
	setPedControlState ( element, "forwards", false )
	setPedControlState ( element, "aim_weapon", true )
	setPedControlState ( element, "fire", true )
	setTimer ( setPedControlState, 2500, 1, element, "fire", false )
end


function secruityWalk ( ped )

	setPedControlState ( ped, "forwards", true )
	setPedControlState ( ped, "walk", true )
	
	local rot = -90
	setTimer ( setPedRotation, 5000, 1, ped, rot )
	local rot = 90
	setTimer ( setPedRotation, 20000, 1, ped, rot )
	local rot = -90
	setTimer ( setPedRotation, 30000, 1, ped, rot )
	local rot = 90
	setTimer ( setPedRotation, 40000, 1, ped, rot )
	local rot = -90
	setTimer ( setPedRotation, 50000, 1, ped, rot )
	local rot = 90
	setTimer ( setPedRotation, 60000, 1, ped, rot )
end