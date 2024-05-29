------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

FBILSDutyIcon = createPickup ( 1122.4000244141, -2037, 70, 3, 1239, 50 )

function FBILSDutyIconHit ( player )

	outputChatBox ( "Tippe /duty [1-4] oder /swat, um in Dienst zu gehen. Chickenskin nicht erlaubt! ", player, 200, 2000, 20 )
end
addEventHandler ( "onPickupHit", FBILSDutyIcon, FBILSDutyIconHit )

function isNearFBILSDutyIcon ( player )

	local x1, y1, z1 = getElementPosition ( player )
	local x2, y2, z2 = getElementPosition ( FBILSDutyIcon )
	if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
		return true
	end
	return false
end