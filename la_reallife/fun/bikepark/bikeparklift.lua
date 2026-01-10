------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

BPLiftMoving = false
BPLiftMoved = false
BPLiftMovetime = 3000
BPLift = createObject ( 2633, -2070.3999023438, -101, 32.600002288818, 0, 0, 0 )

function BPLift_func ( player )

		if not BPLiftMoving then
			if BPLiftMoved == false then
				moveObject ( BPLift, BPLiftMovetime, -2070.3999023438, -101, 39.200002288818, 0, 0, 0 )
				setTimer ( triggerBPLiftVarb, BPLiftMovetime, 1 )
				BPLiftMoved = true
			else
				moveObject ( BPLift, BPLiftMovetime, -2070.3999023438, -101, 32.600002288818, 0, 0, 0 )
				setTimer ( triggerBPLiftVarb, BPLiftMovetime, 1 )
				BPLiftMoved = false
			end
			BPLiftMoving = true
		end
end
addCommandHandler ( "autopark", BPLift_func )

function triggerBPLiftVarb ()

	BPLiftMoving = false
end