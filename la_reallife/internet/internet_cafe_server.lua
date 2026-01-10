--[[local internetEnterMarker = createMarker ( -1594.703613281, 975.84777832031, 7.1202721595764, "corona", 1.5, 0, 255, 0, 150 )
local internetExitMarker = createMarker ( -2837.0786132813, 2810.2290039063, 68.285179138184, "corona", 1.5, 0, 255, 0, 150 )

setElementInterior ( internetExitMarker, 1 )

local function internetMarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
			if source == internetExitMarker then
				fadeElementInterior ( hitElement, 0, -1593.7854003906, 976.64703369141, 7.0444981575012 )
				setTimer ( setElementFrozen, 1000, 1, hitElement, true )
				setTimer ( setElementFrozen, 1250, 1, hitElement, false )
				setPedRotation ( hitElement, 37.5 )
			else
				fadeElementInterior ( hitElement, 1, -2837.0725097656, 2811.4958496094, 68.059410095215 )
				setPedRotation ( hitElement, 90 )
				setTimer ( setElementFrozen, 1000, 1, hitElement, true )
				setTimer ( setElementFrozen, 1250, 1, hitElement, false )
				setTimer ( setElementFrozen, 250, 1, hitElement, false )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", internetEnterMarker, internetMarkerHit )
addEventHandler ( "onMarkerHit", internetExitMarker, internetMarkerHit )
]]