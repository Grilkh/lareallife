------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local CamorraSFToHeli = createMarker ( -1676.1, 1376, 9.8, "corona", 1.5, 255, 0, 0, 150 )
local CamorraSFFromHeli = createMarker ( -1683.7, 1382.5, 14.8, "corona", 1.5, 255, 0, 0, 150 )
local CamorraFromHeli = createMarker ( 725.61, -1450.845, 17.695, "corona", 1.5, 255, 0, 0, 150 )
local CamorraToHeli = createMarker ( 725.5, -1440.5999755859, 13.5, "corona", 1.5, 255, 0, 0, 150 )

local function CamorraSFToHeli_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCamorra(hitElement) or isGatePermitted(hitElement) then
			setElementPosition ( hitElement, -1685.223, 1380.985, 14.79 )
			infobox ( hitElement, "\n\nGuten Flug!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Du bist kein Mitglied der Camorra oder nicht befugt!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", CamorraSFToHeli, CamorraSFToHeli_func )

local function CamorraSFFromHeli_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCamorra(hitElement) or isGatePermitted(hitElement) then
			setElementPosition ( hitElement, -1672.689, 1374.521, 9.797 )
		else
			outputChatBox ( "Du bist kein Mitglied der Camorra oder nicht befugt!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", CamorraSFFromHeli, CamorraSFFromHeli_func )




local function CamorraToHeli_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCamorra(hitElement) or isGatePermitted(hitElement) then
			setElementPosition ( hitElement, 725.107, -1448.421, 17.695 )
			infobox ( hitElement, "\n\nGuten Flug!", 5000, 0, 125, 0 )
		end
	else
		outputChatBox ( "Du bist kein Mitglied der Camorra oder nicht befugt!", hitElement, 125, 0, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", CamorraToHeli, CamorraToHeli_func )

local function CamorraFromHeli_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCamorra(hitElement) or isGatePermitted(hitElement) then
			setElementPosition ( hitElement, 725.582, -1437.162, 13.532 )
		end
	else
		outputChatBox ( "Du bist kein Mitglied der Camorra oder nicht befugt!", hitElement, 125, 0, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", CamorraFromHeli, CamorraFromHeli_func )
