------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

local x, y, z = 461.126953125, -1500.810546875, 31.059518814087
local VictimEntrance = createMarker ( x, y, z, "corona", 1.2, 0, 0, 255, 150 )
local VictimExit = createMarker ( 227.3932800293, -8.2430076599121, 1001.2109375, "corona", 1.5, 0, 0, 255, 150 )
local VictimBuy = createMarker ( 208.79266357422, -3.529522895813, 1001.2177734375, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( VictimExit, 5 )
setElementInterior ( VictimBuy, 5 )

VictimBlip = createBlip ( x, y, z, 45, 1, 0, 0, 0, 0, 0, 200, getRootElement() )

function VictimclothesBuyServer_func ( player, skinid, skinpreis )

	if player == client and tostring ( skinid ) == MySQL_Save ( tostring ( skinid ) )then
		local skinpreis = tonumber ( skinpreis )
		local money = tonumber( laGetElementData ( player, "money" ) )
		if money >= skinpreis then
			laSetElementData ( player, "skinid", skinid )
			laSetElementData ( player, "money", money - skinpreis )
			takePlayerMoney ( player, skinpreis )
			playSoundFrontEnd ( player, 40 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			triggerClientEvent ( player, "VictimsucessfullBuyed", getRootElement() )
			setPedSkin ( player, skinid )
			setElementDimension ( player, 0 )
		else
			infobox ( player, "\n\nDu hast zu wenig Geld!\nDer Skin kostet "..skinpreis.."$!", 5000, 125, 0, 0 )
		end
		setPlayerNametagShowing ( player, true )
	end
end
addEvent ( "VictimclothesBuyServer", true )
addEventHandler ( "VictimclothesBuyServer", getRootElement(), VictimclothesBuyServer_func )

function VictimclothesCancel_func ()

	setElementPosition ( player, 225.42120361328, -8.517578125, 1002.2109375 )
	setElementDimension ( player, 0 )
end
addEvent ( "VictimclothesCancel", true )
addEventHandler ( "VictimclothesCancel", getRootElement(), VictimclothesCancel_func )


local function VictimMarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == VictimEntrance then
			setElementInterior ( hitElement, 5, 225.42120361328, -8.229642868042, 1002.2109375, 180 )
		elseif source == VictimExit then
			setElementInterior ( hitElement, 0, 459.27734375, -1500.810546875, 31.059518814087 )
		elseif source == VictimBuy then
			setElementDimension ( hitElement, math.random ( 1, 100000) )
			triggerClientEvent ( hitElement, "_createSkinauswahlVictimGui", hitElement )
			showCursor ( hitElement, true )
			laSetElementData ( hitElement, "ElementClicked", true )
			toggleAllControls ( hitElement, false )
			setElementPosition ( hitElement, 207.5791015625, -11.6884765625, 1005.2109375 )
			setCameraMatrix ( hitElement, 207.95703125, -7.8359375, 1006.1716918945, 207.5791015625, -11.6884765625, 1005.2109375 )
		else
		end
	end
	setPlayerNametagShowing ( hitElement, true )
end
end
addEventHandler ( "onMarkerHit", VictimEntrance, VictimMarkerHit )
addEventHandler ( "onMarkerHit", VictimExit, VictimMarkerHit )
addEventHandler ( "onMarkerHit", VictimBuy, VictimMarkerHit )