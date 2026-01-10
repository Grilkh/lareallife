gWindow = {}
gButton = {}
gLabel = {}
gRadio = {}

function createTruckerGui_func ()

	showCursor(true)
	if gWindow["truckMenue"] then
		guiSetVisible ( gWindow["truckMenue"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		
		gWindow["truckMenue"] = guiCreateWindow(screenwidth/2-430/2, screenheight/2-292/2,430,292,"Truckmenü",false)
		guiSetAlpha(gWindow["truckMenue"],1)
		guiWindowSetMovable(gWindow["truckMenue"],false)
		guiWindowSetSizable(gWindow["truckMenue"],false)
		gLabel["truckMenueInfo"] = guiCreateLabel(0.0233,0.0856,0.8209,0.1815,"Willkommen im Truckermenü! Hier kannst du deine neuen\nRouten planen sowie deine Statistiken auswerten und neue\nZugmaschinen freischalten.",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["truckMenueInfo"],1)
		guiLabelSetColor(gLabel["truckMenueInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["truckMenueInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["truckMenueInfo"],"left",false)
		gRadio["Roadtrain"] = guiCreateRadioButton(0.0209,0.274,0.2349,0.0651,"Roadtrain",true,gWindow["truckMenue"])
		guiSetAlpha(gRadio["Roadtrain"],1)
		guiRadioButtonSetSelected(gRadio["Roadtrain"],true)
		gLabel["trainsInfo"] = guiCreateLabel(0.2581,0.2842,0.4279,0.1952,"Du kannst neue Zugmaschinen\ndurch aufsteigen im Truckerlevel\nfreischalten.",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["trainsInfo"],1)
		guiLabelSetColor(gLabel["trainsInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["trainsInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["trainsInfo"],"left",false)
		gLabel["curLevelName"] = guiCreateLabel(0.0186,0.4966,0.1953,0.0788,"Truckerlevel:",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["curLevelName"],1)
		guiLabelSetColor(gLabel["curLevelName"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["curLevelName"],"top")
		guiLabelSetHorizontalAlign(gLabel["curLevelName"],"left",false)
		guiSetFont(gLabel["curLevelName"],"default-bold-small")
		gLabel["curLevel"] = guiCreateLabel(0.2093,0.4966-0.005,0.0302,0.0616,"X",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["curLevel"],1)
		guiLabelSetColor(gLabel["curLevel"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["curLevel"],"top")
		guiLabelSetHorizontalAlign(gLabel["curLevel"],"left",false)
		gLabel["curMoneyName"] = guiCreateLabel(0.0186,0.55,0.1,0.0788,"Geld:",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["curMoneyName"],1)
		guiLabelSetColor(gLabel["curMoneyName"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["curMoneyName"],"top")
		guiLabelSetHorizontalAlign(gLabel["curMoneyName"],"left",false)
		guiSetFont(gLabel["curMoneyName"],"default-bold-small")
		gLabel["curMoney"] = guiCreateLabel(0.11,0.545,0.13,0.0616,"1337 $",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["curMoney"],1)
		guiLabelSetColor(gLabel["curMoney"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["curMoney"],"top")
		guiLabelSetHorizontalAlign(gLabel["curMoney"],"left",false)
		gLabel["truckerLVLInfo"] = guiCreateLabel(0.2465,0.4932,0.5953,0.1301,"Dein Truckerlevel steigt, je mehr Fahrten du\nerfolgreich abschliesst!",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["truckerLVLInfo"],1)
		guiLabelSetColor(gLabel["truckerLVLInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["truckerLVLInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["truckerLVLInfo"],"left",false)
		gButton["transport1"] = guiCreateButton(0.0233,0.6575,0.2186,0.1233,"Warentransport",true,gWindow["truckMenue"])
		guiSetAlpha(gButton["transport1"],1)
		gLabel["needetStuff1"] = guiCreateLabel(0.0233,0.8048,0.214,0.0548,"Benötigt:",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetStuff1"],1)
		guiLabelSetColor(gLabel["needetStuff1"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["needetStuff1"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetStuff1"],"left",false)
		guiSetFont(gLabel["needetStuff1"],"default-bold-small")
		gLabel["needetMoney1"] = guiCreateLabel(0.0233,0.863,0.1302,0.0651,tour1Price.." $",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetMoney1"],1)
		guiLabelSetColor(gLabel["needetMoney1"],000,150,000)
		guiLabelSetVerticalAlign(gLabel["needetMoney1"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetMoney1"],"left",false)
		gLabel["needetTruckerlvl1"] = guiCreateLabel(0.0233,0.9178,0.1907,0.0548,"Truckerlevel 1",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetTruckerlvl1"],1)
		guiLabelSetColor(gLabel["needetTruckerlvl1"],050,050,200)
		guiLabelSetVerticalAlign(gLabel["needetTruckerlvl1"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetTruckerlvl1"],"left",false)
		local btnx = 0.2605
		gButton["transport2"] = guiCreateButton(btnx,0.6575,0.2186,0.1233,"Zeittransport",true,gWindow["truckMenue"])
		guiSetAlpha(gButton["transport2"],1)
		gLabel["needetStuff2"] = guiCreateLabel(btnx,0.8048,0.214,0.0548,"Benötigt:",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetStuff2"],1)
		guiLabelSetColor(gLabel["needetStuff2"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["needetStuff2"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetStuff2"],"left",false)
		guiSetFont(gLabel["needetStuff2"],"default-bold-small")
		gLabel["needetMoney2"] = guiCreateLabel(btnx,0.863,0.1302,0.0651,tour2Price.." $",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetMoney2"],1)
		guiLabelSetColor(gLabel["needetMoney2"],000,150,000)
		guiLabelSetVerticalAlign(gLabel["needetMoney2"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetMoney2"],"left",false)
		gLabel["needetTruckerlvl2"] = guiCreateLabel(btnx,0.9178,0.1907,0.0548,"Truckerlevel 3",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetTruckerlvl2"],1)
		guiLabelSetColor(gLabel["needetTruckerlvl2"],050,050,200)
		guiLabelSetVerticalAlign(gLabel["needetTruckerlvl2"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetTruckerlvl2"],"left",false)
		local btnx = 0.2605+0.2372
		gButton["transport3"] = guiCreateButton(btnx,0.6575,0.2186,0.1233,"Gefahren-\ntransport",true,gWindow["truckMenue"])
		guiSetAlpha(gButton["transport3"],1)
		gLabel["needetStuff3"] = guiCreateLabel(btnx,0.8048,0.214,0.0548,"Benötigt:",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetStuff3"],1)
		guiLabelSetColor(gLabel["needetStuff3"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["needetStuff3"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetStuff3"],"left",false)
		guiSetFont(gLabel["needetStuff3"],"default-bold-small")
		gLabel["needetMoney3"] = guiCreateLabel(btnx,0.863,0.1302,0.0651,tour3Price.." $",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetMoney3"],1)
		guiLabelSetColor(gLabel["needetMoney3"],000,150,000)
		guiLabelSetVerticalAlign(gLabel["needetMoney3"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetMoney3"],"left",false)
		gLabel["needetTruckerlvl3"] = guiCreateLabel(btnx,0.9178,0.1957,0.0548,"Truckerlevel 10",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetTruckerlvl3"],1)
		guiLabelSetColor(gLabel["needetTruckerlvl3"],050,050,200)
		guiLabelSetVerticalAlign(gLabel["needetTruckerlvl3"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetTruckerlvl3"],"left",false)
		local btnx = 0.2605+0.2372*2
		gButton["transport4"] = guiCreateButton(btnx,0.6575,0.2186,0.1233,"Spezial\nTransport",true,gWindow["truckMenue"])
		guiSetAlpha(gButton["transport4"],1)
		gLabel["needetStuff4"] = guiCreateLabel(btnx,0.8048,0.214,0.0548,"Benötigt:",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetStuff4"],1)
		guiLabelSetColor(gLabel["needetStuff4"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["needetStuff4"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetStuff4"],"left",false)
		guiSetFont(gLabel["needetStuff4"],"default-bold-small")
		gLabel["needetMoney4"] = guiCreateLabel(btnx,0.863,0.1302,0.0651,tour4Price.." $",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetMoney4"],1)
		guiLabelSetColor(gLabel["needetMoney4"],000,150,000)
		guiLabelSetVerticalAlign(gLabel["needetMoney4"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetMoney4"],"left",false)
		gLabel["needetTruckerlvl4"] = guiCreateLabel(btnx,0.9178,0.1957,0.0548,"Truckerlevel 20",true,gWindow["truckMenue"])
		guiSetAlpha(gLabel["needetTruckerlvl4"],1)
		guiLabelSetColor(gLabel["needetTruckerlvl4"],050,050,200)
		guiLabelSetVerticalAlign(gLabel["needetTruckerlvl4"],"top")
		guiLabelSetHorizontalAlign(gLabel["needetTruckerlvl4"],"left",false)
		gButton["truckMenueExit"] = guiCreateButton( 0.9349, 0.0753, 0.07, 0.07, "X",true,gWindow["truckMenue"])
		guiSetAlpha(gButton["truckMenueExit"],1)
		addEventHandler("onClientGUIClick", gButton["truckMenueExit"], SubmitTruckerAbbrechenBtn, false)
		
		addEventHandler("onClientGUIClick", gButton["transport1"], SubmitTransport1Btn, false)
		addEventHandler("onClientGUIClick", gButton["transport2"], SubmitTransport2Btn, false)
		addEventHandler("onClientGUIClick", gButton["transport3"], SubmitTransport3Btn, false)
		addEventHandler("onClientGUIClick", gButton["transport4"], SubmitTransport4Btn, false)
	end
	refreshTruckerValues()
end
addEvent ( "createTruckerGui", true )
addEventHandler ( "createTruckerGui", getRootElement(), createTruckerGui_func )

function SubmitTransport1Btn ( btn )
	
	if btn == "left" then
		guiSetVisible(gWindow["truckMenue"], false)
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
		if guiRadioButtonGetSelected ( gRadio["Roadtrain"] ) then
			model = 515
		elseif guiRadioButtonGetSelected ( gRadio["Tanker"] ) then
			model = 514
		else
			model = 403
		end			
		triggerServerEvent ( "truckTour", getLocalPlayer(), getLocalPlayer(), model, 1 )
	end
end
function SubmitTransport2Btn ( btn )
	
	if btn == "left" then
		local player = getLocalPlayer()
		local truckerlvl = getElementData ( player, "truckerlvl" )
		if truckerlvl >= 3 then
			guiSetVisible(gWindow["truckMenue"], false)
			showCursor(false)
			triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
			if guiRadioButtonGetSelected ( gRadio["Roadtrain"] ) then
				model = 515
			elseif guiRadioButtonGetSelected ( gRadio["Tanker"] ) then
				model = 514
			else
				model = 403
			end			
			triggerServerEvent ( "truckTour", getLocalPlayer(), getLocalPlayer(), model, 2 )
		else
			outputChatBox ( "Du bist noch nicht erfahren genug!", 125, 0, 0 )
		end
	end
end
function SubmitTransport3Btn ( btn )
	
	if btn == "left" then
		local player = getLocalPlayer()
		local truckerlvl = getElementData ( player, "truckerlvl" )
		if truckerlvl >= 10 then
			guiSetVisible(gWindow["truckMenue"], false)
			showCursor(false)
			triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
			if guiRadioButtonGetSelected ( gRadio["Roadtrain"] ) then
				model = 515
			elseif guiRadioButtonGetSelected ( gRadio["Tanker"] ) then
				model = 514
			else
				model = 403
			end			
			triggerServerEvent ( "truckTour", getLocalPlayer(), getLocalPlayer(), model, 3 )
		else
			outputChatBox ( "Du bist noch nicht erfahren genug!", 125, 0, 0 )
		end
	end
end
function SubmitTransport4Btn ( btn )
	
	if btn == "left" then
		local player = getLocalPlayer()
		local truckerlvl = getElementData ( player, "truckerlvl" )
		if truckerlvl >= 20 then
			guiSetVisible(gWindow["truckMenue"], false)
			showCursor(false)
			triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
			if guiRadioButtonGetSelected ( gRadio["Roadtrain"] ) then
				model = 515
			elseif guiRadioButtonGetSelected ( gRadio["Tanker"] ) then
				model = 514
			else
				model = 403
			end			
			triggerServerEvent ( "truckTour", getLocalPlayer(), getLocalPlayer(), model, 4 )
		else
			outputChatBox ( "Du bist noch nicht erfahren genug!", 125, 0, 0 )
		end
	end
end

function SubmitTruckerAbbrechenBtn ( btn, state )

	if btn == "left" and gWindow["truckMenue"] then
		guiSetVisible(gWindow["truckMenue"], false)
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	end
end

function refreshTruckerValues()

	local player = getLocalPlayer()
	local truckerlvl = getElementData ( player, "truckerlvl" )
	if truckerlvl >= 5 then
		gRadio["Linerunner"] = guiCreateRadioButton(0.0209,0.3425,0.2349,0.0651,"Linerunner",true,gWindow["truckMenue"])
		guiSetAlpha(gRadio["Linerunner"],1)
	end
	if truckerlvl >= 15 then
		gRadio["Tanker"] = guiCreateRadioButton(0.0209,0.411,0.2349,0.0651,"Tanker",true,gWindow["truckMenue"])
		guiSetAlpha(gRadio["Tanker"],1)
	end
	guiSetText ( gLabel["curLevel"], truckerlvl )
	guiSetText ( gLabel["curMoney"], getElementData ( player, "money" ).." $" )
end