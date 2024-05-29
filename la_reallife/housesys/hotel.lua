createBlip ( -2425.0747070313, 337.34390258789, 36.858688354492, 31, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
createBlip ( 2027.2297363281, 1917.2536621094, 11.986656188965, 31, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

local hotelInfoIconSF = createPickup ( -2425.0747070313, 337.34390258789, 36.858688354492, 3, 1273, 1000 )
local hotelInfoIconLV = createPickup ( 2027.2297363281, 1917.2536621094, 11.986656188965 + 1, 3, 1273, 1000 )

local hotelRoomExit = createMarker ( 2233.6398925781, -1114.7894287109, 1050.5319824219, "checkpoint", 1.5, 0, 255, 0, 150 )
setElementInterior ( hotelRoomExit, 5 )
local hotelExit = createMarker ( 2266.1545410156, 1647.615234375, 1083.8835449219, "checkpoint", 1.5, 0, 255, 0, 150 )
setElementInterior ( hotelExit, 1 )

local function hotelInfoIconHitSF ( player )
	infobox ( player, "\n\nUm hier zu starten, verwende das\n/self-Menü und wähle Hotel SF.\nDies kostet 100$.", 7500, 0, 125, 0 )
end
addEventHandler ( "onPickupHit", hotelInfoIconSF, hotelInfoIconHitSF )

local function hotelInfoIconLVHit ( player )
	infobox ( player, "\n\nUm hier zu starten, verwende das\n/self-Menü und wähle Hotel LV.\nDies kostet 100$.", 7500, 0, 125, 0 )
end
addEventHandler ( "onPickupHit", hotelInfoIconLV, hotelInfoIconLVHit )

local function hotelRoomExitHit ( player, dim )
	if dim then
		fadeCamera ( player, false, 1, 0, 0, 0 )
		setTimer ( fadeBack, 1000, 1, player, 1, 2271.1025390625, 1642.3409423828, 1083.8835449219 )
	end
end
addEventHandler ( "onMarkerHit", hotelRoomExit, hotelRoomExitHit )

local function hotelExitHit ( player, dim )
	if dim then
		fadeCamera ( player, false, 1, 0, 0, 0 )
		-- SF, 90
		if laGetElementData ( player, "spawnpos_x" ) == 2230.5236816406 then
			setTimer ( fadeBack, 1000, 1, player, 0, -2425.0747070313, 337.34390258789, 36.858688354492 )
		-- Else
		else
			setTimer ( fadeBack, 1000, 1, player, 0, 2027.2297363281, 1917.2536621094, 11.986656188965, 90 )
		end
	end
end
addEventHandler ( "onMarkerHit", hotelExit, hotelExitHit )

function fadeBack ( player, i, x, y, z )
	if getPlayerPing ( player ) then
		fadeCamera ( player, true, 1 )
		setElementInterior ( player, i, x, y, z )
	end
end