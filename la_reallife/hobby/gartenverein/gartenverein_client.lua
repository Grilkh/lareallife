gButton = {}
gLabel = {}

function showDrugSellGui_func ()

	if gWindow["drugSellHobby"] then
		guiSetVisible ( gWindow["drugSellHobby"], true )
	else
		gWindow["drugSellHobby"] = guiCreateWindow(screenwidth/2-141/2,screenheight/2-179/2,141,179,"Weed verkaufen",false)
		guiSetAlpha(gWindow["drugSellHobby"],1)
		gLabel["drugAmount"] = guiCreateLabel(0.0638,0.1397,0.8794,0.3966,"Du hast im Moment\n1000 Gramm Weed\ndabei! Du kannst je 1\nGramm für 7 $\nverkaufen.",true,gWindow["drugSellHobby"])
		guiSetAlpha(gLabel["drugAmount"],1)
		guiLabelSetColor(gLabel["drugAmount"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["drugAmount"],"top")
		guiLabelSetHorizontalAlign(gLabel["drugAmount"],"left",false)
		guiSetFont(gLabel["drugAmount"],"default-bold-small")
		
		gMemo["drugSellAmount"] = guiCreateMemo(0.0638,0.5419,0.4539,0.1788,"",true,gWindow["drugSellHobby"])
		guiSetAlpha(gMemo["drugSellAmount"],1)
		
		gButton["drugsSell"] = guiCreateButton(0.0638,0.743,0.8723,0.2067,"Verkaufen",true,gWindow["drugSellHobby"])
		guiSetAlpha(gButton["drugsSell"],1)
		gButton["drugSellClose"] = guiCreateButton(0.6312,0.5419,0.234,0.162,"[x]",true,gWindow["drugSellHobby"])
		guiSetAlpha(gButton["drugSellClose"],1)
		
		addEventHandler("onClientGUIClick", gButton["drugsSell"],
			function ()
				if tonumber ( guiGetText ( gMemo["drugSellAmount"] ) ) then
					triggerServerEvent ( "drugsSellHobby", getLocalPlayer(), getLocalPlayer(), tonumber ( guiGetText ( gMemo["drugSellAmount"] ) ) )
					setTimer ( guiSetText, 750, 1, gLabel["drugAmount"], "Du hast im Moment\n"..getElementData(lp,"weed").." Gramm Weed\ndabei! Du kannst je 1\nGramm für 7 $\nverkaufen." )
				end
			end
		)
		addEventHandler("onClientGUIClick", gButton["drugSellClose"],
			function ()
				guiSetVisible ( gWindow["drugSellHobby"], false )
				triggerServerEvent ( "drugsHobbySellCloseServer", getLocalPlayer(), getLocalPlayer() )
			end
		)
	end
	guiSetText ( gLabel["drugAmount"], "Du hast im Moment\n"..getElementData(lp,"weed").." Gramm Weed\ndabei! Du kannst je 1\nGramm für 7 $\nverkaufen." )
end
addEvent ( "showDrugSellGui", true )
addEventHandler ( "showDrugSellGui", getRootElement(), showDrugSellGui_func )

function GartenvereinBetritt (btn)

	guiSetVisible ( GartenvereinBeitrittWindow, false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	triggerServerEvent ( "joinGartenverein", getLocalPlayer(), getLocalPlayer() )
end

function hideGartenvereinBetrittGui (btn)
	
	if btn == "left" then
		guiSetVisible ( GartenvereinBeitrittWindow, false )
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	end
end

function _createGartenvereinGuiJoin_func ()

	if GartenvereinBeitrittWindow then
		guiSetVisible ( GartenvereinBeitrittWindow, true )
	else
		local screenwidth, screenheight = guiGetScreenSize ()
		GartenvereinBeitrittWindow = guiCreateWindow(screenwidth/2-325/2,screenheight/2-467/2,325,467,"Gartenverein",false)
		guiSetAlpha(GartenvereinBeitrittWindow,1)
		guiWindowSetMovable ( GartenvereinBeitrittWindow, false )
		guiWindowSetSizable ( GartenvereinBeitrittWindow, false )

		gLabel["Infotext"] = guiCreateLabel(0.0492,0.0578,0.9108,0.5953,"\"The Uphill Gardner\"\n\n\nHier kannst du dem Gartenverein von San Fierro\nbeitreten - dadurch hast du die Möglichkeit,\nBlumen - und Pflanzensamen zu erwerben, dir einen\nRasenmäher oder eine Schaufel zu kaufen und die\nWelt wieder zu begrünen.\n\nHinweis: Zu den laufenden Kosten kommen\nnoch 200$ Bearbeitungskosten (einmalig)",true,GartenvereinBeitrittWindow)
		guiSetAlpha(gLabel["Infotext"],1)
		guiLabelSetColor(gLabel["Infotext"],200,200,0)
		guiLabelSetVerticalAlign(gLabel["Infotext"],"top")
		guiLabelSetHorizontalAlign(gLabel["Infotext"],"left",false)
		gLabel["Mitgliedskosten"] = guiCreateLabel(0.0492,0.67,0.2862,0.0578,"Mitgliedskosten:",true,GartenvereinBeitrittWindow)
		guiSetAlpha(gLabel["Mitgliedskosten"],1)
		guiLabelSetColor(gLabel["Mitgliedskosten"],200,000,000)
		guiLabelSetVerticalAlign(gLabel["Mitgliedskosten"],"top")
		guiLabelSetHorizontalAlign(gLabel["Mitgliedskosten"],"left",false)
		gLabel["Kosten"] = guiCreateLabel(0.3415,0.67,0.2862,0.0578,"30$ / Stunde",true,GartenvereinBeitrittWindow)
		guiSetAlpha(gLabel["Kosten"],1)
		guiLabelSetColor(gLabel["Kosten"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["Kosten"],"top")
		guiLabelSetHorizontalAlign(gLabel["Kosten"],"left",false)
		
		gButton["Beitreten"] = guiCreateButton(0.0585,0.85,0.3169,0.1092,"Beitreten",true,GartenvereinBeitrittWindow)
		guiSetAlpha(gButton["Beitreten"],1)
		gButton["CloseGartenverein"] = guiCreateButton(0.6154,0.85,0.3169,0.1092,"Schliessen",true,GartenvereinBeitrittWindow)
		guiSetAlpha(gButton["CloseGartenverein"],1)
		
		addEventHandler("onClientGUIClick", gButton["CloseGartenverein"], hideGartenvereinBetrittGui, false)
		addEventHandler("onClientGUIClick", gButton["Beitreten"], GartenvereinBetritt, false)
	end
end
addEvent ( "_createGartenvereinGuiJoin", true )
addEventHandler ( "_createGartenvereinGuiJoin", getLocalPlayer(), _createGartenvereinGuiJoin_func )