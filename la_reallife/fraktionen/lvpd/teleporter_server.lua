------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local LVPDExit = createMarker ( 288.864, 167.544, 1007.172, "corona", 1.5, 0, 255, 0, 150 )
setElementInterior (LVPDExit, 3)

local LVPDEnter = createMarker ( 2337.1750488281, 2459.0568847656, 14.948640823364, "corona", 1.5, 0, 255, 0, 150 )

local LVPDGarageIn = createMarker ( 238.61047363281, 139.08728027344, 1003.01171875, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior ( LVPDGarageIn, 3 )

local LVPDGarageOut = createMarker ( 2268.056640625, 2448.818359375, 3.5142693519592, "corona", 1.5, 255, 0, 0, 150 )

local function LVoutTOinGarage ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			if isOnStateDuty(hitElement) then
				fadeElementInterior ( hitElement, 3, 238.29, 141.676, 1003.023 )
				infobox ( hitElement, "\n\nWillkommen im LVPD!", 5000, 0, 125, 0 )
			else
				outputChatBox ( "Du hast den Schlüssel nicht dabei! Geh zuerst in Dienst!", hitElement, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht befugt, da du kein Staatsbeamter bist!", hitElement, 200, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", LVPDGarageOut, LVoutTOinGarage )

local function LVinTOoutGarage ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			if isOnStateDuty(hitElement) then
				fadeElementInterior ( hitElement, 0, 2268.0358886719, 2447.0505371094, 3.1804757118225 )
			else
				outputChatBox ( "Du hast den Schlüssel nicht dabei! Geh zuerst in Dienst!", hitElement, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht befugt, da du kein Staatsbeamter bist!", hitElement, 200, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", LVPDGarageIn, LVinTOoutGarage )

local function LVPDExit_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		fadeElementInterior ( hitElement, 0, 2337.149, 2456.479, 14.969 )
    end
end
end
addEventHandler ( "onMarkerHit", LVPDExit, LVPDExit_func )

local function LVPDEnter_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		fadeElementInterior ( hitElement, 3, 288.701, 170.381, 1007.179 )
		infobox ( hitElement, "\n\nWillkommen im LVPD!", 5000, 0, 125, 0 )
    end
end
end
addEventHandler ( "onMarkerHit", LVPDEnter, LVPDEnter_func )

createBlip ( 2337.1750488281, 2459.0568847656, 13.948640823364, 30, 2, 0, 0, 0, 255, 0, 200 )