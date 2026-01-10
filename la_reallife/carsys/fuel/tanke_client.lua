--AirportTanke = createMarker ( -1122.7724609375, -202.25073242188, 10.893966674805, "cylinder", 50, 0, 0, 255, 150 )

helicopters = { [548]=true, [425]=true, [417]=true, [487]=true, [488]=true, [497]=true, [563]=true, [447]=true, [469]=true }
planea = { [512]=true, [593]=true, [476]=true, [460]=true, [513]=true }
planeb = { [592]=true, [577]=true, [511]=true, [520]=true, [553]=true, [519]=true }

function showTankenGui ( player )

if getElementData ( player, "sprache" ) == "Deutsch" then
	if player == getLocalPlayer() then
		local veh = getPedOccupiedVehicle ( getLocalPlayer() )
		local model = getElementModel ( veh )
		if not veh or ( not helicopters[model] and not planeb[model] and not planea[model] ) then
			setElementVelocity ( getPedOccupiedVehicle ( getLocalPlayer() ), 0, 0, 0 )
			showCursor ( true )
			setElementData ( getLocalPlayer(), "ElementClicked", true, true )
			toggleAllControls ( getLocalPlayer(), false )
			if gWindow["tankstelle"] then
				guiSetVisible ( gWindow["tankstelle"], true )
			else
				local screenwidth, screenheight = guiGetScreenSize ()
				
				gWindow["tankstelle"] = guiCreateWindow(screenwidth/2-378/2,screenheight/2-174/2,378,174,"Tankstelle",false)
				guiSetAlpha(gWindow["tankstelle"],1)
				guiWindowSetMovable(gWindow["tankstelle"],false)
				guiWindowSetSizable(gWindow["tankstelle"],false)
				gEdit["literFill"] = guiCreateEdit(0.3545,0.477,0.164,0.1609,"",true,gWindow["tankstelle"])
				guiSetAlpha(gEdit["literFill"],1)
				gLabel["literText"] = guiCreateLabel(0.5317,0.523,0.1005,0.1092,"Liter",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["literText"],1)
				guiLabelSetColor(gLabel["literText"],125,000,000)
				guiLabelSetVerticalAlign(gLabel["literText"],"top")
				guiLabelSetHorizontalAlign(gLabel["literText"],"left",false)
				guiSetFont(gLabel["literText"],"default-bold-small")
				gLabel["snackPrice"] = guiCreateLabel(0.7804,0.5115,0.0582,0.1092,"X $",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["snackPrice"],1)
				guiLabelSetColor(gLabel["snackPrice"],000,125,000)
				guiLabelSetVerticalAlign(gLabel["snackPrice"],"top")
				guiLabelSetHorizontalAlign(gLabel["snackPrice"],"left",false)
				guiSetFont(gLabel["snackPrice"],"default-bold-small")
				gLabel["pricePerLiter"] = guiCreateLabel(0.0767,0.5172,0.2011,0.1092,"X.XX $ / Liter",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["pricePerLiter"],1)
				guiLabelSetColor(gLabel["pricePerLiter"],000,125,000)
				guiLabelSetVerticalAlign(gLabel["pricePerLiter"],"top")
				guiLabelSetHorizontalAlign(gLabel["pricePerLiter"],"left",false)
				guiSetFont(gLabel["pricePerLiter"],"default-bold-small")
				gLabel["kannisterPrice"] = guiCreateLabel(0.3545,0.7069,0.1429,0.1897,"X Liter,\nX $",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["kannisterPrice"],1)
				guiLabelSetColor(gLabel["kannisterPrice"],200,050,020)
				guiLabelSetVerticalAlign(gLabel["kannisterPrice"],"top")
				guiLabelSetHorizontalAlign(gLabel["kannisterPrice"],"left",false)
				guiSetFont(gLabel["kannisterPrice"],"default-bold-small")
				
				gButton["buyKannister"] = guiCreateButton(0.0344,0.6724,0.291,0.2644,"Benzinkanister\nkaufen",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["buyKannister"],1)
				gButton["volltanken"] = guiCreateButton(0.0344,0.1724,0.291,0.2644,"Volltanken",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["volltanken"],1)
				gButton["ltanken"] = guiCreateButton(0.3519,0.1667,0.291,0.2644,"Liter tanken",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["ltanken"],1)
				gButton["snack"] = guiCreateButton(0.6693,0.1667,0.291,0.2644,"Snack kaufen",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["snack"],1)
				gButton["closeTanke"] = guiCreateButton(0.6825,0.6782,0.291,0.2644,"Fenster schliessen",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["closeTanke"],1)
				
				addEventHandler("onClientGUIClick", gButton["closeTanke"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["volltanken"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
						triggerServerEvent ( "fillComplete", getLocalPlayer(), getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["ltanken"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
						triggerServerEvent ( "fillPart", getLocalPlayer(), getLocalPlayer(), guiGetText ( gEdit["literFill"] ) )
					end
				)
				addEventHandler("onClientGUIClick", gButton["snack"],
					function()
						triggerServerEvent ( "buySnack", getLocalPlayer(), getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["buyKannister"],
					function()
						triggerServerEvent ( "buyKannister", getLocalPlayer(), getLocalPlayer() )
					end
				)
			end
			guiSetText ( gLabel["snackPrice"], snackPrice.."$" )
			guiSetText ( gLabel["pricePerLiter"], literPrice.."$ / Liter" )
			guiSetText ( gLabel["kannisterPrice"], "15 Liter,\n"..math.floor(literPrice*15)+kannisterPrice.."$" )
		end
	end
else
	showTankenGui_English( player )
end
end
addEvent( "show_Tanke_GUI", true)
addEventHandler("show_Tanke_GUI", getRootElement(), showTankenGui)

function showAirportTanke ( player )
if getElementData ( player, "sprache" ) == "Deutsch" then
	if player == getLocalPlayer() then
		local veh = getPedOccupiedVehicle ( getLocalPlayer() )
		local model = getElementModel ( veh )
		if not veh or helicopters[model] or ( ( planeb[model] or planea[model] ) and isVehicleOnGround ( veh ) ) then
			setElementVelocity ( getPedOccupiedVehicle ( getLocalPlayer() ), 0, 0, 0 )
			showCursor ( true )
			setElementData ( getLocalPlayer(), "ElementClicked", true, true )
			toggleAllControls ( getLocalPlayer(), false )
			if gWindow["tankstelle"] then
				guiSetVisible ( gWindow["tankstelle"], true )
			else
				local screenwidth, screenheight = guiGetScreenSize ()
				
				gWindow["tankstelle"] = guiCreateWindow(screenwidth/2-378/2,screenheight/2-174/2,378,174,"Tankstelle",false)
				guiSetAlpha(gWindow["tankstelle"],1)
				guiWindowSetMovable(gWindow["tankstelle"],false)
				guiWindowSetSizable(gWindow["tankstelle"],false)
				gEdit["literFill"] = guiCreateEdit(0.3545,0.477,0.164,0.1609,"",true,gWindow["tankstelle"])
				guiSetAlpha(gEdit["literFill"],1)
				gLabel["literText"] = guiCreateLabel(0.5317,0.523,0.1005,0.1092,"Liter",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["literText"],1)
				guiLabelSetColor(gLabel["literText"],125,000,000)
				guiLabelSetVerticalAlign(gLabel["literText"],"top")
				guiLabelSetHorizontalAlign(gLabel["literText"],"left",false)
				guiSetFont(gLabel["literText"],"default-bold-small")
				gLabel["snackPrice"] = guiCreateLabel(0.7804,0.5115,0.0582,0.1092,"X $",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["snackPrice"],1)
				guiLabelSetColor(gLabel["snackPrice"],000,125,000)
				guiLabelSetVerticalAlign(gLabel["snackPrice"],"top")
				guiLabelSetHorizontalAlign(gLabel["snackPrice"],"left",false)
				guiSetFont(gLabel["snackPrice"],"default-bold-small")
				gLabel["pricePerLiter"] = guiCreateLabel(0.0767,0.5172,0.2011,0.1092,"X.XX $ / Liter",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["pricePerLiter"],1)
				guiLabelSetColor(gLabel["pricePerLiter"],000,125,000)
				guiLabelSetVerticalAlign(gLabel["pricePerLiter"],"top")
				guiLabelSetHorizontalAlign(gLabel["pricePerLiter"],"left",false)
				guiSetFont(gLabel["pricePerLiter"],"default-bold-small")
				gLabel["kannisterPrice"] = guiCreateLabel(0.3545,0.7069,0.1429,0.1897,"X Liter,\nX $",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["kannisterPrice"],1)
				guiLabelSetColor(gLabel["kannisterPrice"],200,050,020)
				guiLabelSetVerticalAlign(gLabel["kannisterPrice"],"top")
				guiLabelSetHorizontalAlign(gLabel["kannisterPrice"],"left",false)
				guiSetFont(gLabel["kannisterPrice"],"default-bold-small")
				
				gButton["buyKannister"] = guiCreateButton(0.0344,0.6724,0.291,0.2644,"Benzinkanister\nkaufen",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["buyKannister"],1)
				gButton["volltanken"] = guiCreateButton(0.0344,0.1724,0.291,0.2644,"Volltanken",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["volltanken"],1)
				gButton["ltanken"] = guiCreateButton(0.3519,0.1667,0.291,0.2644,"Liter tanken",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["ltanken"],1)
				gButton["snack"] = guiCreateButton(0.6693,0.1667,0.291,0.2644,"Snack kaufen",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["snack"],1)
				gButton["closeTanke"] = guiCreateButton(0.6825,0.6782,0.291,0.2644,"Fenster schliessen",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["closeTanke"],1)
				
				addEventHandler("onClientGUIClick", gButton["closeTanke"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["volltanken"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
						triggerServerEvent ( "fillComplete", getLocalPlayer(), getLocalPlayer(), true )
					end
				)
				addEventHandler("onClientGUIClick", gButton["ltanken"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
						triggerServerEvent ( "fillPart", getLocalPlayer(), getLocalPlayer(), guiGetText ( gEdit["literFill"] ), true )
					end
				)
				addEventHandler("onClientGUIClick", gButton["snack"],
					function()
						triggerServerEvent ( "buySnack", getLocalPlayer(), getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["buyKannister"],
					function()
						triggerServerEvent ( "buyKannister", getLocalPlayer(), getLocalPlayer() )
					end
				)
			end
			guiSetText ( gLabel["snackPrice"], snackPrice.." $" )
			guiSetText ( gLabel["pricePerLiter"], (literPrice*3).." $ / Liter" )
			guiSetText ( gLabel["kannisterPrice"], "15 Liter,\n"..math.floor(literPrice*15)+kannisterPrice.." $" )
		end
	end
else
	showAirportTanke_English()
end
end
addEvent( "showAirportTanke_GUI", true)
addEventHandler("showAirportTanke_GUI", getRootElement(), showAirportTanke)


function showTankenGui_English ( player )

	if player == getLocalPlayer() then
		local veh = getPedOccupiedVehicle ( getLocalPlayer() )
		local model = getElementModel ( veh )
		if not veh or ( not helicopters[model] and not planeb[model] and not planea[model] ) then
			setElementVelocity ( getPedOccupiedVehicle ( getLocalPlayer() ), 0, 0, 0 )
			showCursor ( true )
			setElementData ( getLocalPlayer(), "ElementClicked", true, true )
			toggleAllControls ( getLocalPlayer(), false )
			if gWindow["tankstelle"] then
				guiSetVisible ( gWindow["tankstelle"], true )
			else
				local screenwidth, screenheight = guiGetScreenSize ()
				
				gWindow["tankstelle"] = guiCreateWindow(screenwidth/2-378/2,screenheight/2-174/2,378,174,"Gas station",false)
				guiSetAlpha(gWindow["tankstelle"],1)
				guiWindowSetMovable(gWindow["tankstelle"],false)
				guiWindowSetSizable(gWindow["tankstelle"],false)
				gEdit["literFill"] = guiCreateEdit(0.3545,0.477,0.164,0.1609,"",true,gWindow["tankstelle"])
				guiSetAlpha(gEdit["literFill"],1)
				gLabel["literText"] = guiCreateLabel(0.5317,0.523,0.1005,0.1092,"Liter",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["literText"],1)
				guiLabelSetColor(gLabel["literText"],125,000,000)
				guiLabelSetVerticalAlign(gLabel["literText"],"top")
				guiLabelSetHorizontalAlign(gLabel["literText"],"left",false)
				guiSetFont(gLabel["literText"],"default-bold-small")
				gLabel["snackPrice"] = guiCreateLabel(0.7804,0.5115,0.0582,0.1092,"X $",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["snackPrice"],1)
				guiLabelSetColor(gLabel["snackPrice"],000,125,000)
				guiLabelSetVerticalAlign(gLabel["snackPrice"],"top")
				guiLabelSetHorizontalAlign(gLabel["snackPrice"],"left",false)
				guiSetFont(gLabel["snackPrice"],"default-bold-small")
				gLabel["pricePerLiter"] = guiCreateLabel(0.0767,0.5172,0.2011,0.1092,"X.XX $ / Liter",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["pricePerLiter"],1)
				guiLabelSetColor(gLabel["pricePerLiter"],000,125,000)
				guiLabelSetVerticalAlign(gLabel["pricePerLiter"],"top")
				guiLabelSetHorizontalAlign(gLabel["pricePerLiter"],"left",false)
				guiSetFont(gLabel["pricePerLiter"],"default-bold-small")
				gLabel["kannisterPrice"] = guiCreateLabel(0.3545,0.7069,0.1429,0.1897,"X Liter,\nX $",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["kannisterPrice"],1)
				guiLabelSetColor(gLabel["kannisterPrice"],200,050,020)
				guiLabelSetVerticalAlign(gLabel["kannisterPrice"],"top")
				guiLabelSetHorizontalAlign(gLabel["kannisterPrice"],"left",false)
				guiSetFont(gLabel["kannisterPrice"],"default-bold-small")
				
				gButton["buyKannister"] = guiCreateButton(0.0344,0.6724,0.291,0.2644,"Buy\nJerrycan",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["buyKannister"],1)
				gButton["volltanken"] = guiCreateButton(0.0344,0.1724,0.291,0.2644,"Filling up",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["volltanken"],1)
				gButton["ltanken"] = guiCreateButton(0.3519,0.1667,0.291,0.2644,"Liter filling",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["ltanken"],1)
				gButton["snack"] = guiCreateButton(0.6693,0.1667,0.291,0.2644,"Buy Snack",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["snack"],1)
				gButton["closeTanke"] = guiCreateButton(0.6825,0.6782,0.291,0.2644,"Cancel",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["closeTanke"],1)
				
				addEventHandler("onClientGUIClick", gButton["closeTanke"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["volltanken"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
						triggerServerEvent ( "fillComplete", getLocalPlayer(), getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["ltanken"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
						triggerServerEvent ( "fillPart", getLocalPlayer(), getLocalPlayer(), guiGetText ( gEdit["literFill"] ) )
					end
				)
				addEventHandler("onClientGUIClick", gButton["snack"],
					function()
						triggerServerEvent ( "buySnack", getLocalPlayer(), getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["buyKannister"],
					function()
						triggerServerEvent ( "buyKannister", getLocalPlayer(), getLocalPlayer() )
					end
				)
			end
			guiSetText ( gLabel["snackPrice"], snackPrice.."$" )
			guiSetText ( gLabel["pricePerLiter"], literPrice.."$ / Liter" )
			guiSetText ( gLabel["kannisterPrice"], "15 Liter,\n"..math.floor(literPrice*15)+kannisterPrice.."$" )
		end
	end
end

function showAirportTanke_English ( player )

	if player == getLocalPlayer() then
		local veh = getPedOccupiedVehicle ( getLocalPlayer() )
		local model = getElementModel ( veh )
		if not veh or helicopters[model] or ( ( planeb[model] or planea[model] ) and isVehicleOnGround ( veh ) ) then
			setElementVelocity ( getPedOccupiedVehicle ( getLocalPlayer() ), 0, 0, 0 )
			showCursor ( true )
			setElementData ( getLocalPlayer(), "ElementClicked", true, true )
			toggleAllControls ( getLocalPlayer(), false )
			if gWindow["tankstelle"] then
				guiSetVisible ( gWindow["tankstelle"], true )
			else
				local screenwidth, screenheight = guiGetScreenSize ()
				
				gWindow["tankstelle"] = guiCreateWindow(screenwidth/2-378/2,screenheight/2-174/2,378,174,"Gas station",false)
				guiSetAlpha(gWindow["tankstelle"],1)
				guiWindowSetMovable(gWindow["tankstelle"],false)
				guiWindowSetSizable(gWindow["tankstelle"],false)
				gEdit["literFill"] = guiCreateEdit(0.3545,0.477,0.164,0.1609,"",true,gWindow["tankstelle"])
				guiSetAlpha(gEdit["literFill"],1)
				gLabel["literText"] = guiCreateLabel(0.5317,0.523,0.1005,0.1092,"Liter",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["literText"],1)
				guiLabelSetColor(gLabel["literText"],125,000,000)
				guiLabelSetVerticalAlign(gLabel["literText"],"top")
				guiLabelSetHorizontalAlign(gLabel["literText"],"left",false)
				guiSetFont(gLabel["literText"],"default-bold-small")
				gLabel["snackPrice"] = guiCreateLabel(0.7804,0.5115,0.0582,0.1092,"X $",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["snackPrice"],1)
				guiLabelSetColor(gLabel["snackPrice"],000,125,000)
				guiLabelSetVerticalAlign(gLabel["snackPrice"],"top")
				guiLabelSetHorizontalAlign(gLabel["snackPrice"],"left",false)
				guiSetFont(gLabel["snackPrice"],"default-bold-small")
				gLabel["pricePerLiter"] = guiCreateLabel(0.0767,0.5172,0.2011,0.1092,"X.XX $ / Liter",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["pricePerLiter"],1)
				guiLabelSetColor(gLabel["pricePerLiter"],000,125,000)
				guiLabelSetVerticalAlign(gLabel["pricePerLiter"],"top")
				guiLabelSetHorizontalAlign(gLabel["pricePerLiter"],"left",false)
				guiSetFont(gLabel["pricePerLiter"],"default-bold-small")
				gLabel["kannisterPrice"] = guiCreateLabel(0.3545,0.7069,0.1429,0.1897,"X Liter,\nX $",true,gWindow["tankstelle"])
				guiSetAlpha(gLabel["kannisterPrice"],1)
				guiLabelSetColor(gLabel["kannisterPrice"],200,050,020)
				guiLabelSetVerticalAlign(gLabel["kannisterPrice"],"top")
				guiLabelSetHorizontalAlign(gLabel["kannisterPrice"],"left",false)
				guiSetFont(gLabel["kannisterPrice"],"default-bold-small")
				
				gButton["buyKannister"] = guiCreateButton(0.0344,0.6724,0.291,0.2644,"Buy\nJerrycan",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["buyKannister"],1)
				gButton["volltanken"] = guiCreateButton(0.0344,0.1724,0.291,0.2644,"Filling up",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["volltanken"],1)
				gButton["ltanken"] = guiCreateButton(0.3519,0.1667,0.291,0.2644,"Liter filling",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["ltanken"],1)
				gButton["snack"] = guiCreateButton(0.6693,0.1667,0.291,0.2644,"Buy Snack",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["snack"],1)
				gButton["closeTanke"] = guiCreateButton(0.6825,0.6782,0.291,0.2644,"Cancel",true,gWindow["tankstelle"])
				guiSetAlpha(gButton["closeTanke"],1)
				
				addEventHandler("onClientGUIClick", gButton["closeTanke"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["volltanken"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
						triggerServerEvent ( "fillComplete", getLocalPlayer(), getLocalPlayer(), true )
					end
				)
				addEventHandler("onClientGUIClick", gButton["ltanken"],
					function()
						guiSetVisible ( gWindow["tankstelle"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
						triggerServerEvent ( "fillPart", getLocalPlayer(), getLocalPlayer(), guiGetText ( gEdit["literFill"] ), true )
					end
				)
				addEventHandler("onClientGUIClick", gButton["snack"],
					function()
						triggerServerEvent ( "buySnack", getLocalPlayer(), getLocalPlayer() )
					end
				)
				addEventHandler("onClientGUIClick", gButton["buyKannister"],
					function()
						triggerServerEvent ( "buyKannister", getLocalPlayer(), getLocalPlayer() )
					end
				)
			end
			guiSetText ( gLabel["snackPrice"], snackPrice.."$" )
			guiSetText ( gLabel["pricePerLiter"], (literPrice*3).."$ / Liter" )
			guiSetText ( gLabel["kannisterPrice"], "15 Liter,\n"..math.floor(literPrice*15)+kannisterPrice.."$" )
		end
	end
end