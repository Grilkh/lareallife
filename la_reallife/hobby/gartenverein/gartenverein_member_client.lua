gButton = {}
gLabel = {}

function CloseGartenMember (btn)

	guiSetVisible ( gartenclubMemberWindow, false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
end

function BuyMower (btn)

	guiSetVisible ( gartenclubMemberWindow, false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	triggerServerEvent ( "BuyMowerServer", getLocalPlayer(), getLocalPlayer() )
end

function BuyGartenShovel (btn)
	
	guiSetVisible ( gartenclubMemberWindow, false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	triggerServerEvent ( "BuyShovelServer", getLocalPlayer(), getLocalPlayer() )
end

function BuyGartenFlowers ( btn )
	
	--guiSetVisible ( gartenclubMemberWindow, false )
	--showCursor(false)
	--triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	triggerServerEvent ( "BuyFlowersServer", getLocalPlayer(), getLocalPlayer() )
end
	
function BuyGartenPalm ( btn )
	
	guiSetVisible ( gartenclubMemberWindow, false )
	showCursor(false)
	triggerServerEvent ( "cancel_gui_server", getLocalPlayer() )
	triggerServerEvent ( "BuyPalmServer", getLocalPlayer(), getLocalPlayer() )
end

function _createGartenclubMemberGui_func ()

	if gartenclubMemberWindow then
		guiSetVisible ( gartenclubMemberWindow, true )
	else
		local screenwidth, screenheight = guiGetScreenSize()

		gartenclubMemberWindow = guiCreateWindow(screenwidth/2-214/2,screenheight/2-303/2,214,303,"Gartenclub",false)
		guiSetAlpha(gartenclubMemberWindow,1)
	
		
		gLabel["InfotextGarten"] = guiCreateLabel(0.2056,0.0891,0.6308,0.1881,"Willkommen bei\n\"The Uphill Gardner\"\nWas darf es sein?",true,gartenclubMemberWindow)
		guiSetAlpha(gLabel["InfotextGarten"],1)
		guiLabelSetColor(gLabel["InfotextGarten"],200,200,10)
		guiLabelSetVerticalAlign(gLabel["InfotextGarten"],"top")
		guiLabelSetHorizontalAlign(gLabel["InfotextGarten"],"left",false)

		gLabel["GartenKosten1"] = guiCreateLabel(0.09,0.46,0.215,0.0759,"Kosten:",true,gartenclubMemberWindow)
		guiSetAlpha(gLabel["GartenKosten1"],1)
		guiLabelSetColor(gLabel["GartenKosten1"],200,200,000)
		guiLabelSetVerticalAlign(gLabel["GartenKosten1"],"top")
		guiLabelSetHorizontalAlign(gLabel["GartenKosten1"],"left",false)
		gLabel["GartenKosten2"] = guiCreateLabel(0.55,0.46,0.215,0.0819,"Kosten:",true,gartenclubMemberWindow)
		guiSetAlpha(gLabel["GartenKosten2"],1)
		guiLabelSetColor(gLabel["GartenKosten2"],200,200,0)
		guiLabelSetVerticalAlign(gLabel["GartenKosten2"],"top")
		guiLabelSetHorizontalAlign(gLabel["GartenKosten2"],"left",false)
		gLabel["GartenKosten3"] = guiCreateLabel(0.09,0.74,0.215,0.0878,"Kosten:",true,gartenclubMemberWindow)
		guiSetAlpha(gLabel["GartenKosten3"],1)
		guiLabelSetColor(gLabel["GartenKosten3"],200,200,0)
		guiLabelSetVerticalAlign(gLabel["GartenKosten3"],"top")
		guiLabelSetHorizontalAlign(gLabel["GartenKosten3"],"left",false)
		gLabel["GartenKosten4"] = guiCreateLabel(0.55,0.74,0.215,0.0878,"Kosten:",true,gartenclubMemberWindow)
		guiSetAlpha(gLabel["GartenKosten4"],1)
		guiLabelSetColor(gLabel["GartenKosten4"],200,200,0)
		guiLabelSetVerticalAlign(gLabel["GartenKosten4"],"top")
		guiLabelSetHorizontalAlign(gLabel["GartenKosten4"],"left",false)
		
		gLabel["FlowersPriceGarten"] = guiCreateLabel(0.3,0.74,0.1636,0.0693,"100$",true,gartenclubMemberWindow)
		guiSetAlpha(gLabel["FlowersPriceGarten"],1)
		guiLabelSetColor(gLabel["FlowersPriceGarten"],0,125,0)
		guiLabelSetVerticalAlign(gLabel["FlowersPriceGarten"],"top")
		guiLabelSetHorizontalAlign(gLabel["FlowersPriceGarten"],"left",false)
		gLabel["PalmPriceGarten"] = guiCreateLabel(0.7664,0.74,0.1636,0.0693,"120$",true,gartenclubMemberWindow)
		guiSetAlpha(gLabel["PalmPriceGarten"],1)
		guiLabelSetColor(gLabel["PalmPriceGarten"],0,125,0)
		guiLabelSetVerticalAlign(gLabel["PalmPriceGarten"],"top")
		guiLabelSetHorizontalAlign(gLabel["PalmPriceGarten"],"left",false)
		gLabel["shovelPriceGarten"] = guiCreateLabel(0.7664,0.46,0.1636,0.0747,"15$",true,gartenclubMemberWindow)
		guiSetAlpha(gLabel["shovelPriceGarten"],1)
		guiLabelSetColor(gLabel["shovelPriceGarten"],0,125,0)
		guiLabelSetVerticalAlign(gLabel["shovelPriceGarten"],"top")
		guiLabelSetHorizontalAlign(gLabel["shovelPriceGarten"],"left",false)
		gLabel["MowerPriceGarten"] = guiCreateLabel(0.3,0.46,0.1636,0.0693,"600$",true,gartenclubMemberWindow)
		guiSetAlpha(gLabel["MowerPriceGarten"],1)
		guiLabelSetColor(gLabel["MowerPriceGarten"],000,125,000)
		guiLabelSetVerticalAlign(gLabel["MowerPriceGarten"],"top")
		guiLabelSetHorizontalAlign(gLabel["MowerPriceGarten"],"left",false)
		
		gButton["Mower"] = guiCreateButton(0.09,0.3003,0.3972,0.1551,"Rasenmäher",true,gartenclubMemberWindow)
		guiSetAlpha(gButton["Mower"],1)
		gButton["ShovelGarden"] = guiCreateButton(0.54,0.3003,0.3972,0.1551,"Schaufel",true,gartenclubMemberWindow)
		guiSetAlpha(gButton["ShovelGarden"],1)
		gButton["FlowersGarden"] = guiCreateButton(0.09,0.571,0.3972,0.1551,"Hanfsamen",true,gartenclubMemberWindow)
		guiSetAlpha(gButton["FlowersGarden"],1)
		gButton["Palmseed"] = guiCreateButton(0.54,0.571,0.3879,0.1551,"Palmensamen",true,gartenclubMemberWindow)
		guiSetAlpha(gButton["Palmseed"],1)
		gButton["CloseGarden"] = guiCreateButton(0.325,0.81,0.35,0.15,"Schliessen",true,gartenclubMemberWindow)
		guiSetAlpha(gButton["CloseGarden"],1)
		
		addEventHandler("onClientGUIClick", gButton["CloseGarden"], CloseGartenMember, false)
		addEventHandler("onClientGUIClick", gButton["Mower"], BuyMower, false)
		addEventHandler("onClientGUIClick", gButton["ShovelGarden"], BuyGartenShovel, false)
		addEventHandler("onClientGUIClick", gButton["FlowersGarden"], BuyGartenFlowers, false)
		addEventHandler("onClientGUIClick", gButton["Palmseed"], BuyGartenPalm, false)
	end
end
addEvent ( "_createGartenclubMemberGui", true )
addEventHandler ( "_createGartenclubMemberGui", getLocalPlayer(), _createGartenclubMemberGui_func )