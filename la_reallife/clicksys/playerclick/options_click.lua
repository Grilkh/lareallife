function BonusMenueBtn ()

	triggerEvent ( "_createBonusmenue", getLocalPlayer() )
	guiSetVisible ( optionsWindow, false )
end

--[[function prevOptionsMenueBtn ()

	if channel ~= 1 then
		channel = channel - 1
		if channel == -1 or channel == 0 or channel == 1 then
			guiSetText ( gLabel["channel"], "Playback FM" )
		elseif channel == 2 then
			guiSetText ( gLabel["channel"], "K-Rose" )
		elseif channel == 3 then
			guiSetText ( gLabel["channel"], "K-DST" )
		elseif channel == 4 then
			guiSetText ( gLabel["channel"], "Bounce FM" )
		elseif channel == 5 then
			guiSetText ( gLabel["channel"], "SF-UR" )
		elseif channel == 6 then
			guiSetText ( gLabel["channel"], "Radio Los Angeles" )
		elseif channel == 7 then
			guiSetText ( gLabel["channel"], "Radio X" )
		elseif channel == 8 then
			guiSetText ( gLabel["channel"], "CSR 103.9" )
		elseif channel == 9 then
			guiSetText ( gLabel["channel"], "K-Jah West" )
		elseif channel == 10 then
			guiSetText ( gLabel["channel"], "Master Sounds FM" )
		elseif channel == 11 then
			guiSetText ( gLabel["channel"], "WCTR" )
		elseif channel == 12 then
			guiSetText ( gLabel["channel"], "User Track Player" )
		elseif channel == 13 then
			guiSetText ( gLabel["channel"], "Radio aus" )
		end
	else
		channel = 13
		guiSetText ( gLabel["channel"], "Radio aus" )
	end
	triggerEvent ( "radiochange", getLocalPlayer(), getLocalPlayer(), channel )
end

function nextOptionsMenueBtn ()

	if channel ~= 13 then
		channel = channel + 1
		if channel == 0 or channel == 1 then
			guiSetText ( gLabel["channel"], "Playback FM" )
		elseif channel == 2 then
			guiSetText ( gLabel["channel"], "K-Rose" )
		elseif channel == 3 then
			guiSetText ( gLabel["channel"], "K-DST" )
		elseif channel == 4 then
			guiSetText ( gLabel["channel"], "Bounce FM" )
		elseif channel == 5 then
			guiSetText ( gLabel["channel"], "SF-UR" )
		elseif channel == 6 then
			guiSetText ( gLabel["channel"], "Radio Los Angeles" )
		elseif channel == 7 then
			guiSetText ( gLabel["channel"], "Radio X" )
		elseif channel == 8 then
			guiSetText ( gLabel["channel"], "CSR 103.9" )
		elseif channel == 9 then
			guiSetText ( gLabel["channel"], "K-Jah West" )
		elseif channel == 10 then
			guiSetText ( gLabel["channel"], "Master Sounds FM" )
		elseif channel == 11 then
			guiSetText ( gLabel["channel"], "WCTR" )
		elseif channel == 12 then
			guiSetText ( gLabel["channel"], "User Track Player" )
		elseif channel == 13 then
			guiSetText ( gLabel["channel"], "Radio aus" )
		end
	else
		channel = 1
		guiSetText ( gLabel["channel"], "Playback FM" )
	end
	triggerEvent ( "radiochange", getLocalPlayer(), getLocalPlayer(), channel )
end]]

function HelpMenueBtn ()

	guiSetVisible( gWindows["selfclick"], false )
	guiSetVisible( bonusmenue, false )
	guiSetVisible ( optionsWindow, false )
	triggerEvent ( "ShowHelpmenueGui", getLocalPlayer() )
end

function _createOptionmenue_func()

	if optionsWindow then
		guiSetVisible ( optionsWindow, true )
	else
		if getElementData ( getLocalPlayer(), "favchannel" ) == nil then channel = 6 else channel = tonumber ( getElementData ( getLocalPlayer(), "favchannel" ) ) end
		
		optionsWindow = guiCreateWindow(screenwidth/2-335/2,120,335,420,"Optionen",false)
		guiSetAlpha(optionsWindow,1)
		guiWindowSetMovable ( optionsWindow, false )
		guiWindowSetSizable ( optionsWindow, false )
			
		--gButton["bonusmenue"] = guiCreateButton(275*0.0327,150*0.2095,275*0.3455,150*0.2365,"Bonusmenü",false,optionsWindow)
		--guiSetAlpha(gButton["bonusmenue"],1)
		--gButton["<"] = guiCreateButton(209,77,18,19,"<",false,optionsWindow)
		--guiSetAlpha(gButton["<"],1)
		--gButton[">"] = guiCreateButton(231,77,18,19,">",false,optionsWindow)
		--guiSetAlpha(gButton[">"],1)
		gButton["password"] = guiCreateButton(9,44,95,34,"Passwort\nändern",false,optionsWindow)
		guiSetAlpha(gButton["password"],1)
		gButton["helpmenue"] = guiCreateButton(9,104,95,34,"Hilfemenü",false,optionsWindow)
		guiSetAlpha(gButton["helpmenue"],1)
		gButton["egoSight"] = guiCreateButton(9,164,95,34,"Egoansicht",false,optionsWindow)
		guiSetAlpha(gButton["egoSight"],1)
		gButton["reddot"] = guiCreateButton(9,224,95,34,"Rotpunktvisir",false,optionsWindow)
		guiSetAlpha(gButton["reddot"],1)
		gButton["socialState"] = guiCreateButton(9,284,95,34,"Sozialer\nStatus",false,optionsWindow)
		guiSetAlpha(gButton["socialState"],1)
		gButton["spawnSelection"] = guiCreateButton(9,344,95,34,"Startpunkt",false,optionsWindow)
		guiSetAlpha(gButton["spawnSelection"],1)
		
		--addEventHandler("onClientGUIClick", gButton["bonusmenue"], BonusMenueBtn, false)
		--addEventHandler("onClientGUIClick", gButton["<"], prevOptionsMenueBtn, false)
		--addEventHandler("onClientGUIClick", gButton[">"], nextOptionsMenueBtn, false)
		addEventHandler("onClientGUIClick", gButton["helpmenue"], HelpMenueBtn, false)
		addEventHandler("onClientGUIClick", gButton["egoSight"], 
		function ( btn, state )
			if state == "up" then
				executeCommandHandler ( "ego" )
			end
		end, false)
		addEventHandler("onClientGUIClick", gButton["reddot"], 
		function ( btn, state )
			if state == "up" then
				executeCommandHandler ( "reddot" )
			end
		end, false)
		addEventHandler("onClientGUIClick", gButton["socialState"], 
		function ( btn, state )
			if state == "up" then
				guiSetVisible ( optionsWindow, false )
				showSocialRankWindow ()
			end
		end, false)
		addEventHandler("onClientGUIClick", gButton["spawnSelection"], 
		function ( btn, state )
			if state == "up" then
				guiSetVisible ( optionsWindow, false )
				showSpawnSelection ()
			end
		end, false)
		addEventHandler("onClientGUIClick", gButton["password"], 
		function ( btn, state )
			if state == "up" then
				guiSetVisible ( optionsWindow, false )
				showPasswordWindow ()
			end
		end, false)
		
		--[[gLabel["favsender"] = guiCreateLabel(275*0.0364,150*0.5135,275*0.3491,150*0.1419,"Lieblingssender:",false,optionsWindow)
		guiSetFont(gLabel["favsender"],"default-bold-small")
		guiSetAlpha(gLabel["favsender"],1)
		guiLabelSetColor(gLabel["favsender"],000,000,200)
		guiLabelSetVerticalAlign(gLabel["favsender"],"top")
		guiLabelSetHorizontalAlign(gLabel["favsender"],"left",false)
		gLabel["channel"] = guiCreateLabel(275*0.4,150*0.5135,275*0.3491,150*0.1284,"",false,optionsWindow)
		guiSetFont(gLabel["channel"],"default-bold-small")
		if channel == 0 or channel == 1 then
			guiSetText ( gLabel["channel"], "Playback FM" )
		elseif channel == 2 then
			guiSetText ( gLabel["channel"], "K-Rose" )
		elseif channel == 3 then
			guiSetText ( gLabel["channel"], "K-DST" )
		elseif channel == 4 then
			guiSetText ( gLabel["channel"], "Bounce FM" )
		elseif channel == 5 then
			guiSetText ( gLabel["channel"], "SF-UR" )
		elseif channel == 6 then
			guiSetText ( gLabel["channel"], "Radio Los Angeles" )
		elseif channel == 7 then
			guiSetText ( gLabel["channel"], "Radio X" )
		elseif channel == 8 then
			guiSetText ( gLabel["channel"], "CSR 103.9" )
		elseif channel == 9 then
			guiSetText ( gLabel["channel"], "K-Jah West" )
		elseif channel == 10 then
			guiSetText ( gLabel["channel"], "Master Sounds" )
		elseif channel == 11 then
			guiSetText ( gLabel["channel"], "WCTR" )
		elseif channel == 12 then
			guiSetText ( gLabel["channel"], "User Track Player" )
		elseif channel == 13 then
			guiSetText ( gLabel["channel"], "Radio aus" )
		end
		guiSetAlpha(gLabel["channel"],1)
		guiLabelSetColor(gLabel["channel"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["channel"],"top")
		guiLabelSetHorizontalAlign(gLabel["channel"],"left",false)]]
		
		--[[gLabel["bonuspoints"] = guiCreateLabel(275*0.4036,150*0.1959,275*0.5709,150*0.2365,"Hier kannst du Bonuspunkte\nfür besonderes ausgeben",false,optionsWindow)
		guiSetFont(gLabel["bonuspoints"],"default-bold-small")
		guiSetAlpha(gLabel["bonuspoints"],1)
		guiLabelSetColor(gLabel["bonuspoints"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["bonuspoints"],"top")
		guiLabelSetHorizontalAlign(gLabel["bonuspoints"],"left",false)]]
		gLabel["password"] = guiCreateLabel(275*0.4036,150*0.31,275*0.5709,159*0.4,"Hier kannst du dein\nPasswort ändern.",false,optionsWindow)
		guiSetFont(gLabel["password"],"default-bold-small")
		guiSetAlpha(gLabel["password"],1)
		guiLabelSetColor(gLabel["password"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["password"],"top")
		guiLabelSetHorizontalAlign(gLabel["password"],"left",false)
		
		gLabel["helpmenue"] = guiCreateLabel(275*0.3964,150*0.69,275*0.5709,150*0.2,"Hier kriegst du Hilfe,\nwenn du Probleme hast.",false,optionsWindow)
		guiSetFont(gLabel["helpmenue"],"default-bold-small")
		guiSetAlpha(gLabel["helpmenue"],1)
		guiLabelSetColor(gLabel["helpmenue"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["helpmenue"],"top")
		guiLabelSetHorizontalAlign(gLabel["helpmenue"],"left",false)
		
		gLabel["egoInfo"] = guiCreateLabel(275*0.3964,164,275*0.5709,150*0.4,"Eine komplett neue Sicht -\nbesonders beim Fahren!",false,optionsWindow)
		guiSetFont(gLabel["egoInfo"],"default-bold-small")
		guiSetAlpha(gLabel["egoInfo"],1)
		guiLabelSetColor(gLabel["egoInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["egoInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["egoInfo"],"left",false)
		
		gLabel["reddotInfo"] = guiCreateLabel(275*0.3964,224,275*0.5709,150*0.4+20,"Alle deine Waffen werden\nmit einem Rotpunkt-Visir\naugestattet!",false,optionsWindow)
		guiSetFont(gLabel["reddotInfo"],"default-bold-small")
		guiSetAlpha(gLabel["reddotInfo"],1)
		guiLabelSetColor(gLabel["reddotInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["reddotInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["reddotInfo"],"left",false)
		
		gLabel["socialInfo"] = guiCreateLabel(275*0.3964,284,275*0.5709,150*0.4+20,"Hier kannst du deinen\nsozialen Status auswählen!",false,optionsWindow)
		guiSetFont(gLabel["socialInfo"],"default-bold-small")
		guiSetAlpha(gLabel["socialInfo"],1)
		guiLabelSetColor(gLabel["socialInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["socialInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["socialInfo"],"left",false)
		
		gLabel["spawnInfo"] = guiCreateLabel(275*0.3964,344,275*0.5709,150*0.4+20,"Hier kannst du deinen\nStartpunkt ändern..",false,optionsWindow)
		guiSetFont(gLabel["spawnInfo"],"default-bold-small")
		guiSetAlpha(gLabel["spawnInfo"],1)
		guiLabelSetColor(gLabel["spawnInfo"],255,255,255)
		guiLabelSetVerticalAlign(gLabel["spawnInfo"],"top")
		guiLabelSetHorizontalAlign(gLabel["spawnInfo"],"left",false)
	end
end
addEvent ( "_createOptionmenue", true )
addEventHandler ( "_createOptionmenue", getRootElement(), _createOptionmenue_func )


function showPasswordWindow ()

	if gWindow["passwordChange"] then
		guiSetVisible ( gWindow["passwordChange"], true )
	else

		gWindow["passwordChange"] = guiCreateWindow(screenwidth/2-156/2,120,156,66,"Passwort ändern",false)
		guiSetAlpha(gWindow["passwordChange"],1)
		guiWindowSetMovable(gWindow["passwordChange"],false)
		guiWindowSetSizable(gWindow["passwordChange"],false)
		gButton["PWChangeBtn"] = guiCreateButton(0.5833,0.4091,0.359,0.4545,"Ändern",true,gWindow["passwordChange"])
		guiSetAlpha(gButton["PWChangeBtn"],1)
		gEdit["newPassword"] = guiCreateEdit(0.0577,0.3788,0.4744,0.4545,"",true,gWindow["passwordChange"])
		guiSetAlpha(gEdit["newPassword"],1)
		guiEditSetMasked ( gEdit["newPassword"], true )
		addEventHandler("onClientGUIClick", gButton["PWChangeBtn"],
			function ()
				if guiGetText ( gEdit["newPassword"] ) ~= "" then
					local player = getPlayerName(getLocalPlayer())
					triggerServerEvent ( "passwort", getLocalPlayer(), getLocalPlayer(), player, guiGetText ( gEdit["newPassword"] ) )
					SelfCancelBtn ()
					guiSetVisible ( gWindow["passwordChange"], false )
				end
			end
		)
	end
end
