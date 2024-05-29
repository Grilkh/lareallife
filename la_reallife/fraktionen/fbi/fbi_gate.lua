removeWorldModel(966,1000,-2436.8515625,495.453125,28.953125)
removeWorldModel(967,1000,-2438.7265625,495.0078125,29.1015625)
removeWorldModel(968,1000,-2436.8125,495.46875,29.6796875)

local FbiGate1 = createObject ( 971, -2431.8154296875, 497.42578125, 30.50421333313, 0, 0, 23.8 )
local FbiGate2 = createObject ( 971, -2439.884765625, 493.8688659668, 30.50421333313, 0, 0, 23.8 )

FBIGateMoving = false
FBIGateMoved = false

local function FBI_Gate_SF_func ( player )
	if isFBI(player) then
		if getDistanceBetweenPoints3D ( -2431.8154296875, 497.42578125, 30.50421333313, getElementPosition ( player ) ) < 17 then
			if FBIGateMoving == false then
				FBIGateMoving = true
				if FBIGateMoved == false then
					moveObject ( FbiGate1, 1500, -2431.8154296875, 497.42578125, 21, 0, 0, 0 )
					moveObject ( FbiGate2, 1500, -2439.884765625, 493.8688659668, 21, 0, 0, 0 )
					setTimer ( triggerFBIGateVarb, 1500, 1 )
					FBIGateMoved = true
				else
					moveObject ( FbiGate1, 1500, -2431.8154296875, 497.42578125, 30.50421333313, 0, 0, 0 )
					moveObject ( FbiGate2, 1500, -2439.884765625, 493.8688659668, 30.50421333313, 0, 0, 0 )
					setTimer ( triggerFBIGateVarb, 1500, 1 )
					FBIGateMoved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", FBI_Gate_SF_func )

function triggerFBIGateVarb ()

	FBIGateMoving = false
end