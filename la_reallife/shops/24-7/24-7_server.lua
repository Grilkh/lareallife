------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

--SF Noobspawn
local x1, y1, z1 = -2442.6064453125, 753.44964599609, 35.136966705322
SF24_7 = createBlip ( x1, y1, z1, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( SF24_7, getRootElement(), false)
--LV1
local x2, y2, z2 = 2194.9331054688, 1991.1153564453, 12.2
LV124_7 = createBlip ( x2, y2, z2, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV124_7, getRootElement(), false)
--LV2
local x3, y3, z3 = 2884.728, 2453.8388, 11.06
LV224_7 = createBlip ( x3, y3, z3, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV224_7, getRootElement(), false)
--LV3
local x4, y4, z4 = 1937.825, 2307.234, 10.82
LV324_7 = createBlip ( x4, y4, z4, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV324_7, getRootElement(), false)
--LV4
local x5, y5, z5 = 2097.69, 2224.582, 11.023
LV424_7 = createBlip ( x5, y5, z5, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV424_7, getRootElement(), false)
--LV5
local x6, y6, z6 = 2247.694, 2396.168, 10.82
LV524_7 = createBlip ( x6, y6, z6, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV524_7, getRootElement(), false)
--LV6
local x7, y7, z7 = 2452.481, 2065.165, 10.82
LV624_7 = createBlip ( x7, y7, z7, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV624_7, getRootElement(), false)
--LV7
local x8, y8, z8 = 2546.466, 1972.659, 10.82
LV724_7 = createBlip ( x8, y8, z8, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV724_7, getRootElement(), false)
--LS1
local x9, y9, z9 = 1315.4521484375, -898.7373046875, 39.578125
LS124_7 = createBlip ( x9, y9, z9, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LS124_7, getRootElement(), false)
--LS2
local x10, y10, z10 = 2423.611328125, -1742.2548828125, 13.546875
LS224_7 = createBlip ( x10, y10, z10, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LS224_7, getRootElement(), false)
--LS3
local x11, y11, z11 = 999.969, -920.073, 42.328
LS324_7 = createBlip ( x11, y11, z11, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LS324_7, getRootElement(), false)
--LS4
local x12, y12, z12 = 1352.436, -1759.125, 13.508
LS424_7 = createBlip ( x12, y12, z12, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LS424_7, getRootElement(), false)
--Carson
local x13, y13, z13 = -180.742, 1034.869, 19.742
Carson24_7 = createBlip ( x13, y13, z13, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( Carson24_7, getRootElement(), false)
--Whetstone
local x14, y14, z14 = -1562.534, -2732.942, 48.743
Whetstone24_7 = createBlip ( x14, y14, z14, 36, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( Whetstone24_7, getRootElement(), false)

local function show_shops (player, cmd, what)
if what == "shop" then
	if laGetElementData (player, "showshop") == true then
		setElementVisibleTo ( SF24_7, player, false)
		setElementVisibleTo ( LV124_7, player, false)
		setElementVisibleTo ( LV224_7, player, false)
		setElementVisibleTo ( LV324_7, player, false)
		setElementVisibleTo ( LV424_7, player, false)
		setElementVisibleTo ( LV524_7, player, false)
		setElementVisibleTo ( LV624_7, player, false)
		setElementVisibleTo ( LV724_7, player, false)
		setElementVisibleTo ( LS124_7, player, false)
		setElementVisibleTo ( LS224_7, player, false)
		setElementVisibleTo ( LS324_7, player, false)
		setElementVisibleTo ( LS424_7, player, false)
		setElementVisibleTo ( Carson24_7, player, false)
		setElementVisibleTo ( Whetstone24_7, player, false)
		laSetElementData (player, "showshop", false)
	else
		setElementVisibleTo ( SF24_7, player, true)
		setElementVisibleTo ( LV124_7, player, true)
		setElementVisibleTo ( LV224_7, player, true)
		setElementVisibleTo ( LV324_7, player, true)
		setElementVisibleTo ( LV424_7, player, true)
		setElementVisibleTo ( LV524_7, player, true)
		setElementVisibleTo ( LV624_7, player, true)
		setElementVisibleTo ( LV724_7, player, true)
		setElementVisibleTo ( LS124_7, player, true)
		setElementVisibleTo ( LS224_7, player, true)
		setElementVisibleTo ( LS324_7, player, true)
		setElementVisibleTo ( LS424_7, player, true)
		setElementVisibleTo ( Carson24_7, player, true)
		setElementVisibleTo ( Whetstone24_7, player, true)
		laSetElementData (player, "showshop", true)
	end
elseif what == "ammu" then
	if laGetElementData (player, "showammu") == true then
		setElementVisibleTo ( LS1_Ammu, player, false)
		setElementVisibleTo ( LS2_Ammu, player, false)
		setElementVisibleTo ( LV1_Ammu, player, false)
		setElementVisibleTo ( LV2_Ammu, player, false)
		setElementVisibleTo ( LV3_Ammu, player, false)
		setElementVisibleTo ( Carson_Ammu, player, false)
		setElementVisibleTo ( Quebrados_Ammu, player, false)
		setElementVisibleTo ( Palomino_Ammu, player, false)
		setElementVisibleTo ( Blueberry_Ammu, player, false)
		laSetElementData (player, "showammu", false)
	else
		setElementVisibleTo ( LS1_Ammu, player, true)
		setElementVisibleTo ( LS2_Ammu, player, true)
		setElementVisibleTo ( LV1_Ammu, player, true)
		setElementVisibleTo ( LV2_Ammu, player, true)
		setElementVisibleTo ( LV3_Ammu, player, true)
		setElementVisibleTo ( Carson_Ammu, player, true)
		setElementVisibleTo ( Quebrados_Ammu, player, true)
		setElementVisibleTo ( Palomino_Ammu, player, true)
		setElementVisibleTo ( Blueberry_Ammu, player, true)
		laSetElementData (player, "showammu", true)
	end
elseif what == "tanke" then
	if laGetElementData (player, "showtanke") == true then
		setElementVisibleTo ( TankeSFDowntownBlip, player, false)
		setElementVisibleTo ( TankeSFJuniperHillBlip, player, false)
		setElementVisibleTo ( TankeBoatBlip, player, false)
		setElementVisibleTo ( AirportTankeBlip, player, false)
		setElementVisibleTo ( Tanke1Blip, player, false)
		setElementVisibleTo ( Tanke2Blip, player, false)
		setElementVisibleTo ( Tanke3Blip, player, false)
		setElementVisibleTo ( Tanke4Blip, player, false)
		setElementVisibleTo ( Tanke5Blip, player, false)
		setElementVisibleTo ( Tanke6Blip, player, false)
		setElementVisibleTo ( Tanke7Blip, player, false)
		setElementVisibleTo ( Tanke8Blip, player, false)
		setElementVisibleTo ( Tanke9Blip, player, false)
		setElementVisibleTo ( Tanke10Blip, player, false)
		setElementVisibleTo ( Tanke11Blip, player, false)
		setElementVisibleTo ( Tanke12Blip, player, false)
		setElementVisibleTo ( Tanke13Blip, player, false)
		setElementVisibleTo ( Tanke14Blip, player, false)
		laSetElementData (player, "showtanke", false)
	else
		setElementVisibleTo ( TankeSFDowntownBlip, player, true)
		setElementVisibleTo ( TankeSFJuniperHillBlip, player, true)
		setElementVisibleTo ( TankeBoatBlip, player, true)
		setElementVisibleTo ( AirportTankeBlip, player, true)
		setElementVisibleTo ( Tanke1Blip, player, true)
		setElementVisibleTo ( Tanke2Blip, player, true)
		setElementVisibleTo ( Tanke3Blip, player, true)
		setElementVisibleTo ( Tanke4Blip, player, true)
		setElementVisibleTo ( Tanke5Blip, player, true)
		setElementVisibleTo ( Tanke6Blip, player, true)
		setElementVisibleTo ( Tanke7Blip, player, true)
		setElementVisibleTo ( Tanke8Blip, player, true)
		setElementVisibleTo ( Tanke9Blip, player, true)
		setElementVisibleTo ( Tanke10Blip, player, true)
		setElementVisibleTo ( Tanke11Blip, player, true)
		setElementVisibleTo ( Tanke12Blip, player, true)
		setElementVisibleTo ( Tanke13Blip, player, true)
		setElementVisibleTo ( Tanke14Blip, player, true)
		laSetElementData (player, "showtanke", true)
	end
elseif what == "essen" then
	if laGetElementData (player, "showessen") == true then
		setElementVisibleTo ( SF1_Pizza, player, false)
		setElementVisibleTo ( SF2_Pizza, player, false)
		setElementVisibleTo ( LS1_Pizza, player, false)
		setElementVisibleTo ( LV1_Pizza, player, false)
		setElementVisibleTo ( LV2_Pizza, player, false)
		setElementVisibleTo ( LV3_Pizza, player, false)
		setElementVisibleTo ( LV4_Pizza, player, false)
		setElementVisibleTo ( Palomino_Pizza, player, false)
		setElementVisibleTo ( Montgomery_Pizza, player, false)
		setElementVisibleTo ( Blueberry_Pizza, player, false)
		
		setElementVisibleTo ( SF1_Burger, player, false)
		setElementVisibleTo ( SF2_Burger, player, false)
		setElementVisibleTo ( SF3_Burger, player, false)
		setElementVisibleTo ( LS1_Burger, player, false)
		setElementVisibleTo ( LS2_Burger, player, false)
		setElementVisibleTo ( LV1_Burger, player, false)
		setElementVisibleTo ( LV2_Burger, player, false)
		setElementVisibleTo ( LV3_Burger, player, false)
		setElementVisibleTo ( LV4_Burger, player, false)
		setElementVisibleTo ( LV5_Burger, player, false)
		laSetElementData (player, "showessen", false)
	else
		setElementVisibleTo ( SF1_Pizza, player, true)
		setElementVisibleTo ( SF2_Pizza, player, true)
		setElementVisibleTo ( LS1_Pizza, player, true)
		setElementVisibleTo ( LV1_Pizza, player, true)
		setElementVisibleTo ( LV2_Pizza, player, true)
		setElementVisibleTo ( LV3_Pizza, player, true)
		setElementVisibleTo ( LV4_Pizza, player, true)
		setElementVisibleTo ( Palomino_Pizza, player, true)
		setElementVisibleTo ( Montgomery_Pizza, player, true)
		setElementVisibleTo ( Blueberry_Pizza, player, true)
		
		setElementVisibleTo ( SF1_Burger, player, true)
		setElementVisibleTo ( SF2_Burger, player, true)
		setElementVisibleTo ( SF3_Burger, player, true)
		setElementVisibleTo ( LS1_Burger, player, true)
		setElementVisibleTo ( LS2_Burger, player, true)
		setElementVisibleTo ( LV1_Burger, player, true)
		setElementVisibleTo ( LV2_Burger, player, true)
		setElementVisibleTo ( LV3_Burger, player, true)
		setElementVisibleTo ( LV4_Burger, player, true)
		setElementVisibleTo ( LV5_Burger, player, true)
		laSetElementData (player, "showessen", true)
	end
else
	outputChatBox("Verwende /show [shop] [essen] [ammu] [tanke]", player, 200, 200, 100)
end
end
addCommandHandler("show", show_shops)

local Leave24_7 = {}

local function Exit_24_7_MarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == Leave24_7[1] then
			setElementInterior ( hitElement, 0, -2442.4904785156, 749.57501220703, 34.827850341797 )
		elseif source == Leave24_7[2] then
			setElementInterior ( hitElement, 0, 2191.642, 1991.097, 11.881 )
		elseif source == Leave24_7[3] then
			setElementInterior ( hitElement, 0, 2887.91, 2452.867, 11.07 )
		elseif source == Leave24_7[4] then
			setElementInterior ( hitElement, 0, 1935.988, 2307.454, 10.82 )
		elseif source == Leave24_7[5] then
			setElementInterior ( hitElement, 0, 2097.752, 2222.986, 10.82 )
		elseif source == Leave24_7[6] then
			setElementInterior ( hitElement, 0, 2247.593, 2397.786, 10.82 )
		elseif source == Leave24_7[7] then
			setElementInterior ( hitElement, 0, 2452.536, 2063.39, 10.82 )
		elseif source == Leave24_7[8] then
			setElementInterior ( hitElement, 0, 2546.72, 1970.379, 10.82 )
		elseif source == Leave24_7[9] then
			setElementInterior ( hitElement, 0, 1315.562, -900.674, 39.578 )
		elseif source == Leave24_7[10] then
			setElementInterior ( hitElement, 0, 2421.771, -1739.991, 13.547 )
		elseif source == Leave24_7[11] then
			setElementInterior ( hitElement, 0, 998.507, -920.18, 42.18 )
		elseif source == Leave24_7[12] then
			setElementInterior ( hitElement, 0, 1352.437, -1757.597, 13.508 )
		elseif source == Leave24_7[13] then
			setElementInterior ( hitElement, 0, -183.101, 1034.622, 19.742 )
		elseif source == Leave24_7[14] then
			setElementInterior ( hitElement, 0, -1561.028, -2733.952, 48.743 )
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
local x0, y0, z0 = -27.28, -58.25, 1003.54

for i=1, 14, 1 do
Leave24_7[i] = createMarker ( x0, y0, z0, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( Leave24_7[i], 6 )
setElementDimension ( Leave24_7[i], i )
addEventHandler ( "onMarkerHit", Leave24_7[i], Exit_24_7_MarkerHit )
end

local SF24_7_Enter = createMarker ( x1, y1, z1, "corona", 1.5, 0, 0, 255, 150 )
local LV124_7_Enter = createMarker ( x2, y2, z2, "corona", 1.5, 0, 0, 255, 150 )
local LV224_7_Enter = createMarker ( x3, y3, z3, "corona", 1.5, 0, 0, 255, 150 )
local LV324_7_Enter = createMarker ( x4, y4, z4, "corona", 1.5, 0, 0, 255, 150 )
local LV424_7_Enter = createMarker ( x5, y5, z5, "corona", 1.5, 0, 0, 255, 150 )
local LV524_7_Enter = createMarker ( x6, y6, z6, "corona", 1.5, 0, 0, 255, 150 )
local LV624_7_Enter = createMarker ( x7, y7, z7, "corona", 1.5, 0, 0, 255, 150 )
local LV724_7_Enter = createMarker ( x8, y8, z8, "corona", 1.5, 0, 0, 255, 150 )
local LS124_7_Enter = createMarker ( x9, y9, z9, "corona", 1.5, 0, 0, 255, 150 )
local LS224_7_Enter = createMarker ( x10, y10, z10, "corona", 1.5, 0, 0, 255, 150 )
local LS324_7_Enter = createMarker ( x11, y11, z11, "corona", 1.5, 0, 0, 255, 150 )
local LS424_7_Enter = createMarker ( x12, y12, z12, "corona", 1.5, 0, 0, 255, 150 )
local Carson24_7_Enter = createMarker ( x13, y13, z13, "corona", 1.5, 0, 0, 255, 150 )
local Whetstone24_7_Enter = createMarker ( x14, y14, z14, "corona", 1.5, 0, 0, 255, 150 )

local mx, my, mz = -23.492, -55.331, 1003.546875

local Buy24_7 = {}

local function Buy_24_7_Hit ( player, dim )

	if dim == true then
		triggerClientEvent ( player, "create24_7Shop", getRootElement() )
		showPlayerHudComponent ( player, "ammo", true )
		showPlayerHudComponent ( player, "weapon", true )
		showPlayerHudComponent ( player, "armour", true )
		showPlayerHudComponent ( player, "money", true )
		showPlayerHudComponent ( player, "health", true )
		showPlayerHudComponent ( player, "money", true )
	end
end

for i=1, 14, 1 do
Buy24_7[i] = createMarker ( mx, my, mz, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( Buy24_7[i], 6 )
setElementDimension ( Buy24_7[i], i )
addEventHandler ( "onMarkerHit", Buy24_7[i], Buy_24_7_Hit )
end

local skin = 17
local pex, pey, pez = -23.066, -57.456, 1003.547

local Ped24_7 = {}
for i=1, 14, 1 do
Ped24_7[i] = createPed ( skin, pex, pey, pez )
setElementInterior ( Ped24_7[i], 6 )
setElementDimension ( Ped24_7[i], i )
setPedRotation ( Ped24_7[i], 0 )
setElementData ( Ped24_7[i], "undeadbarped", true )
end


local function Enter_24_7_MarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == SF24_7_Enter then
			setElementDimension ( hitElement, 1 )
		elseif source == LV124_7_Enter then
			setElementDimension ( hitElement, 2 )
		elseif source == LV224_7_Enter then
			setElementDimension ( hitElement, 3 )
		elseif source == LV324_7_Enter then
			setElementDimension ( hitElement, 4 )
		elseif source == LV424_7_Enter then
			setElementDimension ( hitElement, 5 )
		elseif source == LV524_7_Enter then
			setElementDimension ( hitElement, 6 )
		elseif source == LV624_7_Enter then
			setElementDimension ( hitElement, 7 )
		elseif source == LV724_7_Enter then
			setElementDimension ( hitElement, 8 )
		elseif source == LS124_7_Enter then
			setElementDimension ( hitElement, 9 )
		elseif source == LS224_7_Enter then
			setElementDimension ( hitElement, 10 )
		elseif source == LS324_7_Enter then
			setElementDimension ( hitElement, 11 )
		elseif source == LS424_7_Enter then
			setElementDimension ( hitElement, 12 )
		elseif source == Carson24_7_Enter then
			setElementDimension ( hitElement, 13 )
		elseif source == Whetstone24_7_Enter then
			setElementDimension ( hitElement, 14 )
		end
		fadeElementInterior ( hitElement, 6, -27.22, -56.673, 1003.5468 )
		toggleControl ( hitElement, "fire", false )
		toggleControl ( hitElement, "enter_exit", false )
		laSetElementData( hitElement, "nodmzone", 1 )
	end
end
end
addEventHandler ( "onMarkerHit", SF24_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LV124_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LV224_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LV324_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LV424_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LV524_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LV624_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LV724_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LS124_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LS224_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LS324_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", LS424_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", Carson24_7_Enter, Enter_24_7_MarkerHit )
addEventHandler ( "onMarkerHit", Whetstone24_7_Enter, Enter_24_7_MarkerHit )

function itemBuy_func ( player, item)

	if player == client then
		local currentabo = laGetElementData ( player, "handyType" )
		local currentvalue = laGetElementData ( player, "handyCosts")
		if getPedWeapon(player, 10) == 14 then flow = true else flow = false end
		if getPedWeapon(player, 9) == 43 then cam = true else cam = false end
		if getPedWeapon(player, 11) == 44 then nsicht = true else nsicht = false end
		if getPedWeapon(player, 11) == 45 then tsicht = true else tsicht = false end
		local money = laGetElementData ( player, "money" )
		if item == "flowers" then
			if flow then
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits\neine Blume!", 7500, 125, 0, 0 )
			else
				if laGetElementData ( player, "money" ) >= flowers_price then
					laSetElementData ( player, "money", money - flowers_price )
					takePlayerMoney ( player, flowers_price )
					giveWeapon ( player, 14, 1, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), 14, 1 )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 7500, 125, 0, 0 )
				end
			end
		elseif item == "cam" then
			if laGetElementData ( player, "money" ) >= cam_price then
				if cam then
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits\neine Kamera!", 7500, 125, 0, 0 )
				else
					laSetElementData ( player, "money", money - cam_price )
					takePlayerMoney ( player, cam_price )
					giveWeapon ( player, 43, 36, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), 43, 36 )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 7500, 125, 0, 0 )
			end
		elseif item == "camammo" then
			if laGetElementData ( player, "money" ) >= camammo_price then
				if cam then
					laSetElementData ( player, "money", money - camammo_price )
					takePlayerMoney ( player, camammo_price )
					giveWeapon ( player, 43, 36, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), 43, 36 )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast noch\nkeine Kamera!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 7500, 125, 0, 0 )
			end
		elseif item == "nv" then
			if nsicht then
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits\nein Nachtsichtgerät!", 7500, 125, 0, 0 )
			else
				if laGetElementData ( player, "money" ) >= nvgoogles_price then
					laSetElementData ( player, "money", money - nvgoogles_price )
					takePlayerMoney ( player, nvgoogles_price )
					giveWeapon ( player, 44, 1, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), 44, 1 )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 7500, 125, 0, 0 )
				end
			end
		elseif item == "t" then
			if tsicht then
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits\nein Wärmesichtgerät!", 7500, 125, 0, 0 )
			else
				if laGetElementData ( player, "money" ) >= tgoogles_price then
					laSetElementData ( player, "money", money - tgoogles_price )
					takePlayerMoney ( player, tgoogles_price )
					giveWeapon ( player, 45, 1, true )
					triggerClientEvent ( player, "sec_gun_give", getRootElement(), 45, 1 )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 7500, 125, 0, 0 )
				end
			end
		elseif item == "dice" then
			if laGetElementData ( player, "money" ) >= wuerfel_price then
				if laGetElementData ( player, "dice" ) == 0 then
					laSetElementData ( player, "money", money - wuerfel_price )
					takePlayerMoney ( player, wuerfel_price )
					laSetElementData ( player, "dice", 1 )
					MySQL_SetString("inventar", "Wuerfel", laGetElementData ( player, "dice" ), "Name LIKE '"..getPlayerName(player).."'")
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast schon\neinen Würfel!", 7500, 125, 0, 0 )
				end
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht\ngenug Geld!", 7500, 125, 0, 0 )
			end
		elseif item == "los" then
			if laGetElementData ( player, "money" ) >= rubbellos_price then
				laSetElementData ( player, "money", money - rubbellos_price )
				takePlayerMoney ( player, rubbellos_price )
				playSoundFrontEnd ( player, 40 )
				local rnd = math.random ( 1, 100 )
				if rnd <= 60 then
					outputChatBox ( "Leider nur eine Niete!", player, 0, 125, 0 )
				elseif rnd <= 80 then
					outputChatBox ( "Du hast "..(rubbellos_price*1.5).." $ gewonnen!", player, 125, 0, 0 )
					laSetElementData ( player, "money", laGetElementData(player,"money") + (rubbellos_price*1.5) )
					givePlayerMoney ( player, (rubbellos_price*1.5) )
				elseif rnd <= 95 then
					outputChatBox ( "Du hast "..(rubbellos_price*2).." $ gewonnen!", player, 125, 0, 0 )
					laSetElementData ( player, "money", laGetElementData(player,"money") + rubbellos_price*2 )
					givePlayerMoney ( player, rubbellos_price*2 )
				elseif rnd <= 99 then
					outputChatBox ( "Du hast "..(rubbellos_price*5).." $ gewonnen!", player, 125, 0, 0 )
					laSetElementData ( player, "money", laGetElementData(player,"money") + rubbellos_price*5 )
					givePlayerMoney ( player, rubbellos_price*5 )
				else
					outputChatBox ( "Du hast "..(rubbellos_price*20).." $ gewonnen!", player, 125, 0, 0 )
					laSetElementData ( player, "money", laGetElementData(player,"money") + rubbellos_price*20 )
					givePlayerMoney ( player, rubbellos_price*20 )
				end
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!", 7500, 125, 0, 0 )
			end
		elseif item == "beer" then
			if laGetElementData ( player, "money" ) >= beer_price then
				laSetElementData ( player, "money", money - beer_price )
				takePlayerMoney ( player, beer_price )
				playSoundFrontEnd ( player, 40 )
				putFoodInSlot ( player, 2 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
			else
				outputChatBox ( "Du hast nicht genug Geld! Ein Bier kostet "..beer_price.."$!", player, 125, 0, 0 )
			end
			-- beer_price
		elseif item == "cig" then
			if laGetElementData ( player, "money" ) >= zigarett_price then
				laSetElementData ( player, "money", money - zigarett_price )
				takePlayerMoney ( player, zigarett_price )
				laSetElementData ( player, "zigaretten", laGetElementData ( player, "zigaretten" ) + 5 )
				playSoundFrontEnd ( player, 40 )
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
			else
				outputChatBox ( "Du hast nicht genug Geld! Ein Päckchen Zigaretten kostet "..zigarett_price.."$!", player, 125, 0, 0 )
			end
		elseif item == "prepaid50" then
			local value = prepaid_low
			if laGetElementData ( player, "money" ) >= value then
				if currentabo == 2 then
					laSetElementData ( player, "money", money - value )
					takePlayerMoney ( player, value )
					laSetElementData ( player, "handyCosts", value + currentvalue )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
				else
					outputChatBox ( "Du hast kein Prepaid-Handy!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du hast nicht genug Geld! Dieses Guthaben kostet "..value.."$!", player, 125, 0, 0 )
			end
		elseif item == "prepaid100" then
			local value = prepaid_middle
			if laGetElementData ( player, "money" ) >= value then
				if currentabo == 2 then
					laSetElementData ( player, "money", money - value )
					takePlayerMoney ( player, value )
					laSetElementData ( player, "handyCosts", value + currentvalue )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
				else
					outputChatBox ( "Du hast kein Prepaid-Handy!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du hast nicht genug Geld! Dieses Guthaben kostet "..value.."$!", player, 125, 0, 0 )
			end
		elseif item == "prepaid250" then
			local value = prepaid_large
			if laGetElementData ( player, "money" ) >= value then
				if currentabo == 2 then
					laSetElementData ( player, "money", money - value )
					takePlayerMoney ( player, value )
					laSetElementData ( player, "handyCosts", value + currentvalue )
					playSoundFrontEnd ( player, 40 )
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nGekauft!", 7500, 0, 125, 0 )
				else
					outputChatBox ( "Du hast kein Prepaid-Handy!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Du hast nicht genug Geld! Dieses Guthaben kostet "..value.."$!", player, 125, 0, 0 )
			end
		end
	end
end
addEvent ( "itemBuy", true )
addEventHandler ( "itemBuy", getRootElement(), itemBuy_func )