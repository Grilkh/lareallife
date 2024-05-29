------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

function showTutCursor ()

	if isCursorShowing() and not activeGui then
		showCursor ( false )
	elseif not isCursorShowing() then
		showCursor ( true )
	end
end

function showBeginningGui ( player )
	--for i = 1, 35 do outputChatBox ( "" ) end
	showCursor ( true )
	gWindow["tutorialWindow"] = guiCreateWindow ( screenwidth/2-636/2, screenheight/2-264/2, 636, 264, "Herzlich willkommen", false )
	guiSetAlpha(gWindow["tutorialWindow"],1)
	guiWindowSetMovable(gWindow["tutorialWindow"],false)
	guiWindowSetSizable(gWindow["tutorialWindow"],false)
	--gImage["at400Image"] = guiCreateStaticImage(9,26,810,110,"images/"..img,false,gWindow["tutorialWindow"])
	--guiSetAlpha(gImage["at400Image"],1)
	gLabel["tutorialText1"] = guiCreateLabel(8,22,620,158,"Willkommen auf Los Angeles Reallife! Schön dich hier zu sehen. Hier werden deine Träume war!\nOb Verbrecher oder Ordnungshüter, Sanitäter oder Mechaniker, alle Wege sind offen.\n\nAusserdem ist unser kompetentes Team meistens für Support verfügbar. Wenn wir nicht für dich da sind,\nfindest du viele Informationen, indem du F1 drückst oder /infos verwendest.\n\nIn unserem Forum, welches du im Internet unter www.la-rl.com findest, sind alle Regeln zu finden.\nDort musst du dich auch melden, wenn du einer Fraktion beitreten möchtest\noder eine Beschwerde/Vorschlag hast.\n\nWir hoffen, dass du hier viel Spass haben wirst. Hilfe von unserem Team kannst du mit /kontakt anfordern.",false,gWindow["tutorialWindow"])
	guiSetAlpha(gLabel["tutorialText1"],1)
	guiLabelSetColor(gLabel["tutorialText1"],0,150,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText1"],"center",false)
	guiSetFont(gLabel["tutorialText1"],"default-bold-small")
	gButton["goAhead"] = guiCreateButton(9,186,618,60,"Fenster schliessen und Los Angeles erkunden",false,gWindow["tutorialWindow"])
	guiSetAlpha(gButton["goAhead"],1)
	guiSetFont(gButton["goAhead"],"clear-normal")
	addEventHandler("onClientGUIClick", gButton["goAhead"], AbsendenBtn, false)
end

function AbsendenBtn()

	if guiGetVisible ( gWindow["tutorialWindow"] ) then
		guiSetVisible ( gWindow["tutorialWindow"], false )
		showCursor ( false )
		outputChatBox ( "Trete vor den Hotelpagen, um das Tutorial weiterzuführen.", 200, 200, 0)
		tutMarker1 = createMarker ( 2216.7, -1147.04, 1024.79, "cylinder", 1.5, 200, 200, 0, 255 )
		setElementInterior ( tutMarker1, 15 )
		function showTutIntel1 (hitElement)
		if hitElement == lp then
			destroyElement ( tutMarker1 )
			local x, y, z = getElementPosition ( lp )
			--setElementAlpha ( lp, 0 )
			--setCameraMatrix ( x, y, 2214.9, -1146.7, 1025.8, 1055.5, 0, 0 )
			showClickGuiInfo (lp)
		end
		end
		addEventHandler ( "onClientMarkerHit", tutMarker1, showTutIntel1 )
	end
end
--[[function setArrowMoving ( arrow, x, y, z )

	if isElement ( arrow ) then
		if not x then
			x, y, z = getElementPosition ( arrow )
		end
		for i = 1, 10 do
			setTimer ( setElementPosition, 500 + 50 * i, 1, arrow, x, y, z + i * 0.01 )
			setTimer ( setElementPosition, 1050 + 50 * i, 1, arrow, x, y, z + 0.1 - i * 0.01 )
		end
		
		setTimer ( setArrowMoving, 1050, 1, arrow, x, y, z )
	end
end]]


function showClickGuiInfo (player)
	showCursor ( true )
	activeGui = true
if getElementData ( player, "sprache" ) == "Deutsch" then
	gWindow["tutorialWindow1"] = guiCreateWindow(screenwidth/2-452/2, screenheight/2-214/2,452,214,"Tutorial",false)
	guiSetAlpha(gWindow["tutorialWindow1"],1)
	gLabel["tutorialText2"] = guiCreateLabel(10,95,421,48,"Mit dem Klicksystem kannst du mit bestimmten Objekten interagieren.\n Um diese anzuklicken, verwende die \"M\" Taste.\nDann erscheint ein Mauszeiger, mit dem du die Objekte auswählen kannst.",false,gWindow["tutorialWindow1"])
	guiSetAlpha(gLabel["tutorialText2"],1)
	guiLabelSetColor(gLabel["tutorialText2"],0,200,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText2"],"center",false)
	guiSetFont(gLabel["tutorialText2"],"default-bold-small")
	gLabel["tutorialText3"] = guiCreateLabel(10,23,431,72,"Klicksystem",false,gWindow["tutorialWindow1"])
	guiSetAlpha(gLabel["tutorialText3"],1)
	guiLabelSetColor(gLabel["tutorialText3"],0,0,200)
	guiLabelSetHorizontalAlign(gLabel["tutorialText3"],"center",false)
	guiSetFont(gLabel["tutorialText3"],"sa-gothic")
	gButton["tutBtn2"] = guiCreateButton(9,150,434,56,"Weiter",false,gWindow["tutorialWindow1"])
	guiSetAlpha(gButton["tutBtn2"],1)
	guiSetFont(gButton["tutBtn2"],"sa-header")
	addEventHandler("onClientGUIClick", gButton["tutBtn2"],
		function ()
			guiSetVisible ( gWindow["tutorialWindow1"], false )
			showCursor ( false )
			activeGui = false
			tutMarker2 = createMarker ( 2225.85, -1147.092, 1024.796, "cylinder", 1.5, 200, 200, 0, 255 )
			--setArrowMoving ( tutMarker2 )
			setElementInterior ( tutMarker2, 15 )
			--setElementAlpha ( lp, 255 )
			setCameraTarget ( lp )
			function showTutIntel2 (hitElement)
			if hitElement == lp then
				destroyElement ( tutMarker2 )
				local x, y, z = getElementPosition ( lp )
				showInventarGuiInfo (lp)
			end
			end
			addEventHandler ( "onClientMarkerHit", tutMarker2, showTutIntel2 )
			bindKey ( "m", "down", showTutCursor )
			for i = 1, 35 do outputChatBox ( "" ) end
			outputChatBox ( "Stell dich vor den Tisch, um das Tutorial weiterzuführen.", 200, 200, 0 )
			--addEventHandler ( "onClientClick", getRootElement(), tutorialClickCase )
		end
	)
else
	gWindow["tutorialWindow1"] = guiCreateWindow(screenwidth/2-452/2, screenheight/2-214/2,452,214,"Tutorial",false)
	guiSetAlpha(gWindow["tutorialWindow1"],1)
	gLabel["tutorialText2"] = guiCreateLabel(10,95,421,48,"With the click system you can interact with certain objects. \n In order to click on them, use the key \"M\". \nThen you'll see a cursor with which you can select the objects.",false,gWindow["tutorialWindow1"])
	guiSetAlpha(gLabel["tutorialText2"],1)
	guiLabelSetColor(gLabel["tutorialText2"],0,200,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText2"],"center",false)
	guiSetFont(gLabel["tutorialText2"],"default-bold-small")
	gLabel["tutorialText3"] = guiCreateLabel(10,23,431,72,"Clicksystem",false,gWindow["tutorialWindow1"])
	guiSetAlpha(gLabel["tutorialText3"],1)
	guiLabelSetColor(gLabel["tutorialText3"],0,0,200)
	guiLabelSetHorizontalAlign(gLabel["tutorialText3"],"center",false)
	guiSetFont(gLabel["tutorialText3"],"sa-gothic")
	gButton["tutBtn2"] = guiCreateButton(9,150,434,56,"Go ahead",false,gWindow["tutorialWindow1"])
	guiSetAlpha(gButton["tutBtn2"],1)
	guiSetFont(gButton["tutBtn2"],"sa-header")
	addEventHandler("onClientGUIClick", gButton["tutBtn2"],
		function ()
			guiSetVisible ( gWindow["tutorialWindow1"], false )
			showCursor ( false )
			activeGui = false
			tutMarker2 = createMarker ( 2225.85, -1147.092, 1024.796, "cylinder", 1.5, 200, 200, 0, 255 )
			--setArrowMoving ( tutMarker2 )
			setElementInterior ( tutMarker2, 15 )
			--setElementAlpha ( lp, 255 )
			--setPedAnimation ( secruity )
			setCameraTarget ( lp )
			function showTutIntel2 (hitElement)
			if hitElement == lp then
				destroyElement ( tutMarker2 )
				local x, y, z = getElementPosition ( lp )
				showInventarGuiInfo (lp)
			end
			end
			addEventHandler ( "onClientMarkerHit", tutMarker2, showTutIntel2 )
			bindKey ( "m", "down", showTutCursor )
			for i = 1, 35 do outputChatBox ( "" ) end
			outputChatBox ( "Stay in front of the table, to run the tutorial further.", 200, 200, 0 )
			---addEventHandler ( "onClientClick", getRootElement(), tutorialClickCase )
		end
	)
end
end

function tutorialClickCase ( btn, state, x, y, wx, wy, wz, element )

	if element == tutMarker2 then
		removeEventHandler ( "onClientClick", getRootElement(), tutorialClickCase )
		showInventarGuiInfo (lp)
	end
end

function showInventarGuiInfo (player)
	showCursor ( true )
	activeGui = true
	
if getElementData ( lp, "sprache" ) == "Deutsch" then	
	gWindow["tutInfo3"] = guiCreateWindow(screenwidth/2-452/2, screenheight/2-214/2,452,214,"Tutorial",false)
	guiSetAlpha(gWindow["tutInfo3"],1)
	gLabel["tutorialText4"] = guiCreateLabel(10,23,431,72,"Inventar",false,gWindow["tutInfo3"])
	guiSetAlpha(gLabel["tutorialText4"],1)
	guiLabelSetColor(gLabel["tutorialText4"],200,0,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText4"],"center",false)
	guiSetFont(gLabel["tutorialText4"],"sa-gothic")
	gLabel["tutorialText5"] = guiCreateLabel(10,95,421,48,"Alle Gegenstände werden im Inventar angezeigt, z.B. Medikit,\nBenzinkanister, Drogen usw.\n Um das Inventar aufzurufen, verwende die \"I\"-Taste.",false,gWindow["tutInfo3"])
	guiSetAlpha(gLabel["tutorialText5"],1)
	guiLabelSetColor(gLabel["tutorialText5"],0,200,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText5"],"center",false)
	guiSetFont(gLabel["tutorialText5"],"default-bold-small")
	gButton["tutBtn3"] = guiCreateButton(9,150,434,55,"Weiter",false,gWindow["tutInfo3"])
	guiSetAlpha(gButton["tutBtn3"],1)
	guiSetFont(gButton["tutBtn3"],"sa-header")
	destroyElement ( tutMarker2 )
	addEventHandler("onClientGUIClick", gButton["tutBtn3"],
		function ()
			guiSetVisible ( gWindow["tutInfo3"], false )
			showCursor ( false )
			activeGui = false
			unbindKey ( "m", "down", showTutCursor )
			--removeEventHandler ( "onClientClick", getRootElement(), tutorialClickCase )
			for i = 1, 35 do outputChatBox ( "" ) end
			outputChatBox ( "Verlasse nun das Hotel.", 200, 200, 0 )
			
			tutMarker3 = createMarker ( 2228.1, -1150.5, 1026, "checkpoint", 2, getColorFromString ( "#FF000099" ) )
			setElementInterior ( tutMarker3, 15 )
			addEventHandler ( "onClientMarkerHit", tutMarker3, showLastIntel )
		end
	)
else
	gWindow["tutInfo3"] = guiCreateWindow(screenwidth/2-452/2, screenheight/2-214/2,452,214,"Tutorial",false)
	guiSetAlpha(gWindow["tutInfo3"],1)
	gLabel["tutorialText4"] = guiCreateLabel(10,23,431,72,"Inventory",false,gWindow["tutInfo3"])
	guiSetAlpha(gLabel["tutorialText4"],1)
	guiLabelSetColor(gLabel["tutorialText4"],200,0,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText4"],"center",false)
	guiSetFont(gLabel["tutorialText4"],"sa-gothic")
	gLabel["tutorialText5"] = guiCreateLabel(10,95,421,48,"All items will be displayed in the inventory, such as\nMedikit, jerrycan, drugs, etc. \n To access to the inventory, use the \"I\" key. ",false,gWindow["tutInfo3"])
	guiSetAlpha(gLabel["tutorialText5"],1)
	guiLabelSetColor(gLabel["tutorialText5"],0,200,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText5"],"center",false)
	guiSetFont(gLabel["tutorialText5"],"default-bold-small")
	gButton["tutBtn3"] = guiCreateButton(9,150,434,55,"Go ahead",false,gWindow["tutInfo3"])
	guiSetAlpha(gButton["tutBtn3"],1)
	guiSetFont(gButton["tutBtn3"],"sa-header")
	destroyElement ( tutMarker2 )
	addEventHandler("onClientGUIClick", gButton["tutBtn3"],
		function ()
			guiSetVisible ( gWindow["tutInfo3"], false )
			showCursor ( false )
			activeGui = false
			unbindKey ( "m", "down", showTutCursor )
			--removeEventHandler ( "onClientClick", getRootElement(), tutorialClickCase )
			for i = 1, 35 do outputChatBox ( "" ) end
			outputChatBox ( "Now, leave the hotel!", 200, 200, 0 )
			
			tutMarker3 = createMarker ( 2228.1, -1150.5, 1026, "checkpoint", 2, getColorFromString ( "#FF000099" ) )
			setElementInterior ( tutMarker3, 15 )
			addEventHandler ( "onClientMarkerHit", tutMarker3, showLastIntel )
		end
	)
end
end

function showLastIntel (hitElement)
	showCursor ( true )
if getElementData ( hitElement, "sprache" ) == "Deutsch" then
	gWindow["Tutorial4"] = guiCreateWindow(screenwidth/2-452/2,screenheight/2-263/2,452,263,"Tutorial",false)
	guiSetAlpha(gWindow["Tutorial4"],1)
	gLabel["tutorialText6"] = guiCreateLabel(10,23,431,72,"Anzeigen",false,gWindow["Tutorial4"])
	guiSetAlpha(gLabel["tutorialText6"],1)
	guiLabelSetColor(gLabel["tutorialText6"],0,200,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText6"],"center",false)
	guiSetFont(gLabel["tutorialText6"],"sa-gothic")
	gLabel["tutorialText7"] = guiCreateLabel(10,95,421,98,"Du hast zusätzlich zu den normalen Anzeigen (HP, Geld und Waffen)\n auf LA noch weitere, nämlich Hunger, Harndrang und Energie.\nDiese kannst du mit der Taste \"B\" einblenden.\nDu musst regelmässig essen, urinieren und schlafen, damit du\nüberleben kannst.\nDafür musst du eine Pizza bestellen, /piss und /sleep verwenden\nund im Notfall brauchst du sogar ein Medikit!",false,gWindow["Tutorial4"])
	guiSetAlpha(gLabel["tutorialText7"],1)
	guiLabelSetColor(gLabel["tutorialText7"],200,0,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText7"],"center",false)
	guiSetFont(gLabel["tutorialText7"],"default-bold-small")
	gButton["tutBtn4"] = guiCreateButton(9,197,434,54,"Los Angeles betreten",false,gWindow["Tutorial4"])
	guiSetAlpha(gButton["tutBtn4"],1)
	guiSetFont(gButton["tutBtn4"],"sa-header")
	addEventHandler("onClientGUIClick", gButton["tutBtn4"],
		function ()
			guiSetVisible ( gWindow["Tutorial4"], false )
			destroyElement ( tutMarker3 )
			showCursor ( false )
			for i = 1, 35 do outputChatBox ( "" ) end
			tutorial = nil
			setElementInterior ( lp, 0 )
			setElementPosition ( lp, -1971.466796875, 137.821890625, 27.6875 )

			setCameraMatrix(-2004.882, 172.065, 51.346, -1983.859, 140.749, 27.688)
			outputChatBox ( "Hier wirst du starten. Der Bahnhof ist der belebteste Ort in Los Angeles.", 0, 200, 0)
			setTimer ( function()
				setCameraMatrix(-1990.205, -83.364, 53.048, -2026.636, -101.637, 37.951)
				outputChatBox ( "Bei der Fahrschule kannst du alle wichtigen Lizenzen erwerben.", 0, 0, 200)
			end, 10000, 1 )
			setTimer ( function()
				setCameraMatrix(-2139.903, 222.764, 38.962, -2157.056, 253.031, 35.32)
				outputChatBox ( "Beim Jobcenter findest du alle Informationen zu den verschiedenen Jobs.", 200, 200, 0)
			end, 20000, 1 )
			setTimer ( function()
				setElementInterior (lp, 0)
				setElementPosition ( lp, -1971.466796875, 137.821890625, 27.6875 )
				setCameraTarget(lp)
				outputChatBox ( "Wenn du mehr Infos willst, verwende /infos. Die Maus kannst du mit der Taste M aufrufen.", 0, 200, 0)
				outputChatBox ( "Infos findest du auch mit Hilfe der Taste F1. Ansonsten verwende bitte /kontakt.", 0, 250, 0)
				outputChatBox ( "Übrigens haben wir ein umfangreiches Wiki über unseren Server! Du findest es im Forum (www.la-rl.com).", 200, 0, 0)
			end, 30000, 1 )
			setTimer ( function()
				--triggerServerEvent ( "gameBeginGuiShow", lp, lp )
				setTimer ( triggerServerEvent, 1000, 1, "tutfix", lp )
			end, 40000, 1 )
		end
	)
else
	gWindow["Tutorial4"] = guiCreateWindow(screenwidth/2-452/2,screenheight/2-263/2,452,263,"Tutorial",false)
	guiSetAlpha(gWindow["Tutorial4"],1)
	gLabel["tutorialText6"] = guiCreateLabel(10,23,431,72,"Display",false,gWindow["Tutorial4"])
	guiSetAlpha(gLabel["tutorialText6"],1)
	guiLabelSetColor(gLabel["tutorialText6"],0,200,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText6"],"center",false)
	guiSetFont(gLabel["tutorialText6"],"sa-gothic")
	gLabel["tutorialText7"] = guiCreateLabel(10,95,421,98,"You have, in addition to the normal display (HP, money and weapons),\n at LA additional a hunger, a urgency and a energy display. \nThese, you can see with the key \"B\".\nYou regularly need to urinate, eat and sleep, or you'll die!\n You can to order a pizza, use /piss and use /lay!",false,gWindow["Tutorial4"])
	guiSetAlpha(gLabel["tutorialText7"],1)
	guiLabelSetColor(gLabel["tutorialText7"],200,0,0)
	guiLabelSetHorizontalAlign(gLabel["tutorialText7"],"center",false)
	guiSetFont(gLabel["tutorialText7"],"default-bold-small")
	gButton["tutBtn4"] = guiCreateButton(9,197,434,54,"Join Los Angeles!",false,gWindow["Tutorial4"])
	guiSetAlpha(gButton["tutBtn4"],1)
	guiSetFont(gButton["tutBtn4"],"sa-header")
	addEventHandler("onClientGUIClick", gButton["tutBtn4"],
		function ()
			guiSetVisible ( gWindow["Tutorial4"], false )
			destroyElement ( tutMarker3 )
			showCursor ( false )
			for i = 1, 35 do outputChatBox ( "" ) end
			triggerServerEvent ( "gameBeginGuiShow", lp, lp )
			tutorial = nil
			setElementInterior ( lp, 0 )
			laSetElementData ( lp, "isInTut", false )
		end
	)
end
end

function showLanguageGui (player)
if player == lp then
	gWindow["languageWindow"] = guiCreateWindow ( screenwidth/2-460/2, screenheight/2-150/2, 460, 150, "Sprache / Language", false )
	guiSetAlpha(gWindow["languageWindow"],1)
	guiWindowSetMovable(gWindow["languageWindow"],false)
	guiWindowSetSizable(gWindow["languageWindow"],false)
	gLabel["languageText1"] = guiCreateLabel(8,24,448,88,"Wähle deine Sprache aus! / Choose your language!",false,gWindow["languageWindow"])
	guiSetAlpha(gLabel["languageText1"],1)
	guiLabelSetColor(gLabel["languageText1"],0,150,0)
	--guiSetFont(gLabel["languageText1"],"sa-header")
	gRadio["Deutsch"] = guiCreateRadioButton(10,50,67,31,"Deutsch",false,gWindow["languageWindow"])
	guiSetAlpha(gRadio["Deutsch"],1)
	guiLabelSetVerticalAlign(gRadio["Deutsch"],"center")
	guiSetFont(gRadio["Deutsch"],"default-bold-small")
	gRadio["English"] = guiCreateRadioButton(84,50,67,31,"English",false,gWindow["languageWindow"])
	guiSetAlpha(gRadio["English"],1)
	guiLabelSetVerticalAlign(gRadio["English"],"center")
	guiSetFont(gRadio["English"],"default-bold-small")
	guiRadioButtonSetSelected(gRadio["Deutsch"],true)
	
	gButton["goLanguage"] = guiCreateButton(10,90,476,44,"Fertig / Done",false,gWindow["languageWindow"])
	guiSetAlpha(gButton["goLanguage"],1)
	--guiSetFont(gButton["goLanguage"],"sa-header")
	addEventHandler("onClientGUIClick", gButton["goLanguage"], LanguageBtn, false)
end
end

function LanguageBtn()
local player = lp
	if guiGetVisible ( gWindow["languageWindow"] ) then
		guiSetVisible ( gWindow["languageWindow"], false )
		if guiRadioButtonGetSelected(gRadio["Deutsch"]) == true then
			sprache = "Deutsch"
		else
			sprache = "English"
		end
		triggerServerEvent ( "language", player, player, sprache )
		showBeginningGui (lp)
	end
end

function showLanguageOldGui_func ( player )

	showCursor ( true )
	gWindow["languageWindow"] = guiCreateWindow ( screenwidth/2-460/2, screenheight/2-177/2, 460, 177, "Sprache /  language", false )
	guiSetAlpha(gWindow["languageWindow"],1)
	guiWindowSetMovable(gWindow["languageWindow"],false)
	guiWindowSetSizable(gWindow["languageWindow"],false)
	gLabel["languageText1"] = guiCreateLabel(8,24,448,88,"Wähle deine Sprache aus!\nChoose your language!",false,gWindow["languageWindow"])
	guiSetAlpha(gLabel["languageText1"],1)
	guiLabelSetColor(gLabel["languageText1"],0,150,0)
	guiSetFont(gLabel["languageText1"],"sa-header")
	gRadio["Deutsch"] = guiCreateRadioButton(10,123,67,31,"Deutsch",false,gWindow["languageWindow"])
	guiSetAlpha(gRadio["Deutsch"],1)
	guiLabelSetVerticalAlign(gRadio["Deutsch"],"center")
	guiSetFont(gRadio["Deutsch"],"default-bold-small")
	gRadio["English"] = guiCreateRadioButton(84,123,67,31,"English",false,gWindow["languageWindow"])
	guiSetAlpha(gRadio["English"],1)
	guiLabelSetVerticalAlign(gRadio["English"],"center")
	guiSetFont(gRadio["English"],"default-bold-small")
	guiRadioButtonSetSelected(gRadio["Deutsch"],true)
	
	gButton["goLanguage"] = guiCreateButton(153,118,296,44,"Fertig / Done",false,gWindow["languageWindow"])
	guiSetAlpha(gButton["goLanguage"],1)
	guiSetFont(gButton["goLanguage"],"sa-header")
	addEventHandler("onClientGUIClick", gButton["goLanguage"], LanguageOldBtn, false)
end
addEvent ( "showLanguageOldGui", true )
addEventHandler ( "showLanguageOldGui", getRootElement(), showLanguageOldGui_func )
addCommandHandler ( "sprache", showLanguageOldGui_func )
addCommandHandler ( "language", showLanguageOldGui_func )

function LanguageOldBtn()

	if guiGetVisible ( gWindow["languageWindow"] ) then
		guiSetVisible ( gWindow["languageWindow"], false )
		if guiRadioButtonGetSelected(gRadio["Deutsch"]) == true then
			sprache = "Deutsch"
		else
			sprache = "English"
		end
		player = lp
		triggerServerEvent ( "language", lp, lp, sprache )
	end
end