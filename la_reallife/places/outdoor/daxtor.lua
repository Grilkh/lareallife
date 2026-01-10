------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

Tor = createObject ( 11327, -2798.599, 1319.799, 8, 0, 0, 180 )
TorStatus = "zu"

function openTor ( Player )
	if ( TorStatus == "zu" ) then

		moveObject ( Tor, 5000, -2798.599, 1319.799, 4.3 )
		TorStatus = "auf"
		setTimer ( TorTimer, 30000, 1 )
				
	elseif ( TorStatus == "auf" ) then
	
		moveObject ( Tor, 5000, -2798.599, 1319.799, 8 )
		TorStatus = "zu"
	
	end

end

addCommandHandler ( "trust", openTor, false, false )

function TorTimer ( )

	if ( TorStatus == "auf" ) then
	
		moveObject ( Tor, 5000, -2798.599, 1319.799, 8 )
		TorStatus = "zu" 
	
	end

end



local gate_eren58 = createObject(980,-2879.3000488281,88.800003051758,7.4000000953674, 0, 0, 90 )

function open()
moveObject(gate_eren58, 2000,-2879.3000488281,88.800003051758,1.7000000476837, 0, 0, 0 )
end
addCommandHandler("sivas58", open)

function close()
moveObject(gate_eren58, 2000, -2879.3000488281,88.800003051758,7.4000000953674, 0, 0, 0 )
end
addCommandHandler("sivas58c", close)