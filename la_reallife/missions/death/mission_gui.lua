------------------------------
-------- Urheberrecht --------
------- by [LA]Leyynen -------
------------ 2012 ------------
------------------------------

--local bodymarker = createMarker ( 1946.0626220703, -545.39880371094, 19.016662597656, "corona", 2, 125, 255, 200, 255 )

function showHinweis0Gui_func ()

	showCursor ( true )
	setElementData ( lp, "ElementClicked", true )
	if gWindow["NotizFund"] then
		guiSetVisible ( gWindow["NotizFund"], true )
	else
		gWindow["NotizFund"] = guiCreateWindow(screenwidth/2-618/2,screenheight/2-396/2,618,396,"ein Kartenausschnitt!",false)
		guiWindowSetMovable ( gWindow["NotizFund"], false )
		guiWindowSetSizable ( gWindow["NotizFund"], false )
		guiSetAlpha(gWindow["NotizFund"],1)
		
		gLabel[1] = guiCreateLabel(8,23,603,73,"Hier liegt ein Kartenausschnitt!",false,gWindow["NotizFund"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],0,150,0)
		guiLabelSetVerticalAlign(gLabel[1],"center")
		guiLabelSetHorizontalAlign(gLabel[1],"center",false)
		guiSetFont(gLabel[1],"sa-header")
		
		--[[gLabel[2] = guiCreateLabel(14,267,588,48,"Wer das wohl sein mag?\nAm besten siehst du dich in der Gegend nach Hinweisen um.\nVielleicht findest du etwas hilfreiches!",false,gWindow["NotizFund"])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],0,200,0)
		guiLabelSetHorizontalAlign(gLabel[2],"center",false)
		guiSetFont(gLabel[2],"clear-normal")]]
		
		gImage[1] = guiCreateStaticImage(200,98,220,146,"images/mission/notizfund.png",false,gWindow["NotizFund"])
		
		gButton["NotizFundClose"] = guiCreateButton(190,326,238,53,"Verlassen.",false,gWindow["NotizFund"])
		guiSetAlpha(gButton["NotizFundClose"],1)
		guiSetFont(gButton["NotizFundClose"],"sa-header")
		
		addEventHandler ( "onClientGUIClick", gButton["NotizFundClose"],
			function ()
				showCursor ( false )
				setElementData ( lp, "ElementClicked", false )
				guiSetVisible ( gWindow["NotizFund"], false )
			end
		)
	end
end
addEvent( "showHinweis0Gui", true )
addEventHandler( "showHinweis0Gui", getRootElement(), showHinweis0Gui_func )



function showIntroGui ()

	showCursor ( true )
	setElementData ( lp, "ElementClicked", true )
	if gWindow["Leiche"] then
		guiSetVisible ( gWindow["Leiche"], true )
	else
		gWindow["Leiche"] = guiCreateWindow(screenwidth/2-618/2,screenheight/2-396/2,618,396,"Grausiger Fund!",false)
		guiWindowSetMovable ( gWindow["Leiche"], false )
		guiWindowSetSizable ( gWindow["Leiche"], false )
		guiSetAlpha(gWindow["Leiche"],1)
		
		gLabel[1] = guiCreateLabel(8,23,603,73,"Wow, du hast eine Leiche entdeckt!",false,gWindow["Leiche"])
		guiSetAlpha(gLabel[1],1)
		guiLabelSetColor(gLabel[1],0,150,0)
		guiLabelSetVerticalAlign(gLabel[1],"center")
		guiLabelSetHorizontalAlign(gLabel[1],"center",false)
		guiSetFont(gLabel[1],"sa-header")
		
		gLabel[2] = guiCreateLabel(14,267,588,48,"Wer das wohl sein mag?\nAm besten siehst du dich in der Gegend nach Hinweisen um.\nVielleicht findest du etwas hilfreiches!",false,gWindow["Leiche"])
		guiSetAlpha(gLabel[2],1)
		guiLabelSetColor(gLabel[2],0,200,0)
		guiLabelSetHorizontalAlign(gLabel[2],"center",false)
		guiSetFont(gLabel[2],"clear-normal")
		
		gImage[1] = guiCreateStaticImage(52,98,518,146,"images/mission/leiche.png",false,gWindow["Leiche"])
		
		gButton["LeicheClose"] = guiCreateButton(190,326,238,53,"Verlassen.",false,gWindow["Leiche"])
		guiSetAlpha(gButton["LeicheClose"],1)
		guiSetFont(gButton["LeicheClose"],"sa-header")
		
		addEventHandler ( "onClientGUIClick", gButton["LeicheClose"],
			function ()
				showCursor ( false )
				setElementData ( lp, "ElementClicked", false )
				guiSetVisible ( gWindow["Leiche"], false )
			end
		)
	end
end
addEvent( "showLeicheGui", true )
addEventHandler( "showLeicheGui", getRootElement(), showIntroGui )







function showHinweis_1Gui ()

	showCursor ( true )
	setElementData ( lp, "ElementClicked", true )
	if gWindow["Hinweis1"] then
		guiSetVisible ( gWindow["Hinweis1"], true )
	else
		gWindow["Hinweis1"] = guiCreateWindow(screenwidth/2-421/2,screenheight/2-546/2,421,546,"1. Hinweis!",false)
		guiWindowSetMovable ( gWindow["Hinweis1"], false )
		guiWindowSetSizable ( gWindow["Hinweis1"], false )
		--guiSetAlpha(gWindow["Hinweis1"],1)
		
		gImage[1] = guiCreateStaticImage(11,21,401,407,"images/mission/hinweis_1.png",false,gWindow["Hinweis1"])
		guiSetAlpha(gImage[1],1)
		
		gButton["Hinweis1Close"] = guiCreateButton(83,434,255,99,"Weiter",false,gWindow["Hinweis1"])
		guiSetAlpha(gButton["Hinweis1Close"],1)
		guiSetFont(gButton["Hinweis1Close"],"sa-header")
		
		addEventHandler ( "onClientGUIClick", gButton["Hinweis1Close"],
			function ()
				showCursor ( false )
				setElementData ( lp, "ElementClicked", false )
				guiSetVisible ( gWindow["Hinweis1"], false )
			end
		)
	end
end
addEvent( "showHinweis1Gui", true )
addEventHandler( "showHinweis1Gui", getRootElement(), showHinweis_1Gui )






function showHinweis_2Gui ()

	showCursor ( true )
	setElementData ( lp, "ElementClicked", true )
	if gWindow["Hinweis2"] then
		guiSetVisible ( gWindow["Hinweis2"], true )
	else
		gWindow["Hinweis2"] = guiCreateWindow(screenwidth/2-421/2,screenheight/2-546/2,421,546,"2. Hinweis!",false)
		guiWindowSetMovable ( gWindow["Hinweis2"], false )
		guiWindowSetSizable ( gWindow["Hinweis2"], false )
		--guiSetAlpha(gWindow["Hinweis2"],1)
		
		gImage[1] = guiCreateStaticImage(11,21,401,407,"images/mission/hinweis_2.png",false,gWindow["Hinweis2"])
		guiSetAlpha(gImage[1],1)
		
		gButton["Hinweis2Close"] = guiCreateButton(83,434,255,99,"Weiter",false,gWindow["Hinweis2"])
		guiSetAlpha(gButton["Hinweis2Close"],1)
		guiSetFont(gButton["Hinweis2Close"],"sa-header")
		
		addEventHandler ( "onClientGUIClick", gButton["Hinweis2Close"],
			function ()
				showCursor ( false )
				setElementData ( lp, "ElementClicked", false )
				guiSetVisible ( gWindow["Hinweis2"], false )
			end
		)
	end
end
addEvent( "showHinweis2Gui", true )
addEventHandler( "showHinweis2Gui", getRootElement(), showHinweis_2Gui )



function showHinweis_3Gui ()

	showCursor ( true )
	setElementData ( lp, "ElementClicked", true )
	if gWindow["Hinweis3"] then
		guiSetVisible ( gWindow["Hinweis3"], true )
	else
		gWindow["Hinweis3"] = guiCreateWindow(screenwidth/2-421/2,screenheight/2-546/2,421,546,"3. Hinweis!",false)
		guiWindowSetMovable ( gWindow["Hinweis3"], false )
		guiWindowSetSizable ( gWindow["Hinweis3"], false )
		--guiSetAlpha(gWindow["Hinweis3"],1)
		
		gImage[1] = guiCreateStaticImage(11,21,401,407,"images/mission/hinweis_3.png",false,gWindow["Hinweis3"])
		guiSetAlpha(gImage[1],1)
		
		gButton["Hinweis3Close"] = guiCreateButton(83,434,255,99,"Weiter",false,gWindow["Hinweis3"])
		guiSetAlpha(gButton["Hinweis3Close"],1)
		guiSetFont(gButton["Hinweis3Close"],"sa-header")
		
		addEventHandler ( "onClientGUIClick", gButton["Hinweis3Close"],
			function ()
				showCursor ( false )
				setElementData ( lp, "ElementClicked", false )
				guiSetVisible ( gWindow["Hinweis3"], false )
			end
		)
	end
end
addEvent( "showHinweis3Gui", true )
addEventHandler( "showHinweis3Gui", getRootElement(), showHinweis_3Gui )




function showHinweis_4Gui ()

	showCursor ( true )
	setElementData ( lp, "ElementClicked", true )
	if gWindow["Hinweis4"] then
		guiSetVisible ( gWindow["Hinweis4"], true )
	else
		gWindow["Hinweis4"] = guiCreateWindow(screenwidth/2-421/2,screenheight/2-546/2,421,546,"4. Hinweis!",false)
		guiWindowSetMovable ( gWindow["Hinweis4"], false )
		guiWindowSetSizable ( gWindow["Hinweis4"], false )
		--guiSetAlpha(gWindow["Hinweis4"],1)
		
		gImage[1] = guiCreateStaticImage(11,21,401,407,"images/mission/hinweis_4.png",false,gWindow["Hinweis4"])
		guiSetAlpha(gImage[1],1)
		
		gButton["Hinweis4Close"] = guiCreateButton(83,434,255,99,"Weiter",false,gWindow["Hinweis4"])
		guiSetAlpha(gButton["Hinweis4Close"],1)
		guiSetFont(gButton["Hinweis4Close"],"sa-header")
		
		addEventHandler ( "onClientGUIClick", gButton["Hinweis4Close"],
			function ()
				showCursor ( false )
				setElementData ( lp, "ElementClicked", false )
				guiSetVisible ( gWindow["Hinweis4"], false )
			end
		)
	end
end
addEvent( "showHinweis4Gui", true )
addEventHandler( "showHinweis4Gui", getRootElement(), showHinweis_4Gui )


function showHinweis_5Gui ()

	showCursor ( true )
	setElementData ( lp, "ElementClicked", true )
	if gWindow["Hinweis5"] then
		guiSetVisible ( gWindow["Hinweis5"], true )
	else
		gWindow["Hinweis5"] = guiCreateWindow(screenwidth/2-421/2,screenheight/2-546/2,421,546,"5. Hinweis!",false)
		guiWindowSetMovable ( gWindow["Hinweis5"], false )
		guiWindowSetSizable ( gWindow["Hinweis5"], false )
		--guiSetAlpha(gWindow["Hinweis5"],1)
		
		gImage[1] = guiCreateStaticImage(11,21,401,407,"images/mission/hinweis_5.png",false,gWindow["Hinweis5"])
		guiSetAlpha(gImage[1],1)
		
		gButton["Hinweis5Close"] = guiCreateButton(83,434,255,99,"Weiter",false,gWindow["Hinweis5"])
		guiSetAlpha(gButton["Hinweis5Close"],1)
		guiSetFont(gButton["Hinweis5Close"],"sa-header")
		
		addEventHandler ( "onClientGUIClick", gButton["Hinweis5Close"],
			function ()
				showCursor ( false )
				setElementData ( lp, "ElementClicked", false )
				guiSetVisible ( gWindow["Hinweis5"], false )
			end
		)
	end
end
addEvent( "showHinweis5Gui", true )
addEventHandler( "showHinweis5Gui", getRootElement(), showHinweis_5Gui )


--[[function showHinweis_6Gui ()

	showCursor ( true )
	setElementData ( lp, "ElementClicked", true )
	if gWindow["Hinweis6"] then
		guiSetVisible ( gWindow["Hinweis6"], true )
	else
		gWindow["Hinweis6"] = guiCreateWindow(screenwidth/2-421/2,screenheight/2-546/2,421,546,"6. Hinweis!",false)
		guiWindowSetMovable ( gWindow["Hinweis6"], false )
		guiWindowSetSizable ( gWindow["Hinweis6"], false )
		--guiSetAlpha(gWindow["Hinweis6"],1)
		
		gImage[1] = guiCreateStaticImage(11,21,401,407,"images/mission/hinweis_4.png",false,gWindow["Hinweis6"])
		guiSetAlpha(gImage[1],1)
		
		gButton["Hinweis6Close"] = guiCreateButton(83,434,255,99,"Weiter",false,gWindow["Hinweis6"])
		guiSetAlpha(gButton["Hinweis6Close"],1)
		guiSetFont(gButton["Hinweis6Close"],"sa-header")
		
		addEventHandler ( "onClientGUIClick", gButton["Hinweis6Close"],
			function ()
				showCursor ( false )
				setElementData ( lp, "ElementClicked", false )
				guiSetVisible ( gWindow["Hinweis6"], false )
			end
		)
	end
end
addEvent( "showHinweis6Gui", true )
addEventHandler( "showHinweis6Gui", getRootElement(), showHinweis_6Gui )]]









local hinweis6markerlast = createMarker ( 1914.694, -510.379, 18.3869, "corona", 1, 125, 255, 255, 255)


function hinweis6markerlast_func ()
local lp = getLocalPlayer()
if not getPedOccupiedVehicle ( lp ) then
	if getElementData ( lp, "points" ) <= 7 then
		if getElementData ( lp, "points" ) <= 5 then
		--	outputChatBox ( "Hier kannst du noch nicht hin!", 125, 0, 0 )
		else
			showChat ( false )
			screenWidth, screenHeight = guiGetScreenSize()
			toggleAllControls ( false )
			setElementPosition ( lp, 1915.531, -509.153, 18.408 )
			setPedRotation ( lp, 280 )
			fadeCamera ( false, 1, 0, 0, 0 )
			setTimer ( showMysteryBriefing, 5000, 1 )
			MissionName = "Die Wende"
			addEventHandler("onClientRender",getRootElement(), createMysteryName)
			showPlayerHudComponent ( "radar", false )
			setElementData ( lp, "points", 7 )
		end
	end
end
end
addEventHandler ( "onClientMarkerHit", hinweis6markerlast, hinweis6markerlast_func )




function showMysteryBriefing ()
	fadeCamera ( true, 1 )
	TheMystery = createPed ( 33, 1918.165, -508.8855, 18.51234 )
	setPedRotation ( TheMystery, 90 )
	setTimer ( MysteryStep1, 300, 1 )
	setPedRotation ( getLocalPlayer(), 280 )
	setElementDimension ( getLocalPlayer(), tonumber ( getElementData ( getLocalPlayer(), "playerid" ) ) + 1 )
	setElementDimension ( TheMystery, tonumber ( getElementData ( getLocalPlayer(), "playerid" ) ) + 1 )
	setCameraMatrix ( 1909.938, -511.256, 18.203, getElementPosition ( TheMystery ) )
end
addEvent( "showMysteryBriefing", true )
addEventHandler( "showMysteryBriefing", getRootElement(), showMysteryBriefing )

function MysteryStep1 ()
	removeEventHandler("onClientRender",getRootElement(), createMysteryName)
	setTimer ( MysteryStep2, 500, 1 )
end

function MysteryStep2 ()
	setPedAnimation ( getLocalPlayer(), "ped", "IDLE_chat", -1, true, true, true )
	setPedAnimation ( TheMystery )
	r, g, b = 255, 255, 255
	DialogText = "\nHast du ihn ermordet?"
	addEventHandler("onClientRender",getRootElement(), createMysteryDialogText)
	setTimer ( MysteryStep3, 4000, 1 )
--	setTimer ( MysteryStep7, 29500, 1 )
end

function MysteryStep3 ()
	r, g, b = 200, 200, 20
	setPedAnimation ( getLocalPlayer() )
	setPedAnimation ( TheMystery, "ped", "IDLE_chat", -1, true, false, true )
	DialogText = "\nIch bin mir sicher, dass du mich durch meine Notizen gefunden hast."
	setTimer ( MysteryStep4, 4000, 1 )
end

function MysteryStep4 ()
	r, g, b = 200, 200, 20
	setPedAnimation ( getLocalPlayer() )
	setPedAnimation ( TheMystery, "ped", "IDLE_chat", -1, true, false, true )
	DialogText = "\nDer Drogenbaron, gegen den ich Ermittlungen fuehrte, hatte mich entdeckt und bis hierhin verfolgt."
	setTimer ( MysteryStep5, 4000, 1 )
end

function MysteryStep5 ()
	r, g, b = 200, 200, 20
	setPedAnimation ( getLocalPlayer() )
	setPedAnimation ( TheMystery, "ped", "IDLE_chat", -1, true, false, true )
	DialogText = "\nNach einem harten Ueberlebenskampf endete er, so wie du ihn gefunden hast."
	setTimer ( MysteryStep6, 4000, 1 )
end

function MysteryStep6 ()
	r, g, b = 200, 200, 20
	setPedAnimation ( getLocalPlayer() )
	setPedAnimation ( TheMystery, "ped", "IDLE_chat", -1, true, false, true )
	DialogText = "\nEr hatte es nicht anderst verdient. Hier eine Belohnung fuer deinen Einsatz und fuer dein Interesse an meinem Fall!"
--	setTimer ( createeMysterySolvedText, 5000, 1 )
	setTimer ( MysteryStep7, 5000, 1 )
end

function MysteryStep7 ()
	r, g, b = 0, 0, 250
	setPedAnimation ( getLocalPlayer() )
	setPedAnimation ( TheMystery )
	DialogText = "\nDu erhaeltst 20.000$ und einen neuen sozialen Status!"
--	setTimer ( createeMysterySolvedText, 5000, 1 )
	setTimer ( MysteryStep8, 5000, 1 )
	triggerServerEvent ( "givethesuccessboni", getLocalPlayer(), getLocalPlayer() )
end


function MysteryStep8 ()
	DialogText = ""
	setCameraTarget( getLocalPlayer(), getLocalPlayer() )
	setElementDimension ( getLocalPlayer(), 0 )
	setElementData ( getLocalPlayer(), "points", 8 )
	toggleAllControls ( true )
	showChat ( true )
	setPedRotation ( getLocalPlayer(), 0 )
	fadeCamera ( true, 1, 0, 0, 0 )
	--outputChatBox ( "Du!", lp, 0, 125, 0 )
end

function createMysteryName ()
	
	dxDrawText( MissionName, screenWidth-397, screenHeight-72, screenWidth, screenHeight, tocolor ( 0, 0, 0, 255 ), 1.50, "pricedown" )
	dxDrawText( MissionName, screenWidth-400, screenHeight-75, screenWidth, screenHeight, tocolor ( 255, 160, 20, 255 ), 1.50, "pricedown" )
end
--[[function createMysterySolved ()
	dxDrawText( "Mission erledigt! Du verdienst dir 20.000$ und einen sozialen Status!", screenWidth/2-3-200, screenHeight/2-3, screenWidth, screenHeight, tocolor ( 0, 0, 0, 255 ), 2, "pricedown" )
	dxDrawText( "Mission erledigt! Du verdienst dir 20.000$ und einen sozialen Status!", screenWidth/2-200, screenHeight/2, screenWidth, screenHeight, tocolor ( 255, 160, 20, 255 ), 2, "pricedown" )
end

function createMysterySolvedText_func ()

	addEventHandler("onClientRender",getRootElement(), createMysterySolved)
	setTimer ( removeMysterySolvedText, 7000, 1 )
end
addEvent ( "createeMysterySolvedText", true )
addEventHandler ( "createeMysterySolvedText", getRootElement(), createeMysterySolvedText_func )

function removeMysterySolvedText ()
	removeEventHandler("onClientRender",getRootElement(), createMysterySolved)
end
]]


function createMysteryDialogText ()
	dxDrawText( DialogText, screenWidth/2-219-150, screenHeight-124, screenWidth, screenHeight, tocolor ( 0, 0, 0, 255 ), 1.50, "arial" )
	dxDrawText( DialogText, screenWidth/2-220-150, screenHeight-125, screenWidth, screenHeight, tocolor ( r, g, b, 255 ), 1.50, "arial" )
end