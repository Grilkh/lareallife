local x, y, z = -1882.7956542969, 866.05242919922, 35.565866851807
local zipEntrance = createMarker ( x, y, z, "corona", 1.5, 0, 0, 255, 150 )
local zipExit = createMarker ( 161.54940795898, -95.684967041016, 1000.807128906, "corona", 1.5, 0, 0, 255, 150 )
local zipBuy = createMarker ( 181.23762512207, -91.531929016113, 1000.82, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( zipExit, 18 )
setElementInterior ( zipBuy, 18 )

zipBlip = createBlip ( x, y, z, 45, 1, 0, 0, 0, 0, 0, 200, getRootElement() )

function clothesBuyServer_func ( player, skinid, skinpreis )

	if player == client and tostring ( skinid ) == MySQL_Save ( tostring ( skinid ) )then
		local skinpreis = tonumber ( skinpreis )
		local money = tonumber( laGetElementData ( player, "money" ) )
		if money >= skinpreis then
			laSetElementData ( player, "skinid", skinid )
			laSetElementData ( player, "money", money - skinpreis )
			takePlayerMoney ( player, skinpreis )
			playSoundFrontEnd ( player, 40 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			triggerClientEvent ( player, "sucessfullBuyed", getRootElement() )
			setPedSkin ( player, skinid )
			setElementDimension ( player, 0 )
		else
			infobox ( player, "\n\nDu hast zu wenig Geld!\nDer Skin kostet "..skinpreis.."$!", 5000, 125, 0, 0 )
		end
		setPlayerNametagShowing ( player, true )
	end
end
addEvent ( "clothesBuyServer", true )
addEventHandler ( "clothesBuyServer", getRootElement(), clothesBuyServer_func )

function clothesCancel_func ()
	setElementDimension ( client, 0 )
end
addEvent ( "clothesCancel", true )
addEventHandler ( "clothesCancel", getRootElement(), clothesCancel_func )

local function zipMarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == zipEntrance then
			setElementInterior ( hitElement, 18, 161.66276550293, -93.030876159668, 1001.453918457 )
		elseif source == zipExit then
			setElementInterior ( hitElement, 0, -1886.0278320313, 863.37353515625, 34.822071075439 )
		elseif source == zipBuy then
			setElementDimension ( hitElement, math.random ( 1, 100000) )
			triggerClientEvent ( hitElement, "_createSkinauswahlGui", hitElement )
			showCursor ( hitElement, true )
			laSetElementData ( hitElement, "ElementClicked", true )
			toggleAllControls ( hitElement, false )
			setElementPosition ( hitElement, 181.53558349609, -88.071517944336, 1001.672668457 )
			setCameraMatrix ( hitElement, 178.41389465332, -87.539283752441, 1001.2360839844, 181.53558349609, -88.071517944336, 1001.672668457 )
		else
		end
	end
	setPlayerNametagShowing ( hitElement, true )
end
end
addEventHandler ( "onMarkerHit", zipEntrance, zipMarkerHit )
addEventHandler ( "onMarkerHit", zipExit, zipMarkerHit )
addEventHandler ( "onMarkerHit", zipBuy, zipMarkerHit )