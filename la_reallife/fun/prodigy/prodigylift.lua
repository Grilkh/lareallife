------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
-----------------------------

ProdigyLiftMoving = false
ProdigyLiftMoved = false
ProdigyLiftMovetime = 5000
ProdigyLift = createObject ( 2633, -1934, 1344.9005126953, 4.6000003814697, 0, 0, 180 )

function ProdigyLift_func ( player )

		if not ProdigyLiftMoving then
			if ProdigyLiftMoved == false then
				moveObject ( ProdigyLift, ProdigyLiftMovetime, -1934, 1344.9005126953, 23.200000762939, 0, 0, 0 )
				setTimer ( triggerProdigyLiftVarb, ProdigyLiftMovetime, 1 )
				ProdigyLiftMoved = true
			else
				moveObject ( ProdigyLift, ProdigyLiftMovetime, -1934, 1344.9005126953, 4.6000003814697, 0, 0, 0 )
				setTimer ( triggerProdigyLiftVarb, ProdigyLiftMovetime, 1 )
				ProdigyLiftMoved = false
			end
			ProdigyLiftMoving = true
		end
end
addCommandHandler ( "sky", ProdigyLift_func )

function triggerProdigyLiftVarb ()

	ProdigyLiftMoving = false
end