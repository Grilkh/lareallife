removeWorldModel(10252,1000,-2175.7578125,661.921875,50.1015625)
removeWorldModel(1306,1000,-2225.3515625,642.4140625,54.4296875)

removeWorldModel(1570,1000,-2183.78125,636.7109375,49.6953125)
removeWorldModel(1306,1000,-2211.640625,587.390625,41.625)
removeWorldModel(10179,1000,-2187.7265625,599.8046875,49.765625)
	
gateMoving = false
gateMoved = false
gateLSMoving = false
gateLSMoved = false
yakuzaGate = createObject ( 969, -2240.2878417969, 635.88116455078, 48.6090965271, 0, 0, 90 )
yakuzaGateLS = createObject (980, 2828.8000488281, -1590.5, 12.699999809265, 0, 0, 240.75 )

yakuzaCasinoGate = createObject ( 7657, 1903.6638183594, 967.37475585938, 11.5371551, 0, 0, 0 )
yakuzaCasinoGateA = createObject ( 7657, 1903.6638183594, 967.37475585938, 11.5371551, 0, 0, 180 )
attachElementsInCorrectWay ( yakuzaCasinoGateA, yakuzaCasinoGate )

yakuzaCasinoGateState = false
fourDragonGateSwitches = {}
switchA = createObject ( 2886, 1896.2963867188, 967.83520507813, 11.806823730469, 0, 0, 180 )
switchB = createObject ( 2886, 1910.2141113281, 966.93408203125, 11.806823730469, 0, 0, 0 )
fourDragonGateSwitches[switchA] = true
fourDragonGateSwitches[switchB] = true

local function Yakuza_Gate_SF_func ( player )

	if isYakuza(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( -2240.2878417969, 635.88116455078, 48.6090965271, getElementPosition ( player ) ) < 10 then
			if gateMoving == false then
				gateMoving = true
				if gateMoved == false then
					moveObject ( yakuzaGate, 1500, -2240.2878417969, 635.88116455078, 44.6090965271 )
					setTimer ( triggerYakuzaGateVarb, 1500, 1 )
					gateMoved = true
				else
					moveObject ( yakuzaGate, 1500, -2240.2878417969, 635.88116455078, 48.6090965271 )
					setTimer ( triggerYakuzaGateVarb, 1500, 1 )
					gateMoved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", Yakuza_Gate_SF_func )

local function Yakuza_Gate_LS_func ( player )

	if isYakuza(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( 2828.8000488281, -1590.5, 12.699999809265, getElementPosition ( player ) ) < 10 then
			if gateLSMoving == false then
				gateLSMoving = true
				if gateLSMoved == false then
					moveObject ( yakuzaGateLS, 1500, 2828.8000488281, -1590.5, 7, 0, 0, 0 )
					setTimer ( triggerYakuzaGateLSVarb, 1500, 1 )
					gateLSMoved = true
				else
					moveObject ( yakuzaGateLS, 1500, 2828.8000488281, -1590.5, 12.699999809265, 0, 0, 0 )
					setTimer ( triggerYakuzaGateLSVarb, 1500, 1 )
					gateLSMoved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", Yakuza_Gate_LS_func )

function triggerYakuzaGateVarb ()

	gateMoving = false
end

function triggerYakuzaGateLSVarb ()

	gateLSMoving = false
end

function triggerYakuzaGate2Varb ()

	gate2Moving = false
end


function moveYakuzaCasinoGate_func ( player )

	if isYakuza(player) or isGatePermitted(player) then
		if yakuzaCasinoGateState then
			moveObject ( yakuzaCasinoGate, 2500, 1903.6638183594, 967.37475585938, 11.5371551, 0, 0, 0 )
		else
			moveObject ( yakuzaCasinoGate, 2500, 1903.6638183594 + 20, 967.37475585938, 11.5371551, 0, 0, 0 )
		end
		yakuzaCasinoGateState = not yakuzaCasinoGateState
	end
end
addCommandHandler ( "moveYakuzaCasinoGate", moveYakuzaCasinoGate_func )