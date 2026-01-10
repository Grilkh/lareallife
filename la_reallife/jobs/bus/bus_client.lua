------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
-------- 2012 - 2013 ---------
------------------------------

function Busfahrer_GUI_func()
	-- Just for debugging
	-- outputChatBox("#FF0000Info: Busfahrer_GUI_func called at "..os.time(os.date("!*t")))
	showCursor(true)
	local screenWidth, screenHeight = guiGetScreenSize()
	local windowWidth, windowHeight = 550, 143
	local left = screenWidth/2 - windowWidth/2
	local top = screenHeight/2 - windowHeight/2
	gWindow["busfahrerWindow"] = guiCreateWindow(left, top, windowWidth, windowHeight, "Busfahrer", false)
	guiWindowSetSizable(gWindow["busfahrerWindow"], false)
	
	gLabel["label"] = guiCreateLabel(10, 25, 525, 34, "Herzlich willkommen bei den Busfahrern! Möchtest du auch mit dem Bus fahren und Geld\nverdienen? Wähle unten die Route und steigere dein Level, bis du den Reisebus fahren kannst!", false, gWindow["busfahrerWindow"])
	guiLabelSetHorizontalAlign(gLabel["label"], "left", false)
	guiLabelSetVerticalAlign(gLabel["label"], "center")
	
	gLabel["label_2"] = guiCreateLabel(10, 65, 80, 16, "Busfahrerlevel:", false, gWindow["busfahrerWindow"])
	guiLabelSetHorizontalAlign(gLabel["label_2"], "left", false)
	guiLabelSetVerticalAlign(gLabel["label_2"], "center")
	
	gLabel["label_3"] = guiCreateLabel(100, 65, 46, 16, "0", false, gWindow["busfahrerWindow"])
	guiLabelSetHorizontalAlign(gLabel["label_3"], "left", false)
	guiLabelSetVerticalAlign(gLabel["label_3"], "center")
	
	gRadio["stadtroute"] = guiCreateRadioButton(130, 65, 82, 17, "Stadtroute", false, gWindow["busfahrerWindow"])
	guiRadioButtonSetSelected(gRadio["stadtroute"],true)	
	gRadio["reiseroute"] = guiCreateRadioButton(240, 65, 160, 17, "Reiseroute (ab Level 25)", false, gWindow["busfahrerWindow"])

	gButton["busStart"] = guiCreateButton(30, 105, 75, 23, "Fahrt starten", false, gWindow["busfahrerWindow"])
	
	gButton["busClose"] = guiCreateButton(130, 105, 75, 23, "Abbrechen", false, gWindow["busfahrerWindow"])

	guiSetText ( gLabel["label_3"], getElementData ( lp, "buslevel" ) )

	addEventHandler("onClientGUIClick", gWindow["busfahrerWindow"],
	function ()
		-- Just for debugging
		-- outputChatBox("Info: onClientGUIClick clicked at "..os.time(os.date("!*t")))
		if source == gButton["busClose"] then
			guiSetVisible ( gWindow["busfahrerWindow"], false )
			showCursor(false)
			triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		elseif source == gButton["busStart"] then
			if getElementData ( lp, "lkwlicense" ) == 1 then
				if guiRadioButtonGetSelected ( gRadio["stadtroute"] ) then
					if (laGetElementData ( getLocalPlayer(), "isBus" ) == false) then
						-- Just for debugging
						-- outputChatBox("Info: startBusJob - stadt - triggered at "..os.time(os.date("!*t")))
						triggerServerEvent ( "startBusJob", getLocalPlayer(), getLocalPlayer(), "stadt" )
					end
				elseif guiRadioButtonGetSelected ( gRadio["reiseroute"] ) then
					if tonumber(laGetElementData(getLocalPlayer(), "buslevel")) >= 25 then
						if (laGetElementData ( getLocalPlayer(), "isBus" ) == false) then
							-- Just for debugging
							-- outputChatBox("Info: startBusJob - reise - triggered at "..os.time(os.date("!*t")))
							triggerServerEvent ( "startBusJob", getLocalPlayer(), getLocalPlayer(), "reise" )
						end
					else
						outputChatBox ( "Dein Buslevel ist zu niedrig!", 125, 0, 0 )
					end
				end
					guiSetVisible ( gWindow["busfahrerWindow"], false )
					showCursor(false)
					triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
			else
				outputChatBox ( "Du brauchst einen LKW-Führerschein!", 125, 0, 0 )
			end
		end
	end)
end
addEvent ( "Busfahrer_GUI", true )
addEventHandler ( "Busfahrer_GUI", getRootElement(), Busfahrer_GUI_func )