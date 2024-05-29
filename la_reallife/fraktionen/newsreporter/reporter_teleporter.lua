------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local ReporterToInt = createMarker ( -2056.305, 455.23123, 35.171875, "corona", 1.5, 255, 0, 0, 150 )
local ReporterFromInt = createMarker ( -2027.032, -104.441, 1035.171875, "corona", 1.5, 255, 0, 0, 150 )
setElementInterior (ReporterFromInt, 3)


local function ReporterToInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isReporter(hitElement) or isGatePermitted(hitElement) then
			fadeElementInterior ( hitElement, 3, -2029.0856, -104.059, 1035.171875 )
			infobox ( hitElement, "\n\nWillkommen Reporter!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Du bist kein Reporter oder nicht befugt!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", ReporterToInt, ReporterToInt_func )

local function ReporterFromInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isReporter(hitElement) or isGatePermitted(hitElement) then
			fadeElementInterior ( hitElement, 0, -2054.083, 457.3856, 35.171875 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", ReporterFromInt, ReporterFromInt_func )