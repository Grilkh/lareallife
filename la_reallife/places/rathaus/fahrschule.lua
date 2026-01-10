------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local FahrschuleToInt = createMarker ( -2026.6467, -101.317, 35.164, "corona", 1.5, 0, 255, 0, 150 )
local FahrschuleFromInt = createMarker ( -2029.757, -119.1715, 1035.171, "corona", 1.5, 0, 255, 0, 150 )
setElementInterior (FahrschuleFromInt, 3)
setElementDimension (FahrschuleFromInt, 5)


local function FahrschuleToInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		fadeElementInterior ( hitElement, 3, -2029.757, -117.7415, 1035.171 )
		setElementDimension ( hitElement, 5)
		infobox ( hitElement, "\n\nHerzlich Willkommen in der Fahrschule!", 5000, 0, 125, 0 )
		toggleControl ( hitElement, "fire", false )
		toggleControl ( hitElement, "enter_exit", false )
		setElementData( hitElement,"nodmzone", 1)
		setPedRotation ( hitElement, 0)
	end
end
end
addEventHandler ( "onMarkerHit", FahrschuleToInt, FahrschuleToInt_func )

local function FahrschuleFromInt_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		fadeElementInterior ( hitElement, 0, -2026.3571, -98.87, 35.164 )
		setElementDimension ( hitElement, 0)
		toggleControl ( hitElement, "fire", true )
		toggleControl ( hitElement, "enter_exit", true )
		setElementData( hitElement,"nodmzone", 0)
		setPedRotation ( hitElement, 0)
	end
end
end
addEventHandler ( "onMarkerHit", FahrschuleFromInt, FahrschuleFromInt_func )

local fahrschulmarker = createMarker ( -2032.49475, -117.4553, 1034.171, "cylinder", 1.5, 0, 0, 255, 150 )
setElementInterior ( fahrschulmarker, 3)
setElementDimension ( fahrschulmarker, 5)

local function fahrschulmarker_func (hitElement, dim)
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		setElementFrozen ( hitElement, true )
		setTimer ( setElementFrozen, 100, 1, hitElement, false )
		triggerClientEvent ( hitElement, "ShowRathausMenue", getRootElement() )
		showCursor ( hitElement, true )
		setElementData ( hitElement, "ElementClicked", true )
	end
end
end
addEventHandler ( "onMarkerHit", fahrschulmarker, fahrschulmarker_func )


fahrschuleped = createPed(141, -2035.193, -117.448, 1035.171)
setElementInterior (fahrschuleped, 3)
setElementDimension ( fahrschuleped, 5)
setPedRotation(fahrschuleped, 270)
setElementData ( fahrschuleped, "undeadbarped", true )