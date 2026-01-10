--[[createBlip ( -1594.703613281, 975.84777832031, 6.1202721595764, 35, 2, 255, 255, 255, 255, 0, 200 )

local internetPCMarker = createMarker ( -2830.6887207031, 2812.8664550781, 67.385200500488, "cylinder", 1.5, 0, 255, 0, 150 )
setElementInterior ( internetPCMarker, 1 )


local function internetPCMarkerHit ( player )
	if player == lp then
		showFruitDesktop_func ()
	end
end
addEventHandler ( "onClientMarkerHit", internetPCMarker, internetPCMarkerHit )
]]