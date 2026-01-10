function cancelWaffenscheinMenue ( button )

	guiSetVisible(gWindow["ammunationbg"], false)
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
end

function WSbeantragen ( button, state )

	if button == "left" then
		player = getLocalPlayer()
		triggerServerEvent ( "LizenzKaufen", getLocalPlayer(), player, license )
	end
end

function ShowWaffenscheinMenue_func()

	_createWaffenscheinGui()
end
addEvent ( "ShowWaffenscheinMenue", true)
addEventHandler ( "ShowWaffenscheinMenue", getLocalPlayer(),  ShowWaffenscheinMenue_func)

function _createWaffenscheinGui()

	if gWindow["ammunationbg"] then
		guiSetVisible ( gWindow["ammunationbg"], true )
	else
		gWindow["ammunationbg"] = guiCreateWindow(screenwidth/2-750/2,screenheight/2-280/2,750,280,"Waffenscheine",false)
		guiSetAlpha(gWindow["ammunationbg"],1)
		gGrid["Licenses"] = guiCreateGridList(0.0201,0.2709,0.4509,0.6773,true,gWindow["ammunationbg"])
		guiGridListSetSelectionMode(gGrid["Licenses"],2)
		gColumn["waffenscheinLicense"] = guiGridListAddColumn(gGrid["Licenses"],"Schein",0.38)
		gColumn["waffenscheinPreis"] = guiGridListAddColumn(gGrid["Licenses"],"Preis",0.3)
		gColumn["waffenscheinVorhanden"] = guiGridListAddColumn(gGrid["Licenses"],"",0.07)
		guiSetAlpha(gGrid["Licenses"],1)
		gLabel["cityhalInfotext1"] = guiCreateLabel(0.0179,0.0797,0.9688,0.1753,"Herzlich willkommen bei Ammunation! Hier kannst du neue Waffenscheine erwerben.",true,gWindow["ammunationbg"])
		guiSetAlpha(gLabel["cityhalInfotext1"],1)
		guiLabelSetColor(gLabel["cityhalInfotext1"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["cityhalInfotext1"],"top")
		guiLabelSetHorizontalAlign(gLabel["cityhalInfotext1"],"left",false)
		guiSetFont(gLabel["cityhalInfotext1"],"default-bold-small")
		gLabel["cityhalInfotext2"] = guiCreateLabel(0.6228,0.3347,0.1964,0.0677,"Waffenschein A",true,gWindow["ammunationbg"])
		guiSetAlpha(gLabel["cityhalInfotext2"],1)
		guiLabelSetColor(gLabel["cityhalInfotext2"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["cityhalInfotext2"],"top")
		guiLabelSetHorizontalAlign(gLabel["cityhalInfotext2"],"left",false)
		guiSetFont(gLabel["cityhalInfotext2"],"default-bold-small")
		gLabel["cityhalInfotext3"] = guiCreateLabel(0.4888,0.4024,0.4866,0.2231,"Mit einem Waffenschein A kannst du Waffen kaufen.",true,gWindow["ammunationbg"])
		guiSetAlpha(gLabel["cityhalInfotext3"],1)
		guiLabelSetColor(gLabel["cityhalInfotext3"],125,125,200)
		guiLabelSetVerticalAlign(gLabel["cityhalInfotext3"],"top")
		guiLabelSetHorizontalAlign(gLabel["cityhalInfotext3"],"left",false)
		guiSetFont(gLabel["cityhalInfotext3"],"default-bold-small")
		gButton["WSbeantragen"] = guiCreateButton(0.5022,0.7729,0.2143,0.1633,"Beantragen",true,gWindow["ammunationbg"])
		guiSetAlpha(gButton["WSbeantragen"],1)
		gButton["schliessen"] = guiCreateButton(0.75,0.7729,0.2143,0.1633,"Schliessen",true,gWindow["ammunationbg"])
		guiSetAlpha(gButton["schliessen"],1)
		
		addEventHandler("onClientGUIClick", gButton["schliessen"], cancelWaffenscheinMenue, true)
		addEventHandler("onClientGUIClick", gButton["WSbeantragen"], WSbeantragen, true)
		
		refreshWaffenscheinTexts()
	end
	refreshWaffenschein()
end

function waffenscheinammuClick ()
	if gWindow["ammunationbg"] then
		local rowindex, columnindex = guiGridListGetSelectedItem ( gGrid["Licenses"] )
		local selectedText = guiGridListGetItemText ( gGrid["Licenses"], rowindex, gColumn["waffenscheinLicense"] )
		if selectedText == "Waffenschein A" then
			license = "wschein"
			refreshWaffenscheinTexts()
		elseif selectedText == "Waffenschein B" then
			license = "wscheinB"
			refreshWaffenscheinTexts()
		elseif selectedText == "Waffenschein C" then
			license = "wscheinC"
			refreshWaffenscheinTexts()
		end
	end
end
addEventHandler ( "onClientGUIClick", getRootElement(),  waffenscheinammuClick )

function refreshWaffenschein()

	guiGridListClear ( gGrid["Licenses"] )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["waffenscheinLicense"], "Waffenschein A", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["waffenscheinPreis"], "5000 $", true, false )
	if tonumber ( getElementData ( lp, "gunlicense" ) ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["waffenscheinVorhanden"], fix, true, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["waffenscheinLicense"], "Waffenschein B", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["waffenscheinPreis"], "25000 $", true, false )
	if tonumber ( getElementData ( lp, "gunlicenseB" ) ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["waffenscheinVorhanden"], fix, true, false )
	
	local row = guiGridListAddRow ( gGrid["Licenses"] )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["waffenscheinLicense"], "Waffenschein C", false, false )
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["waffenscheinPreis"], "50000 $", true, false )
	if tonumber ( getElementData ( lp, "gunlicenseC" ) ) == 1 then fix = "[x]" else fix = "[_]" end
	guiGridListSetItemText( gGrid["Licenses"], row, gColumn["waffenscheinVorhanden"], fix, true, false )


	license = "wschein"
	refreshWaffenscheinTexts()
end

function refreshWaffenscheinTexts()

	--[[
		license = "wschein"
		
		license = "bike"
		license = "fishing"
		license = "perso"
		license = "lkw"
		license = "raft"
		license = "motorboot"
		license = "planeb"
		license = "car"
		license = "heli"
		license = "planea"
		]]
	if license == "wschein" then
		guiSetText ( gLabel["cityhalInfotext2"], "Waffenschein A" )
		guiSetText ( gLabel["cityhalInfotext3"], "Mit diesem Waffenschein kannst du Hiebwaffen kaufen." )
	elseif license == "wscheinB" then
		guiSetText ( gLabel["cityhalInfotext2"], "Waffenschein B" )
		guiSetText ( gLabel["cityhalInfotext3"], "Mit diesem Waffenschein kannst du leichte Waffen kaufen." )
	elseif license == "wscheinC" then
		guiSetText ( gLabel["cityhalInfotext2"], "Waffenschein C" )
		guiSetText ( gLabel["cityhalInfotext3"], "Mit diesem Waffenschein kannst du mittlere Waffen kaufen." )
	end
end