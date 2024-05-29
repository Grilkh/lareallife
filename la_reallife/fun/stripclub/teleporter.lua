local stripEnterMarker = createMarker ( -2624.5581054688, 1412.1166992188, 6.9, "corona", 1.5, 0, 255, 0, 150)
stripBlip = createBlip ( -2624.5581054688, 1412.1166992188, 6.9, 21, 2, 255, 0, 0, 255, 0, 200, getRootElement() )

local function StripEnterMarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		fadeElementInterior ( hitElement, 3, -2636.96875, 1404.4047851563, 906.1 )
		toggleControl ( hitElement, "fire", false )
		toggleControl ( hitElement, "enter_exit", false )
		laSetElementData( hitElement, "nodmzone", 1 )
		infobox ( hitElement, "\n\nWillkommen bei Jizzys!", 5000, 0, 125, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", stripEnterMarker, StripEnterMarkerHit )

local stripEnterMarkerExit = createMarker ( -2636.9182128906, 1402.5383300781, 905.95, "corona", 1.5, 0, 255, 0, 150)
setElementInterior ( stripEnterMarkerExit, 3 )

local function StripEnterMarkerExitHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		fadeElementInterior ( hitElement, 0, -2624.2016601563, 1410.0379638672, 6.74 )
		toggleControl ( hitElement, "fire", true )
		toggleControl ( hitElement, "enter_exit", true )
		laSetElementData( hitElement, "nodmzone", 0 )
	end
end
end
addEventHandler ( "onMarkerHit", stripEnterMarkerExit, StripEnterMarkerExitHit )