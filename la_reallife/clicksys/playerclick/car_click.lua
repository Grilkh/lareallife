function SubmitFahrzeugAbbrechenBtn(button)
	if button == "left" then
		guiSetVisible ( gWindows["vehinteraktion"], false )
		if gWindow["vehCarDelete"] then
			guiSetVisible ( gWindow["vehCarDelete"], false )
		end
		guiSetInputEnabled ( true )
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	end
end

function _createCarmenue_func( veh )
	guiSetInputEnabled ( false )
	if gWindows["vehinteraktion"] then
		guiSetVisible ( gWindows["vehinteraktion"], true )
		if gWindow["vehCarDelete"] then
			guiSetVisible ( gWindow["vehCarDelete"], true )
		end
	else
		if getElementData ( lp, "adminlvl" ) >= 1 then
			gWindow["vehCarDelete"] = guiCreateWindow(screenwidth/2+224/2,screenheight/2-132/2,151,137,"Admin",false)
			guiSetAlpha(gWindow["vehCarDelete"],1)
			gButton["vehCarDel"] = guiCreateButton(0.0596,0.1898,0.3974,0.2555,"Löschen",true,gWindow["vehCarDelete"])
			guiSetAlpha(gButton["vehCarDel"],1)
			gButton["vehCarResp"] = guiCreateButton(0.4901,0.1898,0.457,0.2555,"Respawnen",true,gWindow["vehCarDelete"])
			guiSetAlpha(gButton["vehCarResp"],1)
			gLabel["vehCarInfo1"] = guiCreateLabel(0.0596,0.4891,0.3113,0.1387,"Grund:",true,gWindow["vehCarDelete"])
			guiSetAlpha(gLabel["vehCarInfo1"],1)
			guiLabelSetColor(gLabel["vehCarInfo1"],255,255,255)
			guiLabelSetVerticalAlign(gLabel["vehCarInfo1"],"top")
			guiLabelSetHorizontalAlign(gLabel["vehCarInfo1"],"left",false)
			guiSetFont(gLabel["vehCarInfo1"],"default-bold-small")
			gMemo["vehCarReason"] = guiCreateMemo(0.0596,0.6058,0.8808,0.3358,"",true,gWindow["vehCarDelete"])
			guiSetAlpha(gMemo["vehCarReason"],1)
			
			addEventHandler("onClientGUIClick", gButton["vehCarResp"], 
				function()
					local veh = getElementData ( lp, "clickedVehicle" )
					local towcar = getElementData ( veh, "carslotnr_owner" )
					local pname = getElementData ( veh, "owner" )
					triggerServerEvent ( "respawnVeh", lp, towcar, pname, veh )
				end
			)
			addEventHandler("onClientGUIClick", gButton["vehCarDel"], 
				function()
					local veh = getElementData ( lp, "clickedVehicle" )
					local towcar = getElementData ( veh, "carslotnr_owner" )
					local pname = getElementData ( veh, "owner" )
					if not pname then
						outputChatBox ( "Dieses Fahrzeug gehört keinem Spieler!", 125, 0, 0 )
					else
						triggerServerEvent ( "deleteVeh", lp, towcar, pname, veh, guiGetText ( gMemo["vehCarReason"] ) )
					end
				end,
			false)
		end
		gWindows["vehinteraktion"] = guiCreateWindow(screenwidth/2-224/2,screenheight/2-132/2,224,132,"Fahrzeugoptionen",false)
		guiSetAlpha(gWindows["vehinteraktion"],1)
		
		gButtons["vehabschliessen"] = guiCreateButton(0.0402,0.1818,0.442,0.3485,"Abschliessen",true,gWindows["vehinteraktion"])
		guiSetAlpha(gButtons["vehabschliessen"],1)
		gButtons["vehrespawn"] = guiCreateButton(0.52,0.1818,0.442,0.3485,"Respawnen",true,gWindows["vehinteraktion"])
		guiSetAlpha(gButtons["vehrespawn"],1)
		gButtons["vehinfo"] = guiCreateButton(0.0402,0.59,0.442,0.3485,"Infos",true,gWindows["vehinteraktion"])
		guiSetAlpha(gButtons["vehinfo"],1)
		gButtons["vehcancel"] = guiCreateButton(0.52,0.59,0.442,0.3485,"Abbrechen",true,gWindows["vehinteraktion"])
		guiSetAlpha(gButtons["vehcancel"],1)

		addEventHandler("onClientGUIClick", gButtons["vehcancel"], SubmitFahrzeugAbbrechenBtn, false)
		
		addEventHandler("onClientGUIClick", gButtons["vehrespawn"], 
			function ()
				local veh = getElementData ( lp, "clickedVehicle" )
				if veh then
					if getElementData ( veh, "owner" ) == getPlayerName ( lp ) then
						triggerServerEvent ( "respawnPrivVehClick", lp, lp, "lock", tonumber ( getElementData ( veh, "carslotnr_owner" ) ) )
					else
						outputChatBox ( "Das Fahrzeug gehört dir nicht!", 125, 0, 0 )
					end
				end
			end
		)
		addEventHandler("onClientGUIClick", gButtons["vehabschliessen"], 
			function ()
				local veh = getElementData ( lp, "clickedVehicle" )
				if veh then
					if getElementData ( veh, "owner" ) == getPlayerName ( lp ) then
						triggerServerEvent ( "lockPrivVehClick", lp, lp, "lock", tonumber ( getElementData ( veh, "carslotnr_owner" ) ) )
					else
						outputChatBox ( "Das Fahrzeug gehört dir nicht!", 125, 0, 0 )
					end
				end
			end
		)
		addEventHandler("onClientGUIClick", gButtons["vehinfo"], 
			function ()
				local veh = getElementData ( lp, "clickedVehicle" )
				if veh then
					local owner = getElementData ( veh, "owner" )
					if not owner or owner == "console" then
						owner = "Niemand"
					end
					local stringw = false
					
					for i = 1, specialUpgrades do
					
						local fix = getElementData ( veh, "stuning"..i )
						
						if fix then 
						
							if not stringw then
								stringw = specialUpgrade[i]
							else
								stringw = stringw..", "..specialUpgrade[i]
							end

						end
							
					end
					
					if not stringw then
						stringw = "Keine"
					end
					
					local totalschaeden = laGetElementData ( veh, "totalschaeden" )
					outputChatBox ( "Fahrzeugname: "..getVehicleName (veh)..", Besitzer: "..owner, 200, 200, 0 )
					outputChatBox ( "Tunings: #969600"..stringw, 255, 255, 0, true )
					outputChatBox ( "Totalschäden: #969600"..totalschaeden, 255, 255, 0, true )
				end
			end
		)

		guiWindowSetSizable(gWindows["vehinteraktion"],false)
		guiWindowSetMovable(gWindows["vehinteraktion"],false)

		guiWindowSetSizable(gWindows["adminvehinteraktion"],false)
		guiWindowSetMovable(gWindows["adminvehinteraktion"],false)
	end
end
addEvent ( "_createCarmenue", true )
addEventHandler ( "_createCarmenue", getRootElement(), _createCarmenue_func )