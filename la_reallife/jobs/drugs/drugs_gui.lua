gButton = {}
gLabel = {}


function CloseDrugDealerWindow_func(button)

	if button == "left" then
		guiSetVisible(gWindow["drugdealerWindow"],false)
		showCursor(false)
		triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	end
end

function AcceptDrugJobWindow_func(button)

	if button == "left" then
		guiSetVisible(gWindow["drugdealerWindow"],false)
		showCursor(false)
		createDrugJobMarker_func ( player )
	end
end

function BuyMowerDrugdealer (btn)

		guiSetVisible(gWindow["drugdealerWindow"],false)
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	triggerServerEvent ( "BuyMowerDrugServer", getLocalPlayer(), getLocalPlayer() )
end

function BuyShovelDrugdealer (btn)
	
	guiSetVisible (gWindow["drugdealerWindow"], false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	triggerServerEvent ( "BuyShovelDrugServer", getLocalPlayer(), getLocalPlayer() )
end

function BuyZweiSamen ( btn )
	
	--guiSetVisible ( gWindow["drugdealerWindow"], false )
	--showCursor(false)
	--triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	triggerServerEvent ( "Buy2SamenServer", getLocalPlayer(), getLocalPlayer() )
end

function BuyZwanzigSamen ( btn )
	
	--guiSetVisible ( gWindow["drugdealerWindow"], false )
	--showCursor(false)
	--triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	triggerServerEvent ( "Buy20SamenServer", getLocalPlayer(), getLocalPlayer() )
end

function _createDrugdealerGui_func ()
	showCursor(true)
	if gWindow["drugdealerWindow"] then
		guiSetVisible ( gWindow["drugdealerWindow"], true )
	else
		local screenwidth, screenheight = guiGetScreenSize()

		gWindow["drugdealerWindow"] = guiCreateWindow(screenwidth/2-636/2,screenheight/2-392/2,636,392,"Weeddealer",false)
		guiSetAlpha(gWindow["drugdealerWindow"],1)
		
		drugdealerTabPanel = guiCreateTabPanel(9,25,619,307,false,gWindow["drugdealerWindow"])
		
	--
		drugdealerTab1 = guiCreateTab("Auftrag",drugdealerTabPanel)
		
		gLabel["InfotextDealer"] = guiCreateLabel(4,20,608,66,"Hey du!\nIch könnte deine Hilfe brauchen! Ich kriege viele Hinweise wo sich Weed befinden könnte,\njedoch sind es zuviele. Ich selbst kann nicht jedem Hinweis selbst nachgehen.\nWenn du willst kannst du einige Aufträge für mich übernehmen!",false,drugdealerTab1)
		guiSetAlpha(gLabel["InfotextDealer"],1)
		guiLabelSetHorizontalAlign(gLabel["InfotextDealer"],"center",false)
		guiSetFont(gLabel["InfotextDealer"],"clear-normal")
		
		gButton["AcceptDrugJob"] = guiCreateButton(179,138,268,45,"Einen Auftrag starten",false,drugdealerTab1)
		guiSetFont(gButton["AcceptDrugJob"],"clear-normal")
	--
	
		drugdealerTab2 = guiCreateTab("Weed kaufen",drugdealerTabPanel)
		
		gLabel["InfotextBuyDrugs"] = guiCreateLabel(5,14,607,37,"Hier kannst du Weed für 30$/g kaufen.\nDa ich viele Kunden habe, kannst du nur alle 10 Minuten max 100 Gramm erwerben!",false,drugdealerTab2)
		guiSetAlpha(gLabel["InfotextBuyDrugs"],1)
		guiLabelSetHorizontalAlign(gLabel["InfotextBuyDrugs"],"center",false)
		guiSetFont(gLabel["InfotextBuyDrugs"],"clear-normal")
	
		gLabel["InfotextBuyDrugs2"] = guiCreateLabel(309,79,34,32,"x 30$",false,drugdealerTab2)
		guiSetAlpha(gLabel["InfotextBuyDrugs2"],1)
		guiLabelSetVerticalAlign(gLabel["InfotextBuyDrugs2"],"center",false)
		guiSetFont(gLabel["InfotextBuyDrugs2"],"default-bold-small")

		
		--[[gLabel["PriceDrugsBuy"] = guiCreateLabel(360,79,34,32,"",false,drugdealerTab2)
		guiSetAlpha(gLabel["PriceDrugsBuy"],1)
		guiLabelSetVerticalAlign(gLabel["PriceDrugsBuy"],"center",false)
		guiSetFont(gLabel["PriceDrugsBuy"],"default-bold-small")
		guiLabelSetColor(gLabel["PriceDrugsBuy"],200,0,0)]]--
		
		gLabel["InfotextBuyDrugs3"] = guiCreateLabel(269,79,9,32,"g",false,drugdealerTab2)
		guiSetAlpha(gLabel["InfotextBuyDrugs3"],1)
		guiLabelSetVerticalAlign(gLabel["InfotextBuyDrugs3"],"center",false)
		guiSetFont(gLabel["InfotextBuyDrugs3"],"default-bold-small")
		
		gButton["BuyDrugs"] = guiCreateButton(181,159,259,46,"Weed kaufen",false,drugdealerTab2)
		guiSetFont(gButton["BuyDrugs"],"clear-normal")
	
		gMemo["BuyDrugsMemoDealer"] = guiCreateMemo(217,79,49,35,"",false,drugdealerTab2)
		guiEditSetMaxLength(gMemo["BuyDrugsMemoDealer"],3)

	--
	
		drugdealerTab3 = guiCreateTab("Weed verkaufen",drugdealerTabPanel)
		
		gLabel["InfotextSellDrugs"] = guiCreateLabel(3,20,611,35,"Hier kannst du Weed für je 7$/g verkaufen! Da ich eine grosse Kundschaft habe,\n kaufe ich dir soviel ab wie du mir bringst!",false,drugdealerTab3)
		guiSetAlpha(gLabel["InfotextSellDrugs"],1)
		guiLabelSetHorizontalAlign(gLabel["InfotextSellDrugs"],"center",false)
		guiSetFont(gLabel["InfotextSellDrugs"],"clear-normal")
	
		gLabel["InfotextSellDrugs2"] = guiCreateLabel(345,81,32,28,"x 7$",false,drugdealerTab3)
		guiSetAlpha(gLabel["InfotextSellDrugs2"],1)
		guiLabelSetVerticalAlign(gLabel["InfotextSellDrugs2"],"center",false)
		guiSetFont(gLabel["InfotextSellDrugs2"],"default-bold-small")
		
		--[[gLabel["PriceDrugsSell"] = guiCreateLabel(386,81,96,28,"",false,drugdealerTab3)
		guiSetAlpha(gLabel["PriceDrugsSell"],1)
		guiLabelSetVerticalAlign(gLabel["PriceDrugsSell"],"center",false)
		guiSetFont(gLabel["PriceDrugsSell"],"default-bold-small")
		guiLabelSetColor(gLabel["PriceDrugsSell"],200,0,0)]]--
		
		gLabel["InfotextSellDrugs3"] = guiCreateLabel(322,81,9,28,"g",false,drugdealerTab3)
		guiSetAlpha(gLabel["InfotextSellDrugs3"],1)
		guiLabelSetVerticalAlign(gLabel["InfotextSellDrugs3"],"center",false)
		guiSetFont(gLabel["InfotextSellDrugs3"],"default-bold-small")
		
		gButton["drugsSellDealer"] = guiCreateButton(181,159,259,46,"Weed verkaufen",false,drugdealerTab3)
		guiSetFont(gButton["drugsSellDealer"],"clear-normal")

		gMemo["SellDrugsDrugdealerMemo"] = guiCreateMemo(181,80,139,34,"",false,drugdealerTab3)

	--
		drugdealerTab4 = guiCreateTab("Sonstiges",drugdealerTabPanel)
		
		gLabel["InfotextSellOther"] = guiCreateLabel(4,15,610,22,"Ich verkaufe auch einige andere Dinge die sehr nützlich sein können. Seh dich ruhig um.",false,drugdealerTab4)
		guiSetAlpha(gLabel["InfotextSellOther"],1)
		guiLabelSetHorizontalAlign(gLabel["InfotextSellOther"],"center",false)
		guiSetFont(gLabel["InfotextSellOther"],"clear-normal")
		
		gButton["Samen2buy"] = guiCreateButton(25,99,279,47,"Hanfsamen kaufen ( 2 Stück 100$ )",false,drugdealerTab4)
		guiSetFont(gButton["Samen2buy"],"clear-normal")
		
		gButton["ShovelBuy"] = guiCreateButton(318,100,279,47,"Schaufel kaufen ( 25$ )",false,drugdealerTab4)
		guiSetFont(gButton["ShovelBuy"],"clear-normal")
		
		gButton["MaherBuy"] = guiCreateButton(318,162,279,47,"Rasenmäher kaufen ( 1000$ )",false,drugdealerTab4)
		guiSetFont(gButton["MaherBuy"],"clear-normal")
		
		gButton["Samen20buy"] = guiCreateButton(25,162,279,47,"Hanfsamen kaufen ( 20 Stück 1000$ )",false,drugdealerTab4)
		guiSetFont(gButton["Samen20buy"],"clear-normal")
		
	--
	
		gButton["CloseDrugdealerBTN"] = guiCreateButton(9,340,619,43,"Weeddealer verlassen",false,gWindow["drugdealerWindow"])
		guiSetFont(gButton["CloseDrugdealerBTN"],"sa-header")
		
		addEventHandler("onClientGUIClick", gButton["CloseDrugdealerBTN"], CloseDrugDealerWindow_func, false)
		
		addEventHandler("onClientGUIClick", gButton["AcceptDrugJob"], AcceptDrugJobWindow_func, false)
		addEventHandler("onClientGUIClick", gButton["MaherBuy"], BuyMowerDrugdealer, false)
		addEventHandler("onClientGUIClick", gButton["ShovelBuy"], BuyShovelDrugdealer, false)
		addEventHandler("onClientGUIClick", gButton["Samen2buy"], BuyZweiSamen, false)
		addEventHandler("onClientGUIClick", gButton["Samen20buy"], BuyZwanzigSamen, false)
		
				addEventHandler("onClientGUIClick", gButton["drugsSellDealer"],
			function ()
				if tonumber ( guiGetText ( gMemo["SellDrugsDrugdealerMemo"] ) ) then
					triggerServerEvent ( "drugsSellDealerJob", getLocalPlayer(), getLocalPlayer(), tonumber ( guiGetText ( gMemo["SellDrugsDrugdealerMemo"] ) ) )
				end
			end
		)
	
					addEventHandler("onClientGUIClick", gButton["BuyDrugs"],
			function ()
				if tonumber ( guiGetText ( gMemo["BuyDrugsMemoDealer"] ) ) then
					triggerServerEvent ( "buydrugs", getLocalPlayer(), getLocalPlayer(), tonumber ( guiGetText ( gMemo["BuyDrugsMemoDealer"] ) ) )
				end
			end
		)
	end
	--local druggydrugs = tonumber ( guiGetText ( gMemo["SellDrugsDrugdealerMemo"] ) ) * 7
--setTimer ( guiSetText, 750, 1, gLabel["PriceDrugsSell"], " "..druggydrugs.." " )
end
addEvent ( "_createDrugdealerGui", true )
addEventHandler ( "_createDrugdealerGui", getLocalPlayer(), _createDrugdealerGui_func )
--addCommandHandler ( "weedfenster", _createDrugdealerGui_func )