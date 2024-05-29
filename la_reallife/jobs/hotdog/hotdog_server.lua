createObject ( 2803, -1706.0394287109, -3.3259353637695, 3.2056336402893, 0, 0, 0 )
createObject ( 2147, -1702.8179931641, -2.3179664611816, 2.5546875, 0, 0, 225 )
createObject ( 2361, -1708.1881103516, -2.3582229614258, 2.5489177703857, 0, 0, 0 )
createObject ( 2452, -1704.5050048828, -4.1225433349609, 2.5546875, 0, 0, 225 )
createObject ( 2805, -1703.6081542969, -3.4309387207031, 3.27188539505, 0, 0, 0 )
createObject ( 2806, -1704.7397460938, -2.1383819580078, 2.7745137214661, 0, 0, 0 )
createObject ( 2806, -1705.4504394531, -1.8996651172638, 2.7745137214661, 0, 0, 322.28500366211 )
createObject ( 2806, -1704.9680175781, -2.1088492870331, 2.8081126213074, 10.25, 0, 322.28393554688 )

local hotdogBuyMarker = createMarker ( -1706.3059082031, 1.1159700155258, 2.3025176525116, "cylinder", 5, 255, 0, 0, 150 )

local function hotdogBuyMarkerHit ( hit, dim )
	if getElementType(hit) == "player" and (dim) then
		local veh = getPedOccupiedVehicle ( hit )
		if veh then
			if getPedOccupiedVehicleSeat ( hit ) == 0 and hotdogwagen[veh] then
				triggerClientEvent ( hit, "showHotdogLoadMenue", getRootElement() )
				laSetElementData ( hit, "ElementClicked", true )
			end
		end
	end
end
addEventHandler ( "onMarkerHit", hotdogBuyMarker, hotdogBuyMarkerHit )

--[[
	Gammelmarker:
	Hotdogverkauf an Spieler ( CMD+Click )
]]
hotdog1 = createVehicle ( 588, -1693.4169921875, 13.642078399658, 3.5546875, 0, 0, 0 )
setVehicleRespawnPosition ( hotdog1, getElementPosition ( hotdog1 ) )
toggleVehicleRespawn ( hotdog1, true )
setVehicleRespawnDelay ( hotdog1, 1000*10 )
setVehicleIdleRespawnDelay ( hotdog1, 1000*60 )

hotdog2 = createVehicle ( 588, -1696.8371582031, 11.822975158691, 3.5546875, 0, 0, 0 )
setVehicleRespawnPosition ( hotdog2, getElementPosition ( hotdog2 ) )
toggleVehicleRespawn ( hotdog2, true )
setVehicleRespawnDelay ( hotdog2, 1000*10 )
setVehicleIdleRespawnDelay ( hotdog2, 1000*60 )

hotdog3 = createVehicle ( 588, -1720.7375488281, 13.455543518066, 3.3380651473999, 0, 0, 0 )
setVehicleRespawnPosition ( hotdog3, getElementPosition ( hotdog3 ) )
toggleVehicleRespawn ( hotdog3, true )
setVehicleRespawnDelay ( hotdog3, 1000*10 )
setVehicleIdleRespawnDelay ( hotdog3, 1000*60 )

hotdog4 = createVehicle ( 588, -1717.3237304688, 16.04842376709, 3.5942802429199, 0, 0, 0 )
setVehicleRespawnPosition ( hotdog4, getElementPosition ( hotdog4 ) )
toggleVehicleRespawn ( hotdog4, true )
setVehicleRespawnDelay ( hotdog4, 1000*10 )
setVehicleIdleRespawnDelay ( hotdog4, 1000*60 )

hotdog5 = createVehicle ( 588, -1713.7370605469, 18.94469833374, 3.5942802429199, 0, 0, 0 )
setVehicleRespawnPosition ( hotdog5, getElementPosition ( hotdog5 ) )
toggleVehicleRespawn ( hotdog5, true )
setVehicleRespawnDelay ( hotdog5, 1000*10 )
setVehicleIdleRespawnDelay ( hotdog5, 1000*60 )

hotdog6 = createVehicle ( 588, -1710.6572265625, 21.605842590332, 3.5942802429199, 0, 0, 0 )
setVehicleRespawnPosition ( hotdog6, getElementPosition ( hotdog6 ) )
toggleVehicleRespawn ( hotdog6, true )
setVehicleRespawnDelay ( hotdog6, 1000*10 )
setVehicleIdleRespawnDelay ( hotdog6, 1000*60 )

laSetElementData ( hotdog1, "hotdogs", 0 )
laSetElementData ( hotdog2, "hotdogs", 0 )
laSetElementData ( hotdog3, "hotdogs", 0 )
laSetElementData ( hotdog4, "hotdogs", 0 )
laSetElementData ( hotdog5, "hotdogs", 0 )
laSetElementData ( hotdog6, "hotdogs", 0 )

hotdogwagen = { [hotdog1]=true, [hotdog2]=true, [hotdog3]=true, [hotdog4]=true, [hotdog5]=true, [hotdog6]=true }

function hotdogEnter ( veh, seat )

	if hotdogwagen[veh] then
		if laGetElementData ( source, "job" ) ~= "hotdog" and seat == 0 then
			opticExitVehicle ( source )
			triggerClientEvent ( source, "infobox_start", getRootElement(), "\n\nDu bist kein Hotdogverkäufer!", 7500, 125, 0, 0 )
		else
			outputChatBox ( "Hotdogs im Wagen: "..laGetElementData ( veh, "hotdogs" ), source, 200, 200, 125 )
		end
	end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), hotdogEnter )

function sellhotdog_func ( player, cmd, amount, target )

	if player == client then
		if target then
			target = getPlayerFromName ( target )
		else
			target = getPlayerFromName ( laGetElementData ( player, "curclicked" ) )
		end
		local amount = math.abs ( math.floor ( tonumber ( amount ) ) )
		if amount and isElement ( target ) then
			local hotdoglevel = laGetElementData (player, "hotdoglevel")
			if hotdoglevel >= 20 then
				if amount > math.abs ( math.floor (hotdoglevel/5)) then
					outputChatBox ( getPlayerName ( player ).." hat dir einen Hotdog für "..amount.."$ angeboten! Verwende /accepthotdog, um anzunehmen!", target, 125, 125, 200 )
					laSetElementData ( target, "hotdogSeller", getPlayerName ( player ) )
					laSetElementData ( target, "hotdogPrice", amount )
					outputChatBox ( "Du hast "..getPlayerName ( target ).." einen Hotdog für "..amount.."$ angeboten!", player, 200, 200, 0 )
				else
					outputChatBox ( "Du kannst mit deinem Level höchstens "..math.abs ( math.floor (hotdoglevel/5)).."$ verlangen. ", player, 150, 0, 0 )
				end
			elseif hotdoglevel < 20 then
				if hotdoglevel < 10 then
					if amount > 2 then
						outputChatBox ( "Du kannst mit deinem Level höchstens 2$ verlangen. ", player, 150, 0, 0 )
					else
						outputChatBox ( getPlayerName ( player ).." hat dir einen Hotdog für "..amount.."$ angeboten! Verwende /accepthotdog, um anzunehmen!", target, 125, 125, 200 )
						laSetElementData ( target, "hotdogSeller", getPlayerName ( player ) )
						laSetElementData ( target, "hotdogPrice", amount )
						outputChatBox ( "Du hast "..getPlayerName ( target ).." einen Hotdog für "..amount.."$ angeboten!", player, 200, 200, 0 )					
					end
				else
					if amount > 3 then
						outputChatBox ( "Du kannst mit deinem Level höchstens 3$ verlangen. ", player, 150, 0, 0 )
					else
						outputChatBox ( getPlayerName ( player ).." hat dir einen Hotdog für "..amount.."$ angeboten! Verwende /accepthotdog, um anzunehmen!", target, 125, 125, 200 )
						laSetElementData ( target, "hotdogSeller", getPlayerName ( player ) )
						laSetElementData ( target, "hotdogPrice", amount )
						outputChatBox ( "Du hast "..getPlayerName ( target ).." einen Hotdog für "..amount.."$ angeboten!", player, 200, 200, 0 )
					end
				end
			end
		else
			outputChatBox ( "Bitte verwende: /sellhotdog [Preis] [Spieler]", player, 125, 0, 0 )
		end
	end
end
addCommandHandler ( "sellhotdog", sellhotdog_func )
addEvent ( "sellhotdog", true )
addEventHandler ( "sellhotdog", getRootElement(), sellhotdog_func )

function accepthotdog_func ( player )
	local pname = getPlayerName(player)
	local seller = getPlayerFromName ( laGetElementData ( player, "hotdogSeller" ) )
	local sellername = getPlayerName(seller)
	local price = laGetElementData ( player, "hotdogPrice" )
	if seller and price then
		local x1, y1, z1 = getElementPosition ( player )
		local x2, y2, z2 = getElementPosition ( seller )
		if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
			local veh = getPedOccupiedVehicle ( seller )
			if hotdogwagen[veh] then
				if laGetElementData ( veh, "hotdogs" ) >= 1 then
					if laGetElementData ( player, "money" ) >= price then
						laSetElementData ( veh, "hotdogs", laGetElementData ( veh, "hotdogs" ) - 1 )
						takePlayerSaveMoney ( player, price )
						givePlayerSaveMoney ( seller, price )
						outputChatBox ( pname.." hat einen deiner Hotdogs gekauft. Du erhältst "..price.."$ und hast noch "..laGetElementData ( veh, "hotdogs" ).." weitere Hotdogs!", seller, 15, 125, 15 )
						outputChatBox ( "Hotdog gekauft!", player, 15, 125, 15 )
						if laGetElementData (seller, "lastHotdogBuy") ~= pname then
							local hotdoglevel = tonumber(laGetElementData(seller, "hotdoglevel"))
							local newlevel = hotdoglevel+1
							laSetElementData(seller, "hotdoglevel", newlevel)
							MySQL_SetString ( "jobdata", "Hotdog", newlevel, "Name LIKE '"..sellername.."'" )	
							outputChatBox ( "Dein Hotdog-Level ist jetzt auf "..newlevel..".", seller, 0, 150, 0 )
							laSetElementData (seller, "lastHotdogBuy", pname)
						else
							outputChatBox ( "Um dein Level zu steigern, musst du auch andere Kunden suchen.", seller, 150, 0, 0 )
						end
						setElementHealth ( player, getElementHealth+5 )
						--triggerClientEvent ( player, "sec_health_give", getRootElement(), 999 )
						triggerClientEvent ( player, "eatSomething", getRootElement(), 25 )
					else
						outputChatBox ( "Das kannst du dir nicht leisten!", player, 125, 0, 0 )
					end
				else
					outputChatBox ( "Der Verkäufer hat keine Hotdogs mehr!", player, 125, 0, 0 )
				end
			else
				outputChatBox ( "Der Verkäufer sitzt nicht im Hotdogwagen!", player, 125, 0, 0 )
			end
		else
			outputChatBox ( "Du bist zu weit weg!", player, 125, 0, 0 )
		end
	else
		outputChatBox ( "Du kannst keinen Hotdog kaufen!", player, 125, 0, 0 )
	end
	laSetElementData ( player, "hotdogSeller", nil )
	laSetElementData ( player, "hotdogPrice", nil )
end
addCommandHandler ( "accepthotdog", accepthotdog_func )

function buyhotdogs_func ( player, amount )

	if player == client then
		local veh = getPedOccupiedVehicle ( player )
		local preis = amount
		if veh then
			local hotdoglevel = laGetElementData (player, "hotdoglevel")
			if hotdoglevel > 20 then
				if amount > hotdoglevel then
					outputChatBox ( "Du kannst mit deinem Level nur "..hotdoglevel.." Hotdogs beladen!", player, 150, 0, 0 )
				else
					if laGetElementData ( player, "money" ) >= preis then
						laSetElementData ( veh, "hotdogs", laGetElementData ( veh, "hotdogs" ) + amount )
						takePlayerSaveMoney ( player, preis )
						outputChatBox ( "Wagen beladen. Du hast nun "..laGetElementData ( veh, "hotdogs" ).." Hotdogs!", player, 10, 125, 10 )
					else
						outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
					end
				end
			else
				if amount > 10 then
					outputChatBox ( "Du kannst mit deinem Level nur 10 Hotdogs beladen!", player, 150, 0, 0 )
					outputChatBox ( "Ab Level 20 kannst du mehr Hotdogs transportieren.", player, 225, 225, 0 )
				else
					if laGetElementData ( player, "money" ) >= preis then
						laSetElementData ( veh, "hotdogs", laGetElementData ( veh, "hotdogs" ) + amount )
						takePlayerSaveMoney ( player, preis )
						outputChatBox ( "Truck beladen. Du hast nun "..laGetElementData ( veh, "hotdogs" ).." Hotdogs!", player, 10, 125, 10 )
					else
						outputChatBox ( "Du hast nicht genug Geld!", player, 125, 0, 0 )
					end
				end
			end
		end
	end
end
addEvent ( "buyhotdogs", true )
addEventHandler ( "buyhotdogs", getRootElement(), buyhotdogs_func )