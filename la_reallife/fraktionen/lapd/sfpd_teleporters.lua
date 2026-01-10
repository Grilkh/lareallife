------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

PoliceComputer = createObject ( 2190, 229.83325195313, 124.82567596436, 1010.1395874023, 0, 0, 200 )
setElementInterior ( PoliceComputer, 10 )

local SFPDExit = createMarker ( 246.4075012207, 107.34195709229, 1003, "corona", 1.5, 0, 255, 0, 150 )
setElementInterior (SFPDExit, 10)

local SFPDEnter = createMarker ( -1605.7623291016, 711.326171875, 14, "corona", 1.5, 0, 255, 0, 150 )

local ToGarageSFPD = createMarker( 214.498, 119.98, 1003.21875, 'corona', 1.5, 255, 0, 0, 150 )
setElementInterior (ToGarageSFPD, 10)

local FromGarageSFPD = createMarker( -1606.3798828125, 672.5166015625, -4.90625, 'corona', 1.5, 255, 0, 0, 150 )

local stellenSFPD = createMarker ( 241.099, 112.790, 1002.27875, "cylinder", 1.5, 0, 255, 0, 150 )
setElementInterior (stellenSFPD, 10)

local SFPDHeliExit = createMarker ( -1647.301, 748.37, 79.688, "corona", 1.5, 255, 0, 0, 150 )

local SFPDHeliEnter = createMarker ( -1650.875, 749.532, 16.519, "corona", 1.5, 0, 255, 0, 150 )

local function ToGarageSFPD_func( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			if isOnStateDuty(hitElement) then
				fadeElementInterior ( hitElement, 0, -1606.397, 675.74, -5.244, 0, 0)
			else
				outputChatBox ( "Du hast den Schlüssel nicht dabei! Geh zuerst in Dienst!", hitElement, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht befugt, da du kein Staatsbeamter bist!", hitElement, 200, 0, 0 )
		end
	end
end
end
addEventHandler( "onMarkerHit", ToGarageSFPD, ToGarageSFPD_func )


local function FromGarageSFPD_func( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			if isOnStateDuty(hitElement) then
				fadeElementInterior ( hitElement, 10, 218.281, 119.3898, 1003.21975, 270, 0)
				infobox ( hitElement, "\n\nWillkommen im SFPD!", 5000, 0, 125, 0 )
			else
				outputChatBox ( "Du hast den Schlüssel nicht dabei! Geh zuerst in Dienst!", hitElement, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht befugt, da du kein Staatsbeamter bist!", hitElement, 200, 0, 0 )
		end
	end
end
end
addEventHandler( "onMarkerHit", FromGarageSFPD, FromGarageSFPD_func )

local function SFPDExit_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		fadeElementInterior ( hitElement, 0, -1605.874, 713.489, 13.44, 0, 0)
	end
end
end
addEventHandler ( "onMarkerHit", SFPDExit, SFPDExit_func )


local function SFPDEnter_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		fadeElementInterior ( hitElement, 10, 245.92279052734, 111.5924911499, 1003, 0, 0)
		infobox ( hitElement, "\n\nWillkommen im SFPD!", 5000, 0, 125, 0 )
	end
end
end
addEventHandler ( "onMarkerHit", SFPDEnter, SFPDEnter_func )

local function SFPDHeliExit_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			fadeElementInterior ( hitElement, 0, -1653.343, 749.869, 16.997, 0, 0)
			infobox ( hitElement, "\n\nWillkommen zurück!", 5000, 0, 125, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", SFPDHeliExit, SFPDHeliExit_func )


local function SFPDHeliEnter_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isCop(hitElement) or isFBI(hitElement) or isArmy(hitElement) then
			if isOnStateDuty(hitElement) then
				fadeElementInterior ( hitElement, 0, -1647.585, 750.481, 79.688, 0, 0)
				infobox ( hitElement, "\n\nGuten Flug!", 5000, 0, 125, 0 )
			else
				outputChatBox ( "Du hast den Schlüssel nicht dabei! Geh zuerst in Dienst!", hitElement, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist nicht befugt, da du kein Staatsbeamter bist!", hitElement, 200, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", SFPDHeliEnter, SFPDHeliEnter_func )

sfpdped = createPed(280, 238.303, 112.845, 1003.21875)
outputDebugString("sfpd_teleporters: 114 - PED erstellt sfpdped")
setElementInterior (sfpdped, 10)
setElementDimension ( sfpdped, 0)
setPedRotation(sfpdped, 270)
setElementData ( sfpdped, "undeadbarped", true )
setElementFrozen (sfpdped, true)


local function stellenSFPD_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if laGetElementData (hitElement, "wanteds") >= 1 then
			if laGetElementData (hitElement, "stellen") == false then
				outputChatBox ( "Du möchtest dich stellen?", hitElement, 0, 125, 0 )
				outputChatBox ( "Verwende /stellen und die Polizei kommt so schnell wie möglich!", hitElement, 0, 125, 0 )
				laSetElementData (hitElement, "stellen", true)
				setTimer(stellendisable_func, 300000, 1, hitElement)
			else
				outputChatBox ( "Du hast dich in den letzten 5 Minuten bereits gemeldet!", hitElement, 150, 0, 0 )
			end
		else
			outputChatBox ( "Du wirst nicht gesucht!", hitElement, 200, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", stellenSFPD, stellenSFPD_func )

local function stellendisable_func ( hitElement)
if getElementType(hitElement) == "player" then
	laSetElementData (hitElement, "stellen", false)
end
end

local SecurityZoneSFPD = createColSphere ( 238.98, 117.6588, 1003.21875, 2.5 )
setElementInterior (SecurityZoneSFPD, 10)

local SecurityZone2SFPD = createColSphere ( 253.1352, 109.196, 1003.21875, 2.5 )
setElementInterior (SecurityZone2SFPD, 10)

local JailZoneSFPD = createColSphere ( 217.66, 117.71, 999.015, 2.5 )
setElementInterior (JailZoneSFPD, 10)

local function SecurityZoneSFPDHit ( player )
if isCop(player) or isFBI(player) or isArmy(player) then
else
	if source == JailZoneSFPD then
		infobox ( player, "\n\nMelde dich bei der Polizei,\nwenn du einen Freund besuchen möchtest.", 5000, 0, 150, 0 )
	else
		infobox ( player, "\n\nACHTUNG:\nHier darfst du nur mit Erlaubnis durch!", 5000, 255, 0, 0 )
	end
end
end
 addEventHandler ( "onColShapeHit", SecurityZoneSFPD, SecurityZoneSFPDHit )
 addEventHandler ( "onColShapeHit", SecurityZone2SFPD, SecurityZoneSFPDHit )
 addEventHandler ( "onColShapeHit", JailZoneSFPD, SecurityZoneSFPDHit ) 