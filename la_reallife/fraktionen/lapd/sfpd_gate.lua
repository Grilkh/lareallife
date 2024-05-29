removeWorldModel(10248,1000,-1680.9921875,683.234375,19.046875)
removeWorldModel(10042,1000,-1606.5625,731.4375,39.3359375)

SFPDgateMoving = false
SFPDgateMoved = false
SFPDgate3Moving = false
SFPDgate3Moved = false
SFPDgate4Moving = false
SFPDgate4Moved = false
SFPDGate1 = createObject ( 980, -1634.3143310547, 688.29608154297, 8.9608917236328, 0, 0, 0 )
SFPDGate2 = createObject ( 980, -1622.7777099609, 688.29217529297, 8.96089, 0, 0, 0 )
SFPDGate3 = createObject ( 968, -1572.20599511719, 658.79998779297, 6.8099999427795, 0, 90, 90 )
SFPDGate4 = createObject ( 968, -1701.4399414063, 687.59997558594, 24.60, 0, 90, -90 )

local function SFPD_Gate_SF_func ( player )
	if isCop(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( -1634.3143310547, 688.29608154297, 8.9608917236328, getElementPosition ( player ) ) < 17 then
			if SFPDgateMoving == false then
				SFPDgateMoving = true
				if SFPDgateMoved == false then
					moveObject ( SFPDGate1, 1500, -1646.1239013672, 688.70806884766, 8.9608917236328, 0, 0, 0 )
					moveObject ( SFPDGate2, 1500, -1612.7661132813, 688.50366210938, 8.9608917236328, 0, 0, 0 )
					setTimer ( triggerSFPDGateVarb, 1500, 1 )
					SFPDgateMoved = true
					if laGetElementData (player, "PDSchrankeoppened") == true then
						local veh = getPedOccupiedVehicle ( player )
						if veh then
							setVehicleSirensOn ( veh, false )
						end
					end
				else
					moveObject ( SFPDGate1, 1500, -1634.3143310547, 688.29608154297, 8.9608917236328, 0, 0, 0 )
					moveObject ( SFPDGate2, 1500, -1622.7777099609, 688.29217529297, 8.96089, 0, 0, 0 ) 
					setTimer ( triggerSFPDGateVarb, 1500, 1 )
					SFPDgateMoved = false
					if laGetElementData (player, "PDSchrankeoppened") == true then
						local veh = getPedOccupiedVehicle ( player )
						if veh then
							setVehicleSirensOn ( veh, false )
						end
					end
				end
			end
		elseif getDistanceBetweenPoints3D ( -1572.20599511719, 658.79998779297, 6.8099999427795, getElementPosition ( player ) ) < 20 then
			if SFPDgate3Moving == false then
				SFPDgate3Moving = true
				if SFPDgate3Moved == false then
					moveObject ( SFPDGate3, 1500, -1572.20599511719, 658.79998779297, 6.8099999427795, 0, -90, 0 )
					setTimer ( triggerSFPDGate3Varb, 1500, 1 )
					SFPDgate3Moved = true
					laSetElementData ( player, "PDSchrankeoppened", true )
					setTimer ( PDSchrankeoppenedTrigger, 10000, 1, player )
				else
					moveObject ( SFPDGate3, 1500, -1572.20599511719, 658.79998779297, 6.8099999427795, 0, 90, 0 )
					setTimer ( triggerSFPDGate3Varb, 1500, 1 )
					SFPDgate3Moved = false
					laSetElementData ( player, "PDSchrankeoppened", true )
					setTimer ( PDSchrankeoppenedTrigger, 10000, 1, player )
				end
			end
		elseif getDistanceBetweenPoints3D ( -1701.4399414063, 687.59997558594, 24.60, getElementPosition ( player ) ) < 20 then
			if SFPDgate4Moving == false then
				SFPDgate4Moving = true
				if SFPDgate4Moved == false then
					moveObject ( SFPDGate4, 1500, -1701.4399414063, 687.59997558594, 24.60, 0, -90, 0 )
					setTimer ( triggerSFPDGate4Varb, 1500, 1 )
					SFPDgate4Moved = true
					laSetElementData ( player, "PDSchrankeoppened", true )
					setTimer ( PDSchrankeoppenedTrigger, 10000, 1, player )
				else
					moveObject ( SFPDGate4, 1500, -1701.4399414063, 687.59997558594, 24.60, 0, 90, 0 )
					setTimer ( triggerSFPDGate4Varb, 1500, 1 )
					SFPDgate4Moved = false
					laSetElementData ( player, "PDSchrankeoppened", true )
					setTimer ( PDSchrankeoppenedTrigger, 10000, 1, player )
				end
			end
		end
	end
end
addCommandHandler ( "move", SFPD_Gate_SF_func )

function triggerSFPDGateVarb ()

	SFPDgateMoving = false
end

function triggerSFPDGate3Varb ()

	SFPDgate3Moving = false
end

function triggerSFPDGate4Varb ()

	SFPDgate4Moving = false
end

function PDSchrankeoppenedTrigger ( player )

laSetElementData ( player, "PDSchrankeoppened", false )

end

SFPDjailMoving = false
SFPDjailMoved = false

SFPDJail = createObject ( 2634, 217.80000305176, 116.40000152588, 999.20001220703, 0, 0, 0 )
setElementInterior (SFPDJail, 10)

local function jail_func ( player )

	if isOnStateDuty (player) then
		if getDistanceBetweenPoints3D ( 217.80000305176, 116.40000152588, 999.20001220703, getElementPosition ( player ) ) < 5 then
			if SFPDjailMoving == false then
				SFPDjailMoving = true
				if SFPDjailMoved == false then
					moveObject ( SFPDJail, 1500, 218.89999389648, 115.59999847412, 999.20001220703, 0, 0, 90 )
					setTimer ( triggerJailVarb, 1500, 1 )
					SFPDjailMoved = true
				else
					moveObject ( SFPDJail, 1500, 217.80000305176, 116.40000152588, 999.20001220703, 0, 0, -90 )
					setTimer ( triggerJailVarb, 1500, 1 )
					SFPDjailMoved = false
				end
			end
		end
	end
end
addCommandHandler ( "jail", jail_func )

function triggerJailVarb ()

	SFPDjailMoving = false
end