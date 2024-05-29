local rathauspickup_1 = createMarker ( -2171.470, 252.101, 35.337, "corona", 1.2, 125, 0, 0, 255 )

local jobchoosepickup = createPickup ( 362.4522, 173.657, 1008.00828125, 3, 1210, 50)
setElementInterior (jobchoosepickup, 3, 362.39953613281, 180.4635925293, 1008.0034790039)

local function jobchoosepickup_func (player)
	setPedFrozen ( player, true )
    setTimer ( setPedFrozen, 100, 1, player, false )
	triggerClientEvent ( player, "showJobGui", getRootElement() )
	showCursor ( player, true )
	setElementData ( player, "ElementClicked", true )
end
addEventHandler ( "onPickupHit", jobchoosepickup, jobchoosepickup_func )

local function pickedUpRathaus (source)

	if getPedOccupiedVehicle(source) == false then
		fadeElementInterior ( source, 3, 387.705, 174.3994, 1008.3828)
		toggleControl ( source, "fire", false )
		toggleControl ( source, "enter_exit", false )
		setElementData(source,"nodmzone", 1)
		infobox ( hitElement, "\n\nHerzlich Willkommen im Jobcenter!", 5000, 0, 125, 0 )
	end
end
addEventHandler ( "onMarkerHit", rathauspickup_1, pickedUpRathaus )

local rathauspickup_2 = createMarker ( 389.90, 173.898, 1008.3828, "corona", 1.2, 125, 0, 0, 255 )
setElementInterior (rathauspickup_2, 3)

local function pickedUpRathaus2 (source)

   fadeElementInterior ( source, 0, -2168.438, 252.2, 35.3297)
   toggleControl ( source, "fire", true )
   toggleControl ( source, "enter_exit", true )
   setElementData(source,"nodmzone", 0)
end
addEventHandler ( "onMarkerHit", rathauspickup_2, pickedUpRathaus2 )

rathausped = createPed(141, 359.7138671875, 173.625765625, 1008.38934)
setElementInterior (rathausped, 3)
setPedRotation(rathausped, 280)
setElementData ( rathausped, "undeadbarped", true )