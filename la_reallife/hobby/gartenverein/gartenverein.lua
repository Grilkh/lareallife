debug.sethook()

firstgrow = 600
firstchange = 3600
secondchange = 7200
thirdchange = 3600
growCount = 0
playerToGroundLevel = 4.3829 - 3.0744

--createBlip ( -2579.8989257813, 310.11599731445, 4.87415599823, 62, 2, 255, 0, 0, 255, 0, 200, getRootElement() )
--gartenvereinPickup = createPickup ( -2579.8989257813, 310.11599731445, 4.87415599823, 3, 1239, 50, 0 )
--gartenvereinDrogen = createPickup ( -2581.79, 304.06, 4.82, 3, 1239, 50, 0 )

function weedAddMySQL ( x, y, z, hour, minute, player, weedart )

	local x = math.floor ( x * 100 ) / 100
	local y = math.floor ( y * 100 ) / 100
	local z = math.floor ( z * 100 ) / 100
if weedart == "big" then
	-- local result = mysql_query ( handler, "INSERT INTO weed ( X, Y, Z, Hour, Min, Spieler, Art ) VALUES ( '"..x.."', '"..y.."', '"..z.."', '"..hour.."', '"..minute.."', '"..player.."', '"..weedart.."'  )" )
	local result = dbQuery ( handler, "INSERT INTO weed ( X, Y, Z, Hour, Min, Spieler, Art ) VALUES ( '"..x.."', '"..y.."', '"..z.."', '"..hour.."', '"..minute.."', '"..player.."', '"..weedart.."'  )" )
	-- mysql_free_result(result)
	dbFree(result)
elseif weedart == "small" then
	-- local result = mysql_query ( handler, "INSERT INTO weed ( X, Y, Z, Hour, Min, Spieler, Art ) VALUES ( '"..x.."', '"..y.."', '"..z.."', '"..hour.."', '"..minute.."', '"..player.."', '"..weedart.."'  )" )
	local result = dbQuery ( handler, "INSERT INTO weed ( X, Y, Z, Hour, Min, Spieler, Art ) VALUES ( '"..x.."', '"..y.."', '"..z.."', '"..hour.."', '"..minute.."', '"..player.."', '"..weedart.."'  )" )
	-- mysql_free_result(result)
	dbFree(result)
end
end

function weedDelMySQL ( x, y, z, hour, minute )

	--if tostring ( x ) == MySQL_Save ( x ) and tostring ( y ) == MySQL_Save ( y ) and tostring ( z ) == MySQL_Save ( z ) and tostring ( hour ) == MySQL_Save ( hour ) and tostring ( minute ) == MySQL_Save ( minute ) then
		MySQL_DelRow ( "weed", "X LIKE '"..x.."' AND Y LIKE '"..y.."' AND Z LIKE '"..z.."'")
--	end
end

function drugsSellHobby_func ( player, amount )

	if player == client then
		local amount = math.abs ( tonumber ( amount ) )
		local weed = laGetElementData ( player, "weed" )
		if weed >= amount then
			laSetElementData ( player, "weed", weed - amount )
			givePlayerMoney ( player, "money", amount * 7 )
			laSetElementData ( player, "money", laGetElementData ( player, "money" ) + amount * 7 )
			outputChatBox ( "Du hast für "..amount.." Gramm Weed "..(amount*7).."$ bekommen!", player, 0, 125, 0 )
		else
			outputChatBox ( "Du hast nicht so viel Weed!", player, 125, 0, 0 )
		end
	end
end
addEvent ( "drugsSellHobby", true )
addEventHandler ( "drugsSellHobby", getRootElement(), drugsSellHobby_func )

function drugsHobbySellCloseServer_func ( player )

	if player == client then
		showCursor ( player, false )
		laSetElementData ( player, "ElementClicked", false )
		toggleAllControls ( player, true )
	end
end
addEvent ( "drugsHobbySellCloseServer", true )
addEventHandler ( "drugsHobbySellCloseServer", getRootElement(), drugsHobbySellCloseServer_func )

function createWeedPlants ()

	-- result = mysql_query ( handler, "SELECT * FROM weed" )
	result = dbQuery ( handler, "SELECT * FROM weed" )
	weedCount = 0
	-- if result then
	-- 	weedData = mysql_fetch_assoc ( result )
	-- 	while weedData and weedCount < 2000 do
	-- 		weedCount = weedCount + 1
	-- 		local x = weedData["X"]
	-- 		local y = weedData["Y"]
	-- 		local z = weedData["Z"]
	-- 		local hour = tonumber ( weedData["Hour"] )
	-- 		local minute = tonumber ( weedData["Min"] )
	-- 		local art = weedData["Art"]
	-- 		addWeed ( x, y, z, hour, minute, art )
	-- 		weedData = mysql_fetch_assoc ( result )
	-- 	end
	-- 	mysql_free_result(result)
	-- end
	-- outputServerLog ( "Es wurden "..weedCount.." Hanfpflanzen gefunden!" )

	if result then
		re = dbPoll(result, -1)
        -- while weedData and weedCount < 2000 do
		for _, weedData in ipairs ( re ) do
			weedCount = weedCount + 1
			local x = weedData["X"]
			local y = weedData["Y"]
			local z = weedData["Z"]
			local hour = tonumber ( weedData["Hour"] )
			local minute = tonumber ( weedData["Min"] )
			local art = weedData["Art"]
			addWeed ( x, y, z, hour, minute, art )
			weedData = dbPoll(result, -1)
		end
		dbFree(result)
	end
	outputServerLog ( "Es wurden "..weedCount.." Hanfpflanzen gefunden!" )
end
setTimer ( createWeedPlants, 1000, 1 )

function addWeed ( x, y, z, hour, minute, art )
	
	growCount = growCount + 1
	_G["weedPlant"..growCount] = createObject ( 3409, x, y, z )
	_G["weedPlantZ"..growCount] = z
	_G["weedPlantX"..growCount] = x
	_G["weedPlantY"..growCount] = y
	--_G["weedPlantX"..weedCount] = x
	--_G["weedPlantY"..weedCount] = y
	_G["weedBox1"..growCount] = createObject ( 2991, -2589.3125, 330.35571289063, 4.1824889183044, 0, 0, 270 )
	_G["weedBox2"..growCount] = createObject ( 2991, -2587.8278808594, 330.31005859375, 4.1824889183044, 0, 0, 270 )
	laSetElementData ( _G["weedBox1"..growCount], "count", growCount )
	laSetElementData ( _G["weedBox2"..growCount], "count", growCount )
	local ox1, oy1, oz1 = -2588.5119628906-(-2589.3125), 330.2961730957-(330.35571289063), -3.1796875+(4.1824889183044)
	local ox2, oy2, oz2 = -2588.5119628906-(-2587.8278808594), 330.2961730957-(330.31005859375), -3.1796875+(4.1824889183044)
	attachElements ( _G["weedBox1"..growCount], _G["weedPlant"..growCount], ox1, oy1, oz1, 0, 0, 270 )
	attachElements ( _G["weedBox2"..growCount], _G["weedPlant"..growCount], ox2, oy2, oz2, 0, 0, 270 )
	_G["weedMin"..growCount] = minute
	_G["weedHour"..growCount] = hour
	_G["weedArt"..growCount] = art
	setElementAlpha ( _G["weedBox1"..growCount], 0 )
	setElementAlpha ( _G["weedBox2"..growCount], 0 )
end

function gartenvereinPickupHit ( player )
	
	if source == gartenvereinPickup then
		if getPedOccupiedVehicle ( player ) == false then
			if laGetElementData ( player, "club" ) == "gartenverein" then
				triggerClientEvent ( player, "_createGartenclubMemberGui", getRootElement() )
				showCursor ( player, true )
				laSetElementData ( player, "ElementClicked", true )
				toggleAllControls ( player, false )
			else
				triggerClientEvent ( player, "_createGartenvereinGuiJoin", getRootElement() )
				showCursor ( player, true )
				laSetElementData ( player, "ElementClicked", true )
				toggleAllControls ( player, false )
			end
		end
	end
end
addEventHandler ( "onPickupHit", getRootElement(), gartenvereinPickupHit )

--[[function gartenvereinDrogenHit ( player )
	
	if not getPedOccupiedVehicle ( player ) then
		if laGetElementData ( player, "club" ) == "gartenverein" then
			triggerClientEvent ( player, "showDrugSellGui", getRootElement() )
			showCursor ( player, true )
			laSetElementData ( player, "ElementClicked", true )
			toggleAllControls ( player, false )
		else
			outputChatBox ( "Drogenankauf nur für Mitglieder des Gartenvereins.", player, 125, 0, 0 )
		end
	end
end
addEventHandler ( "onPickupHit", gartenvereinDrogen, gartenvereinDrogenHit )]]

function grow_func ( player, cmd, planttype )

	--[[if planttype == "palme" then
		local x, y, z = getElementPosition ( player )
		local pname = getPlayerName ( player )
		
		if _G[pname.."tree"] then
			destroyElement ( _G[pname.."tree"] )
		end
		_G[pname.."treex"] = x
		_G[pname.."treey"] = y
		_G[pname.."treez"] = z
		
		setTimer ( grow1, firstgrow*1000, 1, _G[pname.."tree"], pname )
		
		triggerClientEvent ( player, "infobox_start", getRootElement(), "Du hast soeben\neine Palme gepflanzt-\nSchau in ein\npaar Stunden\nerneut vorbei!", 7500, 0, 200, 0 )]]
	if planttype == "weed" then
		if isPedOnGround ( player ) and not getPedOccupiedVehicle ( player ) and getElementInterior ( player ) == 0 and getElementDimension ( player ) then
			if not laGetElementData ( player, "growing" ) then
				if laGetElementData ( player, "flowerseeds" ) >= 1 then
					laSetElementData ( player, "growing", true )
					--setElementFrozen ( player, true ) n
					laSetElementData(player,"anim", 1)
					setTimer ( growFinished, 28500, 1, player )
					toggleAllControls ( player, false, true, true ) -- n
					--setTimer ( toggleAllControls, 30*1000, 1, player, false, true, true ) -- n
					--setTimer ( setElementFrozen, 30*1000, 1, player, false )
					--setTimer ( laSetElementData, 30*1000, 1, player, "growing", false )
					setPedAnimation ( player, "BOMBER", "BOM_Plant_Crouch_In", 1500, false, false, false, true )
					setTimer ( setPedAnimation, 1500, 1, player, "BOMBER", "BOM_Plant_Loop", -1, true, false, false, true )
					
					laSetElementData ( player, "flowerseeds", laGetElementData ( player, "flowerseeds" ) - 1 )
					growCount = growCount + 1
					local x, y, z = getElementPosition ( player )
					local z = z - playerToGroundLevel*2
					local ox1, oy1, oz1 = -2588.5119628906-(-2589.3125), 330.2961730957-(330.35571289063), -3.1796875+(4.1824889183044)
					local ox2, oy2, oz2 = -2588.5119628906-(-2587.8278808594), 330.2961730957-(330.31005859375), -3.1796875+(4.1824889183044)
					_G["weedPlant"..growCount] = createObject ( 3409, x, y, z )
					_G["weedPlantZ"..growCount] = z + playerToGroundLevel
					_G["weedPlantX"..growCount] = x
					_G["weedPlantY"..growCount] = y
					_G["weedBox1"..growCount] = createObject ( 2991, -2589.3125, 330.35571289063, 4.1824889183044, 0, 0, 270 )
					_G["weedBox2"..growCount] = createObject ( 2991, -2587.8278808594, 330.31005859375, 4.1824889183044, 0, 0, 270 )
					laSetElementData ( _G["weedBox1"..growCount], "count", growCount )
					laSetElementData ( _G["weedBox2"..growCount], "count", growCount )
					attachElements ( _G["weedBox1"..growCount], _G["weedPlant"..growCount], ox1, oy1, oz1, 0, 0, 270 )
					attachElements ( _G["weedBox2"..growCount], _G["weedPlant"..growCount], ox2, oy2, oz2, 0, 0, 270 )
					local gTime = getRealTime()
					_G["weedMin"..growCount] = gTime.minute
					_G["weedHour"..growCount] = gTime.hour
					local weedart = "small"
					_G["weedArt"..growCount] = weedart
					setElementAlpha ( _G["weedBox1"..growCount], 0 )
					setElementAlpha ( _G["weedBox2"..growCount], 0 )
					moveObject ( _G["weedPlant"..growCount], 120000, x, y, z + playerToGroundLevel )
					local pname = getPlayerName(player)
					weedAddMySQL ( x, y, z + playerToGroundLevel, gTime.hour, gTime.minute, pname, weedart )
					outputChatBox ( "Hanf wird angepflanzt! Du kannst es per Klick ernten, wann du willst, jedoch steigt der Ertrag pro Stunde!", player, 0, 150, 0 )
				else
					outputChatBox ( "Du hast keine Hanfsamen dabei!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Bitte pflanze erst zuende an!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist an keiner gültigen Stelle!", player, 125, 0, 0 )
		end
	elseif planttype == "bigweed" then
		if isPedOnGround ( player ) and not getPedOccupiedVehicle ( player ) and getElementInterior ( player ) == 0 and getElementDimension ( player ) then
			if not laGetElementData ( player, "growing" ) then
				if laGetElementData ( player, "premiumseeds" ) >= 1 then
					laSetElementData ( player, "growing", true )
					--setElementFrozen ( player, true ) n
					laSetElementData(player,"anim", 1)
					setTimer ( growFinished, 42750, 1, player )
					toggleAllControls ( player, false, true, true ) -- n
					--setTimer ( toggleAllControls, 30*1000, 1, player, false, true, true ) -- n
					--setTimer ( setElementFrozen, 30*1000, 1, player, false )
					--setTimer ( laSetElementData, 30*1000, 1, player, "growing", false )
					setPedAnimation ( player, "BOMBER", "BOM_Plant_Crouch_In", 1500, false, false, false, true )
					setTimer ( setPedAnimation, 1500, 1, player, "BOMBER", "BOM_Plant_Loop", -1, true, false, false, true )
					
					laSetElementData ( player, "premiumseeds", laGetElementData ( player, "premiumseeds" ) - 1 )
					growCount = growCount + 1
					local x, y, z = getElementPosition ( player )
					local z = z - playerToGroundLevel*2
					local ox1, oy1, oz1 = -2588.5119628906-(-2589.3125), 330.2961730957-(330.35571289063), -3.1796875+(4.1824889183044)
					local ox2, oy2, oz2 = -2588.5119628906-(-2587.8278808594), 330.2961730957-(330.31005859375), -3.1796875+(4.1824889183044)
					_G["weedPlant"..growCount] = createObject ( 3409, x, y, z )
					_G["weedPlantZ"..growCount] = z + playerToGroundLevel
					_G["weedPlantX"..growCount] = x
					_G["weedPlantY"..growCount] = y
					_G["weedBox1"..growCount] = createObject ( 2991, -2589.3125, 330.35571289063, 4.1824889183044, 0, 0, 270 )
					_G["weedBox2"..growCount] = createObject ( 2991, -2587.8278808594, 330.31005859375, 4.1824889183044, 0, 0, 270 )
					laSetElementData ( _G["weedBox1"..growCount], "count", growCount )
					laSetElementData ( _G["weedBox2"..growCount], "count", growCount )
					attachElements ( _G["weedBox1"..growCount], _G["weedPlant"..growCount], ox1, oy1, oz1, 0, 0, 270 )
					attachElements ( _G["weedBox2"..growCount], _G["weedPlant"..growCount], ox2, oy2, oz2, 0, 0, 270 )
					local gTime = getRealTime()
					_G["weedMin"..growCount] = gTime.minute
					_G["weedHour"..growCount] = gTime.hour
					local weedart = "big"
					_G["weedArt"..growCount] = weedart
					setElementAlpha ( _G["weedBox1"..growCount], 0 )
					setElementAlpha ( _G["weedBox2"..growCount], 0 )
					moveObject ( _G["weedPlant"..growCount], 120000, x, y, z + playerToGroundLevel )
					local pname = getPlayerName(player)
					weedAddMySQL ( x, y, z + playerToGroundLevel, gTime.hour, gTime.minute, pname, weedart )
					outputChatBox ( "Hanf wird angepflanzt! Du kannst es per Klick ernten, wann du willst, jedoch steigt der Ertrag pro Stunde!", player, 0, 150, 0 )
				else
					outputChatBox ( "Du hast keine Premiumsamen dabei!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Bitte pflanze erst zuende an!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist an keiner gültigen Stelle!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Bitte /grow [weed/bigweed] verwenden!", player, 125, 0, 0 )
	end
end
addCommandHandler("grow", grow_func)

function growFinished ( player )

	setPedAnimation ( player, "BOMBER", "BOM_Plant_Crouch_Out", 1500, false, false, false, true )
	setTimer ( defreezeAfterWeedPlant, 1500, 1, player )
	laSetElementData ( player, "growing", false )
	laSetElementData(player,"anim", 0)
end

function defreezeAfterWeedPlant ( player )

	toggleAllControls ( player, true, true, true ) -- n
	setTimer ( laSetElementData, 30000, 1, player, "growing", false )
	setPedAnimation ( player )
end

function grow1 ( tree, pname )

	if not _G[pname.."tree"] then
		_G[pname.."tree"] = createObject ( 634, _G[pname.."treex"]+1.2, _G[pname.."treey"], _G[pname.."treez"]-5 )
		moveObject ( _G[pname.."tree"], firstchange*1000, _G[pname.."treex"]+1.2, _G[pname.."treey"], _G[pname.."treez"]-3, 0, 0 )
		setTimer ( grow2, firstchange*1000, 1, _G[pname.."tree"], pname )
	end
end

function grow2 ( tree, pname )

	if _G[pname.."tree"] then
		destroyElement ( tree )
		_G[pname.."tree"] = createObject ( 711, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+1.4 )
		moveObject ( _G[pname.."tree"], secondchange*1000, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+4.696, 0, 0, 180 )
		setTimer ( grow3, secondchange*1000, 1, _G[pname.."tree"], pname )
	end
end

function grow3 ( tree, pname )

	if _G[pname.."tree"] then
		destroyElement ( tree )
		_G[pname.."tree"] = createObject ( 710, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+2.62 )
		moveObject ( _G[pname.."tree"], thirdchange*1000, _G[pname.."treex"], _G[pname.."treey"], _G[pname.."treez"]+7.9137, 0, 0, 180 )
	end
end

function joinGartenverein_func ( player )

	if player == client then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		if money >= 200 then
			laSetElementData ( player, "money", money - 200 )
			takePlayerMoney ( player, 200 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			laSetElementData ( player, "club", "gartenverein" )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nun\nMitglied des Garten-\nClubs und kannst\nGartenartikel erwerben!", 7500, 0, 200, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld - Dem\nGartenverein beizutreten\nkostetn 200 $!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "joinGartenverein", true )
addEventHandler ( "joinGartenverein", getRootElement(), joinGartenverein_func )

function BuyMowerServer_func ( player )

	if player == client then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		if money >= 600 then
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			carbuy ( player, 600, 572, -2593.993, 334.072, 4.148, 0, 0, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld - Ein\nRasenmäher\nkostet 600 $!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "BuyMowerServer", true )
addEventHandler ( "BuyMowerServer", getRootElement(), BuyMowerServer_func )

function BuyShovelServer_func ( player )

	if player == client then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		if money >= 15 then
			laSetElementData ( player, "money", money - 15 )
			takePlayerMoney ( player, 15 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			local weapon = 6
			local ammo = 1
			giveWeapon ( player, weapon, ammo, true )
			triggerClientEvent ( player, "sec_gun_give", getRootElement(), weapon, ammo )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld - eine\nSchaufel kostet 15 $!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "BuyShovelServer", true )
addEventHandler ( "BuyShovelServer", getRootElement(), BuyShovelServer_func )

function BuyFlowersServer_func ( player )

	if player == client then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		local seeds = tonumber ( laGetElementData ( player, "flowerseeds" ) )
		if money >= 100 then
			laSetElementData ( player, "money", money - 100 )
			takePlayerMoney ( player, 100 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			
			laSetElementData ( player, "flowerseeds", seeds + 2 )
			
			triggerClientEvent ( player, "infobox_start", getRootElement(), "2 Samen gekauft-\nTippe /grow weed,\num sie einzu-\npflanzen!", 7500, 0, 200, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld - Weed-\nsamen kosten 100$!", 7500, 125, 0, 0 )
		end
	end
end
addEvent ( "BuyFlowersServer", true )
addEventHandler ( "BuyFlowersServer", getRootElement(), BuyFlowersServer_func )

function BuyPalmServer_func ( player )

	if player == client then
		local money = tonumber ( laGetElementData ( player, "money" ) )
		--[[if money >= 120 then
			laSetElementData ( player, "money", money - 120 )
			takePlayerMoney ( player, 120 )
			triggerClientEvent ( player, "HudEinblendenMoney", getRootElement() )
			laSetElementData ( player, "club", "gartenverein" )
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu bist nun\nMitglied des Garten-\nClubs und kannst\nGartenartikel erwerben!", 7500, 0, 200, 0 )
		else
			triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast nicht\ngenug Geld - Ein\nPalmensamen kostet\n120 $!", 7500, 125, 0, 0 )
		end]]
		outputChatBox ( "Coming soon!", player, 200, 200, 0 )
	end
end
addEvent ( "BuyPalmServer", true )
addEventHandler ( "BuyPalmServer", getRootElement(), BuyPalmServer_func )

function quitclub_func ( player )

	laSetElementData ( player, "club", "none" )
	triggerClientEvent ( player, "infobox_start", getRootElement(), "\nDu hast deinen\nClub verlassen!", 7500, 125, 0, 0 )
end
addCommandHandler ( "quitclub", quitclub_func )