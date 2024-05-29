SurenosGate1 = createObject ( 980, -2190.5, 1011, 80.699996948242, 0, 0,179.99450683594)
SurenosGateLS = createObject ( 980, 2232.6591796875, -1311.2998046875, 25.799999237061, 0, 0, 0 )
SurenosGateMoving = false
SurenosGateMoved = false
SurenosGateLSMoving = false
SurenosGateLSMoved = false

local function Surenos_Gate_SF_func ( player )

	if isSurenos(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( -2190.5, 1011, 80.699996948242, getElementPosition ( player ) ) < 17 then
			if SurenosGateMoving == false then
				SurenosGateMoving = true
				if SurenosGateMoved == false then
					moveObject ( SurenosGate1, 1500, -2190.5, 1011, 75.699996948242, 0, 0, 0 )
					setTimer ( triggerSurenosGateVarb, 1500, 1 )
					SurenosGateMoved = true
				else
					moveObject ( SurenosGate1, 1500, -2190.5, 1011, 80.699996948242, 0, 0, 0 )
					setTimer ( triggerSurenosGateVarb, 1500, 1 )
					SurenosGateMoved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", Surenos_Gate_SF_func )

local function Surenos_Gate_LS_func ( player )

	if isSurenos(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( 2232.6591796875, -1311.2998046875, 25.799999237061, getElementPosition ( player ) ) < 17 then
			if SurenosGateLSMoving == false then
				SurenosGateLSMoving = true
				if SurenosGateLSMoved == false then
					moveObject ( SurenosGateLS, 1500, 2232.6591796875, -1311.2998046875, 20.10000038147, 0, 0, 0 )
					setTimer ( triggerSurenosGateLSVarb, 1500, 1 )
					SurenosGateLSMoved = true
				else
					moveObject ( SurenosGateLS, 1500, 2232.6591796875, -1311.2998046875, 25.799999237061, 0, 0, 0 )
					setTimer ( triggerSurenosGateLSVarb, 1500, 1 )
					SurenosGateLSMoved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", Surenos_Gate_LS_func )

function triggerSurenosGateVarb ()

	SurenosGateMoving = false
end

function triggerSurenosGateLSVarb ()

	SurenosGateLSMoving = false
end



local SurenosToInt = createMarker ( 2233.1000976563, -1333.1999511719, 23.29999961853, "corona", 1.5, 255, 0, 0, 150 )
local SurenosFromInt = createMarker ( 1726.952636, -1638.48999, 20.223, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior (SurenosFromInt, 18)

local function SurenosToInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isSurenos(hitElement) or isGatePermitted(hitElement) then
			fadeElementInterior ( hitElement, 18, 1726.952636, -1640, 20.223 )
			infobox ( hitElement, "\n\nWillkommen Sureno!", 5000, 0, 125, 0 )
		end
	else
		outputChatBox ( "Du bist kein Mitglied der Surenos oder nicht befugt!", hitElement, 125, 0, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", SurenosToInt, SurenosToInt_func )

function SurenosFromInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		fadeElementInterior ( hitElement, 0, 2230.1000976563, -1333.1999511719, 24 )
	else
		outputChatBox ( "Du bist kein Mitglied der Surenos oder nicht befugt!", hitElement, 125, 0, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", SurenosFromInt, SurenosFromInt_func )


SurenosGateLV1 = createObject ( 980, -834.79999, 1396.90002, 15.4, 0, 0, 26.99)
SurenosGateLV1Moving = false
SurenosGateLV1Moved = false


local function Surenos_Gate_LV_1_func ( player )

	if isSurenos(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( -834.79999, 1396.90002, 15.4, getElementPosition ( player ) ) < 17 then
			if SurenosGateLV1Moving == false then
				SurenosGateLV1Moving = true
				if SurenosGateLV1Moved == false then
					moveObject ( SurenosGateLV1, 1500, -834.79999, 1396.90002, 5.4, 0, 0, 0 )
					setTimer ( triggerSurenosGateLV1Varb, 1500, 1 )
					SurenosGateLV1Moved = true
				else
					moveObject ( SurenosGateLV1, 1500, -834.79999, 1396.90002, 15.4, 0, 0, 0 )
					setTimer ( triggerSurenosGateLV1Varb, 1500, 1 )
					SurenosGateLV1Moved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", Surenos_Gate_LV_1_func )


function triggerSurenosGateLV1Varb ()

	SurenosGateLV1Moving = false
end



SurenosGateLV2 = createObject ( 980, -869.5, 1633.90002, 28.7, 0, 0, 30.998)
SurenosGateLV2Moving = false
SurenosGateLV2Moved = false


local function Surenos_Gate_LV_2_func ( player )

	if isSurenos(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( -869.5, 1633.90002, 28.7, getElementPosition ( player ) ) < 17 then
			if SurenosGateLV2Moving == false then
				SurenosGateLV2Moving = true
				if SurenosGateLV2Moved == false then
					moveObject ( SurenosGateLV2, 1500, -869.5, 1633.90002, 18.7, 0, 0, 0)
					setTimer ( triggerSurenosGateLV2Varb, 1500, 1 )
					SurenosGateLV2Moved = true
				else
					moveObject ( SurenosGateLV2, 1500, -869.5, 1633.90002, 28.7, 0, 0, 0)
					setTimer ( triggerSurenosGateLV2Varb, 1500, 1 )
					SurenosGateLV2Moved = false
				end
			end
		end
	end
end
addCommandHandler ( "move", Surenos_Gate_LV_2_func )


function triggerSurenosGateLV2Varb ()

	SurenosGateLV2Moving = false
end


local SurenosToRock = createMarker ( -722.262, 1558.079, 42.084, "corona", 1.5, 255, 0, 0, 150 )
local SurenosFromRock = createMarker ( -651.389, 1528.183, 82.979, "corona", 1.5, 255, 0, 0, 150 )

local function SurenosToRock_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isSurenos(hitElement) or isGatePermitted(hitElement) then
			setElementPosition ( hitElement, -654.458, 1528.082, 82.85 )
			infobox ( hitElement, "\n\nWillkommen Sureno!", 5000, 0, 125, 0 )
		end
	else
		outputChatBox ( "Du bist kein Mitglied der Surenos oder nicht befugt!", hitElement, 125, 0, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", SurenosToRock, SurenosToRock_func )

function SurenosFromRock_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		setElementPosition ( hitElement, -724.321, 1555.031, 41.031 )
	else
		outputChatBox ( "Du bist kein Mitglied der Surenos oder nicht befugt!", hitElement, 125, 0, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", SurenosFromRock, SurenosFromRock_func )
