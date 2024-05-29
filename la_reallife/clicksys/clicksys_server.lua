koksped = createPed(1, -1088.948, -1613.681, 76.367)
setElementInterior (koksped, 0)
setElementDimension ( koksped, 0)
setPedRotation(koksped, 180)
setElementData ( koksped, "undeadbarped", true )
setElementFrozen (koksped, true)

guiObjectModels = { [2942]=true, [2190]=true, [2754]=true }
secondClickTypes = { ["ped"] = true, ["player"] = true, ["vehicle"] = true }
clickSpecialPeds = { [fahrschuleped]=true, [sfpdped]=true, [koksped]=true }

function player_click ( button, state, clickedElement, x, y, z )

	if state == "down" and not getElementData ( source, "ElementClicked" ) then

		-- Keypads
		if fourDragonGateSwitches[clickedElement] then
			moveYakuzaCasinoGate_func ( source )
			return nil
		elseif CamorraCasinoKeypads[clickedElement] then
			moveCasinoDoor ( source )
			return true
		end

		local x1, y1, z1 = getElementPosition ( source )
		local veh = getPedOccupiedVehicle ( source )

		if veh then
			if getElementData ( veh, "katjuscha" ) then
				fireKatjuscha ( getElementData ( veh, "katjuschaID" ), x, y, z )
				showcurser ( source )
				return nil
			end
		end

		-- Spezial --
		if not clickedElement then
			if laGetElementData ( source, "objectToPlace" ) or laGetElementData ( source, "airstrike" ) or laGetElementData ( source, "wanzen" ) then
				if laGetElementData ( source, "wanzen" ) then
					createWanze ( source, clickedElement, x, y, z )
				elseif laGetElementData ( source, "airstrike" ) then
					laSetElementData ( source, "airstrike", false )
					createAirstrike ( source, x, y, z )
					showCursor ( source, false )
					setElementData ( source, "ElementClicked", false )
				end
				return true
			end
		end

		-- Special Elements - Objekte --
		if clickedElement and not secondClickTypes[getElementType(clickedElement)] then
			local x2, y2, z2 = getElementPosition ( clickedElement )
			if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 10 then
				local model = getElementModel ( clickedElement )
				local count = getElementData ( clickedElement, "count" )
				if guiObjectModels[model] then
					if model == 2942 then
						triggerClientEvent ( source, "showCashPoint", getRootElement() )
						setElementData ( source, "ElementClicked", true )
					elseif model == 2190 then
						if isOnDuty ( source ) then
							triggerClientEvent ( source, "ShowPoliceComputerGui", getRootElement() )
							setElementData ( source, "ElementClicked", true )
						end
					elseif model == 2754 then
						triggerClientEvent ( source, "showChipBuy", source )
					end
				elseif laGetElementData ( clickedElement, "placeableObject" ) then
					if laGetElementData ( source, "adminlvl" ) then
						if not laGetElementData ( source, "objectDelete" ) then
							outputChatBox ( "Du kannst dieses Objekt löschen; Klicke es dazu erneut an!", source, 0, 125, 0 )
							laSetElementData ( source, "objectDelete", true )
							setTimer ( laSetElementData, 60000, 1, source, "objectDelete", nil )
						else
							destroyElement ( clickedElement )
						end
					end
				elseif count then
					local x1, y1, z1 = getElementPosition ( source )
					local x2, y2, z2 = getElementPosition ( clickedElement )
					if getDistanceBetweenPoints3D ( x1, y1, z1, x2, y2, z2 ) <= 3 then
						local x3, y3, z3 = getElementPosition ( _G["weedPlant"..count] )
						destroyElement ( _G["weedPlant"..count] )
						destroyElement ( _G["weedBox1"..count] )
						destroyElement ( _G["weedBox2"..count] )
						
						local gTime = getRealTime()
						
						if _G["weedHour"..count] > tonumber ( gTime.hour ) then
							htime = 24 - _G["weedHour"..count] + gTime.hour
						elseif _G["weedHour"..count] == tonumber ( gTime.hour ) then
							if _G["weedMin"..count] > tonumber ( gTime.minute ) then
								htime = 24 - _G["weedHour"..count] + gTime.hour
							else
								htime = gTime.hour - _G["weedHour"..count]
							end
						else
							htime = gTime.hour - _G["weedHour"..count]
						end
						
						local weed = math.floor ( htime * 2 ) + 1
						if _G["weedArt"..count] == "big" then
							local zufall = math.random (10, 40)
							local zufallgenau = zufall/10
							if weed > 50 then
								weed = 50
							end
							weed = math.round((weed * zufallgenau))
						else
							weed = weed
							if weed > 50 then
								weed = 50
							end
						end
						
						weedDelMySQL ( _G["weedPlantX"..count], _G["weedPlantY"..count], _G["weedPlantZ"..count], _G["weedHour"..count], _G["weedMin"..count] )
						
						outputChatBox ( "Du hast "..weed.." Gramm Weed geerntet!", source, 0, 125, 0 )
						laSetElementData ( source, "weed", laGetElementData ( source, "weed" ) + weed )
						
						--[[local gTime = getRealTime()
						--MySQL_DelRow ( "weed", "X LIKE '"..x.."' AND Y LIKE '"..y.."' AND Z LIKE '"..z.."'")
						local weedHour = MySQL_GetString("weed", "Hour", "X LIKE '"..x.."' AND Y LIKE '"..y.."' AND Z LIKE '"..z.."'")
						local weedMinute = MySQL_GetString("weed", "Min", "X LIKE '"..x.."' AND Y LIKE '"..y.."' AND Z LIKE '"..z.."'")
						if tonumber ( weedHour ) > tonumber ( gTime.hour ) then
							htime = 24 - tonumber ( weedHour ) + tonumber ( gTime.hour )
						elseif tonumber ( weedHour ) == tonumber ( gTime.hour ) then
							if tonumber ( weedMinute ) > tonumber ( gTime.minute ) then
								htime = 24 - tonumber ( weedHour ) + tonumber ( gTime.hour )
							else
								htime = tonumber ( gTime.hour ) - tonumber ( weedHour )
							end
						else
							htime = tonumber ( gTime.hour ) - tonumber ( weedHour )
						end
						
						local weed = math.floor ( htime * 2 ) + 1
						
						if weed > 50 then
							weed = 50
						end
						
						weedDelMySQL ( _G["weedPlantX"..count], _G["weedPlantY"..count], _G["weedPlantZ"..count], weedHour, weedMinute )
						
						outputChatBox ( "Du hast "..weed.." Gramm Weed geerntet!", source, 0, 125, 0 )
						laSetElementData ( source, "weed", laGetElementData ( source, "weed" ) + weed )]]
					end
				elseif gunBoxes[clickedElement] then
					triggerClientEvent ( source,"gunCrateMenue", getRootElement() )
					setElementData ( source, "ElementClicked", true )
				elseif depots[clickedElement] then
					if isInDepotFaction ( source ) then
							setElementData ( source, "ElementClicked", true )
							local fraktion = fraktionNames[tonumber(laGetElementData ( source, "fraktion" ))]
							Money = tonumber ( MySQL_GetString("fraktionen", "DepotGeld", "Name LIKE '"..fraktion.."'") )
							Weed = tonumber ( MySQL_GetString("fraktionen", "DepotDrogen", "Name LIKE '"..fraktion.."'") )
							Mats = tonumber ( MySQL_GetString("fraktionen", "DepotMaterials", "Name LIKE '"..fraktion.."'") )
							Koks = tonumber ( MySQL_GetString("fraktionen", "DepotKokain", "Name LIKE '"..fraktion.."'") )
							triggerClientEvent ( source, "showFDepot", getRootElement(), Money, Mats, Weed, Koks )
					else
						outputChatBox ( "Du bist in einer ungültigen Fraktion!", source, 125, 0, 0 )
					end
				end
				return true
			end
		end
		
		-- Special Elements - Player --
		if clickedElement then
			if secondClickTypes[getElementType(clickedElement)] then
				if getElementModel ( clickedElement ) == 280 and not getElementType ( clickedElement ) == "player" then
					if not laGetElementData ( source, "ticketOffered" ) then
						laSetElementData ( source, "ticketOffered", true )
						outputChatBox ( "Hier kannst du ein Strafzettel lösen, um ein Wanted zu löschen.", source, 200, 200, 0 )
						outputChatBox ( "Kosten: 2.000$", source, 200, 200, 0 )
						setTimer ( laSetElementData, 30000, 1, source, "ticketOffered", false )
					else
						if laGetElementData ( source, "wanteds" ) == 1 then
							if laGetElementData ( source, "money" ) >= 2000 then
								laSetElementData ( source, "ticketOffered", false )
								outputChatBox ( "Strafzettel bezahlt!", source, 0, 125, 0 )
								setPlayerWantedLevel ( source, 0 )
								laSetElementData ( source, "wanteds", 0 )
								takePlayerSaveMoney ( source, 2000 )
							else
								outputChatBox ( "Ein Strafzettel kostet 2.000$", source, 125, 0, 0 )
							end
						else
							outputChatBox ( "Nur möglich, wenn du ein Wanted hast!", source, 125, 0, 0 )
						end
					end
				elseif clickedElement == source then
					--if getElementData ( source "ElementClicked") == false then
						triggerClientEvent ( source, "ShowSelfClickMenue", getRootElement() )
						showCursor ( source, true )
						setElementData ( source, "ElementClicked", true )
					--end
				elseif clickSpecialPeds[clickedElement] then
					if clickedElement == fahrschuleped then
						triggerClientEvent ( source, "ShowRathausMenue", getRootElement() )
						showCursor ( source, true )
						setElementData ( source, "ElementClicked", true )
					elseif clickedElement == sfpdped then
						if not laGetElementData ( source, "ticketOffered" ) then
							laSetElementData ( source, "ticketOffered", true )
							outputChatBox ( "Hier kannst du ein Strafzettel lösen, um ein Wanted zu löschen.", source, 200, 200, 0 )
							outputChatBox ( "Kosten: 2.000$", source, 200, 200, 0 )
							setTimer ( laSetElementData, 30000, 1, source, "ticketOffered", false )
						else
							if laGetElementData ( source, "wanteds" ) == 1 then
								if laGetElementData ( source, "money" ) >= 2000 then
									laSetElementData ( source, "ticketOffered", false )
									outputChatBox ( "Strafzettel bezahlt!", source, 0, 125, 0 )
									setPlayerWantedLevel ( source, 0 )
									laSetElementData ( source, "wanteds", 0 )
									takePlayerSaveMoney ( source, 2000 )
								else
									outputChatBox ( "Ein Strafzettel kostet 2.000$", source, 125, 0, 0 )
								end
							else
								outputChatBox ( "Nur möglich, wenn du ein Wanted hast!", source, 125, 0, 0 )
							end
						end
					elseif clickedElement == koksped then
						outputChatBox ( "Verwende /koksverkauf [Anzahl] um dein Kokain zu verkaufen.", source, 200, 200, 0 )
						outputChatBox ( "Du kriegst 100$/g, ich nehme höchstens 100g in einer Stunde an.", source, 200, 200, 0 )
					
					--[[elseif clickedElement == vincenzo then
						triggerClientEvent ( source, "showCamorraGunshop", getRootElement() )
						showCursor ( source, true )
						setElementData ( source, "ElementClicked", true )]]
					end
				elseif getElementType ( clickedElement ) == "vehicle" then
					local veh = clickedElement
					if getVehicleTrunkState ( veh ) then
						local data = MySQL_GetString( "vehicles", "Kofferraum", "Besitzer LIKE '"..laGetElementData ( veh, "owner" ).."' AND Slot LIKE '"..laGetElementData ( veh, "carslotnr_owner" ).."'" )
						local weed = tonumber ( gettok ( data, 1, string.byte ( '|' ) ) )
						local mats = tonumber ( gettok ( data, 2, string.byte ( '|' ) ) )
						local gun = tonumber ( gettok ( data, 3, string.byte ( '|' ) ) )
						local ammo = tonumber ( gettok ( data, 4, string.byte ( '|' ) ) )
						local koks = tonumber ( MySQL_GetString( "vehicles", "Kokain", "Besitzer LIKE '"..laGetElementData ( veh, "owner" ).."' AND Slot LIKE '"..laGetElementData ( veh, "carslotnr_owner" ).."'" ) )
						triggerClientEvent ( source, "showTrunkGui", getRootElement(), weed, mats, koks, gun, ammo )
						laSetElementData ( source, "clickedVehicle", clickedElement )
						showCursor ( source, true )
						setElementData ( source, "ElementClicked", true )
					else
						triggerClientEvent ( source, "_createCarmenue", getRootElement(), clickedElement )
						setElementData ( source, "clickedVehicle", clickedElement )
						showCursor ( source, true )
						setElementData ( source, "ElementClicked", true )
					end
				elseif getElementData ( clickedElement, "clickPed" ) then
					local typ = laGetElementData ( clickedElement, "typ" )
					local item, price
					if typ == "bum" then
						item = "100 $?!"
						price = "Burger"
					elseif typ == "gunbuyer" then
						if laGetElementData ( clickedElement, "item" ) == 4 then
							price = "Messer"
						elseif laGetElementData ( clickedElement, "item" ) == 22 then
							price = "9mm Pistole"
						else
							price = "AK-47"
						end
						item = tostring ( laGetElementData ( clickedElement, "price" ) ).." $"
					else
						price = tostring ( laGetElementData ( clickedElement, "price" ) ).." $"
					end
					if typ == "wdealer" then
						item = aiGunNames[laGetElementData ( clickedElement, "item" )]
					elseif typ == "dealer" then
						item = tostring ( laGetElementData ( clickedElement, "item" ) ).." g, \nDrogen"
					elseif typ == "sdealer" then
						item = tostring ( laGetElementData ( clickedElement, "item" ) ).." Stk.,\nHanfsamen"
					elseif typ == "car" then
						local i = laGetElementData ( clickedElement, "id" )
						local car = curAiCarSpots[i]["car"]
						item = laGetElementData ( car, "name" )
						price = laGetElementData ( car, "price" )
					end
					laSetElementData ( source, "curclicked", clickedElement )
					setElementData ( source, "ElementClicked", true )
					triggerClientEvent ( source, "showPedInteraction", getRootElement(), typ, item, price )
				elseif getElementType ( clickedElement ) == "player" then
					if laGetElementData ( clickedElement, "tazered" ) and isOnStateDuty ( source ) then
						grab_func ( source, "grab", getPlayerName ( clickedElement ) )
					else
						local pname = getPlayerName ( clickedElement )
						laSetElementData ( source, "curclicked", pname )
						setElementData ( source, "ElementClicked", true )
							if getTeamName(getPlayerTeam(clickedElement)) == "Terror" then
								triggerClientEvent ( source,"ShowInteraktionsguiGuiTerror", getRootElement() )
							else
								triggerClientEvent ( source,"ShowInteraktionsguiGui", getRootElement() )
							end
					end
				end
			end
		end
	end
end
addEventHandler ( "onPlayerClick", getRootElement (), player_click )

function removeRemoteExplosive ( clickedElement )

	destroyElement ( clickedElement )
	setElementFrozen ( source, false )
end

function cancel_gui_server_func ( player )

	if player then source = player end
	setElementData ( source, "ElementClicked", false )
	if not laGetElementData ( source, "tazered" ) then
		if not getElementData ( source, "tiedsecur" ) then
			toggleAllControls ( source, true )
		end
	end
	if getElementData(source,"nodmzone") == 1 then toggleControl ( source, "fire", false ) end
	--if getElementData(source,"nodmzone") == 1 then toggleControl ( source, "enter_exit", false ) end
	if getElementData(source,"sprint") == 1 then toggleControl ( source, "sprint", false ) end
	if laGetElementData ( source, "jailtime" ) > 0 then
		toggleControl ( source, "fire", false )
		toggleControl ( source, "jump", false )
	end
	if laGetElementData ( source, "inKampfsport" ) then
		toggleControl ( source, "jump", false )
	end
end
addEvent ("cancel_gui_server", true )
addEventHandler ( "cancel_gui_server", getRootElement (), cancel_gui_server_func )

function showcurser ( player )

	if tonumber(getElementData ( player, "loggedin" )) == 1 and not getElementData ( player, "isInRace" ) then
		if isCursorShowing ( player ) then
			if not getElementData ( player, "ElementClicked" ) then
				showCursor ( player, false )
			end
		else
			showCursor ( player, true )
			setElementData ( player, "ElementClicked", false )
		end
	end
end
addCommandHandler ( "click", showcurser )

function showhmenue ( player )

	if tonumber(getElementData ( player, "loggedin" )) == 1 then
		if getElementData ( player, "ElementClicked" ) == false then
			setElementData ( player, "ElementClicked", true )
			triggerClientEvent ( player, "ShowHelpmenueGui", getRootElement() )
			showCursor ( player, true )
		end
	end
end

function self_func ( player )

	triggerClientEvent ( player, "ShowSelfClickMenue", getRootElement() )
	showCursor ( player, true )
	setElementData ( player, "ElementClicked", true )
end
addCommandHandler ( "self", self_func )

function findRotation(x1,y1,x2,y2)
 
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	if t < 0 then t = t + 360 end
	return t
end