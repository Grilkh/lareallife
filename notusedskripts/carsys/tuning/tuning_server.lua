setGarageOpen ( 18, true )
setGarageOpen ( 33, true )
setGarageOpen ( 7, true )
setGarageOpen ( 10, true )
setGarageOpen ( 45, true )
local x1, y1, z1 = -1936.0651855469, 245.01071166992, 33.385932922363
local x2, y2, z2 = 2386.8405761719, 1048.7375488281, 8.9104995727539
local x3, y3, z3 = 2645.02734375, -2045.375, 12.00237903595
local x4, y4, z4 = 1041.71875, -1018.779296875, 30.607528686523
local x5, y5, z5 = 405.9501953125, 2450.607421875, 16.5
MarkerTuning1 = createMarker ( x1, y1, z1, "cylinder", 3, 0, 0, 255, 150, getRootElement() )
createBlip ( x1, y1, z1, 27, 2, 255, 0, 0, 255, 0, 200 )
MarkerTuning2 = createMarker ( x2, y2, z2, "cylinder", 3, 0, 0, 255, 150, getRootElement() )
createBlip ( x2, y2, z2, 27, 2, 255, 0, 0, 255, 0, 200 )
MarkerTuning3 = createMarker ( x3, y3, z3, "cylinder", 3, 0, 0, 255, 150, getRootElement() )
createBlip ( x3, y3, z3, 27, 2, 255, 0, 0, 255, 0, 200 )
MarkerTuning4 = createMarker ( x4, y4, z4, "cylinder", 3, 0, 0, 255, 150, getRootElement() )
createBlip ( x4, y4, z4, 27, 2, 255, 0, 0, 255, 0, 100 )
MarkerTuning5 = createMarker ( x5, y5, z5, "cylinder", 10, 0, 0, 255, 150, getRootElement() )
createBlip ( x5, y5, z5, 27, 2, 255, 0, 0, 255, 0, 100 )

laSetElementData ( MarkerTuning1, "sx", -1936.6840820313 )
laSetElementData ( MarkerTuning1, "sy", 220.6498260498 )
laSetElementData ( MarkerTuning1, "sz", 34.3125 )
laSetElementData ( MarkerTuning1, "sr", 0 )

laSetElementData ( MarkerTuning2, "sx", 2393.8520507813 )
laSetElementData ( MarkerTuning2, "sy", 989.70678710938 )
laSetElementData ( MarkerTuning2, "sz", 10.790312385559 )
laSetElementData ( MarkerTuning2, "sr", 0 )

laSetElementData ( MarkerTuning3, "sx", 2656.4130859375 )
laSetElementData ( MarkerTuning3, "sy", -2039.189453125 )
laSetElementData ( MarkerTuning3, "sz", 13.550000190735 )
laSetElementData ( MarkerTuning3, "sr", 0 )

laSetElementData ( MarkerTuning4, "sx", 1055.27734375 )
laSetElementData ( MarkerTuning4, "sy", -1032.10546875 )
laSetElementData ( MarkerTuning4, "sz", 31.917291259766 )
laSetElementData ( MarkerTuning4, "sr", 0 )

laSetElementData ( MarkerTuning5, "sx", 391.0458984375 )
laSetElementData ( MarkerTuning5, "sy", 2504.92578125 )
laSetElementData ( MarkerTuning5, "sz", 20 )
laSetElementData ( MarkerTuning5, "sr", 0 )

--[[
transfender1, 2393.8520507813, 989.70678710938, 10.690312385559
tuning, 2386.8405761719, 1048.7375488281, 8.9104995727539
]]

function applyLightValues_func ( red, green, blue )

	local red = MySQL_Save ( red )
	local green = MySQL_Save ( green )
	local blue = MySQL_Save ( blue )
	
	local player = client
	local veh = getPedOccupiedVehicle ( player )
	
	setVehicleHeadLightColor ( veh, red, green, blue )
	
	local pname = laGetElementData ( veh, "owner" )
	local slot = laGetElementData ( veh, "carslotnr_owner" )
	
	if pname == getPlayerName ( player ) then
		lcolor = "|"..red.."|"..green.."|"..blue.."|"
		laSetElementData ( veh, "lcolor", lcolor )
		
		MySQL_SetString("vehicles", "Lights", lcolor, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '"..slot.."'")
	end
end
addEvent ( "applyLightValues", true )
addEventHandler ( "applyLightValues", getRootElement(), applyLightValues_func )

function MarkerTuningHit ( hitElement, matchingDimension )
	
	if getElementType( hitElement ) == "vehicle" and matchingDimension then
		if getVehicleOccupant ( hitElement, 0 ) ~= false and getVehicleOccupant ( hitElement, 1 ) == false and getVehicleOccupant ( hitElement, 2 ) == false and getVehicleOccupant ( hitElement, 3 ) == false then
			if not copvehs[getElementModel ( hitElement )] then
				local player = getVehicleOccupant ( hitElement )
				if player then
					if laGetElementData ( hitElement, "owner" ) then
						if laGetElementData ( hitElement, "owner" ) == getPlayerName ( player ) then
							local x, y, z, r = laGetElementData ( source, "sx" ), laGetElementData ( source, "sy" ), laGetElementData ( source, "sz" ), laGetElementData ( source, "sr" )
							
							laSetElementData ( hitElement, "tuningSx", x )
							laSetElementData ( hitElement, "tuningSy", y )
							laSetElementData ( hitElement, "tuningSz", z )
							laSetElementData ( hitElement, "tuningSr", r )

							if bikes[getElementModel ( hitElement )] then
								removePedFromVehicle ( player )
								warpPedIntoVehicle ( player, hitElement, 1 )
							end
							i = tonumber ( laGetElementData ( player, "playerid" ) )
							laSetElementData ( hitElement, "usingdim", i )
							setElementPosition ( hitElement, -2053.7531738281, 143.72497558594, 28.923471450806 )
							setVehicleRotation ( hitElement, 0, 0, 290 )
							setElementDimension ( hitElement, i )
							setElementDimension ( player, i )
							setElementInterior ( hitElement, i )
							setElementInterior ( player, i )
							setElementVelocity ( hitElement, 0, 0, 0 )
							setCameraMatrix ( player, -2059.251953125, 149.47894287109, 31.377527236938, -2047.3326416016, 137.53858947754, 29.064981460571 )
							triggerClientEvent ( player, "createTuningMenue", getRootElement() )
							showPlayerHudComponent ( player, "ammo", true )
							showPlayerHudComponent ( player, "weapon", true )
							showPlayerHudComponent ( player, "armour", true )
							showPlayerHudComponent ( player, "money", true )
							laSetElementData ( player, "ElementClicked", true )
						else
							if getElementData ( player, "sprache" ) == "Deutsch" then
								outputChatBox ( "Du kannst nur deine Privatfahrzeuge tunen!", player, 125, 0, 0 )
							else
								outputChatBox ( "You can tune your private vehicles only!", player, 125, 0, 0 )							
							end
						end
					else
						if getElementData ( player, "sprache" ) == "Deutsch" then
								outputChatBox ( "Du kannst nur deine Privatfahrzeuge tunen!", player, 125, 0, 0 )
						else
							outputChatBox ( "You can tune your private vehicles only!", player, 125, 0, 0 )							
						end
					end
				end
			else
				if getElementData ( player, "sprache" ) == "Deutsch" then
					outputChatBox ( "Polizeifahrzeuge werden nicht getuned!", player, 125, 0, 0 )
				else
					outputChatBox ( "You can't tune police vehicles!", player, 125, 0, 0 )
				end
			end
		end
	end
end
addEventHandler ( "onMarkerHit", MarkerTuning1, MarkerTuningHit )
addEventHandler ( "onMarkerHit", MarkerTuning2, MarkerTuningHit )
addEventHandler ( "onMarkerHit", MarkerTuning3, MarkerTuningHit )
addEventHandler ( "onMarkerHit", MarkerTuning4, MarkerTuningHit )
addEventHandler ( "onMarkerHit", MarkerTuning5, MarkerTuningHit )

function addSpecialTuning_func ( tuning )

	local player = source
	if player == client then
		local price = specialUpgradePrice[tuning]
		local money = laGetElementData ( player, "money" )
		if money >= price then
			local pname = MySQL_Save ( getPlayerName ( player ) )
			local veh = getPedOccupiedVehicle ( player )
			local totTuning = ""
			for i = 1, 6 do
				if i == tuning then
					laSetElementData ( veh, "stuning"..i, tuning )
					totTuning = totTuning.."1".."|"
					if i == 1 then
						if getElementData ( player, "sprache" ) == "Deutsch" then
							outputChatBox ( "Dein Fahrzeug hat nun einen Kofferraum - benutze die Spezialmissionen-Taste (2), um ihn zu öffnen.", player, 0, 125, 0 )
							outputChatBox ( "Anschliessend kannst du ihn per Klicksystem bedienen und bestimmte Items darin lagern.", player, 0, 125, 0 )
						else
							outputChatBox ( "Your vehicle has a trunk now - use the special missions-key (2) to open it.", player, 0, 125, 0 )
							outputChatBox ( "Then you can use it with the clicksystem and you can store certain items in the trunk.", player, 0, 125, 0 )
						end
					elseif i == 2 then
						if getElementData ( player, "sprache" ) == "Deutsch" then
							outputChatBox ( "Dein Fahrzeug ist nun gepanzert und hält einiges mehr an Schaden aus.", player, 0, 125, 0 )
						else
							outputChatBox ( "Your vehicle is now armed and holds a lot more out of harm.", player, 0, 125, 0 )
						end
					elseif i == 3 then
						if getElementData ( player, "sprache" ) == "Deutsch" then
							outputChatBox ( "Dein Fahrzeug verbraucht nun deutlich weniger Benzin.", player, 0, 125, 0 )
						else
							outputChatBox ( "Your vehicle uses much less gasoline now.", player, 0, 125, 0 )
						end
					elseif i == 4 then
						if getElementData ( player, "sprache" ) == "Deutsch" then
							outputChatBox ( "Dein Fahrzeug ist nun mit einem GPS-Sender versehen, du kannst seine Position mit /fahrzeuge abrufen.", player, 0, 125, 0 )
						else
							outputChatBox ( "Your vehicle is now equipped with a GPS transmitter, you can see the position of your vehicle with /fahrzeuge.", player, 0, 125, 0 )
						end
					end
				else
					local tok = gettok ( laGetElementData ( veh, "stuning" ), i, string.byte ( '|' ) )
					totTuning = totTuning..tok.."|"
				end
			end
			totTuning = MySQL_Save ( totTuning )
			laSetElementData ( veh, "stuning", totTuning )
			MySQL_SetString("vehicles", "STuning", totTuning, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..laGetElementData ( veh, "carslotnr_owner" ).. "' ")
			specPimpVeh ( veh )
			specialTuningVehEnter ( player, 0 )
			laSetElementData ( player, "money", money - price )
		end
	end
end
addEvent ( "addSpecialTuning", true )
addEventHandler ( "addSpecialTuning", getRootElement(), addSpecialTuning_func )

function CancelTuning_func ( player, veh, c1, c2, c3, c11, c12, c13, c21, c22, c23, c31, c32, c33, paintjob, t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16 )

	if player == client then
		paintjob = MySQL_Save ( paintjob )
		setVehiclePaintjob ( veh, paintjob )
		local color = MySQL_Save ( "|"..c1.."|"..c2.."|"..c3.."|"..c11.."|"..c12.."|"..c13.."|"..c21.."|"..c22.."|"..c23.."|"..c31.."|"..c32.."|"..c33.."|" )
		laSetElementData ( veh, "color", color )
		setPrivVehCorrectColor1 ( veh )
		setElementDimension ( player, 0 )
		setElementInterior ( player, 0 )
		setElementDimension ( veh, 0 )
		setElementInterior ( veh, 0 )
		
		local x, y, z, r = laGetElementData ( veh, "tuningSx" ), laGetElementData ( veh, "tuningSy" ), laGetElementData ( veh, "tuningSz" ), laGetElementData ( veh, "tuningSr" )
		
		setElementPosition ( veh, x, y, z )
		setElementRotation ( veh, 0, 0, 90 )
		setVehicleFrozen ( veh, true )
		setElementVelocity ( veh, 0, 0, 0 )
		setTimer ( setVehicleFrozen, 2000, 1, veh, false )
		setCameraTarget ( player, player )
		for i = 0, 16 do
			local upgrade = getVehicleUpgradeOnSlot ( veh, i )
			if upgrade then
				removeVehicleUpgrade ( veh, upgrade )
			end
		end
		local tuning = "|"
		if t0 == false then t0 = 0 else addVehicleUpgrade ( veh, t0 ) end
		tuning = tuning..t0.."|"
		if t1 == false then t1 = 0 else addVehicleUpgrade ( veh, t1 ) end
		tuning = tuning..t1.."|"
		if t2 == false then t2 = 0 else addVehicleUpgrade ( veh, t2 ) end
		tuning = tuning..t2.."|"
		if t3 == false then t3 = 0 else addVehicleUpgrade ( veh, t3 ) end
		tuning = tuning..t3.."|"
		if t4 == false then t4 = 0 else addVehicleUpgrade ( veh, t4 ) end
		tuning = tuning..t4.."|"
		if t5 == false then t5 = 0 else addVehicleUpgrade ( veh, t5 ) end
		tuning = tuning..t5.."|"
		if t6 == false then t6 = 0 else addVehicleUpgrade ( veh, t6 ) end
		tuning = tuning..t6.."|"
		if t7 == false then t7 = 0 else addVehicleUpgrade ( veh, t7 ) end
		tuning = tuning..t7.."|"
		if t8 == false then t8 = 0 else addVehicleUpgrade ( veh, t8 ) end
		tuning = tuning..t8.."|"
		if t9 == false then t9 = 0 else addVehicleUpgrade ( veh, t9 ) end
		tuning = tuning..t9.."|"
		if t10 == false then t10 = 0 else addVehicleUpgrade ( veh, t10 ) end
		tuning = tuning..t10.."|"
		if t11 == false then t11 = 0 else addVehicleUpgrade ( veh, t11 ) end
		tuning = tuning..t11.."|"
		if t12 == false then t12 = 0 else addVehicleUpgrade ( veh, t12 ) end
		tuning = tuning..t12.."|"
		if t13 == false then t13 = 0 else addVehicleUpgrade ( veh, t13 ) end
		tuning = tuning..t13.."|"
		if t14 == false then t14 = 0 else addVehicleUpgrade ( veh, t14 ) end
		tuning = tuning..t14.."|"
		if t15 == false then t15 = 0 else addVehicleUpgrade ( veh, t15 ) end
		tuning = tuning..t15.."|"
		if t16 == false then t16 = 0 else addVehicleUpgrade ( veh, t16 ) end
		tuning = tuning..t16.."|"
		tuning = MySQL_Save ( tuning )
		local pname = MySQL_Save ( getPlayerName ( player ) )
		local slot = laGetElementData ( veh, "carslotnr_owner" )
		if slot then
			MySQL_SetString("vehicles", "Tuning", tuning, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
			MySQL_SetString("vehicles", "Farbe", color, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
			MySQL_SetString("vehicles", "Paintjob", paintjob, "Besitzer LIKE '" ..pname.."' AND Slot LIKE '" ..slot.. "' ")
		end
	end
end
addEvent ( "CancelTuning", true )
addEventHandler ( "CancelTuning", getRootElement(), CancelTuning_func )

function buyTuningPart_func ( player, veh, part, price )
	
	if player == client then
		addVehicleUpgrade ( veh, part )
		moneychange ( player, (price*-1) )
	end
end
addEvent ( "buyTuningPart", true )
addEventHandler ( "buyTuningPart", getRootElement(), buyTuningPart_func )

function setPrivVehCorrectLightColor4 ( veh )

	if veh then
		local colors = laGetElementData ( veh, "lcolor" )
		if colors then
			local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
			local c2 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
			local c3 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))
			laSetElementData ( veh, "lc1", c1 )
			laSetElementData ( veh, "lc2", c2 )
			laSetElementData ( veh, "lc3", c3 )
			setVehicleHeadLightColor ( veh, c1, c2, c3 )
		end
	end
end

function setPrivVehCorrectColor1 ( veh )

	local colors = laGetElementData ( veh, "color" )
	local c1 = tonumber ( gettok ( colors, 1, string.byte( '|' ) ))
	local c2 = tonumber ( gettok ( colors, 2, string.byte( '|' ) ))
	local c3 = tonumber ( gettok ( colors, 3, string.byte( '|' ) ))

	local c11 = tonumber ( gettok ( colors, 4, string.byte( '|' ) ))
	local c12 = tonumber ( gettok ( colors, 5, string.byte( '|' ) ))
	local c13 = tonumber ( gettok ( colors, 6, string.byte( '|' ) ))
	
	local c21 = tonumber ( gettok ( colors, 7, string.byte( '|' ) ))
	local c22 = tonumber ( gettok ( colors, 8, string.byte( '|' ) ))
	local c23 = tonumber ( gettok ( colors, 9, string.byte( '|' ) ))
	
	local c31 = tonumber ( gettok ( colors, 10, string.byte( '|' ) ))
	local c32 = tonumber ( gettok ( colors, 11, string.byte( '|' ) ))
	local c33 = tonumber ( gettok ( colors, 12, string.byte( '|' ) ))
	setVehicleColor ( veh, c1, c2, c3, c11, c12, c13, c21, c22, c23, c31, c32, c33 )
	setTimer ( setVehicleColor, 100, 1, veh, c1, c2, c3, c11, c12, c13, c21, c22, c23, c31, c32, c33 )
end