local FederalToHeli = createMarker ( -2446.7297363281, 528.22644042969, 30.273189544678, "corona", 1.5, 255, 0, 0, 150 )
local FederalFromHeli = createMarker ( -2454.3820800781, 515.05053710938, 45.502365112305, "corona", 1.5, 255, 0, 0, 150 )
local FederalToBunker = createMarker ( -2470.2028808594, 485.21612548828, 30.036027908325, "corona", 1.5, 255, 0, 0, 150 )
local FederalFromBunker = createMarker ( -2434.0083007813, 502.66101074219, -22.260213851929, "corona", 1.5, 255, 0, 0, 150 )

local function FederalToHeli_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isFBI(hitElement) or isArmy(hitElement) or isCop(hitElement) then
			setElementPosition ( hitElement, -2454.2243652344, 512.92053222656, 45.211734771729 )
			infobox ( hitElement, "\n\nWillkommen, guten Flug!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Nur für Staatsfraktionen!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", FederalToHeli, FederalToHeli_func )

local function FederalFromHeli_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isFBI(hitElement) or isArmy(hitElement) or isCop(hitElement) then
			setElementPosition ( hitElement, -2443.9675292969, 527.796875, 29.565580368042 )
			infobox ( hitElement, "\n\nWillkommen zurück!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Nur für Staatsfraktionen!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", FederalFromHeli, FederalFromHeli_func )

local function FederalToBunker_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isFBI(hitElement) then
			setElementPosition ( hitElement, -2433.6518554688, 499.89215087891, -22.418783187866 )
			infobox ( hitElement, "\n\nWillkommen, Agent!", 5000, 0, 125, 0 )
		else
			outputChatBox ( "Nur für FBI Agenten!", hitElement, 125, 0, 0 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", FederalToBunker, FederalToBunker_func )

local function FederalFromBunker_func ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if isFBI(hitElement) then
			setElementPosition ( hitElement, -2469.3479003906, 482.94918823242, 29.585912704468 )
		end
	end
end
end
addEventHandler ( "onMarkerHit", FederalFromBunker, FederalFromBunker_func )