------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

--SF1
local x1, y1, z1 = -1808.3822021484, 945.3701171875, 23.848808288574
SF1_Pizza = createBlip ( x1, y1, z1, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( SF1_Pizza, getRootElement(), false)
--SF2
local x2, y2, z2 = -1721.3131103516, 1359.7663574219, 6.6736726760864
SF2_Pizza = createBlip ( x2, y2, z2, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( SF2_Pizza, getRootElement(), false)
--LS1
local x3, y3, z3 = 2105.474, -1806.535, 13.555
LS1_Pizza = createBlip ( x3, y3, z3, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LS1_Pizza, getRootElement(), false)
--LV1
local x4, y4, z4 = 2756.748, 2477.368, 11.062
LV1_Pizza = createBlip ( x4, y4, z4, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV1_Pizza, getRootElement(), false)
--LV2
local x5, y5, z5 = 2330.648, 2533.395, 10.82
LV2_Pizza = createBlip ( x5, y5, z5, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV2_Pizza, getRootElement(), false)
--LV3
local x6, y6, z6 = 2638.785, 1849.743, 11.023
LV3_Pizza = createBlip ( x6, y6, z6, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV3_Pizza, getRootElement(), false)
--LV4
local x7, y7, z7 = 2083.309, 2224.7, 11.023
LV4_Pizza = createBlip ( x7, y7, z7, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV4_Pizza, getRootElement(), false)
--Palomino
local x8, y8, z8 = 2331.825, 75.036, 26.621
Palomino_Pizza = createBlip ( x8, y8, z8, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( Palomino_Pizza, getRootElement(), false)
--Montgomery
local x9, y9, z9 = 1367.407, 248.438, 19.567
Montgomery_Pizza = createBlip ( x9, y9, z9, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( Montgomery_Pizza, getRootElement(), false)
--Blueberry
local x10, y10, z10 = 212.427, -202.231, 1.578
Blueberry_Pizza = createBlip ( x10, y10, z10, 29, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( Blueberry_Pizza, getRootElement(), false)

local Leave_Pizza = {}

local function Exit_Pizza_MarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == Leave_Pizza[1] then
			setElementInterior ( hitElement, 0, -1806, 945.3701171875, 24.5 )
		elseif source == Leave_Pizza[2] then
			setElementInterior ( hitElement, 0, -1724.324, 1360.114, 7.188 )
		elseif source == Leave_Pizza[3] then
			setElementInterior ( hitElement, 0, 2103.621, -1806.449, 13.555 )
		elseif source == Leave_Pizza[4] then
			setElementInterior ( hitElement, 0, 2755.366, 2475.8, 11.0625 )
		elseif source == Leave_Pizza[5] then
			setElementInterior ( hitElement, 0, 2330.499, 2530.822, 10.82 )
		elseif source == Leave_Pizza[6] then
			setElementInterior ( hitElement, 0, 2636.129, 1849.89, 11.023 )
		elseif source == Leave_Pizza[7] then
			setElementInterior ( hitElement, 0, 2083.45, 2222.954, 10.82 )
		elseif source == Leave_Pizza[8] then
			setElementInterior ( hitElement, 0, 2334.801, 75.065, 26.484 )
		elseif source == Leave_Pizza[9] then
			setElementInterior ( hitElement, 0, 1365.703, 249.18, 19.567 )
		elseif source == Leave_Pizza[10] then
			setElementInterior ( hitElement, 0, 212.601, -205.18, 1.578 )
		end
		setElementDimension ( hitElement, 0 )
		toggleControl ( hitElement, "fire", true )
		toggleControl ( hitElement, "enter_exit", true )
		laSetElementData( hitElement, "nodmzone", 0 )
		setPlayerNametagShowing ( hitElement, true )
	end
end
end


--leaveMarker
local x0, y0, z0 = 372.29702758789, -133.29911804199, 1000.4741210938

for i=1, 10, 1 do
Leave_Pizza[i] = createMarker ( x0, y0, z0, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( Leave_Pizza[i], 5 )
setElementDimension ( Leave_Pizza[i], i )
addEventHandler ( "onMarkerHit", Leave_Pizza[i], Exit_Pizza_MarkerHit )
end


local SF1_Pizza_Enter = createMarker ( x1, y1, z1, "corona", 1.5, 0, 0, 255, 150 )
local SF2_Pizza_Enter = createMarker ( x2, y2, z2, "corona", 1.5, 0, 0, 255, 150 )
local LS1_Pizza_Enter = createMarker ( x3, y3, z3, "corona", 1.5, 0, 0, 255, 150 )
local LV1_Pizza_Enter = createMarker ( x4, y4, z4, "corona", 1.5, 0, 0, 255, 150 )
local LV2_Pizza_Enter = createMarker ( x5, y5, z5, "corona", 1.5, 0, 0, 255, 150 )
local LV3_Pizza_Enter = createMarker ( x6, y6, z6, "corona", 1.5, 0, 0, 255, 150 )
local LV4_Pizza_Enter = createMarker ( x7, y7, z7, "corona", 1.5, 0, 0, 255, 150 )
local Palomino_Pizza_Enter = createMarker ( x8, y8, z8, "corona", 1.5, 0, 0, 255, 150 )
local Montgomery_Pizza_Enter = createMarker ( x9, y9, z9, "corona", 1.5, 0, 0, 255, 150 )
local Blueberry_Pizza_Enter = createMarker ( x10, y10, z10, "corona", 1.5, 0, 0, 255, 150 )

local mx, my, mz = 376.69479370117, -120.20676422119, 1000.4741210938

local Buy_Pizza = {}

healthyPizza = createObject ( 2355, 375.45205688477, -118.02765655518, 1001.580078125, 335, 25, 252.5 )
setElementDimension ( healthyPizza, 1337 )
setElementInterior ( healthyPizza, 5 )

bigPizza = createObject ( 2220, 377.63815307617, -118.02765655518, 1001.58, 335, 25, 252.5 )
setElementDimension ( bigPizza, 1337 )
setElementInterior ( bigPizza, 5 )

mediumPizza = createObject ( 2219, 379.09591674805, -118.02765655518, 1001.58, 335, 25, 252.5 )
setElementDimension ( mediumPizza, 1337 )
setElementInterior ( mediumPizza, 5 )

smallPizza = createObject ( 2218, 373.5, -118.02765655518, 1001.58, 335, 25, 252.5 )
setElementDimension ( smallPizza, 1337 )
setElementInterior ( smallPizza, 5 )

local function pizzaBuyHit ( player, dim )

	if dim == true then
		laSetElementData ( player, "intdim", getElementDimension ( player ) )
		laSetElementData ( player, "curpizza", 1 )
		setElementDimension ( player, 1337 )
		local px, py, pz = getElementPosition ( healthyPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		bindKey ( player, "arrow_l", "down", pizzaLeft, player )
		bindKey ( player, "arrow_r", "down", pizzaRight, player )
		bindKey ( player, "space", "down", pizzaLeave, player )
		bindKey ( player, "enter", "down", pizzaBuy, player )
		foodtext ( player, "Salat", "5" )
		setPedFrozen ( player, true )
		showPlayerHudComponent ( player, "health", true )
		showPlayerHudComponent ( player, "money", true )
	end
end

for i=1, 10, 1 do
Buy_Pizza[i] = createMarker ( mx, my, mz, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( Buy_Pizza[i], 5 )
setElementDimension ( Buy_Pizza[i], i )
addEventHandler ( "onMarkerHit", Buy_Pizza[i], pizzaBuyHit )
end


local skin = 155
local pex, pey, pez = 376.69479370117, -117.20676422119, 1001.141418457

local Ped_Pizza = {}
for i=1, 10, 1 do
Ped_Pizza[i] = createPed ( skin, pex, pey, pez )
setElementInterior ( Ped_Pizza[i], 5 )
setElementDimension ( Ped_Pizza[i], i )
setPedRotation ( Ped_Pizza[i], 180 )
setElementData ( Ped_Pizza[i], "undeadbarped", true )
end

local function pizzaEnterMarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == SF1_Pizza_Enter then
			setElementDimension ( hitElement, 1 )
		elseif source == SF2_Pizza_Enter then
			setElementDimension ( hitElement, 2 )
		elseif source == LS1_Pizza_Enter then
			setElementDimension ( hitElement, 3 )
		elseif source == LV1_Pizza_Enter then
			setElementDimension ( hitElement, 4 )
		elseif source == LV2_Pizza_Enter then
			setElementDimension ( hitElement, 5 )
		elseif source == LV3_Pizza_Enter then
			setElementDimension ( hitElement, 6 )
		elseif source == LV4_Pizza_Enter then
			setElementDimension ( hitElement, 7 )
		elseif source == Palomino_Pizza_Enter then
			setElementDimension ( hitElement, 8 )
		elseif source == Montgomery_Pizza_Enter then
			setElementDimension ( hitElement, 9 )
		elseif source == Blueberry_Pizza_Enter then
			setElementDimension ( hitElement, 10 )
		end
		fadeElementInterior ( hitElement, 5, 372.29702758789, -131, 1001 )
		toggleControl ( hitElement, "fire", false )
		toggleControl ( hitElement, "enter_exit", false )
		laSetElementData( hitElement, "nodmzone", 1 )
	end
end
end
addEventHandler ( "onMarkerHit", SF1_Pizza_Enter, pizzaEnterMarkerHit )
addEventHandler ( "onMarkerHit", SF2_Pizza_Enter, pizzaEnterMarkerHit )
addEventHandler ( "onMarkerHit", LS1_Pizza_Enter, pizzaEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV1_Pizza_Enter, pizzaEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV2_Pizza_Enter, pizzaEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV3_Pizza_Enter, pizzaEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV4_Pizza_Enter, pizzaEnterMarkerHit )
addEventHandler ( "onMarkerHit", Palomino_Pizza_Enter, pizzaEnterMarkerHit )
addEventHandler ( "onMarkerHit", Montgomery_Pizza_Enter, pizzaEnterMarkerHit )
addEventHandler ( "onMarkerHit", Blueberry_Pizza_Enter, pizzaEnterMarkerHit )

function pizzaLeave ( player )

	textDestroyDisplay ( _G[getPlayerName(player).."foodDisplay"] )
	setElementPosition ( player, 372.29702758789, -122, 1001 )
	setElementDimension ( player, laGetElementData ( player, "intdim" ) )
	setCameraTarget ( player, player )
	unbindKey ( player, "arrow_l", "down", pizzaLeft )
	unbindKey ( player, "arrow_r", "down", pizzaRight )
	unbindKey ( player, "space", "down", pizzaLeave )
	unbindKey ( player, "enter", "down", pizzaBuy )
	setPedFrozen ( player, false )
	showPlayerHudComponent ( player, "health", false )
	showPlayerHudComponent ( player, "money", false )
end

function pizzaLeft ( player )

	local pizza = tonumber ( laGetElementData ( player, "curpizza" ) )
	if pizza == 1 then
		pizza = 4
	elseif pizza == 2 then
		pizza = 1
	elseif pizza == 3 then
		pizza = 2
	elseif pizza == 4 then
		pizza = 3
	end
	pizzaLookCheck ( player, pizza )
end

function pizzaRight ( player )

	local pizza = laGetElementData ( player, "curpizza" )
	if pizza == 1 then
		pizza = 2
	elseif pizza == 2 then
		pizza = 3
	elseif pizza == 3 then
		pizza = 4
	elseif pizza == 4 then
		pizza = 1
	end
	pizzaLookCheck ( player, pizza )
end

function pizzaLookCheck ( player, pizza )
	
	laSetElementData ( player, "curpizza", pizza )
	if pizza == 1 then
		local px, py, pz = getElementPosition ( healthyPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		local preis = salatprice
		foodtext ( player, "Salat", preis )
	elseif pizza == 2 then
		local px, py, pz = getElementPosition ( smallPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		local preis = smallpizzaprice
		foodtext ( player, "Kleine Pizza", smallpizzaprice )
	elseif pizza == 3 then
		local px, py, pz = getElementPosition ( mediumPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		local preis = normalpizzaprice
		foodtext ( player, "Pizza und Salat", preis )
	elseif pizza == 4 then
		local px, py, pz = getElementPosition ( bigPizza )
		setCameraMatrix ( player, px-.04, py-0.4, pz+0.5, px, py, pz )
		local preis = bigpizzaprice
		foodtext ( player, "Grosse Pizza", preis )
	end
end

function pizzaBuy ( player )

	local pizza = laGetElementData ( player, "curpizza" )
	if pizza == 1 then 
		pizzaprice = salatprice
		healthadd = salatheal/2
	elseif pizza == 2 then
		pizzaprice = smallpizzaprice
		healthadd = smallpizzaheal/2
	elseif pizza == 3 then
		pizzaprice = normalpizzaprice
		healthadd = normalpizzaheal/2
	elseif pizza == 4 then
		pizzaprice = bigpizzaprice
		healthadd = bigpizzaheal/2
	end
	local pmoney = laGetElementData ( player, "money" )
	if pmoney >= pizzaprice then
		pizzaStackKasse = pizzaStackKasse + math.floor(pizzaprice/3)
		--updateBizKasse()
		if ( getElementHealth ( player ) + healthadd ) <= 100 then
			triggerClientEvent ( player, "sec_health_give", player, getElementHealth ( player ) + healthadd + 1 )
			setElementHealth ( player, getElementHealth ( player ) + healthadd )
		else
			triggerClientEvent ( player, "sec_health_give", player, getElementHealth ( player ) + healthadd + 1 )
			setElementHealth ( player, 100 )
		end
		laSetElementData ( player, "money", pmoney - pizzaprice )
		takePlayerMoney ( player, pizzaprice )
		playSoundFrontEnd ( player, 40 )
		triggerClientEvent ( player, "eatSomething", getRootElement(), pizzaprice )
		triggerClientEvent ( player, "eaturinSomething", getRootElement(), pizzaprice )
		triggerClientEvent ( player, "sec_health_give", player, getElementHealth ( player ) + 1 )
		triggerClientEvent ( player, "showHungerBar", player)
		setTimer ( hideHungerBarPizza_func, 4000, 1, player )
	else
		infobox ( player, "\n\nDu hast zu wenig Geld!\nDieses Gericht kostet "..pizzaprice.."$!", 5000, 125, 0, 0 )
	end
end

function hideHungerBarPizza_func(player)
triggerClientEvent ( player, "hideHungerBar", player)
end

function foodtext ( player, name, kosten )

	if _G[getPlayerName(player).."foodDisplay"] then
		textDestroyDisplay ( _G[getPlayerName(player).."foodDisplay"] )
	end
	_G[getPlayerName(player).."foodDisplay"] = textCreateDisplay ()
	textDisplayAddObserver ( _G[getPlayerName(player).."foodDisplay"], player )
	_G[getPlayerName(player).."foodTextText"] = textCreateTextItem ( name..",\nKosten: "..kosten.."$", 0.2, 0.7, "medium", 75, 200, 50, 255, 2, "left", "top", 255 )
	textDisplayAddText ( _G[getPlayerName(player).."foodDisplay"], _G[getPlayerName(player).."foodTextText"] )
end