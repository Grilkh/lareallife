local PlaneExitMarker = createMarker ( 315.65246582031, 1029.5246582031, 1949.32, "corona", 20, 255, 255, 255, 150 )
setElementInterior ( PlaneExitMarker, 9 )
local PlaneEnterMarker = createMarker ( -1552.60546875, -427.16171264648, 4.99, "cylinder", 1.5, 0, 0, 255, 150 )

local BasejumpTowerDown = createMarker ( -1753.609375, 883.71209716797, 295.5009765625, "corona", 1, 0, 255, 0, 150 )
local BasejumpTowerUp = createMarker ( -1749.3293457031, 870.81555175781, 24.035942077637, "corona", 3, 0, 255, 0, 150 )

skydivePrice = 1000

local function PlaneEnterMarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		infobox ( hitElement, "\n\nVerwende /fallschirm um für "..skydivePrice.."$\neinen Fallschirmsprung zu machen!", 7500, 255, 255, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", PlaneEnterMarker, PlaneEnterMarkerHit )

local function PlaneExitMarkerHit ( player, dim )
	if dim then
		fadeElementInterior ( player, 0, -2250, 455, 3000 )
	end
end
addEventHandler ( "onMarkerHit", PlaneExitMarker, PlaneExitMarkerHit )

local function parachute_func ( player )
if isPedInVehicle ( player ) == false then
	local x, y, z = getElementPosition ( player )
	if getDistanceBetweenPoints3D ( -1552.60546875, -427.16171264648, 4.99, x, y, z ) <= 3 then
		if laGetElementData ( player, "money" ) >= skydivePrice then
			if laGetElementData ( player, "wanteds") < 1 then
				takePlayerSaveMoney ( player, skydivePrice )
				removePedFromVehicle ( player )
				fadeElementInterior ( player, 9, 315.77294921875, 986.72650146484, 1958.1627197266 )
				giveWeapon ( player, 46, 1, true )
			else
				infobox ( player, "\n\nDu wirst gesucht!", 5000, 200, 0, 0 )
			end
		else
			infobox ( player, "\n\nDu hast nicht genug Geld.\nDer Sprung kostet "..skydivePrice.."$!", 7500, 200, 0, 0 )
		end
	else
		infobox ( player, "\n\nDu bist zu weit entfernt!", 5000, 200, 0, 0 )
	end
end
end
addCommandHandler ( "parachute", parachute_func )
addCommandHandler ( "fallschirm", parachute_func )

local function BasejumpTowerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == BasejumpTowerDown then
			fadeElementInterior ( hitElement, 0, -1749.3260498047, 867.03533935547, 24.735162734985 )
		elseif source == BasejumpTowerUp then
			fadeElementInterior ( hitElement, 0, -1753.6976318359, 885.82843017578, 295.52423095703 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", BasejumpTowerDown, BasejumpTowerHit )
addEventHandler ( "onMarkerHit", BasejumpTowerUp, BasejumpTowerHit )