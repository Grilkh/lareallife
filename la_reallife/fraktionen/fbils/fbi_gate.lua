------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

FbiGate3 = createObject ( 985, 1261.5, -2051, 60, 0, 0, 177.99499511719 )
FbiGate4 = createObject ( 986, 1269.3994140625, -2051.2998046875, 60, 0, 0, 177.99499511719 )

FBIGateMoving = false
FBIGateMoved = false

local function FBI_Gate_LS_func ( player )
	if isFBI(player) then
		if getDistanceBetweenPoints3D ( 1265.3000488281, -2051, 59.299999237061, getElementPosition ( player ) ) < 17 then
			if FBIGateMoving == false then
				FBIGateMoving = true
				if FBIGateMoved == false then
					moveObject ( FbiGate3, 1500, 1261.5, -2051, 50 )
					moveObject ( FbiGate4, 1500, 1269.3994140625, -2051.2998046875, 50 )
					setTimer ( triggerFBIGateVarb, 1500, 1 )
					FBIGateMoved = true
				else
					moveObject ( FbiGate3, 1500, 1261.5, -2051, 60 )
					moveObject ( FbiGate4, 1500, 1269.3994140625, -2051.2998046875, 60 )
					setTimer ( triggerFBIGateVarb, 1500, 1 )
					FBIGateMoved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", FBI_Gate_LS_func )

function triggerFBIGateVarb ()

	FBIGateMoving = false
end