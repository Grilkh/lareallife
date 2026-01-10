------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

local AusstellBus1 = createVehicle(437,  -1976.956, 437.296, 26.435, 0, 0, 0)
local AusstellBus2 = createVehicle(431,  -1981.111, 437.662, 26.5, 0, 0, 0)
local AusstellBus3 = createVehicle(437,  -1976.338, 459.856, 28.687, 0, 0, 0)
local AusstellBus4 = createVehicle(431,  -1981.338, 459.856, 28.687, 0, 0, 0)

setVehicleLocked(AusstellBus1, true)
setVehicleLocked(AusstellBus2, true)
setVehicleLocked(AusstellBus3, true)
setVehicleLocked(AusstellBus4, true)

setElementFrozen(AusstellBus1, true)
setElementFrozen(AusstellBus2, true)
setElementFrozen(AusstellBus3, true)
setElementFrozen(AusstellBus4, true)

busModels = { 
[431]=true,
[437]=true,
 }

function startBusJob_func (player, add)
	-- Just for debugging
	-- outputChatBox("Info: startBusJob FunctionCall - Bus "..getPlayerName (player).." called at "..os.time(os.date("!*t")))
	-- Get Player Name
	local pname = getPlayerName (player)
	-- removes every markers and blips if job was done before and they exist
	if _G["Bus"..pname] then
		-- destroy all BusMarker and BusBlip if they already exist
		for i = 1,14 do
			if _G["BusMarker"..tostring(i)..pname] then destroyElement(_G["BusMarker"..tostring(i)..pname]) end
			if _G["BusBlip"..tostring(i)..pname] then destroyElement(_G["BusBlip"..tostring(i)..pname]) end
		end
		for i = 1,10 do
			if _G["ReiseMarker"..tostring(i)..pname] then destroyElement(_G["ReiseMarker"..tostring(i)..pname]) end
			if _G["ReiseBlip"..tostring(i)..pname] then destroyElement(_G["ReiseBlip"..tostring(i)..pname]) end
		end
	end
	if laGetElementData (player, "job") == "bus" then
			-- do not allow the player to shoot a gun
			toggleControl (player, "fire", true)
			-- do not allow the player to enter a vehicle
			toggleControl (player, "enter_exit", true)
			-- set the player to no dm zone
			laSetElementData(player, "nodmzone", 0)
			-- Get the matching Dimension of the current player and create a new Dimension by adding 1 to the player id [used for bus job] example (19283 + 1) = 19284 -> Dimension for the Bus Job
			local matchDim = tonumber (laGetElementData (player, "playerid")) + 1
			-- Set the Interiror (normal GTA World) and the Dimension (Dimension for the Bus Job)
			setElementInterior (player, 0)
			setElementDimension (player, matchDim)
			if add == "stadt" then
				-- Create the Bus the Player is used to go trough the checkpoints
				_G["Bus"..pname] = createVehicle (431, -1978.36, 496.344, 29.126, 0, 0, 0)
				-- Just for debugging
				-- outputChatBox("Info: Stadt Zufall 1 - Bus"..pname.." created")
				_G["BusMarker1"..pname] = createMarker (-2009.506, 453.53, 34.4574, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip1"..pname] = createBlip (-2009.506, 453.53, 34.4574, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker2"..pname] = createMarker (-2009.506, 172.726, 26.98, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip2"..pname] = createBlip (-2009.506, 172.726, 26.98, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker3"..pname] = createMarker (-2170.495, 13.362, 34.614, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip3"..pname] = createBlip (-2170.495, 13.362, 34.614, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker4"..pname] = createMarker (-2289.646, -187.118, 34.606, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip4"..pname] = createBlip (-2289.646, -187.118, 34.606, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker5"..pname] = createMarker (-2447.406, -67.329, 33.409, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip5"..pname] = createBlip (-2447.406, -67.329, 33.409, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker6"..pname] = createMarker (-2663.057, -67.482, 3.60, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip6"..pname] = createBlip (-2663.057, -67.482, 3.60, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker7"..pname] = createMarker (-2703.56, 196.1886, 3.628, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip7"..pname] = createBlip (-2703.56, 196.1886, 3.628, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker8"..pname] = createMarker (-2747.086, 378.124, 3.563, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip8"..pname] = createBlip (-2747.086, 378.124, 3.563, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker9"..pname] = createMarker (-2649.5485, 705.1953, 27.211, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip9"..pname] = createBlip (-2649.5485, 705.1953, 27.211, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker10"..pname] = createMarker (-2454.03, 705.51, 34.453, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip10"..pname] = createBlip (-2454.03, 705.51, 34.453, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker11"..pname] = createMarker (-2100.229, 805.728, 68.852, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip11"..pname] = createBlip (-2100.229, 805.728, 68.852, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker12"..pname] = createMarker (-1928.4436, 835.184, 37.302, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip12"..pname] = createBlip (-1928.4436, 835.184, 37.302, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker13"..pname] = createMarker (-2007.925, 793.028, 45.396, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip13"..pname] = createBlip (-2007.925, 793.028, 45.396, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				_G["BusMarker14"..pname] = createMarker (-2007.088, 608.292, 35.127, "checkpoint", 10, 255, 255, 255, 150, player)
				_G["BusBlip14"..pname] = createBlip (-2007.088, 608.292, 35.127, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
				-- CHATBOX SECTION
				outputChatBox ("[AUFGABE]: Du musst die angegebene Route fahren, um deinen Lohn zu erhalten.", player, 0, 100, 200)
				outputChatBox ("[INFO]: Du kannst jederzeit den Bus verlassen und die Mission beenden!", player, 200, 200, 0)
				--
				-- Sets only the Marker1 and Blip1 in the correct dimension of the player
				setElementDimension (_G["BusMarker1"..pname], matchDim)
				setElementDimension (_G["BusBlip1"..pname], matchDim)
				-- hide all the other markers and blips and only show the first one in this case BusMarker1 and BusBlip1		
				for i = 2, 14 do
					setElementDimension (_G["BusBlip"..i..pname], matchDim-1)
					setElementDimension (_G["BusMarker"..i..pname], matchDim-1)
				end
			elseif add == "reise" then
				if tonumber(laGetElementData(player, "buslevel")) >= 25 then
					_G["Bus"..pname] = createVehicle (437, -1978.36, 496.344, 29.126, 0, 0, 0)
					-- Just for debugging
					-- outputChatBox("Info: Reise - Bus "..pname.." created")
					_G["ReiseMarker1"..pname] = createMarker (-2385.1999511719, -2175.6000976563, 33.299999237061, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip1"..pname] = createBlip (-2385.1999511719, -2175.6000976563, 33.299999237061, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					_G["ReiseMarker2"..pname] = createMarker (-22.60000038147, -2506.6000976563, 36.700000762939, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip2"..pname] = createBlip (-22.60000038147, -2506.6000976563, 36.700000762939, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					_G["ReiseMarker3"..pname] = createMarker (1532.9000244141, -1672.6999511719, 13.60000038147, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip3"..pname] = createBlip (1532.9000244141, -1672.6999511719, 13.60000038147, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					_G["ReiseMarker4"..pname] = createMarker (2699.6999511719, -1885.8000488281, 10.89999961853, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip4"..pname] = createBlip (2699.6999511719, -1885.8000488281, 10.89999961853, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					_G["ReiseMarker5"..pname] = createMarker (2343.5, 177.19999694824, 26.299999237061, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip5"..pname] = createBlip (2343.5, 177.19999694824, 26.299999237061, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					_G["ReiseMarker6"..pname] = createMarker (2155.1000976563, 1094.9000244141, 12.60000038147, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip6"..pname] = createBlip (2155.1000976563, 1094.9000244141, 12.60000038147, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					_G["ReiseMarker7"..pname] = createMarker (829.5, 851.20001220703, 11.800000190735, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip7"..pname] = createBlip (829.5, 851.20001220703, 11.800000190735, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					_G["ReiseMarker8"..pname] = createMarker (119.90000152588, 1095.6999511719, 13.60000038147, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip8"..pname] = createBlip (119.90000152588, 1095.6999511719, 13.60000038147, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					_G["ReiseMarker9"..pname] = createMarker (-304.10000610352, 1570.1999511719, 75.40000152587, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip9"..pname] = createBlip (-304.10000610352, 1570.1999511719, 75.40000152587, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					_G["ReiseMarker10"..pname] = createMarker (-1899.4000244141, 879.40002441406, 35, "checkpoint", 10, 255, 255, 255, 150, player)
					_G["ReiseBlip10"..pname] = createBlip (-1899.4000244141, 879.40002441406, 35, 0, 2, 255, 0, 0, 255, 0, 99999.0, player)
					outputChatBox ("[AUFGABE]: Du musst die Touristen zu den Sehenswürdigkeiten fahren.", player, 0, 100, 200)
					outputChatBox ("[INFO]: Du kannst jederzeit den Bus verlassen und die Mission beenden!", player, 200, 200, 0)
					-- Sets only the Marker1 and Blip1 in the correct dimension of the player
					setElementDimension (_G["ReiseMarker1"..pname], matchDim)
					setElementDimension (_G["ReiseBlip1"..pname], matchDim)
				    -- wants to hide the markers and blips and only show the first one in this case ReiseMarker1 and ReiseBlip1
					for i = 2, 5 do
						setElementDimension (_G["ReiseBlip"..i..pname], matchDim-1)
						setElementDimension (_G["ReiseMarker"..i..pname], matchDim-1)
					end
				else
					infobox (player, "\n\nDu hast zu wenig Busjob-Punkte!", 15000, 125, 0, 0)
				end
			end
			-- Sets the spawned bus in the correct dimension of the Bus Job
			setElementDimension (_G["Bus"..pname], matchDim)
			-- Rather just a delay before warping the player
			setTimer(BusMissionAccept, 1000, 1, player)
			-- Warp the Player into bus
			warpPedIntoVehicle (player, _G["Bus"..pname])
	else
		outputChatBox ("Du bist kein Busfahrer!", player, 150, 0, 0)
	end
	-- Call leaveBus function when player exits or has wasted (killed, died)
	addEventHandler ("onVehicleExit", getRootElement(), leaveBus)
	addEventHandler ("onPlayerWasted", getRootElement(), leaveBus)
end
addEvent ("startBusJob", true)
addEventHandler ("startBusJob", getRootElement(), startBusJob_func)

function BusMissionAccept (player)
	laSetElementData (player, "isBus", true)
end

function leaveBus (player)
	local veh = source
	-- Just for debugging
	-- outputChatBox("leaveBus Function Call vehicle1= "..tostring(veh))
	if laGetElementData (player, "job") == "bus" and busModels [ getElementModel(veh) ] then
		if laGetElementData (player, "isBus") then
			local pname = getPlayerName (player)
			destroyElement (veh)
			laSetElementData (player, "isBus", false)
			outputChatBox ("Job beendet!", player, 125, 0, 0)
			setTimer (spawnAtBusbase, 1000, 1, player)
		end
	end
end

function spawnAtBusbase (player)
	setElementPosition (player, -1977.028, 480.128, 29.016)
	setElementDimension (player, 0)
	laSetElementData (player, "isBus", false)
end
-- FOR DEBUGGING
addCommandHandler("tpbus", spawnAtBusbase) 

function BusMarkerHit(hitElement, mDim)
	-- Check if the element that hits the marker is a player
	if getElementType (hitElement) == "player" then
		-- Get the matching Dimension of the current player and create a new Dimension by adding 1 to the player id [used for bus job] example (19283 + 1) = 19284 -> Dimension for the Bus Job
		local matchDim = tonumber (laGetElementData (hitElement, "playerid")) + 1
		-- Get Player Name
		local pname = getPlayerName (hitElement)
		-- Get the vehicle the player is sitting in, should always be the _G["Bus"..pname] so the Bus the player is warped into
		local veh = getPedOccupiedVehicle (hitElement)
		-- Checks if the element thats been hit is Marker1 or 2 or 3 ... and if it´s in the correct dimension
		if source == _G["BusMarker1"..pname] and mDim then
			-- Changes the dimension of the Marker1 and Blip1 in a dimension where the player is not, to make it invisible
			setElementDimension (_G["BusMarker1"..pname], matchDim-1)
			setElementDimension (_G["BusBlip1"..pname], matchDim-1)
			-- Makes the BusMarker2 and BusBlip2 visible to the player
			setElementDimension (_G["BusMarker2"..pname], matchDim)
			setElementDimension (_G["BusBlip2"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			-- Freezes the Player in 50 ms
			setTimer (frozenplayerbus, 50, 1, hitElement)
			-- Unfreezes the Player after 2 seconds
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			-- hitElement = player so it gives the player + 50 money
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			-- gives the player + 50 again, not sure yet why this
			givePlayerMoney (hitElement, 50)
			-- shows the money hud to the player
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
			-- there should be a function call to leaveBus which should remove the vehicle
			-- removePedFromVehicle (hitElement)
		elseif source == _G["BusMarker2"..pname] and mDim then
			setElementDimension (_G["BusMarker2"..pname], matchDim-1)
			setElementDimension (_G["BusBlip2"..pname], matchDim-1)
			setElementDimension (_G["BusMarker3"..pname], matchDim)
			setElementDimension (_G["BusBlip3"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker3"..pname] and mDim then
			setElementDimension (_G["BusMarker3"..pname], matchDim-1)
			setElementDimension (_G["BusBlip3"..pname], matchDim-1)
			setElementDimension (_G["BusMarker4"..pname], matchDim)
			setElementDimension (_G["BusBlip4"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker4"..pname] and mDim then
			setElementDimension (_G["BusMarker4"..pname], matchDim-1)
			setElementDimension (_G["BusBlip4"..pname], matchDim-1)
			setElementDimension (_G["BusMarker5"..pname], matchDim)
			setElementDimension (_G["BusBlip5"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker5"..pname] and mDim then
			setElementDimension (_G["BusMarker5"..pname], matchDim-1)
			setElementDimension (_G["BusBlip5"..pname], matchDim-1)
			setElementDimension (_G["BusMarker6"..pname], matchDim)
			setElementDimension (_G["BusBlip6"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker6"..pname] and mDim then
			setElementDimension (_G["BusMarker6"..pname], matchDim-1)
			setElementDimension (_G["BusBlip6"..pname], matchDim-1)
			setElementDimension (_G["BusMarker7"..pname], matchDim)
			setElementDimension (_G["BusBlip7"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker7"..pname] and mDim then
			setElementDimension (_G["BusMarker7"..pname], matchDim-1)
			setElementDimension (_G["BusBlip7"..pname], matchDim-1)
			setElementDimension (_G["BusMarker8"..pname], matchDim)
			setElementDimension (_G["BusBlip8"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker8"..pname] and mDim then
			setElementDimension (_G["BusMarker8"..pname], matchDim-1)
			setElementDimension (_G["BusBlip8"..pname], matchDim-1)
			setElementDimension (_G["BusMarker9"..pname], matchDim)
			setElementDimension (_G["BusBlip9"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker9"..pname] and mDim then
			setElementDimension (_G["BusMarker9"..pname], matchDim-1)
			setElementDimension (_G["BusBlip9"..pname], matchDim-1)
			setElementDimension (_G["BusMarker10"..pname], matchDim)
			setElementDimension (_G["BusBlip10"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker10"..pname] and mDim then
			setElementDimension (_G["BusMarker10"..pname], matchDim-1)
			setElementDimension (_G["BusBlip10"..pname], matchDim-1)
			setElementDimension (_G["BusMarker11"..pname], matchDim)
			setElementDimension (_G["BusBlip11"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker11"..pname] and mDim then
			setElementDimension (_G["BusMarker11"..pname], matchDim-1)
			setElementDimension (_G["BusBlip11"..pname], matchDim-1)
			setElementDimension (_G["BusMarker12"..pname], matchDim)
			setElementDimension (_G["BusBlip12"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker12"..pname] and mDim then
			setElementDimension (_G["BusMarker12"..pname], matchDim-1)
			setElementDimension (_G["BusBlip12"..pname], matchDim-1)
			setElementDimension (_G["BusMarker13"..pname], matchDim)
			setElementDimension (_G["BusBlip13"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker13"..pname] and mDim then
			setElementDimension (_G["BusMarker13"..pname], matchDim-1)
			setElementDimension (_G["BusBlip13"..pname], matchDim-1)
			setElementDimension (_G["BusMarker14"..pname], matchDim)
			setElementDimension (_G["BusBlip14"..pname], matchDim)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 2000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 50)
			givePlayerMoney (hitElement, 50)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["BusMarker14"..pname] and mDim then
			setElementDimension (_G["BusMarker14"..pname], matchDim-1)
			setElementDimension (_G["BusBlip14"..pname], matchDim-1)
			outputChatBox ("Glückwunsch, du hast es geschafft! Du kriegst 500$ Bonus!", hitElement, 0, 125, 0)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 500)
			givePlayerMoney (hitElement, 500)
			playSoundFrontEnd (hitElement, 40)
			removePedFromVehicle (hitElement)
			setTimer (spawnAtBusbase, 1000, 1, hitElement)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
			local busjobpoints = tonumber(laGetElementData(hitElement, "buslevel"))
			local newbuspoints = busjobpoints+1
			laSetElementData(hitElement, "buslevel", newbuspoints)
			MySQL_SetString ("jobdata", "Bus", newbuspoints, "Name LIKE '"..pname.."'")
			outputChatBox ("[INFO]: Dein Busjob-Level ist jetzt auf "..newbuspoints..".", hitElement, 200, 200, 0)
		elseif source == _G["ReiseMarker1"..pname] and mDim then
			setElementDimension (_G["ReiseMarker1"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip1"..pname], matchDim-1)
			setElementDimension (_G["ReiseMarker2"..pname], matchDim)
			setElementDimension (_G["ReiseBlip2"..pname], matchDim)
			outputChatBox ("[INFO]: Hier sehen Sie den Mount Chilliad.", hitElement, 250, 250, 0)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 10000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 250)
			givePlayerMoney (hitElement, 250)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["ReiseMarker2"..pname] and mDim then
			setElementDimension (_G["ReiseMarker2"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip2"..pname], matchDim-1)
			setElementDimension (_G["ReiseMarker3"..pname], matchDim)
			setElementDimension (_G["ReiseBlip3"..pname], matchDim)
			outputChatBox ("[INFO]: Hier sehen Sie ein berühmtes Motel.", hitElement, 250, 250, 0)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 10000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 250)
			givePlayerMoney (hitElement, 250)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["ReiseMarker3"..pname] and mDim then
			setElementDimension (_G["ReiseMarker3"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip3"..pname], matchDim-1)
			setElementDimension (_G["ReiseMarker4"..pname], matchDim)
			setElementDimension (_G["ReiseBlip4"..pname], matchDim)
			outputChatBox ("[INFO]: Hier sehen Sie das Los Santos Police Departement.", hitElement, 250, 250, 0)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 10000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 250)
			givePlayerMoney (hitElement, 250)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["ReiseMarker4"..pname] and mDim then
			setElementDimension (_G["ReiseMarker4"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip4"..pname], matchDim-1)
			setElementDimension (_G["ReiseMarker5"..pname], matchDim)
			setElementDimension (_G["ReiseBlip5"..pname], matchDim)
			outputChatBox ("[INFO]: Hier sehen Sie das Los Santos Stadion.", hitElement, 250, 250, 0)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 10000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 250)
			givePlayerMoney (hitElement, 250)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["ReiseMarker5"..pname] and mDim then
			setElementDimension (_G["ReiseMarker5"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip5"..pname], matchDim-1)
			setElementDimension (_G["ReiseMarker6"..pname], matchDim)
			setElementDimension (_G["ReiseBlip6"..pname], matchDim)
			outputChatBox ("[INFO]: Hier befinden wir uns in Palomino Creek.", hitElement, 250, 250, 0)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 10000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 250)
			givePlayerMoney (hitElement, 250)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["ReiseMarker6"..pname] and mDim then
			setElementDimension (_G["ReiseMarker6"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip6"..pname], matchDim-1)
			setElementDimension (_G["ReiseMarker7"..pname], matchDim)
			setElementDimension (_G["ReiseBlip7"..pname], matchDim)
			outputChatBox ("[INFO]: Hier sehen Sie das Schloss 'Come-A-Lot'.", hitElement, 250, 250, 0)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 10000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 250)
			givePlayerMoney (hitElement, 250)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["ReiseMarker7"..pname] and mDim then
			setElementDimension (_G["ReiseMarker7"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip7"..pname], matchDim-1)
			setElementDimension (_G["ReiseMarker8"..pname], matchDim)
			setElementDimension (_G["ReiseBlip8"..pname], matchDim)
			outputChatBox ("[INFO]: Hier sehen Sie die grösste Baustelle von Los Angeles.", hitElement, 250, 250, 0)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 10000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 250)
			givePlayerMoney (hitElement, 250)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["ReiseMarker8"..pname] and mDim then
			setElementDimension (_G["ReiseMarker8"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip8"..pname], matchDim-1)
			setElementDimension (_G["ReiseMarker9"..pname], matchDim)
			setElementDimension (_G["ReiseBlip9"..pname], matchDim)
			outputChatBox ("[INFO]: Hier befinden wir uns beim Autokino.", hitElement, 250, 250, 0)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 10000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 250)
			givePlayerMoney (hitElement, 250)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["ReiseMarker9"..pname] and mDim then
			setElementDimension (_G["ReiseMarker9"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip9"..pname], matchDim-1)
			setElementDimension (_G["ReiseMarker10"..pname], matchDim)
			setElementDimension (_G["ReiseBlip10"..pname], matchDim)
			outputChatBox ("[INFO]: Hier befindet sich die grösste Satellitenschüssel von Los Angeles.", hitElement, 250, 250, 0)
			playSoundFrontEnd (hitElement, 43)
			setTimer (frozenplayerbus, 50, 1, hitElement)
			setTimer (unfrozenplayerbus, 10000, 1, hitElement)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 250)
			givePlayerMoney (hitElement, 250)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
		elseif source == _G["ReiseMarker10"..pname] and mDim then
			setElementDimension (_G["ReiseMarker10"..pname], matchDim-1)
			setElementDimension (_G["ReiseBlip10"..pname], matchDim-1)
			outputChatBox ("[INFO]: Hier sehen Sie die Statue von Vojvoda Vik.", hitElement, 250, 250, 0)
			outputChatBox ("Glückwunsch, du hast es geschafft! Du kriegst 2500$ Bonus!", hitElement, 0, 125, 0)
			laSetElementData (hitElement, "money", laGetElementData (hitElement, "money") + 2500)
			givePlayerMoney (hitElement, 2500)
			playSoundFrontEnd (hitElement, 40)
			removePedFromVehicle (hitElement)   
			setTimer (spawnAtBusbase, 1000, 1, hitElement)
			triggerClientEvent (hitElement, "HudEinblendenMoney", getRootElement())
			local busjobpoints = tonumber(laGetElementData(hitElement, "buslevel"))
			local newbuspoints = busjobpoints+1
			laSetElementData(hitElement, "buslevel", newbuspoints)
			MySQL_SetString ("jobdata", "Bus", newbuspoints, "Name LIKE '"..pname.."'")
			outputChatBox ("[INFO]: Dein Busjob-Level ist jetzt auf "..newbuspoints..".", hitElement, 200, 200, 0)
		end
	end
end
-- there can just be used getRootElement() which is equal to all objects or player that hits this marker, cause in this dimension there is only one player
addEventHandler("onMarkerHit", getRootElement(), BusMarkerHit)

function frozenplayerbus (player)
	local veh = getPedOccupiedVehicle (player)
	setElementFrozen (veh, true)
end

function unfrozenplayerbus (player)
	local veh = getPedOccupiedVehicle (player)
	setElementFrozen (veh, false)
end