NRGateMoving = false
NRGateMoved = false
NRGate = createObject ( 980, -2017.8000488281, 401.7099, 35.9, 0, 0, 90 )
--removeWorldModel(792, 0, 0, 0)
function NRGate_func ( player )

   	if isReporter(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( -2017.8000488281, 401.7099, 35.9, getElementPosition ( player ) ) < 17 then
			if not NRGateMoving then
				if NRGateMoved == false then
					moveObject ( NRGate, 1500, -2017.8000488281, 401.7099, 31.4, 0, 0, 0 )
					setTimer ( triggerNRGateVarb, 1500, 1 )
					NRGateMoved = true
				else
					moveObject ( NRGate, 1500, -2017.8000488281, 401.7099, 35.9, 0, 0, 0 )
					setTimer ( triggerNRGateVarb, 1500, 1 )
					NRGateMoved = false
				end
				NRGateMoving = true
			end
		end
	end
end
addCommandHandler ( "move", NRGate_func )

function triggerNRGateVarb ()

	NRGateMoving = false
end

NRGate2Moving = false
NRGate2Moved = false
NRGate2 = createObject ( 980, -2018, 486.60000610352, 35.9, 0, 0, 270 )

function NRGate2_func ( player )

   	if isReporter(player) or isGatePermitted(player) then
		if getDistanceBetweenPoints3D ( -2018, 486.60000610352, 35.9, getElementPosition ( player ) ) < 17 then
			if not NRGate2Moving then
				if NRGate2Moved == false then
					moveObject ( NRGate2, 3000, -2018, 486.60000610352, 31.4, 0, 0, 0 )
					setTimer ( triggerNRGate2Varb, 3000, 1 )
					NRGate2Moved = true
				else
					moveObject ( NRGate2, 3000, -2018, 486.60000610352, 35.9, 0, 0, 0 )
					setTimer ( triggerNRGate2Varb, 3000, 1 )
					NRGate2Moved = false
				end
				NRGate2Moving = true
			end
		end
	end
end
addCommandHandler ( "move", NRGate2_func )

function triggerNRGate2Varb ()

	NRGate2Moving = false
end

NRLiftMoving = false
NRLiftMoved = false
NRLiftMovetime = 15000
NRLift = createObject ( 2633, -2020.484375, 455.22721557617, 32.685661315918, 0, 0, 0 )

function NRLift_func ( player )

   	if isReporter(player) or isGatePermitted(player) then
		if not NRLiftMoving then
			if NRLiftMoved == false then
				moveObject ( NRLift, NRLiftMovetime, -2023.6525878906, 455.22721557617, 137.10433959961, 0, 0, 0 )
				setTimer ( triggerNRLiftVarb, NRLiftMovetime, 1 )
				NRLiftMoved = true
			else
				moveObject ( NRLift, NRLiftMovetime, -2020.484375, 455.22721557617, 32.685661315918, 0, 0, 0 )
				setTimer ( triggerNRLiftVarb, NRLiftMovetime, 1 )
				NRLiftMoved = false
			end
			NRLiftMoving = true
		end
	else
		outputChatBox ( "Du bist kein Reporter!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "lift", NRLift_func )

function triggerNRLiftVarb ()

	NRLiftMoving = false
end


NRLift2Moving = false
NRLift2Moved = false
NRLift2Movetime = 3000
NRLift2 = createObject ( 2633, -2038.8000488281, 433, 113.40000152588, 0, 0, 180 )

function NRLift2_func ( player )

   	if isReporter(player) or isGatePermitted(player) then
		if not NRLift2Moving then
			if NRLift2Moved == false then
				moveObject ( NRLift2, NRLift2Movetime, -2038.8000488281, 433, 137.1, 0, 0, 0 )
				setTimer ( triggerNRLift2Varb, NRLift2Movetime, 1 )
				NRLift2Moved = true
			else
				moveObject ( NRLift2, NRLift2Movetime, -2038.8000488281, 433, 113.40000152588, 0, 0, 0 )
				setTimer ( triggerNRLift2Varb, NRLift2Movetime, 1 )
				NRLift2Moved = false
			end
			NRLift2Moving = true
		end
	else
		outputChatBox ( "Du bist kein Reporter!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "lift2", NRLift2_func )

function triggerNRLift2Varb ()

	NRLift2Moving = false
end

NRAutoliftMoving = false
NRAutoliftMoved = false
NRAutoliftMovetime = 30000
NRAutolift = createObject ( 3567, -2032.0999755859, 454.899, 33.31, 0, 0, 0 )

function NRAutolift_func ( player )

   	if isReporter(player) or isGatePermitted(player) then
		if not NRAutoliftMoving then
			if NRAutoliftMoved == false then
				moveObject ( NRAutolift, NRAutoliftMovetime, -2032.0999755859, 454.899, 137.850999755859, 0, 0, 0 )
				setTimer ( triggerNRAutoliftVarb, NRAutoliftMovetime, 1 )
				NRAutoliftMoved = true
			else
				moveObject ( NRAutolift, NRAutoliftMovetime, -2032.0999755859, 454.899, 33.31, 0, 0, 0 )
				setTimer ( triggerNRAutoliftVarb, NRAutoliftMovetime, 1 )
				NRAutoliftMoved = false
			end
			NRAutoliftMoving = true
		end
	else
		outputChatBox ( "Du bist kein Reporter!", player, 125, 0, 0 )
	end
end
addCommandHandler ( "autolift", NRAutolift_func )

function triggerNRAutoliftVarb ()

	NRAutoliftMoving = false
end