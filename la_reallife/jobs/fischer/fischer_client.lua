------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

function Fischer_GUI_func()
	showCursor(true)
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 535, 143
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	gWindow["fischerWindow"] = guiCreateWindow(left, top, windowWidth, windowHeight, "Fischer", false)
	guiWindowSetSizable(gWindow["fischerWindow"], false)
	
	gLabel["label"] = guiCreateLabel(10, 25, 503, 34, "Herzlich willkommen am Hafen! Möchtest du auch Fische fangen und somit Geld verdienen?\nWähle unten eine Variante und steigere dein Level, bis du alles freigeschaltet hast!", false, gWindow["fischerWindow"])
	guiLabelSetHorizontalAlign(gLabel["label"], "left", false)
	guiLabelSetVerticalAlign(gLabel["label"], "center")
	
	gLabel["label_2"] = guiCreateLabel(10, 65, 71, 16, "Fischerlevel:", false, gWindow["fischerWindow"])
	guiLabelSetHorizontalAlign(gLabel["label_2"], "left", false)
	guiLabelSetVerticalAlign(gLabel["label_2"], "center")
	
	gLabel["label_3"] = guiCreateLabel(90, 65, 46, 16, "0", false, gWindow["fischerWindow"])
	guiLabelSetHorizontalAlign(gLabel["label_3"], "left", false)
	guiLabelSetVerticalAlign(gLabel["label_3"], "center")
	
	gRadio["normal"] = guiCreateRadioButton(140, 65, 121, 17, "Normales Fischen", false, gWindow["fischerWindow"])
	
	gRadio["glueck"] = guiCreateRadioButton(270, 65, 175, 17, "Glücksfischen (ab Level 100)", false, gWindow["fischerWindow"])
	guiRadioButtonSetSelected(gRadio["normal"],true)
	gButton["fischerStart"] = guiCreateButton(30, 105, 75, 23, "Fahrt starten", false, gWindow["fischerWindow"])
	
	gButton["fischerClose"] = guiCreateButton(130, 105, 75, 23, "Abbrechen", false, gWindow["fischerWindow"])
	
	addEventHandler("onClientGUIClick", getRootElement(),
		function ()
			if source == gButton["fischerClose"] then
				guiSetVisible ( gWindow["fischerWindow"], false )
				showCursor(false)
				triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
			elseif source == gButton["fischerStart"] then
				if getElementData ( lp, "fishinglicense" ) == 1 and getElementData ( lp, "motorbootlicense" ) == 1 then
					if guiRadioButtonGetSelected ( gRadio["normal"] ) then
						startfishing_func()
					elseif guiRadioButtonGetSelected ( gRadio["glueck"] ) then
						if tonumber(laGetElementData(player, "fischerlevel")) >= 100 then
							glueck_fishing_func()
						else
							outputChatBox ( "Dein Fischerlevel ist zu niedrig!", 125, 0, 0 )
						end
					end
						guiSetVisible ( gWindow["fischerWindow"], false )
						showCursor(false)
						triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
				else
					outputChatBox ( "Du brauchst einen Angel- und einen Bootsschein!", 125, 0, 0 )
				end
			end
		end
	)
	guiSetText ( gLabel["label_3"], getElementData ( lp, "fischerlevel" ) )
end
addEvent ( "Fischer_GUI", true )
addEventHandler ( "Fischer_GUI", getRootElement(), Fischer_GUI_func )