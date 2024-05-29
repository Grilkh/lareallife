--LS1
local x1, y1, z1 = 1368.5, -1279.8000488281, 12.5
LS1_Ammu = createBlip ( x1, y1, z1, 6, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LS1_Ammu, getRootElement(), false)
--LS2
local x2, y2, z2 = 2400.412109375, -1981.6259765625, 13.5
LS2_Ammu = createBlip ( x2, y2, z2, 6, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LS2_Ammu, getRootElement(), false)
--LV1
local x3, y3, z3 = 2159.2697753906, 943.19427490234, 10.7992029190063
LV1_Ammu = createBlip ( x3, y3, z3, 6, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV1_Ammu, getRootElement(), false)
--LV2
local x4, y4, z4 = 2539.2819824219, 2083.9797363281, 10.79
LV2_Ammu = createBlip ( x4, y4, z4, 6, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV2_Ammu, getRootElement(), false)
--LV3
local x5, y5, z5 = 776.723, 1871.439, 4.907
LV3_Ammu = createBlip ( x5, y5, z5, 6, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( LV3_Ammu, getRootElement(), false)
--Carson
local x6, y6, z6 = -315.99951171875, 829.81396484375, 14.224180221558
Carson_Ammu = createBlip ( x6, y6, z6, 6, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( Carson_Ammu, getRootElement(), false)
--Quebrados
local x7, y7, z7 = -1508.794, 2610.701, 55.836
Quebrados_Ammu = createBlip ( x7, y7, z7, 6, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( Quebrados_Ammu, getRootElement(), false)
--Palomino
local x8, y8, z8 = 2333.087, 61.683, 26.706
Palomino_Ammu = createBlip ( x8, y8, z8, 6, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( Palomino_Ammu, getRootElement(), false)
--Blueberry
local x9, y9, z9 = 243.286, -178.272, 1.582
Blueberry_Ammu = createBlip ( x9, y9, z9, 6, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
setElementVisibleTo ( Blueberry_Ammu, getRootElement(), false)




local Leave_Ammu = {}

local function Exit_Ammu_MarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == Leave_Ammu[1] then
			setElementInterior ( hitElement, 0, 1366.3000488281, -1279.8000488281, 13.199999809265 )
		elseif source == Leave_Ammu[2] then
			setElementInterior ( hitElement, 0, 2400.412109375, -1979.5478515625, 13.546875 )
		elseif source == Leave_Ammu[3] then
			setElementInterior ( hitElement, 0, 2156.908203125, 943.21978759766, 10.469537734985 )
		elseif source == Leave_Ammu[4] then
			setElementInterior ( hitElement, 0, 2537.10546875, 2084.0485839844, 10.469537734985 )
		elseif source == Leave_Ammu[5] then
			setElementInterior ( hitElement, 0, 779.271, 1871.357, 4.906 )
		elseif source == Leave_Ammu[6] then
			setElementInterior ( hitElement, 0, -313.68911743164, 829.89306640625, 13.891412734985 )
		elseif source == Leave_Ammu[7] then
			setElementInterior ( hitElement, 0, -1508.991, 2607.504, 55.836 )
		elseif source == Leave_Ammu[8] then
			setElementInterior ( hitElement, 0, 2336.17, 61.547, 26.482 )
		elseif source == Leave_Ammu[9] then
			setElementInterior ( hitElement, 0, 239.948, -178.596, 1.578 )
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
local x0, y0, z0 = 296.862, -112.07, 1001.516

for i=1, 9, 1 do
Leave_Ammu[i] = createMarker ( x0, y0, z0, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( Leave_Ammu[i], 6 )
setElementDimension ( Leave_Ammu[i], i )
addEventHandler ( "onMarkerHit", Leave_Ammu[i], Exit_Ammu_MarkerHit )
end

local LS1_Ammu_Enter = createMarker ( x1, y1, z1, "corona", 1.5, 0, 0, 255, 150 )
local LS2_Ammu_Enter = createMarker ( x2, y2, z2, "corona", 1.5, 0, 0, 255, 150 )
local LV1_Ammu_Enter = createMarker ( x3, y3, z3, "corona", 1.5, 0, 0, 255, 150 )
local LV2_Ammu_Enter = createMarker ( x4, y4, z4, "corona", 1.5, 0, 0, 255, 150 )
local LV3_Ammu_Enter = createMarker ( x5, y5, z5, "corona", 1.5, 0, 0, 255, 150 )
local Carson_Ammu_Enter = createMarker ( x6, y6, z6, "corona", 1.5, 0, 0, 255, 150 )
local Quebrados_Ammu_Enter = createMarker ( x7, y7, z7, "corona", 1.5, 0, 0, 255, 150 )
local Palomino_Ammu_Enter = createMarker ( x8, y8, z8, "corona", 1.5, 0, 0, 255, 150 )
local Blueberry_Ammu_Enter = createMarker ( x9, y9, z9, "corona", 1.5, 0, 0, 255, 150 )

local mx, my, mz = 292.461, -106.953, 1001.516

local Buy_Ammu = {}

local function ammuBuyHit ( player, dim )

	if dim then
		if laGetElementData ( player, "gunlicense" ) == 1 then
			triggerClientEvent ( player, "createAmmunationGunshop", getRootElement() )
			showPlayerHudComponent ( player, "ammo", true )
			showPlayerHudComponent ( player, "weapon", true )
			showPlayerHudComponent ( player, "armour", true )
			showPlayerHudComponent ( player, "money", true )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keinen Waffenschein!", 7500, 125, 0, 0 )
		end
	end
end

for i=1, 9, 1 do
Buy_Ammu[i] = createMarker ( mx, my, mz, "checkpoint", 1.5, 0, 0, 255, 150 )
setElementInterior ( Buy_Ammu[i], 6 )
setElementDimension ( Buy_Ammu[i], i )
addEventHandler ( "onMarkerHit", Buy_Ammu[i], ammuBuyHit )
end

local skin = 179
local pex, pey, pez = 292.438, -104.485, 1001.516

local Ped_Ammu = {}
for i=1, 9, 1 do
Ped_Ammu[i] = createPed ( skin, pex, pey, pez )
setElementInterior ( Ped_Ammu[i], 6 )
setElementDimension ( Ped_Ammu[i], i )
setPedRotation ( Ped_Ammu[i], 180 )
setElementData ( Ped_Ammu[i], "undeadbarped", true )
end

local function ammuEnterMarkerHit ( hitElement, dim )
if getElementType(hitElement) == "player" and (dim) then
	if isPedInVehicle ( hitElement ) == false then
		if source == LS1_Ammu_Enter then
			setElementDimension ( hitElement, 1 )
		elseif source == LS2_Ammu_Enter then
			setElementDimension ( hitElement, 2 )
		elseif source == LV1_Ammu_Enter then
			setElementDimension ( hitElement, 3 )
		elseif source == LV2_Ammu_Enter then
			setElementDimension ( hitElement, 4 )
		elseif source == LV3_Ammu_Enter then
			setElementDimension ( hitElement, 5 )
		elseif source == Carson_Ammu_Enter then
			setElementDimension ( hitElement, 6 )
		elseif source == Quebrados_Ammu_Enter then
			setElementDimension ( hitElement, 7 )
		elseif source == Palomino_Ammu_Enter then
			setElementDimension ( hitElement, 8 )
		elseif source == Blueberry_Ammu_Enter then
			setElementDimension ( hitElement, 9 )
		end
		fadeElementInterior ( hitElement, 6, 296.832, -109.63, 1001.516 )
		toggleControl ( hitElement, "fire", false )
		toggleControl ( hitElement, "enter_exit", false )
		laSetElementData( hitElement, "nodmzone", 1 )
	end
end
end
addEventHandler ( "onMarkerHit", LS1_Ammu_Enter, ammuEnterMarkerHit )
addEventHandler ( "onMarkerHit", LS2_Ammu_Enter, ammuEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV1_Ammu_Enter, ammuEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV2_Ammu_Enter, ammuEnterMarkerHit )
addEventHandler ( "onMarkerHit", LV3_Ammu_Enter, ammuEnterMarkerHit )
addEventHandler ( "onMarkerHit", Carson_Ammu_Enter, ammuEnterMarkerHit )
addEventHandler ( "onMarkerHit", Quebrados_Ammu_Enter, ammuEnterMarkerHit )
addEventHandler ( "onMarkerHit", Palomino_Ammu_Enter, ammuEnterMarkerHit )
addEventHandler ( "onMarkerHit", Blueberry_Ammu_Enter, ammuEnterMarkerHit )

createBlip ( -2625.8752441406, 209.44961547852, 3.5589985847473, 18, 2, 255, 0, 0, 255, 0, 200 ) --SF Blip

AmmuNationSFToIntMarker = createMarker ( -2625.8752441406, 209.44961547852, 3.6089985847473, "cylinder", 1.5, 125, 0, 0, 255 ) --Ammu to Int
AmmuNationSFFromIntMarker = createMarker ( 285.270, -41.299, 1000.615, "cylinder", 1.5, 125, 0, 0, 255 ) --Ammu from Int
setElementInterior (AmmuNationSFFromIntMarker, 1)

function AmmuNationSFToInt_func ( hitElement, dim )
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			fadeElementInterior ( hitElement, 1, 286.566, -39.279, 1001.515 )
			outputChatBox ( "Wilkommen im Ammunation!", hitElement, 0, 125, 0 )
			setTimer ( animped_func, 1200, 1)
			setTimer ( animped2_func, 1400, 1)
			setTimer ( animped3_func, 1800, 1)
			setTimer ( pedgun_func, 2500, 1)
		end
	end
end
addEventHandler ( "onMarkerHit", AmmuNationSFToIntMarker, AmmuNationSFToInt_func )

function AmmuNationSFFromInt_func ( hitElement, dim )
	if getElementType(hitElement) == "player" and (dim) then
		if isPedInVehicle ( hitElement ) == false then
			fadeElementInterior ( hitElement, 0, -2625.7507324219, 212.39736938477, 4.2707958221436 )
		end
	end
end
addEventHandler ( "onMarkerHit", AmmuNationSFFromIntMarker, AmmuNationSFFromInt_func )

AmmuNationSF = createMarker ( 296.315, -38.03, 1000.615, "cylinder", 1.5, 125, 0, 0, 255 ) --Waffenkaufmarker im SF INT
setElementInterior (AmmuNationSF, 1)

function AmmuNationSF_func ( player, dim )
   
   	if dim == true and getPedOccupiedVehicle ( player ) == false then
		if laGetElementData ( player, "gunlicense" ) == 1 then
			triggerClientEvent ( player, "createAmmunationSFGunshop", getRootElement() )
			showPlayerHudComponent ( player, "ammo", true )
			showPlayerHudComponent ( player, "weapon", true )
			showPlayerHudComponent ( player, "armour", true )
			showPlayerHudComponent ( player, "money", true )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keinen Waffenschein!", 7500, 125, 0, 0 )
		end
	end
end
addEventHandler ( "onMarkerHit", AmmuNationSF, AmmuNationSF_func )


function ammunationCancel_func ( player )

	if player == client then
		local x, y, z, r = laGetElementData ( player, "ammunationX" ), laGetElementData ( player, "ammunationY" ), laGetElementData ( player, "ammunationZ" ), laGetElementData ( player, "ammunationR" )
		setElementDimension ( player, 0 )
		setElementInterior ( player, 0 )
		setElementPosition ( player, x, y, z )
		setPedRotation ( player, r )
		setCameraTarget ( player, player )
	end
end
addEvent ( "ammunationCancel", true )
addEventHandler ( "ammunationCancel", getRootElement(), ammunationCancel_func )

function gunbuyGunshop_func ( player, itemtype, item,  w0, w1, w2, w3, w4, w5, w6, w7 )

	if player == client then
		local success = 0
		if itemtype == "armor" then
			if laGetElementData ( player, "money" ) >= armor_gunshop_price then
				laSetElementData ( player, "money", laGetElementData ( player, "money" ) - armor_gunshop_price )
				takePlayerMoney ( player, armor_gunshop_price )
				triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
				setPedArmor ( player, 100 )
				triggerClientEvent ( player, "sec_armor_give", getRootElement(), 100 )
				local success = 1
			else
				triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nSchutzweste kostet "..armor_gunshop_price.."$!", 5000, 125, 0, 0 )
			end
		elseif itemtype == "ammo" then
			if item == "9mmammo" then
				if laGetElementData ( player, "money" ) >= pistolammo_gunshop_price then
					if w2 == 22 or w2 == 23 then
						laSetElementData ( player, "money", laGetElementData ( player, "money" ) - pistolammo_gunshop_price )
						takePlayerMoney ( player, pistolammo_gunshop_price )
						triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
						triggerClientEvent ( player, "hudEinblendenDmg", player, player )
						giveWeapon ( player, w2, 17, true )
						triggerClientEvent ( player, "sec_gun_give", getRootElement(), w2, 17 )
						success = 1
					else
						triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine Pistole!", 5000, 125, 0, 0 )
					end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Magazin kostet "..pistolammo_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "eagleammo" then
				if laGetElementData ( player, "money" ) >= eagleammo_gunshop_price then
						if w2 == 24 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - eagleammo_gunshop_price )
							takePlayerMoney ( player, eagleammo_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, w2, 7, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), w2, 7 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine Desert Eagle!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Magazin kostet "..eagleammo_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "mp5ammo" then
				if laGetElementData ( player, "money" ) >= mpammo_gunshop_price then
						if w4 == 29 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - mpammo_gunshop_price )
							takePlayerMoney ( player, mpammo_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, w4, 30, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), w4, 30 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine MP5!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Magazin kostet "..mpammo_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "schrot" then
				if laGetElementData ( player, "money" ) >= shotgunammo_gunshop_price then
						if w3 == 25 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - shotgunammo_gunshop_price )
							takePlayerMoney ( player, shotgunammo_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, w3, 1, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), w3, 1 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine Schrotflinte!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Patrone kostet "..shotgunammo_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "ak47ammo" then
				if laGetElementData ( player, "money" ) >= akammo_gunshop_price then
						if w5 == 30 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - akammo_gunshop_price )
							takePlayerMoney ( player, akammo_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, w5, 30, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), w5, 30 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine AK-47!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Magazin kostet "..akammo_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "m4ammo" then
				if laGetElementData ( player, "money" ) >= mammo_gunshop_price then
						if w5 == 31 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - mammo_gunshop_price )
							takePlayerMoney ( player, mammo_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, w5, 50, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), w5, 50 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast keine M4!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Magazin kostet "..mammo_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "gewehrammo" then
				if laGetElementData ( player, "money" ) >= gewehrammo_gunshop_price then
						if w6 == 33 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - gewehrammo_gunshop_price )
							takePlayerMoney ( player, gewehrammo_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, w6, 1, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), w6, 1 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein Gewehr!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Patrone kostet "..gewehrammo_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "sgewehrammo" then
				if laGetElementData ( player, "money" ) >= sgewehrammo_gunshop_price then
						if w6 == 34 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - sgewehrammo_gunshop_price )
							takePlayerMoney ( player, sgewehrammo_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, w6, 1, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), w6, 1 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast kein Gewehr!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Patrone kostet "..sgewehrammo_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
		elseif itemtype == "gun" then
			if item == "baseballbat" then
				if laGetElementData ( player, "money" ) >= baseball_gunshop_price then
						if w1 ~= 5 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - baseball_gunshop_price )
							takePlayerMoney ( player, baseball_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 5, 1, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 5, 1 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Schläger!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Schläger kostet "..baseball_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "schaufel" then
				if laGetElementData ( player, "money" ) >= shovels_gunshop_price then
						if w1 ~= 6 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - shovels_gunshop_price )
							takePlayerMoney ( player, shovels_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 6, 1, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 6, 1 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine Schaufel!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Schaufel kostet "..shovels_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "golfclub" then
				if laGetElementData ( player, "money" ) >= golfclub_gunshop_price then
						if w1 ~= 2 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - golfclub_gunshop_price )
							takePlayerMoney ( player, golfclub_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 2, 1, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 2, 1 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Golfschläger!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Golfschläger kostet "..golfclub_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "messer" then
				if laGetElementData ( player, "money" ) >= knife_gunshop_price then
						if w1 ~= 4 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - knife_gunshop_price )
							takePlayerMoney ( player, knife_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 4, 1, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 4, 1 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits ein Messer!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Messer kostet "..knife_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "schlagring" then
				if laGetElementData ( player, "money" ) >= schlagringe_gunshop_price then
						if w1 == 0 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - schlagringe_gunshop_price )
							takePlayerMoney ( player, schlagringe_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 1, 1, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 1, 1 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits einen Schlagring!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Schlagring kostet "..schlagringe_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "9mm" then
				if laGetElementData ( player, "money" ) >= pistol_gunshop_price then
						if w2 ~= 22 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - pistol_gunshop_price )
							takePlayerMoney ( player, pistol_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 22, 17, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 22, 17 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine Pistole!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Pistole kostet "..pistol_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "9mmsd" then
				if laGetElementData ( player, "money" ) >= sdpistol_gunshop_price then
						if w2 ~= 23 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - sdpistol_gunshop_price )
							takePlayerMoney ( player, sdpistol_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 23, 17, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 23, 17 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine SD-Pistole!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine SD-Pistole kostet "..sdpistol_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "eagle" then
				if laGetElementData ( player, "money" ) >= eagle_gunshop_price then
						if w2 ~= 24 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - eagle_gunshop_price )
							takePlayerMoney ( player, eagle_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 24, 7, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 24, 7 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine Desert Eagle!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Desert Eagle kostet "..eagle_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "mp5" then
				if laGetElementData ( player, "money" ) >= mp_gunshop_price then
						if w4 ~= 29 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - mp_gunshop_price )
							takePlayerMoney ( player, mp_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 29, 30, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 29, 30 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine MP5!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine MP5 kostet "..mp_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "shotty" then
				if laGetElementData ( player, "money" ) >= shotgun_gunshop_price then
						if w3 ~= 25 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - shotgun_gunshop_price )
							takePlayerMoney ( player, shotgun_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 25, 5, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 25, 5 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine Schrotflinte!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine Schrotflinte kostet "..shotgun_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "ak47" then
				if laGetElementData ( player, "money" ) >= ak_gunshop_price then
						if w5 ~= 30 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - ak_gunshop_price )
							takePlayerMoney ( player, ak_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 30, 30, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 30, 30 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine AK-47!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine AK-47 kostet "..ak_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "m4" then
				if laGetElementData ( player, "money" ) >= m_gunshop_price then
						if w5 ~= 30 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - m_gunshop_price )
							takePlayerMoney ( player, m_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 31, 50, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 31, 50 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits eine M4!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEine M4 kostet "..m_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "gewehr" then
				if laGetElementData ( player, "money" ) >= gewehr_gunshop_price then
						if  w6 ~= 33 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - gewehr_gunshop_price )
							takePlayerMoney ( player, gewehr_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 33, 7, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 33, 7 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits ein Gewehr!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Gewehr kostet "..gewehr_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
			if item == "sniper" then
				if laGetElementData ( player, "money" ) >= sgewehr_gunshop_price then
						if w6 ~= 34 then
							laSetElementData ( player, "money", laGetElementData ( player, "money" ) - sgewehr_gunshop_price )
							takePlayerMoney ( player, sgewehr_gunshop_price )
							triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
							triggerClientEvent ( player, "hudEinblendenDmg", player, player )
							giveWeapon ( player, 34, 7, true )
							triggerClientEvent ( player, "sec_gun_give", getRootElement(), 34, 7 )
							success = 1
						else
							triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast bereits ein Scharfschützengewehr!", 5000, 125, 0, 0 )
						end
				else
					triggerClientEvent ( player, "infobox_start", getRootElement(), "\n\nDu hast nicht genug Geld!\nEin Scharfschützengewehr kostet "..sgewehr_gunshop_price.."$!", 5000, 125, 0, 0 )
				end
			end
		end
		if success == 1 then 
			playSoundFrontEnd ( player, 40 )
		end
	end
end
addEvent ( "gunbuyGunshop", true )
addEventHandler ( "gunbuyGunshop", getRootElement(), gunbuyGunshop_func )


ammunationped = createPed(179, 296.352, -40.313, 1001.516)
setElementInterior (ammunationped, 1)
setPedRotation(ammunationped, 0)
setElementFrozen ( ammunationped, true )
setElementData ( ammunationped, "undeadbarped", true )

ammunation2ped = createPed(73, 298.928, -33.379, 1001.515625)
setElementInterior (ammunation2ped, 1)
setPedRotation(ammunation2ped, 90)
setElementFrozen ( ammunation2ped, true )
setElementData ( ammunation2ped, "undeadbarped", true )

aimingped = createPed(22, 290.614, -25.4129, 1001.515625)
setElementInterior (aimingped, 1)
setPedRotation(aimingped, 340)

aimingped2 = createPed(34, 293.638, -25.3277, 1001.515625)
setElementInterior (aimingped2, 1)
setPedRotation(aimingped2, 340)

aimingped3 = createPed(71, 296.674, -25.2566, 1001.515625)
setElementInterior (aimingped3, 1)
setPedRotation(aimingped3, 340)

function animped_func()
giveWeapon ( aimingped, 25, 9999 )
setPedAnimation( aimingped, "SHOTGUN", "shotgun_fire")
end
function animped2_func()
 giveWeapon ( aimingped2, 25, 9999 )
 setPedAnimation( aimingped2, "SHOTGUN", "shotgun_fire")
end
function animped3_func()
 giveWeapon ( aimingped3, 25, 9999 )
 setPedAnimation( aimingped3, "SHOTGUN", "shotgun_fire")
 end
 
 function pedgun_func()
 giveWeapon ( aimingped, 25, 9999 )
 giveWeapon ( aimingped2, 25, 9999 )
 giveWeapon ( aimingped3, 25, 9999 )
 giveWeapon ( ammunation2ped, 31, 50 )
 end

waffenscheinmarker = createMarker ( 297.78256, -33.397, 1000.615625, "cylinder", 1, 125, 0, 0, 255 )
setElementInterior ( waffenscheinmarker, 1)

function waffenscheinmarker_func (player, dim)
   
	if dim == true then
		setPedFrozen ( player, true )
		setTimer ( setPedFrozen, 100, 1, player, false )
		triggerClientEvent ( player, "ShowWaffenscheinMenue", getRootElement() )
		showCursor ( player, true )
		setElementData ( player, "ElementClicked", true )
	end
end
addEventHandler ( "onMarkerHit", waffenscheinmarker, waffenscheinmarker_func )
