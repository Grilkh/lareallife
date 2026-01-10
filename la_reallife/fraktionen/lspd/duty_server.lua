------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

LSPDDutyIcon = createPickup ( 256.89999389648, 70.099998474121, 1003.561340332, 3, 1239, 50, 0 )
setElementInterior ( LSPDDutyIcon, 6 )
--ticketIcon = createPickup ( 246.54, 118.03, 1002.86, 3, 1239, 50, 0 )
--setElementInterior ( ticketIcon, 6 )

function dutyhit ( player )

	outputChatBox ( "Tippe /duty oder /swat, um in Dienst zu gehen. /fskin für Skinchange. Chickenskin nicht erlaubt! ", player, 200, 2000, 20 )
end
addEventHandler ( "onPickupHit", LSPDDutyIcon, dutyhit )

function isNearLSPDDutyIcon ( player )

	local x1, y1, z1 = getElementPosition ( player )
	local x2, y2, z2 = getElementPosition ( LSPDDutyIcon )
	if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) < 5 then
		return true
	end
	return false
end