------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------


createObject ( 2642, -2358.2592773438, -160.6789855957, 36.138740539551 )
createObject ( 8843, -2352.7250976563, -159.10821533203, 34.3203125 )
createObject ( 8843, -2333.2939453125, -172.28869628906, 34.3203125, 0, 0, 90 )


--SF1
local x1, y1, z1 = -2336.861, -166.727, 35.5557
SF1_Burger = createBlip ( x1, y1, z1, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( SF1_Burger, getRootElement(), false)
--SF2
local x2, y2, z2 = -2356.456, 1008.131, 50.898
SF2_Burger = createBlip ( x2, y2, z2, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( SF2_Burger, getRootElement(), false)
--SF3
local x3, y3, z3 = -1912.433, 827.927, 35.23
SF3_Burger = createBlip ( x3, y3, z3, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( SF3_Burger, getRootElement(), false)
--LS1
local x4, y4, z4 = 810.486, -1616.065, 13.547
LS1_Burger = createBlip ( x4, y4, z4, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LS1_Burger, getRootElement(), false)
--LS2
local x5, y5, z5 = 1199.532, -918.503, 43.119
LS2_Burger = createBlip ( x5, y5, z5, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LS2_Burger, getRootElement(), false)
--LV1
local x6, y6, z6 = 2169.804, 2795.715, 10.82
LV1_Burger = createBlip ( x6, y6, z6, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV1_Burger, getRootElement(), false)
--LV2
local x7, y7, z7 = 1872.643, 2071.749, 11.062
LV2_Burger = createBlip ( x7, y7, z7, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV2_Burger, getRootElement(), false)
--LV3
local x8, y8, z8 = 2472.864, 2034.171, 11.062
LV3_Burger = createBlip ( x8, y8, z8, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV3_Burger, getRootElement(), false)
--LV4
local x9, y9, z9 = 1157.919, 2072.185, 11.062
LV4_Burger = createBlip ( x9, y9, z9, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV4_Burger, getRootElement(), false)
--LV5
local x10, y10, z10 = 2366.804, 2071.029, 10.82
LV5_Burger = createBlip ( x10, y10, z10, 10, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV5_Burger, getRootElement(), false)


local Leave_Burger = {}

local function Exit_Burger_MarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == Leave_Burger[1] then
			setElementInterior ( hitElement, 0, -2332.601, -166.775, 35.555 )
		elseif source == Leave_Burger[2] then
			setElementInterior ( hitElement, 0, -2358.291, 1008.128, 50.865 )
		elseif source == Leave_Burger[3] then
			setElementInterior ( hitElement, 0, -1910.713, 829.443, 35.172 )
		elseif source == Leave_Burger[4] then
			setElementInterior ( hitElement, 0, 812.933, -1615.971, 13.547 )
		elseif source == Leave_Burger[5] then
			setElementInterior ( hitElement, 0, 1197.942, -920.777, 43.042 )
		elseif source == Leave_Burger[6] then
			setElementInterior ( hitElement, 0, 2172.253, 2795.917, 10.82 )
		elseif source == Leave_Burger[7] then
			setElementInterior ( hitElement, 0, 1874.243, 2071.953, 11.062 )
		elseif source == Leave_Burger[8] then
			setElementInterior ( hitElement, 0, 2471.358, 2034.094, 11.062 )
		elseif source == Leave_Burger[9] then
			setElementInterior ( hitElement, 0, 1159.508, 2072.281, 11.062 )
		elseif source == Leave_Burger[10] then
			setElementInterior ( hitElement, 0, 2363.591, 2070.875, 10.82 )
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
local x0, y0, z0 = 362.923, -75.221, 1001.508

for i=1, 10, 1 do
Leave_Burger[i] = createMarker ( x0, y0, z0, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( Leave_Burger[i], 10 )
setElementDimension ( Leave_Burger[i], i )
addEventHandler ( "onMarkerHit", Leave_Burger[i], Exit_Burger_MarkerHit )
end

local SF1_Burger_Enter = createMarker ( x1, y1, z1, "corona", 1.5, 0, 0, 255, 150 )
local SF2_Burger_Enter = createMarker ( x2, y2, z2, "corona", 1.5, 0, 0, 255, 150 )
local SF3_Burger_Enter = createMarker ( x3, y3, z3, "corona", 1.5, 0, 0, 255, 150 )
local LS1_Burger_Enter = createMarker ( x4, y4, z4, "corona", 1.5, 0, 0, 255, 150 )
local LS2_Burger_Enter = createMarker ( x5, y5, z5, "corona", 1.5, 0, 0, 255, 150 )
local LV1_Burger_Enter = createMarker ( x6, y6, z6, "corona", 1.5, 0, 0, 255, 150 )
local LV2_Burger_Enter = createMarker ( x7, y7, z7, "corona", 1.5, 0, 0, 255, 150 )
local LV3_Burger_Enter = createMarker ( x8, y8, z8, "corona", 1.5, 0, 0, 255, 150 )
local LV4_Burger_Enter = createMarker ( x9, y9, z9, "corona", 1.5, 0, 0, 255, 150 )
local LV5_Burger_Enter = createMarker ( x10, y10, z10, "corona", 1.5, 0, 0, 255, 150 )

local mx, my, mz = 376.541, -68.199, 1001.515

local Buy_Burger = {}

local function burgerBuyHit ( player, dim )

	if dim == true then
		triggerClientEvent ( player, "show_Burgershot_GUI", player, player )
		setPlayerHudComponentVisible ( player, "health", true )
		setPlayerHudComponentVisible ( player, "money", true )
	end
end

for i=1, 10, 1 do
Buy_Burger[i] = createMarker ( mx, my, mz, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( Buy_Burger[i], 10 )
setElementDimension ( Buy_Burger[i], i )
addEventHandler ( "onMarkerHit", Buy_Burger[i], burgerBuyHit )
end

local skin = 205
local pex, pey, pez = 376.449, -65.647, 1001.508

local Ped_Burger = {}
for i=1, 10, 1 do
Ped_Burger[i] = createPed ( skin, pex, pey, pez )
outputDebugString("burgershot_server: 136 - PED erstellt ped_burger")
setElementInterior ( Ped_Burger[i], 10 )
setElementDimension ( Ped_Burger[i], i )
setPedRotation ( Ped_Burger[i], 180 )
setElementData ( Ped_Burger[i], "undeadbarped", true )
end

local function burgerEnterMarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == SF1_Burger_Enter then
			setElementDimension ( hitElement, 1 )
		elseif source == SF2_Burger_Enter then
			setElementDimension ( hitElement, 2 )
		elseif source == SF3_Burger_Enter then
			setElementDimension ( hitElement, 3 )
		elseif source == LS1_Burger_Enter then
			setElementDimension ( hitElement, 4 )
		elseif source == LS2_Burger_Enter then
			setElementDimension ( hitElement, 5 )
		elseif source == LV1_Burger_Enter then
			setElementDimension ( hitElement, 6 )
		elseif source == LV2_Burger_Enter then
			setElementDimension ( hitElement, 7 )
		elseif source == LV3_Burger_Enter then
			setElementDimension ( hitElement, 8 )
		elseif source == LV4_Burger_Enter then
			setElementDimension ( hitElement, 9 )
		elseif source == LV5_Burger_Enter then
			setElementDimension ( hitElement, 10 )
		end
		fadeElementInterior ( hitElement, 10, 363.886, -73.787, 1001.508 )
		toggleControl ( hitElement, "fire", false )
		toggleControl ( hitElement, "enter_exit", false )
		laSetElementData( hitElement, "nodmzone", 1 )
	end
end
end
addEventHandler ( "onMarkerHit", SF1_Burger_Enter, burgerEnterMarkerHit )
addEventHandler ( "onMarkerHit", SF2_Burger_Enter, burgerEnterMarkerHit )
addEventHandler ( "onMarkerHit", SF3_Burger_Enter, burgerEnterMarkerHit )
addEventHandler ( "onMarkerHit", LS1_Burger_Enter, burgerEnterMarkerHit )
addEventHandler ( "onMarkerHit", LS2_Burger_Enter, burgerEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV1_Burger_Enter, burgerEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV2_Burger_Enter, burgerEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV3_Burger_Enter, burgerEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV4_Burger_Enter, burgerEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV5_Burger_Enter, burgerEnterMarkerHit )




function BurgershotBuy_func ( item )

	local player = source
	local money = laGetElementData ( player, "money" )
	if player == client or not client then
		if item == 1 then
			if money >= burgerPrice then
				if laGetElementData ( player, "food1" ) == 0 or laGetElementData ( player, "food2" ) == 0 or laGetElementData ( player, "food3" ) == 0 then
					laSetElementData ( player, "money", money - burgerPrice )
					putFoodInSlot ( player, 3 )
					burgershotKasse = burgershotKasse + math.floor(burgerPrice*0.75)
					--updateBizKasse()
				else
					outputChatBox ( "Du hast keinen freien Essensslot mehr! Wirf etwas weg!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du hast nicht genug Geld! Ein Burger kostet "..burgerPrice.." $!", player, 125, 0, 0 )
			end
		elseif item == 2 then
			if money >= snackPrice then
				if laGetElementData ( player, "food1" ) == 0 or laGetElementData ( player, "food2" ) == 0 or laGetElementData ( player, "food3" ) == 0 then
					laSetElementData ( player, "money", money - snackPrice )
					putFoodInSlot ( player, 4 )
					burgershotKasse = burgershotKasse + math.floor(snackPrice)
					--updateBizKasse()
				else
					outputChatBox ( "Du hast keinen freien Essensslot mehr! Wirf etwas weg!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du hast nicht genug Geld! Ein Snack kostet "..snackPrice.." $!", player, 125, 0, 0 )
			end
		elseif item >=3 then
			if item == 3 then
				burgerprice = salatprice
				healthadd = salatheal/2
			elseif item == 4 then
				burgerprice = smallpizzaprice
				healthadd = smallpizzaheal/2	
			elseif item == 5 then
				burgerprice = normalpizzaprice
				healthadd = normalpizzaheal/2
			elseif item == 6 then
				burgerprice = bigpizzaprice
				healthadd = bigpizzaheal/2
			end
			local pmoney = laGetElementData ( player, "money" )
			if pmoney >= burgerprice then
				burgershotKasse = burgershotKasse + math.floor(burgerprice*0.75)
				--updateBizKasse()
				if ( getElementHealth ( player ) + healthadd ) <= 100 then
					triggerClientEvent ( player, "sec_health_give", player, getElementHealth ( player ) + healthadd + 1 )
					setElementHealth ( player, getElementHealth ( player ) + healthadd )
				else
					triggerClientEvent ( player, "sec_health_give", player, getElementHealth ( player ) + healthadd + 1 )
					setElementHealth ( player, 100 )
				end
				laSetElementData ( player, "money", pmoney - burgerprice )
				takePlayerMoney ( player, burgerprice )
				playSoundFrontEnd ( player, 40 )
				triggerClientEvent ( player, "eatSomething", getRootElement(), burgerprice )
				triggerClientEvent ( player, "eaturinSomething", getRootElement(), burgerprice )
				triggerClientEvent ( player, "sec_health_give", player, getElementHealth ( player ) + 1 )
				triggerClientEvent ( player, "showHungerBar", player)
				setTimer ( hideHungerBarBurger_func, 4000, 1, player )
			else
				infobox ( player, "\n\nDu hast zu wenig Geld!\nDieses Gericht kostet "..burgerprice.."$!", 5000, 125, 0, 0 )
			end
		end
	end
end
addEvent ( "BurgershotBuy", true )
addEventHandler ( "BurgershotBuy", getRootElement(), BurgershotBuy_func )

function hideHungerBarBurger_func(player)
triggerClientEvent ( player, "hideHungerBar", player)
end

-- putFoodInSlot ( player, item )