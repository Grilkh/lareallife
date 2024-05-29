local discoBlip = 48
createBlip ( -2552.9599609375, 193.01498413086, 5.7878270149231, discoBlip, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

local discoEnterMarker = createMarker ( -2551.1716308594, 193.70712280273, 6.0384402275085, "corona", 1.5, 0, 255, 0, 150 )
local discoExitMarker = createMarker ( 493.41168212891, -24.308652877808, 1000.57861328125, "corona", 1.5, 0, 255, 0, 150 )
setElementInterior ( discoExitMarker, 17 )

local function enterDisco ( hit, dim )
if getElementType(hit) == "player" and (dim) then
	if isPedInVehicle ( hit ) == false then
			if not getPedOccupiedVehicle ( hit ) then
				local x, y, z, r = 493.40060424805, -22.230197906494, 1000.328918457, 0
				fadeElementInterior ( hit, 17, x, y, z, r )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", discoEnterMarker, enterDisco )

local function exitDisco ( hit, dim )
if getElementType(hit) == "player" and (dim) then
	if isPedInVehicle ( hit ) == false then
			if not getPedOccupiedVehicle ( hit ) then
				local x, y, z, r = -2552.9599609375, 193.01498413086, 5.7878270149231, 105
				fadeElementInterior ( hit, 0, x, y, z, r )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", discoExitMarker, exitDisco )